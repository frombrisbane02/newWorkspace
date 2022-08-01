<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
	<c:choose>
		<c:when test="${nickname!=null}">
			<h2>'${nickname}'님 <br> 환영합니다!</h2>
			<br/>
			<!-- 
			<a href="http://localhost:4040/springapp/member/kakaounlink.do"
				class="kakao btn d-flex justify-content-center align-items-center">
				<span class="iconify" data-icon="ri:kakao-talk-fill" data-width="24"
				data-height="24"></span>&nbsp; Logout with Kakao
			</a>
			 -->
		</c:when>
		
	
		<c:otherwise>
			<a
				href="https://kauth.kakao.com/oauth/authorize?client_id=864c0c83f5039090b5065e41a69f1f0f&redirect_uri=http://localhost:4040/springapp/member/kakaoLogin.do&response_type=code"
				class="kakao btn d-flex justify-content-center align-items-center">
				<span class="iconify" data-icon="ri:kakao-talk-fill" data-width="24"
				data-height="24"></span>&nbsp; Login with Kakao
			</a>
			<!-- 
			<a href="#"
				class="naver btn d-flex justify-content-center align-items-center">
				<span class="iconify" data-icon="simple-icons:naver" data-width="24"
				data-height="24"></span>&nbsp; Login with Naver
			</a> -->
		</c:otherwise>
	</c:choose>


</body>
</html>