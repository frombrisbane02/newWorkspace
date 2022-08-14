
const localurl = 'http://localhost.0.27:4040/springapp/admin';
const imgUrl = 'http://localhost.0.27:4040/springapp/upload/img/';

var urlChange = '/userChart.do';

var monthDay = '';
var dataText = "";
var bbcc = "";
var currentYear = "";
var currentMonth = "";
var thisMonth = "";
var monthText = "";

// 날짜
var startDate = "";
var endDate = "";
 

var tabText = "회원";

var galleryArr = [];


// 차트 관련
var monthArr = [];
var xValues = [];
var yValues = [];
var yValuesTwo = [];

var userId = "";
var myInfoData = "";

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
	  monthArr = [];
      monthText = "이전달";
      calendarInit();
  });

  // 다음달로 이동
  $('.go-next').on('click', function() {
	  	monthArr = [];
        monthText = "다음달";
        calendarInit();
  });

  // 회원과 현황 탭
  $('.memberClass').on('click', function(){
	   urlChange = '/userChart.do';
        monthText = "";
        tabText = "회원";
        calendarInit();
    });

  // 매출 현황 탭
//    $('.salesClass').on('click', function(){
//        monthText = "";
//        tabText = "매출";
//        calendarInit();
//    });

  //갤러리 현황 탭
    $('.galleryClass').on('click', function(){
	      urlChange = '/galleryChart.do';
          monthText = "";
          tabText = "게시물";
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
			 	url: localurl + '/salesofweek.do',
			    type: "POST",
			    cache: false,
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
			    	
			    	
			    	calendarInit();
			    	
			    	
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
    calendar = document.querySelector('.dates');
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
	 
	 	if(tabText == "회원"){
	 		chartUsersInfo();
	 	}
	 	
	 	if(tabText == "게시물"){
			chartUsersInfo();
	 	}
    
  } // CALENDAR INIT FN END
  
  
  
  var ajaxData = "";

  // 회원 CHRAT 현황 데이터
  function chartUsersInfo(){
	 
  var obj = [{"startDate" : startDate, "endDate" : endDate}];
  	  
 	$.ajax({
	 	url: localurl + urlChange,
	    type: "POST",
	    cache: false,
        dataType: "json",
        contentType: "application/json",
	    data: JSON.stringify(obj),
	    success: function(data){
	    	
	    	if(tabText == "회원"){
		    	// 기존 캔버스 삭제
			      $('.div_chart1').find('canvas').remove();
			   	  // 새로 다시 그림
			      $('.div_chart1').append('<canvas id="memberChartID" style="width: 100%; max: width 1104px;"></canvas>');
			   	  
			      $('.thID1').html('');
			      $('.thID2').html('');
			      $('.thID3').html('');
		    	
				  $('.thID_1').html('');
				  $('.thID_2').html('');
				  $('.thID_3').html('');
	    	}else{
			      // 기존 캔버스 삭제
			      $('.div_chart3').find('canvas').remove();
			   	  // 새로 다시 그림
			      $('.div_chart3').append('<canvas id="galleryChartID" style="width: 100%; max: width 1104px;"></canvas>');
			   	  
			      $('.GSRemove').html('');
			      
			      
	    	}
			  			
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
	    
	    
	    if(tabText == "회원"){
		    $('.thID1').append('<th scope="col">일자</th>');
		    $('.thID2').append('<th scope="col">일자</th>');
		    $('.thID3').append('<th scope="col">일자</th>');	    	
	    }else{
		    $('.galleryDateTr1').append('<th scope="col">일자</th>');
		    $('.galleryDateTr2').append('<th scope="col">일자</th>');
		    $('.galleryDateTr3').append('<th scope="col">일자</th>');	    	
	    }
		
	    for(var i = 1; i <= monthArr.length; i++){
	    	var dateValue = i >= 10 ? i : '0' + i;
	    	dateValue = String(dateValue);
	    	var dateVal = yearValue + monthValue + dateValue;
	    
	    	if(tabText == "회원"){
	    		
		    	if( i <= 10){
		    		$('.thID1').append('<th scope="col">'+ dateValue +'</th>');	
		    	} else if(i <= 20 && i >= 10 ) {
		    		$('.thID2').append('<th scope="col">'+ dateValue +'</th>');
		    	} else {
		    		$('.thID3').append('<th scope="col">'+ dateValue +'</th>');
		    	}
		    	
		    	var obj = {"dateDay" : dateVal, "totalCount" : 0, "idx" : i};
		    			    	
	    	}else{
		    	if( i <= 10){
		    		$('.galleryDateTr1').append('<th scope="col">'+ dateValue +'</th>');	
		    	} else if(i <= 20 && i >= 10 ) {
		    		$('.galleryDateTr2').append('<th scope="col">'+ dateValue +'</th>');
		    	} else {
		    		$('.galleryDateTr3').append('<th scope="col">'+ dateValue +'</th>');
		    	}
	    		
		    	var obj = {"dateDay" : dateVal, "photo" : 0, "story" : 0, "idx" : i};
		    	
	    	}
	    	
	    	
	    	
	    	dateArr.push(obj);
	    	xValues.push(dateValue);
	    }
	    

	 	if(tabText == "회원"){
	 		
			  $('.thID_1').append('<th scope="col">회원수</th>');
			  $('.thID_2').append('<th scope="col">회원수</th>');
			  $('.thID_3').append('<th scope="col">회원수</th>');
	 		
	 		if(ajaxData.length != 0){
			  	  for(var i = 0; i < ajaxData.length; i++){
					  var v =  ajaxData[i];
					  var obj = {"dateDay" : v.dateDay, "totalCount" : v.totalCount};
					  dataArr.push(obj);
				  }
		
			  	  
			  	
			  	  
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
			 			$('.thID_1').append('<td>'+ v.totalCount +'</td>');
			 		
			 		}else if(i <= 20 && i > 10){
						  $('.thID_2').append('<td>'+ v.totalCount +'</td>');
			 		}else{
			 			  $('.thID_3').append('<td>'+ v.totalCount +'</td>');	
			 		}
			 		
			 		
			 		
			 		 sum += v.totalCount;
			 		$('#total_all').text(sum);
			 		
			 		yValues.push(v.totalCount);
			 	}	 			
	 		}else{
	 			
	 			for(var i = 0; i < xValues.length; i++){
	 				
			 		if(i < 10){
			 			$('.thID_1').append('<td>0</td>');
			 		
			 		}else if(i <= 20 && i > 10){
						  $('.thID_2').append('<td>0</td>');
			 		}else{
			 			  $('.thID_3').append('<td>0</td>');	
			 		}
	 			
			 		
	 				 yValues.push(0);
	 			}
	 			
		 			$('#total_all').text(0);
	 		}	 	  
	 		
		// 차트 세팅
 		  new Chart("memberChartID", {
 				  type: "bar",
 				  data: {
 				    labels: xValues,
 				    datasets: [
 		                { label: '회원 수', backgroundColor: "rgba(110, 101, 213)", data: yValues }
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
	 	
	 	
	 	if(tabText == "게시물"){
	 		
	 		$('.galleryCount1').append('<th scope="row">갤러리 수</th>');
	 		$('.galleryCount2').append('<th scope="row">갤러리 수</th>');
	 		$('.galleryCount3').append('<th scope="row">갤러리 수</th>');
	 		
	 		$('.storyCount1').append('<th scope="row">스토리 수</th>');
	 		$('.storyCount2').append('<th scope="row">스토리 수</th>');
	 		$('.storyCount3').append('<th scope="row">스토리 수</th>');
	 		
	 		
	 			var galleryDataArr = JSON.parse(ajaxData[0].gallery);
				var storyDataArr = JSON.parse(ajaxData[0].story);
				
				
				// 갤러리 차트 데이터 세팅
				if(galleryDataArr.length != 0){
					
					var gaArr = [];
					var gaArr1 = [];
				  
					for(var y = 0; y < galleryDataArr.length; y++){
						var vv = galleryDataArr[y];
						var dateDay = vv.photoDate.substring(0, 10);
						var dateDay =  dateDay.split("-").join("");
						var obj = {"photo" : vv.photo, "dateDay" : dateDay};
						gaArr.push(obj);
					}
					
					for(var i = 0; i < dateArr.length; i++){
						var v = dateArr[i];
						
						for(var y = 0; y < gaArr.length; y++){
							var vv = gaArr[y];
							
							if(v.dateDay == vv.dateDay){
								vv.idx = v.idx;
								gaArr1.push(vv);
							}
						}
				  	}
				  	
				  	var aaArr = [...new Set([...gaArr1, ...dateArr])];
				  	var aa = aaArr.filter(
		  				(arr, index, callback) => index === callback.findIndex(t => t.idx === arr.idx));
				  	
					 //정렬
					var getResult = aa.sort(function (a, b) {
					  	    return a.idx - b.idx;
					});
					
					
					for(var i = 0; i < getResult.length; i++){
						var v = getResult[i];
						
   						if(i < 10){
				 			$('.galleryCount1').append('<td>'+ v.photo +'</td>');
				 		
				 		}else if(i <= 20 && i > 10){
							$('.galleryCount2').append('<td>'+ v.photo +'</td>');
				 		}else{
				 			$('.galleryCount3').append('<td>'+ v.photo +'</td>');
				 		}
						
						
						sum += v.photo;
						yValues.push(v.photo);
					}
					
						$('#galleryTotal').text(sum);
				  	
					
					
				}else{
					
					for(var i = 0; i < dateArr.length; i++){
						var v = dateArr[i];
						
						if(i < 10){
				 			$('.galleryCount1').append('<td>'+ v.photo +'</td>');
				 		
				 		}else if(i <= 20 && i > 10){
							$('.galleryCount2').append('<td>'+ v.photo +'</td>');
				 		}else{
				 			$('.galleryCount3').append('<td>'+ v.photo +'</td>');
				 		}
						
						
						sum += v.photo;
						yValues.push(v.photo);
					}
					
						$('#galleryTotal').text(sum);
					
				}
				
				// 스토리 차트 데이터 세팅
				if(storyDataArr.length != 0){
					var stArr =[];
					var stArr1 =[];
					for(var y = 0; y < storyDataArr.length; y++){
						var vv = storyDataArr[y];						
						var dateDay = vv.storyDate.substring(0, 10);
						var dateDay =  dateDay.split("-").join("");
						var obj = {"story" : vv.story, "dateDay" : dateDay};
						stArr.push(obj);
					}
				
					for(var i = 0; i < dateArr.length; i++){
						var v = dateArr[i];
						
						for(var y = 0; y < stArr.length; y++){
							var vv = stArr[y];
							
							if(v.dateDay == vv.dateDay){
								vv.idx = v.idx;
								stArr1.push(vv);
							}		
							
						}
					}
					
					
					var aaArr = [...new Set([...stArr1, ...dateArr])];
				  	var aa = aaArr.filter(
		  				(arr, index, callback) => index === callback.findIndex(t => t.idx === arr.idx));
				  	
					 //정렬
					var getResult = aa.sort(function (a, b) {
					  	    return a.idx - b.idx;
					});
					
					for(var i = 0; i < getResult.length; i++){
						var v = getResult[i];
						
   						if(i < 10){
				 			$('.storyCount1').append('<td>'+ v.story +'</td>');
				 		
				 		}else if(i <= 20 && i > 10){
							  $('.storyCount2').append('<td>'+ v.story +'</td>');
				 		}else{
				 			  $('.storyCount3').append('<td>'+ v.story +'</td>');
				 		}
						
						sum2 += v.story;
						yValuesTwo.push(v.story);
					}
					
						$('#storyTotal').text(sum2);
						
				}else{
					
					for(var i = 0; i < dateArr.length; i++){
						var v = dateArr[i];
						
						if(i < 10){
				 			$('.storyCount1').append('<td>'+ v.story +'</td>');
				 		
				 		}else if(i <= 20 && i > 10){
							$('.storyCount2').append('<td>'+ v.story +'</td>');
				 		}else{
				 			$('.storyCount3').append('<td>'+ v.story +'</td>');
				 		}
						
						
						sum2 += v.story;
						yValuesTwo.push(v.story);
					}
						$('#storyTotal').text(sum2);
				}
	 		
			// 차트 세팅
			  new Chart("galleryChartID", {
					  type: "bar",
					  data: {
					    labels: xValues,
					    datasets: [
			                { label: '갤러리 수', backgroundColor: "rgba(110, 101, 213)", data: yValues }
			              , { label: '스토리 수', backgroundColor: "rgba(169, 153, 255)", borderColor:"red", data: yValuesTwo }
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
	  
  }
  
  
  
  
  
//======================================= 회원 정보 ===============================================================
  //회원 정보
  	$('.userClass').on('click', function(){
  		userAjax();
  	});
  
  
  	
  	// 페이징 선언
  	// 보여줄 페이지 번호
  	var page = 1;
  	// 페이지당 보여줄 게시글의 갯수
	var ppp = 10;
	
  	var userNo = 0, enabled = 0, keyword = "", userData = "", orderby = "ASC";
		    	
	

  // 회원 리스트 조회
  	function userAjax(){
	
		keyword = $("#keyword").val();
		
		var obj = [{'type' : 'ALL', 'keyword' : keyword, 'ppp' : ppp, 'page' : page, 'orderby' : orderby}];
			
	 	$.ajax({
		 	url: localurl + "/userData.do",
		    type: "POST",
		    cache: false,
	        dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(obj),
		    success: function(data){
			
				console.log("DATA CHECK : ", data);
				
				userData = data;
				memberSetting(data);
				
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
		  });
  	}
  
  	// 회원 리스트 세팅
  	function memberSetting(data){
  		
  		$('#userListAppend').html('');
  		
  		
  		if(data[0].length == 0){
			innerHtml += '<tr>';
			innerHtml += '<td class="text-center" colspan="6">회원이 없습니다.</td>';
			innerHtml += '</tr>';
			$('#userListAppend').append(innerHtml);  			
  			return false;
  		}
  		
  		
		 

		for(var i = 0; i < data[0].length; i++){			
			var v = data[0][i];
			
			if(v.enabled == 1){
				var buttonHTML = '<button type="button" style="background-color:red;" class="btn btn-secondary btn-sm btnClick" data-userno='+ v.userNo +' data-enabled='+ v.enabled +'>활동정지</button>';
				
			}else{
				var buttonHTML = '<button type="button" style="background-color:green;" class="btn btn-secondary btn-sm btnClick" data-userno='+ v.userNo +' data-enabled='+ v.enabled +'>복원</button>';
				
			}
						
			var innerHtml = "";	
			innerHtml += '<tr>';
			innerHtml += 	'<td class="text-center">'+ v.rnum +'</td>';
			innerHtml +=	'<td class="text-center cur-pointer"><a class="primary modalShow" data-toggle="modal" data-target="#exampleModalCenter" data-userno='+ v.userNo +'>'+ v.userId +'</a></td>';
			innerHtml +=	'<td class="text-center">'+ v.userPassword +'</a></td>';
			innerHtml +=	'<td class="text-center">'+ v.userEmail +'</a></td>';
			innerHtml +=	'<td class="text-center">'+ v.userName +'</td>';
			innerHtml +=	'<td class="text-center">'+ v.userNickname +'</td>';
			innerHtml +=	'<td class="text-center">'+ buttonHTML +'</td>';
			innerHtml += '</tr>';
			$('#userListAppend').append(innerHtml);
		}
		
			pagingFn();
  	}
  	
  	
  	// 모달 세팅
  	$(document).on("click", '.modalShow',function(){
  		var userNo = $(this).data("userno");  		
  		for(var i = 0; i < userData[0].length; i++){
  			var v = userData[0][i];
  			if(userNo == v.userNo){
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
  		}
  	});
  	
  	
  	// 활동 정지 버튼
  	$(document).on('click', '.btnClick', function(){
  		var userNo = $(this).data('userno');
		var enabled = $(this).data('enabled');
			keyword = $("#keyword").val();
		
			if(enabled == 1){
				var enData = 2;
			}else{
				var enData = 1;
			}
			
			var obj = [{'type' : 'UPDATE', 'userNo' : userNo, 'enabled' : enData, 'page' : page, 'ppp' : ppp, 'keyword' : keyword, 'orderby' : orderby }];
  		
  		 $.ajax({
 		    url: localurl + "/userData.do",
 		    type: "POST",
 		    cache: false,
 		    dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(obj),
 		    success: function(data){
 				
 				var check = "";
 				 				
 				for(var i = 0; i < data[0].length; i++){
 					var v = data[0][i];
 					
 					if(userNo == v.userNo && enabled != v.enabled){
 						check = "success";
 					}
 				}
 				 				
				if(check == "success"){
					alert("업데이트 되었습니다");
				}else{
					alert("업데이트에 실패 했습니다");
				}
			
					memberSetting(data);
 				
 		    }, error: function (request, status, error){
 		    	alert("Error");
 		    }
 		  });
  	});
  	
  	
  	// 검색 버튼
  	$('#searchClick').on('click', function(){
  		searchFn();
  	});
  	
  	//엔터키
   $("#keyword").on("keyup",function(key){
		if(key.keyCode==13) {
			searchFn();
	     }
	});
	
	var orderby = "ASC";
	
	// 오름 차순 내림 차순
	$('.orderClick').on('click', function(){
		orderby = $(this).attr('value');
		
		if(orderby == "ASC"){
			$('#orderId').text('오름 차순');	
		}else{
			$('#orderId').text('내림 차순');
		}
		
		searchFn();
	});
  	
  	// 회원 검색
  	function searchFn(){
		keyword = $("#keyword").val();
  		
//  		if(keyword == ""){
//  			alert("검색어를 입력해주세요");
//  			return false;
//  		}

		var obj = [{'type' : 'SEARCH', 'keyword' : keyword, 'ppp' : ppp, 'page' : page, 'orderby' : orderby}];
  		
 		 $.ajax({
  		    url: localurl + "/userData.do",
  		    type: "POST",
  		    cache: false,
  		    dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(obj),
  		    success: function(data){		 
			 userData = data;
			 memberSetting(data);
  		    }, error: function (request, status, error){
  		    	alert("Error");
  		    }
  		});
  	}
  	
  	  	
  	var firstCheck = "false";
  	var markerNum = 1;
  	
  	// 페이징
  	function pagingFn(){
  		
  		$('.pagination').html('');
  		  	
  		var pagingHTML = "";
   			pagingHTML += '<li class="page-item cur-pointer li_pre"><a class="page-link pagination-link preClick" data-pre_page='+ userData[1].startPage +' "prev"="">Previous</a></li>';
  		
  		for(var i = userData[1].startPage; i <= userData[1].endPage; i++){
			
//			active

			pagingHTML += '<li class="page-item cur-pointer ac_add ac_add'+ i +'"><a class="page-link pagination-link numberClick" data-number='+ i +'>'+ i +'</a></li>';
			
//  			if(i == 1){
//  				pagingHTML += '<li class="page-item ac_add ac_add'+ i +'"><a class="page-link pagination-link numberClick" data-number='+ i +'>'+ i +'</a></li>';
//  			}else{					
//  			}  						
  		}	// FOR END
  		
	  		pagingHTML += '<li class="page-item cur-pointer li_next"><a class="page-link nextClick" data-next_page='+ userData[1].endPage +' "next"="">Next</a></li>';
	  		
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
		
		if(!userData[1].prev){
			alert("첫번째 페이지 입니다");
			return false;
		}
		
		var preNum = $(this).data('pre_page');
		markerNum = preNum - 1;
		page = preNum - 1;		
		
		if(keyword == ""){
			userAjax();	
		}else{
			searchFn();
		}
		
	});  	
  	
  	// NEXT BUTTON CLICK
  	$(document).on('click', '.nextClick', function(){
	
		if(!userData[1].next){
			alert("마지막 페이지 입니다");
			return false;
		}
	
		var nextNum = $(this).data('next_page');
		markerNum = nextNum + 1;
		page = nextNum + 1;
		
		
		if(keyword == ""){
			userAjax();	
		}else{
			searchFn();
		}
		
	});
  	
  	
  	// 숫자 버튼 클릭
  	$(document).on('click', '.numberClick', function(){
		markerNum = $(this).data('number');
		firstCheck = 'true';
		page = markerNum;
		
		if(keyword == ""){
			userAjax();	
		}else{
			searchFn();
		}
	});
  	