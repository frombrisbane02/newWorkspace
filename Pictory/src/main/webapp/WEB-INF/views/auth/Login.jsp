<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/fontstyle.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lgoin/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/style.css">

<title>Login #6</title>
</head>
<script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
<body>

   <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <img src="${pageContext.request.contextPath}/resources/img/login/signin-image.jpg" alt="sing up image">
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign In</h2>
	<c:if test="${not empty NotMember }">
		<div class="alert alert-success">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Failure!</strong> ${NotMember}
		</div>
	</c:if>
	

	<c:if test="${empty sessionScope.userId}" var="isLogin">
		<form  class="register-form" action="<c:url value="/auth/LoginProcess.do"/>" method="POST"  id="login-form">
			<div class="form-group first">
			<label for="username">
			<i class="glyphicon glyphicon-user"></i>
			</label> 
			<input type="text" name="userId" placeholder="ID">
			</div>
			
			<div class="form-group last mb-3">
			<label for="password">
			<i class="fa fa-key"></i>
			</label> 
			<input type="password" name="userPassword" id="userPassword" placeholder="Password">
			</div>
			

			<div class="form-group d-flex mb-5 align-items-center">
			<input type="checkbox" name="remember-me"  id="remember-me" class= "control control--checkbox mb-0"/>
			<label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label> 
			
			<div class="control__indicator"></div> </label> 
			<span class="ml-auto">
			<a href="#" class="forgot-pass">Forgot Password</a></span>
			</div>	
			<input type="submit" value="Log In" id="login" class="btn btn-block"> 
			<br> 
		</form>
		</c:if>
		
		<c:if test="${not isLogin }">
		<div class="alert alert-success">
		  <strong>Success!</strong> ${sessionScope.userId}님 즐감하세요!
		</div>
		</c:if>
		<c:if test="${not isLogin }">
		<a class="nav-link" href="<c:url value="/auth/Logout.do"/>">로그아웃</a></li>
		</c:if>
		<form action="<c:url value="/auth/JoinAgree.do"/>">
		<input type="submit" value="Sign Up" id="signup" class="btn btn-block btn-primary">
		</form>
			<span class="d-block text-center my-4 text-muted">
			&mdash;	or &mdash;</span>
			
			<div class="social-login">
			<!-- kakao/naver Login -->
			<jsp:include page="/WEB-INF/views/kakaoLogin.jsp" />
			</div>
		

	
	
	
</div>
</div>

</div>
</section>
</div>

