<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/Top.jsp"/>
	
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/page2.css"/> "/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/dm.css"/> "/>
	

    <script src="${pageContext.request.contextPath}/resources/js/feed/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/feed/modernizr.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<br/>
<br/>
<br/>
<br/>
<div class="msg-container">
	
		<div class="messaging">
	      <div class="inbox_msg">
	      	<!-- 메세지 목록 영역 -->
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>Recent</h4>
	            </div>
	            <!-- 메세지 검색 -->
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> 
	              </div>
	            </div>
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">
		          
	          </div>
	        </div>
	        
	        <!-- 메세지 내용 영역 -->
	        <div class="mesgs">
	          <!-- 메세지 내용 목록 -->
	          <div class="msg_history" name="contentList">
	            <!-- 메세지 내용이 올 자리 -->
	          </div>
	          <div class="send_message">
	          </div>
	          <!-- 메세지 입력란이 올자리 -->
	        </div>
	      </div>
	      
	    </div>
	</div>
	
	<script>
	
	// 가장 처음 메세지 리스트를 가져온다.
	const FirstMessageList = function(){
		$.ajax({
			url:"DmAjaxList.do",
			method:"get",
			data:{
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					//alert('room : '+ $(this).attr('room'));
					
					let dmRoom = $(this).attr('dmRoom');
					
					let otherNick = $(this).attr('otherNick');
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+dmRoom).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+dmRoom).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						// 메세지 전송 함수 호출
						SendMessage(dmRoom, otherNick);
						
						
					});
					
					
					// 메세지 내용을 불러오는 함수 호출
					DmContentList(dmRoom);
					
				});
				
			}
		
		})
	};
	
	// 메세지 리스트를 다시 가져온다.
	const MessageList = function(){
		$.ajax({
			url:"DmAjaxList.do",
			method:"get",
			data:{
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					//alert('room : '+ $(this).attr('room'));
					
					let dmRoom = $(this).attr('dmRoom');
					
					let otherNick = $(this).attr('otherNick');
					alert(otherNick);
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+dmRoom).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+dmRoom).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						// 메세지 전송 함수 호출
						SendMessage(dmRoom, otherNick);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					// 메세지 내용을 불러오는 함수 호출
					DmContentList(dmRoom);
					
				});
				
				// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
				// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
				$('.chat_list_box:first').addClass('active_chat');
			}
		})
	};
    
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const DmContentList = function(dmRoom) {
		
		$.ajax({
			url:"DmContentList.do",
			method:"GET",
			data:{
				dmRoom : dmRoom
			},
			success:function(data){
				console.log("메세지 내용 가져오기 성공");
				
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		})
		
		$('.unread'+dmRoom).empty();
	
	};
	
	
	// 메세지를 전송하는 함수
	const SendMessage = function(dmRoom, otherNick){
		
		let dmContent = $('.write_msg').val();
		//alert("content: " + content);
		
		dmContent = dmContent.trim();
		
		if(dmContent == ""){
			alert("메세지를 입력하세요!");
		}else{
			$.ajax({
				url:"DmSendList.do",
				method:"GET",
				data:{
					dmRoom : dmRoom,
					otherNick: otherNick,
					dmContent: dmContent
				},
				success:function(data){
					console.log("메세지 전송 성공");
					alert(dmRoom);
					// 메세지 입력칸 비우기
					$('.write_msg').val("");
					
					// 메세지 내용  리로드
					DmContentList(dmRoom);
					
					// 메세지 리스트 리로드
					MessageList();
					
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
		
	};
	
	$(document).ready(function(){
		// 메세지 리스트 리로드
		FirstMessageList();
	});
	</script>
</body>
</html>