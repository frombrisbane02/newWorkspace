<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/resources/css/chatbot.css"/>">

<style>
   * {
      font-family: 'Noto Sans KR', sans-serif;
      font-size: 18px;
   }
</style>

   <section>
     <div class="container-fluid">
          <div class="row d-flex justify-content-center">
            <div style="width:100%;height:100%;margin:5px;">
      
              <div class="card" id="chat1" style="border-radius: 15px;">
                <div
                  class="card-header d-flex justify-content-between align-items-center p-3 text-white border-bottom-0"
                  style="border-top-left-radius: 15px; border-top-right-radius: 15px; background-color:#8B7FF2;">
                  <i class="fas fa-angle-left" aria-hidden="true"></i>
                  <p class="mb-0 fw-bold">CHATORY</p>
                  <i class="fas fa-times" aria-hidden="true"></i>
                </div>

                <div class="card-body">
                 <div class="chat-container" style="width:100%;margin:0px;" >
                     <div class="d-flex flex-row justify-content-start mb-4">
                       <img src="<c:url value="/resources/img/chatbot/chatbot.png"/>"
                         alt="avatar 1" style="width: 65px; height: 100%;">
                       <div class="p-3 ms-3" style="border-radius: 15px; background-color: #E5D1FF;">
                         <p class="small mb-0">안녕하세요. 픽토리 이용 도우미 챗봇 '쳇토리' 입니다.<br/>사진 보정 팁<br/>판매 및 스토리 업로드 이용 가이드 등<br/>궁금 하신 부분을 알려드리겠습니다!</p>
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
        var query = $(this).val();
        console.log(query)
           if (!query) {//텍스트를 입력하지 않는 경우
             return
           }
        //chat-container에 사용자의 응답 추가
        $('.chat-container').append(
        '<div class="d-flex flex-row justify-content-end mb-4"><div class="p-3 border" style="border-radius: 15px; background-color: #fbfbfb;"><p class="small mb-0">'+query+'</p></div></div>');

        
        $('#query').val('');
        
        $(document).scrollTop($(document).height());
        
        //메시지 전송
        sendMessage(query,"<%=session.getId()%>");
        
    }
   
    
});


$(document).ready(function() {
   $('.topBtn').hide();
   $('.bottomBtn').hide();
   $('#chatbot-div').hide();
   $('.content').hide();
})






</script>