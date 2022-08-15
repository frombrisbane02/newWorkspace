const localurl = 'http://192.168.0.27:4040/springapp/admin';
const imgUrl = 'http://192.168.0.27:4040/springapp/upload/img/';

var tabText = '공지';
var orderby = "ASC";
var userId = $('#adminUserId').val();

var userId = "";
var myInfoData = "";

var noticeAjaxData = "";
var URLInfo = "/noticeList.do";

// 페이징
var page = 1;
var ppp = 10;


	$(document).ready(function() {
		userId = $('#mainUserId').val();
		
		if(!userId){
			alert("로그인을 해주세요\n로그인 페이지로 이동합니다");
			window.location.href = "http://192.168.0.27:4040/springapp/auth/Logout.do";
			return false;
		}
		
			AdminLoginInfo();
	});


function AdminLoginInfo(){
			$.ajax({
			 //컨트롤러 주소값
			 	url: localurl + '/LoginUserInfo.do',
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
	//	console.log("myInfoData : ", myInfoData);
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

//한 주
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
		    	
		    	
		    		noticeListFn();
		    	
		    	
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
	  });
}

//Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});

  //탭 클릭
  $(document).on('click', '.tabClick', function(){
	 
	 tabText = $(this).data('tab_title');
	 
	 if(tabText == "공지"){
		 URLInfo = "/noticeList.do";
		 noticeListFn();
	 }else if(tabText == "qna"){
		 URLInfo = "/qnaList.do";
		 noticeListFn();
	 }else{
//		 URLInfo = "/reportList.do";
	 }
  });
  
  
  var answerChk = "ALL";
  
  // 공지사항 정렬
  $('.orderClick').on('click', function(){
	  orderby = $(this).attr('value');
	  noticeListFn();
  });
  
  // QNA 답변 미답변
  $('.answerClick').on('click', function(){
	  answerChk = $(this).attr('value');
	  noticeListFn();
  });
  
  
  var qnaNo = "";
  
  //Q&A 답변클릭
  $('#modalQnaClick').on('click',function(){
	  	qnaNo = $(this).val();
	  	var qnaTextValue = $(this).text();
	 	
	  	if(qnaTextValue == "답변"){
	  		URLInfo = "/qnaAnswer.do";
	  	}else{
	  		URLInfo = "/qnaAnswerUpdate.do";
	  	}
	  	
	 	qnaAnswerFn();
  });
  
  //Q&A 답변
  function qnaAnswerFn(){
	  
	     var answerText = $('#modalQnaAnswer').val();
		
		if(!answerText){
			alert("답변을 입력해주세요");
			return false;
		}
		
		
		// 모달창 삭제
		$('#modalQnaClick').attr('data-dismiss', "modal");
		
		var obj = [{"qnaNo" : qnaNo, "answerText" : answerText}];
	
		 $.ajax({
			    url: localurl + URLInfo,
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    data: JSON.stringify(obj),
			    success: function(data){
			    	
			    	if(data == true){
			    		alert("등록 되었습니다");
			    		$('#modalQnaAnswer').val('');
			    		URLInfo = "/qnaList.do";
			    		noticeListFn();
			    		return false;
			    	}else{
			    		alert("등록에 실패했습니다");
			    		return false;
			    	}
			    		    	
//			    	noticeAjaxData = data;		    	
//			    	$('#tr_notice').html('');
//			    	$('#qnaTbody').html('');		    	
//			    	noticeSettingFn();
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
  }
  
  // 데이터 AJAX
  function noticeListFn(){
	  
	  if(tabText == "공지"){
		  var noticeKeyword = $('#noticeKeyword').val();
		  var obj = [{"orderby" : orderby, "noticeKeyword" :  noticeKeyword, 'ppp' : ppp, 'page' : page}];
	  } 
		  
	  if(tabText == "qna"){
		  var qnaKeyword = $('#qnaKeyword').val();
		  var obj = [{"orderby" : orderby, "answerChk" : answerChk ,"qnaKeyword" :  qnaKeyword, 'ppp' : ppp, 'page' : page}];		  
	  }

	 $.ajax({
		    url: localurl + URLInfo,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    contentType: "application/json",
		    data: JSON.stringify(obj),
		    success: function(data){
		    		    	
		    	noticeAjaxData = data;
		    	
		    	$('#tr_notice').html('');
		    	$('#qnaTbody').html('');
		    	
		    	noticeSettingFn();
		    	
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
	  });
  }
  
  // 리스트 세팅
  function noticeSettingFn(){
	  
		if(tabText == "공지" && noticeAjaxData[0].length == 0){
			var noticeHTML = '';
			noticeHTML += '<tr>'
			noticeHTML	+= '<td class="text-center" colspan="6">등록된 글이 없습니다.</td>'
		    noticeHTML += '</tr>'
			$('#tr_notice').append(noticeHTML);
		   	return false;
		}
		
		if(tabText == "qna" && noticeAjaxData[0].length == 0){
			var qnaHTML = '';
			qnaHTML += '<tr>'
			qnaHTML += '<td class="text-center" colspan="6">등록된 글이 없습니다.</td>'
			qnaHTML += '</tr>'
			$('#qnaTbody').append(qnaHTML);
			return false;
		}
	  
	  if(tabText == "공지"){
		  for(var i = 0; i < noticeAjaxData[0].length; i++){
			  var noticeHTML = '';
			  var v = noticeAjaxData[0][i];
			  var noDate = v.noticeDate.substring(0, 10);
			  	  noticeHTML += '<tr>'
				  noticeHTML += '<td class="text-center">'+ v.rnum +'</td>'
				  noticeHTML += '<td><a class="primary cur-pointer modalClick" data-modal_no='+ v.noticeNo +' data-toggle="modal" data-target="#exampleModalCenter">[공지사항] '+ v.noticeTitle +'</a></td>'
				  noticeHTML += '<td>'+ v.userId +'</td>'
				  noticeHTML += '<td class="text-center">'+ noDate +'</td>'
				  noticeHTML += '</tr>'
				  $('#tr_notice').append(noticeHTML);
		  }  
	  }else if(tabText == 'qna'){
		  for(var i = 0; i < noticeAjaxData[0].length; i++){
			  var qnaHTML = '';
			  var v = noticeAjaxData[0][i];
			  
				if(v.answerText){
					var anCheck = "O";
					
					var anHTML = '<td style="color:green; font-size: 20px;" class="text-center">O</td>';
					
				}else{
					var anCheck = "X";
					var anHTML = '<td style="color:red; font-size: 20px;" class="text-center">X</td>';
				}
			  
			  var qnDate = v.qnaDate.substring(0, 10);
			 	  qnaHTML += '<tr>'
				  qnaHTML += '<td class="text-center">'+ v.rnum +'</td>'
				  qnaHTML += '<td class="text-center"><a class="primary cur-pointer modalClick" data-modal_no='+ v.qnaNo +' data-toggle="modal" data-target="#exampleModalCenter1">'+ v.qnaTitle +'</a></td>'
				  qnaHTML += '<td class="text-center">'+ v.userId +'</a></td>'
				  qnaHTML += ''+ anHTML +'';
				  qnaHTML += '<td class="text-center">'+ qnDate +'</td>'
				  qnaHTML += '</tr>'
				  $('#qnaTbody').append(qnaHTML);
		  }		  
	  }
	  
	  	pagingFn();
  }
  
  
  // 모달 클릭
  $(document).on('click', '.modalClick', function(){
	  var modalNo = $(this).data('modal_no');
	  if(tabText == '공지'){
		  for(var i = 0; i < noticeAjaxData[0].length; i++){
			  var v = noticeAjaxData[0][i];
			  var noDate = v.noticeDate.substring(0, 10);
			  if(modalNo == v.noticeNo){
				  $('#modalNo').text(v.noticeNo);
				  $('#modalID').text(v.userId);
				  $('#modalDate').text(noDate);
				  $('#modalTitle').val(v.noticeTitle);
				  $('#modalContent').val(v.noticeContent);
				  $('#updateNoticeBtn').val(v.noticeNo);
				  $('#deleteNoticeBtn').val(v.noticeNo);
			  }
		  }  
	  }else if(tabText == 'qna'){
		  
		  
//		  $('.modalQnaRemove').text('');
		  $('.modalQnaRemove').val('');
		  
		 // console.log("noticeAjaxData : ", noticeAjaxData);
		  
		  for(var i = 0; i < noticeAjaxData[0].length; i++){
			  var v = noticeAjaxData[0][i];
			  var qnDate = v.qnaDate.substring(0, 10);
			  if(modalNo == v.qnaNo){
				  if(v.answerText){
					  $('#modalQnaAnswer').val(v.answerText);
					  $('#modalQnaClick').text('수정');
				  }else{
					  $('#modalQnaAnswer').val('');
					  $('#modalQnaClick').text('답변');
				  }
				  
				  $('#modalQnaNo').text(v.qnaNo);
				  $('#modalQnaId').text(v.userId);
				  $('#modalQnaDate').text(qnDate);
				  $('#modalQnaTitle').text(v.qnaTitle);
				  $('#modalQnaContent').text(v.qnaContent);
				  $('#modalQnaClick').val(v.qnaNo);
				  $('#modalQnaDelete').val(v.qnaNo);
			  }
		  }
	  }
  });
  
  // 공지사항 업데이트
  $('#updateNoticeBtn').on('click',function(){
	  
	  var noticeTitle = $('#modalTitle').val();
	  var noticeContent = $('#modalContent').val();
	  var noticeNo = $(this).val();
	  var obj = {"noticeNo" : noticeNo, "noticeTitle" : noticeTitle, "noticeContent" : noticeContent};
	  
	// 모달창 삭제
	   $('#updateNoticeBtn').attr('data-dismiss', "modal");
	  
		 $.ajax({
			    url: localurl + "/noticeUpdate.do",
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    data: JSON.stringify(obj),
			    success: function(data){
					if(data == false){
						alert("업데이트에 실패했습니다");
						return false;
					}else{
						alert("업데이트 되었습니다");
						noticeListFn();
					}
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
  });
  
  // 공지사항 삭제
  $('.modelDeleteBtn').on('click', function(){

		  var deleteMessage = confirm('공지사항을 삭제하시겠습니까?');
		  if(!deleteMessage){
			  alert("취소 되었습니다");
			  return false;
		  }
		  
		if(tabText == '공지'){
		 var noticeNo = $(this).val();
		 var obj = { "noticeNo" : noticeNo };
		 var delUrl = "/noticeDelete.do";
		 // 모달창 삭제
		 $('#deleteNoticeBtn').attr('data-dismiss', "modal");
				 
		}else if(tabText == 'qna'){
		 var qnaNo = $(this).val();
		 var obj = { "qnaNo" : qnaNo };
		 var delUrl = "/qnaDelete.do";
		// 모달창 삭제
		 $('#modalQnaDelete').attr('data-dismiss', "modal");
		}
	    
		 $.ajax({
			    url: localurl + delUrl,
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    data: obj,
			    success: function(data){
					if(data == false){
						alert("삭제가 안 되었습니다");
						return false;
					}else{
						alert("삭제 되었습니다");
						noticeListFn();
					}
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
  });
  
  // 공지사항 등록
  $('#noticeInsertBtn').on('click', function(){
	 	  
	  var noticeTitle = $("#noInsertTitle").val();
	  var noticeContent = $("#noInsertContent").val();
	  var obj = [{"userNo" : 1, "noticeTitle" : noticeTitle, "noticeContent" : noticeContent}];
	  
	  // 모달창 삭제
	  $('#noticeInsertBtn').attr('data-dismiss', "modal");
	  
	 $.ajax({
		    url: localurl + "/noticeInsert.do",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    contentType: "application/json",
		    data: JSON.stringify(obj),
		    success: function(data){
		    	if(data == false){
		    		alert("등록에 실패 했습니다");
		    		return false;
		    	}else{
		    		alert("등록 되었습니다");
		    		$("#noInsertTitle").val('');
		    		$("#noInsertContent").val('');
		    		
		    		noticeListFn();
		    	}
		    	
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
	  });
  });
  
  
//  ============================ 페이징 ===============================================================================
  
  	var firstCheck = "false";
  	var markerNum = 1;
  	
  	// 페이징
  	function pagingFn(){
  		
  		$('.pagination').html('');
  		  	
  		var pagingHTML = "";
   			pagingHTML += '<li class="page-item cur-pointer li_pre"><a class="page-link pagination-link preClick" data-pre_page='+ noticeAjaxData[1].startPage +' "prev"="">Previous</a></li>';
  		
  		for(var i = noticeAjaxData[1].startPage; i <= noticeAjaxData[1].endPage; i++){
			
//			active

			pagingHTML += '<li class="page-item cur-pointer ac_add ac_add'+ i +'"><a class="page-link pagination-link numberClick" data-number='+ i +'>'+ i +'</a></li>';
			
//  			if(i == 1){
//  				pagingHTML += '<li class="page-item ac_add ac_add'+ i +'"><a class="page-link pagination-link numberClick" data-number='+ i +'>'+ i +'</a></li>';
//  			}else{					
//  			}  						
  		}	// FOR END
  		
	  		pagingHTML += '<li class="page-item cur-pointer li_next"><a class="page-link nextClick" data-next_page='+ noticeAjaxData[1].endPage +' "next"="">Next</a></li>';
	  		
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
		
		if(!noticeAjaxData[1].prev){
			alert("첫번째 페이지 입니다");
			return false;
		}
		
		var preNum = $(this).data('pre_page');
		markerNum = preNum - 1;
		page = preNum - 1;
		noticeListFn();
		
	});  	
  	
  	// NEXT BUTTON CLICK
  	$(document).on('click', '.nextClick', function(){
	
		if(!noticeAjaxData[1].next){
			alert("마지막 페이지 입니다");
			return false;
		}
	
		var nextNum = $(this).data('next_page');
		markerNum = nextNum + 1;
		page = nextNum + 1;
		noticeListFn();
		
	});
  	
  	
  	// 숫자 버튼 클릭
  	$(document).on('click', '.numberClick', function(){
		markerNum = $(this).data('number');
		firstCheck = 'true';
		page = markerNum;
		noticeListFn();
	});