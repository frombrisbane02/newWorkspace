<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/resources/css/chatbot.css"/>">

	<section>
     <div class="container py-5 mt-5">
      
          <div class="row d-flex justify-content-center" style="width:100%">
            <div class="col-md-8 col-lg-6 col-xl-4">
      
              <div class="card" id="chat1" style="border-radius: 15px;">
                <div
                  class="card-header d-flex justify-content-between align-items-center p-3 bg-info text-white border-bottom-0"
                  style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
                  <i class="fas fa-angle-left" aria-hidden="true"></i>
                  <p class="mb-0 fw-bold">CHATORY</p>
                  <i class="fas fa-times" aria-hidden="true"></i>
                </div>
                <div class="card-body">
      			  <div class="chat-container" style="width:100%;margin:0px" >
	                  <div class="d-flex flex-row justify-content-start mb-4">
	                    <img src="<c:url value="/resources/img/chatbot/chatbot.png"/>"
	                      alt="avatar 1" style="width: 65px; height: 100%;">
	                    <div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
	                      <p class="small mb-0">안녕하세요. 픽토리 이용 도우미 챗봇 '쳇토리' 입니다!</p>
	                    </div>
	                  </div>
                  </div>
                  <div class="form-outline">
                    <input class="form-control" id="query" style="font-size: 12px;"/>
                    <label class="form-label" for="textAreaExample" style="font-size: 12px;">메세지를 입력하세요</label>
                  </div>
                </div>
              </div>
      
            </div>
          </div>
      
        </div>
    </section>
    
<script src="${pageContext.request.contextPath}/resources/js/chatbot.js"></script>

<script>
$("#query").on('keypress',function(e) {
    if (e.keyCode == 13){
        //e.preventDefault();
        var query = $(this).val()
        console.log(query)
        if (!query) {//텍스트를 입력하지 않는 경우
          return
        }
        //chat-container에 사용자의 응답 추가
        $('.chat-container').append(
        	          '<div class="d-flex flex-row justify-content-end mb-4">'+
	                    '<div class="p-3 border" style="border-radius: 15px; background-color: #fbfbfb;">'+
	                      '<p class="small mb-0">'
	                      +query+
	                      '</p>'+
	                    '</div>'+  
	                    +'</div>');
               
        $('#query').val('');
        //스크롤바 아래로
        $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
        //메시지 전송
        sendMessage(query,"<%=session.getId()%>");
    }
});
</script>