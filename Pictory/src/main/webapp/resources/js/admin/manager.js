  	//   window.pagObj = $('#pagination').twbsPagination({
//        totalPages: [[$(dataListPage.totalPages)]], // 전체 페이지
//        startPage: parseInt([[$(dataListPage.number)]] + 1), // 시작(현재) 페이지
//        visiblePages: 10, // 최대로 보여줄 페이지
//        prev: "‹", // Previous Button Label
//        next: "›", // Next Button Label
//        first: '«', // First Button Label
//        last: '»', // Last Button Label
//        onPageClick: function (event, page) { // Page Click event
//            console.info("current page : " + page);
//        }
//    }).on('page', function (event, page) {
//        searchDataList(page);
//    });


const localhost = 'http://localhost:4040/springapp/admin';
const imgUrl = 'http://localhost:4040/springapp/upload/img/';

var monthDay = '';
var dataText = "";
var bbcc = "";
var currentYear = "";
var currentMonth = "";
var thisMonth = "";
var monthText = "";
var page = 1;
var ppp = 5;

// 차트
var monthArr = [];

var tabText = "회원";

var userId = "";
var myInfoData = "";

//var pageNum = ${param.pageNum}
	

  $(document).ready(function() {
	
		userId = $('#mainUserId').val();
		
		if(!userId){
			alert("로그인을 해주세요\n로그인 페이지로 이동합니다");
			window.location.href = "http://localhost:4040/springapp/auth/Logout.do";
			return false;
		}
		
			AdminLoginInfo();
  });
  
  
  function AdminLoginInfo(){
			$.ajax({
			 //컨트롤러 주소값
			 	url: localhost + '/LoginUserInfo.do',
			    type: "POST",
			    //비동기
			    cache: false,
			    dataType: "json",
			    //string으로 ..
			    data: { "userId" : userId },
			    success: function(data){
				
				// 회원 정보 확인
					if( data.length == 0){
						alert("회원 정보가 없습니다");
						return false;	
					}
					
					for(var i = 0; i < data.length; i++){
						var v = data[i];
						$('.userInfo0').attr('src', imgUrl + v.userProfile);
						$('.userInfo1').text(v.userId);
						$('.userInfo2').text(v.userName);
					}
					
					
					myInfoData = data;
				    			    
			    	salesOfWeek();
			   	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });	
	}
	
	
	// 내 정보 MODAL
	$(document).on('click', '#myInfo', function(){
		console.log("myInfoData : ", myInfoData);
		if(myInfoData.length == 0){
			alert("회원정보가 없습니다");
			return false;
		}
		
		for(var i = 0; i < myInfoData.length; i++){
			var v = myInfoData[i];
			
			$('.modal0').attr('src', imgUrl + v.userProfile);
			$('.modal1').val(v.userNo);
			$('.modal2').val(v.userId);
			$('.modal3').val(v.userPassword);
			$('.modal4').val(v.userEmail);
			$('.modal5').val(v.userName);
			$('.modal6').val(v.userNickname);
			$('.modal7').val(v.userSelf);
			$('.modal8').val(v.userFing);
			$('.modal9').val(v.userFwer);
			
		}
	});
  

  //Sidebar Toggler
  $('.sidebar-toggler').click(function () {
      $('.sidebar, .content').toggleClass("open");
      return false;
  });
  
  
  // 이전달로 이동
  $('.go-prev').on('click', function() {
      monthText = "이전달";
      calendarInit();
  });

  // 다음달로 이동
  $('.go-next').on('click', function() {
        monthText = "다음달";
        calendarInit();
  });

  // 탭 클릭
  // 최근 거래내역
  $('.memberClass').on('click', function(){
	  	paymentListAjax();
    });

  // 차트 탭
    $('.salesClass').on('click', function(){
    	calendarInit();
    });
  
  
  
	// 한 주
	function weekDate(){
	
		var currentDay = new Date();  
		var theYear = currentDay.getFullYear();
		var theMonth = currentDay.getMonth();
		var theDate  = currentDay.getDate();
		var theDayOfWeek = currentDay.getDay();
		 
		var thisWeek = [];
	 
		for(var i = 0; i < 7; i++) {
		  var resultDay = new Date(theYear, theMonth, theDate - (i + theDayOfWeek) + 7 );
		  
		  var yyyy = resultDay.getFullYear();
		  var mm = Number(resultDay.getMonth()) + 1;
		  var dd = resultDay.getDate();
		 
		  mm = String(mm).length === 1 ? '0' + mm : mm;
		  dd = String(dd).length === 1 ? '0' + dd : dd;
		 
		  thisWeek[i] = yyyy + mm + dd;
		}
				
		return thisWeek.sort();
	}
  
  
  
	function salesOfWeek(){
		var weekArr = [];
		var week = weekDate();
		var obj = {"startDate" : week[0], "endDate" : week[6]};
		
		weekArr.push(obj);
		
		 $.ajax({
			 	url: localhost + '/salesofweek.do',
			    type: "POST",
			    cache: true,
			    dataType: "json",
			    contentType: "application/json",
			    data: JSON.stringify(weekArr),
			    success: function(data){
			    	
			    	
			    	for(var i = 0; i < data.length; i++){
			    		var v = data[i];
			    		
			    		var payWeek = v.payWeek.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			    		var payTotal = v.payTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			    		
			    		$('#weekPay').text(payWeek + '원');
			    		$('#totalPay').text(payTotal + '원');
			    		$('#weekUser').text(v.userWeek + '명');
			    		$('#totalUser').text(v.userTotal + '명');
			    	}
			    	
			    	
			    	paymentListAjax();
			    	
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
	}


    //차트
    function calendarInit(){
  	  
  	  monthArr = [];
  	  
      // 날짜 정보 가져오기
       var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
       var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
       var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
       var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
       
       
       
          if(monthText == "이전달"){
            thisMonth = new Date(currentYear, currentMonth - 1, 1);  
          }else if(monthText == "다음달"){
            thisMonth = new Date(currentYear, currentMonth + 1, 1);
          }else{
            thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
          }
      
      // 달력에서 표기하는 날짜 객체
          currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
          currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
      var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

      var now = new Date();
      var month_now = now.getMonth()+1
      var year_now = now.getFullYear();


      // 렌더링을 위한 데이터 정리
      currentYear = thisMonth.getFullYear();
      currentMonth = thisMonth.getMonth();
      currentDate = thisMonth.getDate();
      
      // 이전 달의 마지막 날 날짜와 요일 구하기
      var startDay = new Date(currentYear, currentMonth, 0);
      var prevDate = startDay.getDate();
      var prevDay = startDay.getDay();

      // 이번 달의 마지막날 날짜와 요일 구하기
      var endDay = new Date(currentYear, currentMonth + 1, 0);
      var nextDate = endDay.getDate();
      var nextDay = endDay.getDay();

      // 현재 월 표기
       $('.year-month').text(currentYear + '.' + (currentMonth + 1));

      // 렌더링 html 요소 생성
      calendar = document.querySelector('.dates')
      calendar.innerHTML = '';
      $(".dates").hide();

      // 지난달
      for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
      }
      // 이번달
      for (var i = 1; i <= nextDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>';
          monthArr.push(i);
      }
     

      if(month_now == currentMonth + 1 && currentYear == year_now){
        $('.go-next').hide();
      }else{
        $('.go-next').show();
      }

      // 다음달
      for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {        	
          calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
      }

      // 오늘 날짜 표기
      if (today.getMonth() == currentMonth) {
          todayDate = today.getDate();
          var currentMonthDate = document.querySelectorAll('.dates .current');
          currentMonthDate[todayDate -1].classList.add('today');
      }
      
  	var year = String(thisMonth.getFullYear());
  	var month = String(thisMonth.getMonth() + 1);
  	
	  	month = month >= 10 ? month : '0' + month;
	  	startDate = year + month + "01";
  	 
  	 var today = new Date(year, month, 0);
  	 var year = today.getFullYear();
  	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
  	 
  	 
  	 var day = ('0' + today.getDate()).slice(-2);
  	 endDate = year + month + day;
  	 
  		paymentChartAjax()
      
    } // CALENDAR INIT FN END

  
  var ajaxData = "";
  
  	// 차트 데이터
  	function paymentChartAjax(){
    	
    	var obj = [{"startDate" : startDate, "endDate" : endDate}];
    	
     	$.ajax({
    	 	url: localhost + "/paymentChart.do",
    	    type: "POST",
    	    cache: false,
            dataType: "json",
            contentType: "application/json",
    	    data: JSON.stringify(obj),
    	    success: function(data){
    	    	
    	    	
			      // 기존 캔버스 삭제
			      $('.div_chart2').find('canvas').remove();
			   	  // 새로 다시 그림
			      $('.div_chart2').append('<canvas id="paymentChartID" style="width: 100%; max: width 1104px;"></canvas>');
			   	  
			   	  $('.removeClass').html('');
    	    	
    	    	ajaxData = data;
    	    	
  				chartSetting();
    			
    	    }, error: function (request, status, error){
    	    	alert("Error");
    	    }
    	  });
  	}
    
    // 차트 세팅
    function chartSetting(){
   
    	
	    var xValues = [];
	    var yValues = [];
	    var yValuesTwo = [];
	 	  
		var yearValue = endDate.substring(0, 4);
		var monthValue = endDate.substring(4, 6);
		var sum = 0;
		var sum2 = 0;
		var dateArr = [];
	    var dataArr = [];
	    var dataArr2 = [];
	   
	    
	    $('.thID1').append('<th scope="col">일자</th>');
	    $('.thID2').append('<th scope="col">일자</th>');
	    $('.thID3').append('<th scope="col">일자</th>');
	    
	    
	    $('.thID_1').append('<th scope="row">총 매출</th>');
	    $('.thID_2').append('<th scope="row">총 매출</th>');
	    $('.thID_3').append('<th scope="row">총 매출</th>');
	    
	    $('.thID_11').append('<th scope="row">매출<br>(10%수수료)</th>');
	    $('.thID_21').append('<th scope="row">매출<br>(10%수수료)</th>');
	    $('.thID_31').append('<th scope="row">매출<br>(10%수수료)</th>');
	    
	    
		
	    for(var i = 1; i <= monthArr.length; i++){
	    	var dateValue = i >= 10 ? i : '0' + i;
	    	
	    	
	    	if( i <= 10 ){
	    		$('.thID1').append('<th scope="col">'+ dateValue +'</th>');
	    	}else if(i >= 10 && i <= 20){
	    		$('.thID2').append('<th scope="col">'+ dateValue +'</th>');
	    	}else{
	    		$('.thID3').append('<th scope="col">'+ dateValue +'</th>');
	    	}
	    	
	    	
	    	dateValue = String(dateValue);
	    	var dateVal = yearValue + monthValue + dateValue;
	    	
	    	
	    	var obj = {'dateDay' : dateVal, "paymentTotal" : 0,  "persent" : 0, "idx" : i};
	    	
	    	dateArr.push(obj);
	    	xValues.push(dateValue);
	    }
    	
	    
	    for(var i = 0; i < ajaxData.length; i++){
	    	var v = ajaxData[i];
	    	var obj = { "paymentTotal" : v.paymentTotal, "persent" : v.persent, "dateDay" : v.dateDay };
	    	dataArr.push(obj);
	    }
 		
 		if(ajaxData.length != 0){
	 		
		  	  for(var i = 0; i < dateArr.length; i++){
		  		  var v = dateArr[i];
		  		  
		  		  for(var y = 0; y < dataArr.length; y++){
		  			  var vv = dataArr[y];
		  			  
		  			  if(v.dateDay == vv.dateDay){
		  				vv.idx = v.idx;
		  				dataArr2.push(vv);
		  			  }
		  		  }
		  	  }
		    
			  	var aaArr = [...new Set([...dataArr2, ...dateArr])];
			  	var aa = aaArr.filter(
	  				(arr, index, callback) => index === callback.findIndex(t => t.idx === arr.idx));
			  	
			  	
			 //정렬
			  var geResult = aa.sort(function (a, b) {
			  	    return a.idx - b.idx;
			  });
			 
			 
			 for(var i = 0; i < geResult.length; i++){
				 var v = geResult[i];
				 
					if(i < 10){
			 		    $('.thID_1').append('<td>'+ v.paymentTotal +'</td>');
			 		    $('.thID_11').append('<td>'+ v.persent +'</td>');
			 		
			 		}else if(i <= 20 && i > 10){
			 		    $('.thID_2').append('<td>'+ v.paymentTotal +'</td>');
			 		    $('.thID_21').append('<td>'+ v.persent +'</td>');
			 		}else{
			 		    $('.thID_3').append('<td>'+ v.paymentTotal +'</td>');
				 		$('.thID_31').append('<td>'+ v.persent +'</td>');
			 		}
			
				 sum += v.paymentTotal;
				 sum2 += v.persent;
				
				 yValues.push(v.paymentTotal);
				 yValuesTwo.push(v.persent);
			 }
			 		
	 			$('#total_all').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	 			$('#total_all2').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			 
 		}else{
 			
 			
 			for(var i = 0; i < xValues.length; i++){
 				
				if(i < 10){
		 		    $('.thID_1').append('<td>0</td>');
		 		    $('.thID_11').append('<td>0</td>');
		 		
		 		}else if(i <= 20 && i > 10){
		 		    $('.thID_2').append('<td>0</td>');
		 		    $('.thID_21').append('<td>0</td>');
		 		}else{
		 		    $('.thID_3').append('<td>0</td>');
			 		$('.thID_31').append('<td>0</td>');
		 		}
 				
 				
				 yValues.push(0);
				 yValuesTwo.push(0);	
 			}
 			
 			$('#total_all').text(sum);
 			$('#total_all2').text(sum2);
 		}
    	
    	
		// 차트 세팅
		  new Chart("paymentChartID", {
				  type: "bar",
				  data: {
				    labels: xValues,
				    datasets: [
		                { label: '총 매출', backgroundColor: "rgba(110, 101, 213)", data: yValues }
		              , { label: 'Pictory 매출 (10%수수료)', backgroundColor: "rgba(169, 153, 255)", borderColor:"red", data: yValuesTwo }
		    ]
				  },
				  options: {
				    legend: {display: true},
				    scales: {
				      yAxes: [{
				        ticks: {
				          beginAtZero: true
				        }
				      }],
				    }
				  }
				});
    }
  
  	var ajaxData = "";
  
  	function paymentListAjax(){
  		
//  		if(choiceValue != "ALL" && keyword != ""){
//			alert("검색어를 입력해주세요");
//			return false;
//		}
	  		
		var obj = [{'page' : page, 'ppp' : ppp}];
	  		
  	 	$.ajax({
  		 	url: localhost + '/paymentList.do',
  		    type: "POST",
  		    cache: false,
  	        dataType: "json",
  	        contentType: "application/json",
  	      	data: JSON.stringify(obj),
  		    success: function(data){
	  		    	
  		  		$('.tr_append').html('');
  		    	
  		    	ajaxData = data;
  		    	
  		    	paymentSetting();
  		    	
  		    }, error: function (request, status, error){
  		    	alert("Error");
  		    }
  		});
  	}
  	
  	
	var choiceValue = "ALL";
    // 최근거래내역 정렬
    $('.searchId').on('click', function(){
    	choiceValue = $(this).attr('value');
   	
    	if(choiceValue == "CONSUMER"){
			$('#buttonTitle').text('구매자 아이디');
		}else if(choiceValue == "SELLER"){
			$('#buttonTitle').text('판매자 아이디');
		}else if(choiceValue == "ORDER"){
			$('#buttonTitle').text('주문 번호');
		}else if(choiceValue == "PRODUCT"){
			$('#buttonTitle').text('상품 번호');
		}else{
			$('#buttonTitle').text('검색 키워드');
		}
		
    });
    
    // 검색 클릭
    $('#searchClick').on('click', function(){
    	paymentSearchAjax();
    });
    
    
    //엔터키
   $("#keyword").on("keyup",function(key){
		if(key.keyCode==13) {
			paymentSearchAjax();
	     }
	});
  	
  	
  	var keyword = "";
  	
  	// 검색
  	function paymentSearchAjax(){
  		
  		keyword =  $('#keyword').val();
  		
  		console.log("choiceValue : ", choiceValue);
  		console.log("keyword : ", keyword);

  		if( choiceValue != 'ALL' && !keyword){
			console.log("검색어 1");
  			alert("검색어를 입력해주세요");
  			return false;
  		}
  		
  		if(choiceValue == 'ALL' && keyword){
			console.log("검색어 2");
			alert("검색 키워드를 선택해주세요");
			return false;
		}
  	
		var obj = [{"keyword" : keyword, 'choiceValue' : choiceValue, 'page' : page, 'ppp' : ppp}];
	
  	 	$.ajax({
  		 	url: localhost + '/paymentSearch.do',
  		    type: "POST",
  		    cache: false,
  	        dataType: "json",
  	        contentType: "application/json",
  	      	data : JSON.stringify(obj),
  		    success: function(data){

  		  		$('.tr_append').html('');
  		  		
  		    	ajaxData = data;
  		    	paymentSetting();
  		    	
  		    	
  		    }, error: function (request, status, error){
  		    	alert("Error");
  		    }
  		});
  	}
  	
  	
  	
  	function paymentSetting(){

  		if(ajaxData[0].length == 0){
			var paymentHTML = "";
			
			paymentHTML += '<tr>';
			paymentHTML += '<td class="text-center" colspan="12">최근 구매 / 판매 목록이 없습니다.</td>';
			paymentHTML += '<tr>';
			
			$('.tr_append').append(paymentHTML);
			return false;
		}  		

  			
  		for(var i = 0; i < ajaxData[0].length; i++){
	
  			var v = ajaxData[0][i];
  			var paymentHTML = "";
  			var payDate = v.paymentDate.substring(0, 10);
  			var paymentTotal = v.paymentTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  			
  			paymentHTML += '<tr>';
  			paymentHTML += '<td class="text-center">'+ v.rnum +'</td>';
  		    paymentHTML += '<td class="text-center">'+ v.consumer +'</a></td>';
  		    paymentHTML += '<td class="text-center">'+ v.seller +'</a></td>';
  		    paymentHTML += '<td class="text-center">'+ v.paymentNo +'</td>';
  		    paymentHTML += '<td class="text-center">'+ v.pdNo +'</td>';
  		    paymentHTML += '<td class="text-center">'+ v.postTitle +'</td>';
  		    paymentHTML += '<td class="text-center"><img style="height: 100px; width: 100px;" src='+ imgUrl + v.photoUrl +' /></td>';
  		    paymentHTML += '<td class="text-center">'+ paymentTotal +'원</td>';
  		    paymentHTML += '<td class="text-center">'+ payDate +'</td>';
  		    paymentHTML += '</tr>';
        	$('.tr_append').append(paymentHTML);
  		}
  			pagingFn();  		
  	}	// FN

  	
  	var firstCheck = "false";
  	var markerNum = 1;
  	
  	// 페이징
  	function pagingFn(){

  		$('.pagination').html('');
  		  	
  		var pagingHTML = "";
   			pagingHTML += '<li class="page-item cur-pointer li_pre"><a class="page-link pagination-link preClick" data-pre_page='+ ajaxData[1].startPage +' "prev"="">Previous</a></li>';
  		
  		for(var i = ajaxData[1].startPage; i <= ajaxData[1].endPage; i++){

			pagingHTML += '<li class="page-item cur-pointer ac_add ac_add'+ i +'"><a class="page-link pagination-link numberClick" data-number='+ i +'>'+ i +'</a></li>';					
  		}	// FOR END
  		
	  		pagingHTML += '<li class="page-item cur-pointer li_next"><a class="page-link nextClick" data-next_page='+ ajaxData[1].endPage +' "next"="">Next</a></li>';
	  		
  			$('.pagination').append(pagingHTML);


		// ACTIVE ADD  			
  			$('.ac_add').removeClass('active');
  			$(".ac_add" + markerNum).addClass("active");

		if(firstCheck == 'true'){
			firstCheck = 'false';
		}
  	}
  	
  	
  	// PREVIOUS BUTTON CLICK
	  $(document).on('click', '.preClick', function(){
				
			if(!ajaxData[1].prev){
				alert("첫번째 페이지 입니다");
				return false;
			}
			
			var preNum = $(this).data('pre_page');
			markerNum = preNum - 1;
			page = preNum - 1;
			
			if(choiceValue == "ALL"){
				paymentListAjax();	
			}else{
				paymentSearchAjax();
			}
		});  	
  	
  	// NEXT BUTTON CLICK
  	$(document).on('click', '.nextClick', function(){
	
		if(!ajaxData[1].next){
			alert("마지막 페이지 입니다");
			return false;
		}
	
		var nextNum = $(this).data('next_page');
		markerNum = nextNum + 1;
		page = nextNum + 1;
		if(choiceValue == "ALL"){
			paymentListAjax();	
		}else{
			paymentSearchAjax();		
		}
	});
  	
  	
  	// 숫자 버튼 클릭
  	$(document).on('click', '.numberClick', function(){
		markerNum = $(this).data('number');
		firstCheck = 'true';
		page = markerNum;
		
		if(choiceValue == "ALL"){
			paymentListAjax();	
		}else{
			paymentSearchAjax();		
		}
	});