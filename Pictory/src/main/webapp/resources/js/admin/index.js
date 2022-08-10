const localhost = 'http://localhost:4040/springapp/admin';
const imgUrl = 'http://localhost:4040/springapp/upload/img/';

var userId = "";
var myInfoData = "";

	$(document).ready(function(){
		
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
						
						console.log("vvv : ", v);
						
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
			
			console.log("vv : ", v);
			
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
	
	// 한 주
	function weekDate(){
	
		var currentDay = new Date();  
		var theYear = currentDay.getFullYear();
		var theMonth = currentDay.getMonth();
		var theDate  = currentDay.getDate();
		var theDayOfWeek = currentDay.getDay();
		 
		var thisWeek = [];
	 
		for(var i = 0; i < 7; i++) {
		  var resultDay = new Date(theYear, theMonth, theDate - (i + theDayOfWeek) + 7);
		  
		  var yyyy = resultDay.getFullYear();
		  var mm = Number(resultDay.getMonth()) + 1;
		  var dd = resultDay.getDate();
		 
		
		  mm = String(mm).length === 1 ? '0' + mm : mm;
		  dd = String(dd).length === 1 ? '0' + dd : dd;
		 
		  thisWeek[i] = yyyy + mm + dd;
		}

		return thisWeek.sort();
	}
	
	// 매출FN
	function salesOfWeek(){
		
		var weekArr = [];
		var week = weekDate();
		var obj = {"startDate" : week[0], "endDate" : week[6]};
		weekArr.push(obj);
		
			$.ajax({
			 //컨트롤러 주소값
			 	url: localhost + '/salesofweek.do',
			    type: "POST",
			    //비동기
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    //string으로 ..
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
			    	
			    		paymentChartAjax();
			   	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
	}
	
	// 이번주 매출FN
	function paymentChartAjax(){
		
		var weekDay = weekDate();
		var weekArr = []; 
		var obj = {"startDate" : weekDay[0], "endDate" : weekDay[6]};
		weekArr.push(obj);
		
			 $.ajax({
			    url: localhost + '/mainPaymentChart.do',
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    data: JSON.stringify(weekArr),
			    success: function(data){
			    	    
			    	mainPaymentChartSetting(data);
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
	}
	
	function mainPaymentChartSetting(data){
		
		var weekLength = weekDate();
		 
			 var dateArr = [];
			 var dataArr = [];
			 var dataArr2 = [];
			 var yValues = [];
			 var yValues2 = [];

			 for(var i = 0; i < weekLength.length; i++){
				 var v = weekLength[i];
				 var obj = {"dateDay" : v, "paymentTotal" : 0, "persent" : 0, "idx" : i};
				 dateArr.push(obj);
			 }
			 
			 
		if(data.length != 0){
			
			 for(var i = 0; i < data.length; i++){
				 var v = data[i];
				 var obj = {"dateDay" : v.dateDay, "paymentTotal" : v.paymentTotal, "persent" : v.persent};
				 dataArr.push(obj);
			 }
			 
			 	
			 for(var i = 0; i < dataArr.length; i++){
			 
				 var v = dataArr[i];
				 
				for(var y = 0; y < dateArr.length; y++){
				
					var vv = dateArr[y];
					
					if(v.dateDay == vv.dateDay){
						v.idx = vv.idx;
						dataArr2.push(v);
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
					yValues.push(v.paymentTotal);
					yValues2.push(v.persent);
				}
		}else{
			
			for(var i = 0; i < dateArr.length; i++){
				var v = dateArr[i];
				yValues.push(v.paymentTotal);
				yValues2.push(v.persent);
			}
		}

	//이번 주 매출 (메인에 보여주기)				
		 		var xValues = ["월", "화", "수", "목", "금", "토", "일"];

				var barColors = [
				  "rgba(110, 101, 213)",
		 		  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
		 		  "rgba(110, 101, 213)"
				 
				];

			new Chart("earningChart", {
				  type: "bar",
				  data: {
				    labels: xValues,
				    datasets: [{
				      backgroundColor: barColors,
				      data: yValues
				    }]
				  },
				  options: {
				    legend: {display: false},
				    scales: {
				      yAxes: [{
				        ticks: {
				          beginAtZero: true
				        }
				      }],
				    }
				  }
				});
				
				
				//이번 주 Picktory 매출 (메인에 보여주기)
				var xValues = ["월", "화", "수", "목", "금", "토", "일"];
//				var yValues = [60, 50, 68, 87, 73, 79, 52];
				var barColors = [
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)",
				  "rgba(110, 101, 213)"
				 
				];
				
		new Chart("visitChart", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues2
			    }]
			  },
			  options: {
			    legend: {display: false},
			    scales: {
			      yAxes: [{
			        ticks: {
			          beginAtZero: true
			        }
			      }],
			    }
			  }
			});
			
			mainUsersAjax();
	}

		 function mainUsersAjax(){
			
			var weekArr = [];
			var weekDay = weekDate();
			var obj = {"startDate" : weekDay[0], "endDate" : weekDay[6]};
			weekArr.push(obj);
			var xhttp = new XMLHttpRequest();
			xhttp.open('POST', localhost + '/mainUsersChart.do', true);
			xhttp.setRequestHeader('Content-Type', 'application/json');
			xhttp.send(JSON.stringify(weekArr));
			xhttp.onload = () => {
				if(xhttp.status != 200){
					console.log("ERROR : ", xhttp.status);
					return false;
				}
				
				var data = JSON.parse(xhttp.response);
				mainUsersChartSetting(data);
			}
		 }
		 
		 
		 function mainUsersChartSetting(data){
			var weekLength = weekDate();
			 
			 var dateArr = [];
			 var dataArr = [];
			 var dataArr2 = [];
			 var yValues = [];
			 var yValues2 = [];
			
			 
			 for(var i = 0; i < weekLength.length; i++){
				 var v = weekLength[i];
				 var obj = {"dateDay" : v, "totalCount" : 0, "idx" : i};
				 dateArr.push(obj);
			 }
			 
			 
			 
			 if( data.length != 0 ){
				 
				 for(var i = 0; i < data.length; i++){
					 var v = data[i];
					 var obj = {"dateDay" : v.dateDay, "totalCount" : v.totalCount};
					 dataArr.push(obj);
				 }
				 
				 	
				 for(var i = 0; i < dataArr.length; i++){
				 
					 var v = dataArr[i];
					 
					for(var y = 0; y < dateArr.length; y++){
					
						var vv = dateArr[y];
						
						if(v.dateDay == vv.dateDay){
							v.idx = vv.idx;
							dataArr2.push(v);
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
						yValues.push(v.totalCount);
					}
			 }else{
				 	
					for(var i = 0; i < dateArr.length; i++){
						var v = dateArr[i];
						yValues.push(v.totalCount);
					}
				 
			 }
			 
			 
				//이번 주 가입한 회원 수 (메인에 보여주기)
				var xValues = ["월", "화", "수", "목", "금", "토", "일"];
//				var yValues = [3,5,3,4,7,3,1];

				new Chart("memberChart", {
					  type: "line",
					  data: {
					    labels: xValues,
					    datasets: [{
					      fill: false,
					      lineTension: 0,
					      backgroundColor: "rgba(110, 101, 213)",
					      borderColor: "rgba(110, 101, 213)",
					      data: yValues
					    }]
					  },
					  options: {
					    legend: {display: false},
					    scales: {
					     
					    }
					  }
				});
				
				galleryChartAjax();
		}
		
		function galleryChartAjax(){
			var weekArr = [];
			var weekDay = weekDate();
			var obj = {"startDate" : weekDay[0], "endDate" : weekDay[6]};
			
			weekArr.push(obj);
			
			 $.ajax({
					    url: localhost + '/mainGalleryChart.do',
					    type: "POST",
					    cache: false,
					    dataType: "json",
					    contentType: "application/json",
					    data: JSON.stringify(weekArr),
					    success: function(data){
					    	
					    	galleryChartSetting(data);
					    	
					    }, error: function (request, status, error){
					    	alert("Error");
					    }
				  });
		}
		
		
		function galleryChartSetting(data){
	
			 var sumArr1 = [];
			 var sumArr2 = [];
			 var yValues = [];

			 
			 if( data.length != 0 ){
				 
				 for(var i = 0; i < data.length; i++){
					 var v = data[i];
					 yValues = [v.photo, v.story];
				 }

			 }else{
				 
				 yValues = [0, 0];				 
			 }
			 
			 
			//갤러리와 스토리 도넛비율
				var xValues = ["갤러리", "스토리"];
//				var yValues = [55, 42];
				var barColors = [
				  "#6e65d5",
				  "#a999ff",
				];
			
				new Chart("galleryChart", {
					  type: "doughnut",
					  data: {
					    labels: xValues,
					    datasets: [{
					      backgroundColor: barColors,
					      data: yValues
					    }]
					  },
					  options: {
					    responsive : false,
					    title: {
					      display: false
					      
					    }
					  }
				});
			 
				paymentAjax();
		 }
		 
		 
		 function paymentAjax(){
			
			 $.ajax({
			    url: localhost + '/mainPaymentList.do',
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    data: { },
			    success: function(data){
			    		    
			    	paymentListSetting(data);
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
		}
		
		
		function paymentListSetting(data){
		
		
		$('#mainPaymentAppend').html('');
		
		if(data.length == 0){
			var payHTML = "";			
			payHTML += '<tr>';
			payHTML +=  '<td class="text-center" colspan="12">등록된 글이 없습니다.</td>';
			payHTML += '</tr>';
			$('#mainPaymentAppend').append(payHTML);
		}else{
			
			for(var i = 0; i < data.length; i++){
				var v = data[i];
				
				var payHTML = "";
				
				var payDate = v.paymentDate.substring(0, 10);
				var num = i + 1;
				
				var paymentTotal = v.paymentTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
				payHTML += '<tr>';
				payHTML += '<td class="text-center">'+ num +'</td>';
				payHTML += '<td class="text-center">'+ v.consumer +'</td>';
				payHTML += '<td class="text-center">'+ v.seller +'</td>';
				payHTML += '<td class="text-center">'+ v.paymentNo +'</td>';
				payHTML += '<td class="text-center">'+ v.pdNo +'</td>';
				payHTML += '<td class="text-center">'+ v.postTitle +'</td>';
				payHTML += '<td class="text-center"><img style="height: 100px; width: 100px;" src='+ imgUrl + v.photoUrl +' /></td>';
				payHTML += '<td class="text-center">'+ paymentTotal +'원</td>';
				payHTML += '<td class="text-center">'+ payDate +'</td>';
				payHTML += '</tr>';
				$('#mainPaymentAppend').append(payHTML);
			}
		}
		
			noticeAjax();
	}
	
	
	var noticeAJaxData = "";
	var qnaAJaxData = "";
	
	function noticeAjax(){
		
		$.ajax({
				    url: localhost + '/mainNoticeList.do',
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    contentType: "application/json",
				    data: { },
				    success: function(data){
				    	
				    	noticeAJaxData = data;
				    	
				    	noticeListSetting(data);
				    	
				    }, error: function (request, status, error){
				    	alert("Error");
				    }
			  });
	}
	
	function noticeListSetting(data){
		$('#mainNoticeAppend').html('');
			
			if(data.length == 0){
				var noHTML = "";
				noHTML += '<tr>';
				noHTML += '<td class="text-center" colspan="10">등록된 글이 없습니다.</td>';
				noHTML += '</tr>';
				$('#mainNoticeAppend').append(noHTML);
			}else{
				for(var i = 0; i < data.length; i++){
					
					var v = data[i];
					var noHTML = "";
					var num = i + 1;
					var noDate = v.noticeDate.substring(0, 10);
					
					noHTML += '<tr>';
					noHTML += '<td class="text-center">'+ num +'</td>';
					noHTML += '<td><a class="primary cur-pointer modalClick" data-number='+ num +' data-notice_no='+ v.noticeNo +' data-modal_text="notice" data-toggle="modal" data-target="#exampleModalCenter1">[공지사항] '+ v.noticeTitle +'</a></td>';
					noHTML += '<td>'+ v.userId +'</td>';
					noHTML += '<td class="text-center">'+ noDate +'</td>';
					noHTML += '</tr>';
					
					$('#mainNoticeAppend').append(noHTML);
				}				
			}
		
			mainQnaAjax();
	}
	
	
	function mainQnaAjax(){
		
			$.ajax({
			    url: localhost + '/mainQnaList.do',
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    data: { },
			    success: function(data){
			    	qnaAJaxData = data;
			    	mainQnaSetting(data);
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
	}
	
	
			// Q & A 세팅
		function mainQnaSetting(data){
			
			$("#mainQnaAppend").html('');
			
			if(data.length == 0){
				var qnaHTML = "";
				qnaHTML += '<tr>';
				qnaHTML +=   '<td class="text-center" colspan="6">등록된 글이 없습니다.</td>';
				qnaHTML +=	'</tr>';
				$("#mainQnaAppend").append(qnaHTML);
				
			}else{
				
				for(var i = 0; i < data.length; i++){
					var v = data[i];
					var qnaHTML = "";
					var num = i + 1;
					var qnDate = v.qnaDate.substring(0, 10);
				
					if(v.answerText){
						var anCheck = 'true';
						var anText = '<td class="text-center" style="color:green; font-size: 20px;">O</td>';
					}else{
						var anCheck = 'false';
						var anText = '<td class="text-center" style="color:red; font-size: 20px;">X</td>';						
					}
										
					qnaHTML += '<tr>';
				    qnaHTML +=  '<td class="text-center">'+ num +'</td>';
				    qnaHTML += 	'<td class="text-center"><a class="primary cur-pointer modalClick" data-an_chk='+ anCheck +' data-number='+ num +' data-qna_no='+ v.qnaNo +' data-modal_text="qna" data-toggle="modal" data-target="#exampleModalCenter12">'+ v.qnaTitle +'</a></td>';
				    qnaHTML += 	'<td class="text-center">'+ v.userId +'</a></td>';
				    qnaHTML += 	''+ anText +'';
				    qnaHTML += 	'<td class="text-center">'+ qnDate +'</td>';
				    qnaHTML += '</tr>';
					$("#mainQnaAppend").append(qnaHTML);
				}
			}
		}

		// MODAL CLICK
		var anCheck = "";
		$(document).on('click', '.modalClick', function(){
			var modalText = $(this).data('modal_text');
			var noticeNo = $(this).data('notice_no');
			var qnaNo = $(this).data('qna_no');
			var num = $(this).data('number');
				anCheck = $(this).data('an_chk');
	
			if(modalText == 'notice'){
				
				for(var i = 0; i < noticeAJaxData.length; i++){
					var v = noticeAJaxData[i];
				
					if(v.noticeNo == noticeNo){
						var modalDate = v.noticeDate.substring(0, 10);
						$('#modalNo').text(num);
						$('#modalId').text(v.userId);
						$('#modalDate').text(modalDate);
						$('#modalTitle').val(v.noticeTitle);
						$('#modalContent').val(v.noticeContent);
						$('#mainNoticeUpdate').val(noticeNo);
						$('#mainNoticeDelete').val(noticeNo);
						
						// 모달창 삭제(업데이트)
	   					$('#mainNoticeUpdate').attr('data-dismiss', "modal");
	   					// 모달창 삭제(삭제)
		 				$('#mainNoticeDelete').attr('data-dismiss', "modal");
						
					}
				}
				
			}else{
						
				for(var i = 0; i < qnaAJaxData.length; i++){
					var v = qnaAJaxData[i];
					
					if(qnaNo == v.qnaNo){
						var qnaDate = v.qnaDate.substring(0, 10);
						$('#modalQnaNo').text(num);
						$('#modalQnaId').text(v.userId);
						$('#modalQnaDate').text(qnaDate);
						$('#modalQnaTitle').text(v.qnaTitle);
						$('#modalQnaContent').text(v.qnaContent);
						$('#modalQnaClick').val(qnaNo);
						$('#modalQnaDelete').val(qnaNo);
						
						// 모달창 삭제(인서트 업데이트)
	   					$('#modalQnaClick').attr('data-dismiss', "modal");
	   					// 모달창 삭제(삭제)
		 				$('#modalQnaDelete').attr('data-dismiss', "modal");
												
						if(v.answerText){
							$('#modalQnaAnswer').val(v.answerText);
						}else{
							$('#modalQnaAnswer').val('');
						}
					}				
				}	
			}
		});
		
		
	// 공지사항 업데이트
	$(document).on('click', '#mainNoticeUpdate', function(){
				
	  var noticeTitle = $('#modalTitle').val();
	  var noticeContent = $('#modalContent').val();
	  var noticeNo = $(this).val();
	  
	  var obj = {"noticeNo" : noticeNo, "noticeTitle" : noticeTitle, "noticeContent" : noticeContent};
	  
		 $.ajax({
			    url: localhost + "/noticeUpdate.do",
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
						noticeAjax();
					}
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });			
		});
		
		// 공지사항 삭제
		$(document).on('click', '#mainNoticeDelete', function(){
			console.log("공지사항 삭제");
			
			
			
		  var deleteMessage = confirm('공지사항을 삭제하시겠습니까?');
		  if(!deleteMessage){
			  alert("취소 되었습니다");
			  return false;
		  }
		  

		 var noticeNo = $(this).val();
		 var obj = { "noticeNo" : noticeNo };
	    
		 $.ajax({
			    url: localhost + '/noticeDelete.do',
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
						noticeAjax();
					}
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
		});
		
		
		
		// Q&A 답변 저장 및 업데이트
		$(document).on('click', '#modalQnaClick', function(){
			var qnaNo = $(this).val();
		  	var answerText = $('#modalQnaAnswer').val();

		  			 	
		  	if(!answerText){
				alert("답변을 입력해주세요");
				return false;
		  	}

			if(anCheck == false){
				var URLInfo = "/qnaAnswer.do";
			}else{
				var URLInfo = "/qnaAnswerUpdate.do";
			}
					
			var obj = [{"qnaNo" : qnaNo, "answerText" : answerText}];
	
			 $.ajax({
				    url: localhost + URLInfo,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    contentType: "application/json",
				    data: JSON.stringify(obj),
				    success: function(data){
						
				    	if(data == true){
							alert("등록 되었습니다");
				    		mainQnaAjax();
				    		return false;
				    	}else{
				    		alert("등록에 실패했습니다");
				    		return false;
				    	}
				    }, error: function (request, status, error){
				    	alert("Error");
				    }
			  });
		});
		
		
		$(document).on('click', '#modalQnaDelete', function(){
			
			var message = confirm('삭제하시겠습니까?');
			
			if(!message){
				alert("삭제가 취소되었습니다");
				return false;
			}
			
			var delUrl = "/qnaDelete.do";
			var qnaNo = $(this).val();
			var obj = { "qnaNo" : qnaNo };
						
			 $.ajax({
			    url: localhost + delUrl,
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
						mainQnaAjax();
					}
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
			});
		});
		
		