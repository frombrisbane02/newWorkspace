<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>

    <title>Sign up</title>
</head>
<style>
.gradient-custom-3 {
/* fallback for old browsers 
background: #84fab0;
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))*/
}
.gradient-custom-4 {

    border: none;
    color: white;
/* fallback for old browsers 
background: #84fab0;
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))*/
}

</style>
<body>
    <div class="content">

    <section class="vh-100 bg-image" style="background-image: url(img/login/signin-image.jpg);">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-12 col-md-9 col-lg-7 col-xl-6">
            <div class="card" style="border-radius: 15px;">
              <div class="card-body p-5">
                <h2 class="text-uppercase text-center mb-5">Create an account</h2>
  				
                <form action="<c:url value="/member/Validation.do"/>" method="POST"  id="joinForm">
  				
  				<div class="form-outline mb-4" >
                    <input type="text" class="form-control form-control-lg" value="${param.userId }" name="userId" id="inputid" placeholder="ID"/>
                      <input type="button" class="btn btn-outline-secondary btn-sm"  id="idcheck" value="중복확인"/>
                      <c:if test="${not empty idError}"><strong id="idmsg" style="color:red;">${idError }</strong></c:if>
                 
                  </div>
                  <div class="form-outline mb-4">
                    <input type="text" class="form-control form-control-lg" name="userName" value="${param.userName }" placeholder="Name"/>
                  <c:if test="${not empty nameError}"><strong id="namemsg" style="color:red;">${nameError}</strong></c:if>
                
                  </div>
  
                  <div class="form-outline mb-4">
                    <input type="email" class="form-control form-control-lg" name="userEmail" value="${param.userEmail }" id="inputemail" placeholder="Email"/>
                    <input type="button" class="btn btn-outline-secondary btn-sm"  id="emailcheck" value="이메일 중복확인"/>
                    <c:if test="${not empty emailError}"><strong id="emailmsg" style="color:red;">${emailError}</strong></c:if>
              
                  </div>
  
                  <div class="form-outline mb-4">
                    <input type="password" class="form-control form-control-lg" name="userPassword" value="${param.userPassword }" placeholder="Password"/>
                    <c:if test="${not empty passwordError}"><strong id="pw1msg" style="color:red;">${passwordError}</strong></c:if>
                 
                  </div>
  
                  <div class="form-outline mb-4">
                    <input type="password" class="form-control form-control-lg" name="password2" value="${param.password2 }" placeholder="Repeat your password"/>
                    <c:if test="${not empty password1Error}"><strong id="pw2msg" style="color:red;">${password1Error}</strong></c:if>
                    <c:if test="${not empty password2Error}"><strong id="pw2msg" style="color:red;">${password2Error}</strong></c:if>
          
                  </div>
  
                  <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4">Register</button>
                  </div>
  
                  <p class="text-center text-muted mt-5 mb-0">Have already an account? 
                    <a href="<c:url value="/auth/Login.do"/>" class="fw-bold text-body"><u>Login here</u></a></p>
                </form>
  
              </div>           
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> 
  </div>
</body>
</html>
<script>
var box=document.getElementsByClassName('form-control');
for(var i=0; i<box.length; i++){
	var boxs = box[i];
	boxs.addEventListener('focus',function emptytxt() {
		  document.getElementById("idmsg").innerHTML = "";});
	boxs.addEventListener('focus',function emptytxt() {
		  document.getElementById("namemsg").innerHTML = "";});
	boxs.addEventListener('focus',function emptytxt() {
		  document.getElementById("emailmsg").innerHTML = "";});
	boxs.addEventListener('focus',function emptytxt() {
		  document.getElementById("pw1msg").innerHTML = "";});
	boxs.addEventListener('focus',function emptytxt() {
		  document.getElementById("pw2msg").innerHTML = "";});
};


	
$('#idcheck').click(function(e){
	
	const userId=$('#inputid').val();
	
	console.log(userId);
	if(userId==""){
		return alert("아이디를 입력하세요");
		}
		
	$.ajax({
		url : "<c:url value='/member/IdCheck.do'/>",
		type : "GET",
		data : "userId="+ userId,
		success : function(data){
			console.log(data);
			if(data >= 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				alert("사용 가능한 아이디입니다.");
			}
		}
	})
});

$('#emailcheck').click(function(e){
	
	const userEmail=$('#inputemail').val();
	
	console.log(userEmail);
	if(userEmail==""){
		return alert("이메일을 입력하세요");
		}
		
	$.ajax({
		url : "<c:url value='/member/emailCheck.do'/>",
		type : "GET",
		data : "userEmail="+ userEmail,
		success : function(data){
			console.log(data);
			if(data >= 1){
				alert("중복된 이메일입니다.");
			}else if(data == 0){
				alert("사용 가능한 이메일입니다.");
			}
		}
	})
});




</script>

   