<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/resources/css/chatbot.css"/>">


      <div class="container h-1000" style="margin-top:200px">
        <div class="row align-items-center h-100" >
            <div class="col-md-8 col-sm-12 mx-auto">
                <div class="h-100 justify-content-center">
                    <div class="chat-container" style="overflow: auto;max-height: 60vh">

                        <div class="chat-message col-md-5 bot-message" style="margin-bottom:50px">
                          안녕하세요. 픽토리 이용 도우미 챗봇 '쳇토리' 입니다!
                        </div>
	


                    </div>
                    <input class="input" type="text"  placeholder="질의어를 입력하세요" id="query"/>

                </div>
            </div>
        </div>
    </div>
   
    <script src="${pageContext.request.contextPath}/resources/js/chatbot.js"></script>




 		