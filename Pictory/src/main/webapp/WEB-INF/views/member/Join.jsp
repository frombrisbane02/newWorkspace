<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    

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
  
                <form action="<c:url value="/member/Insert.do"/>" method="POST"  id="joinForm">
  				
  				<div class="form-outline mb-4">
                    <input type="text" class="form-control form-control-lg" name="userId" placeholder="ID"/>
                    <c:if test="${not empty idError}">${idError}</c:if>
                  </div>
                  <div class="form-outline mb-4">
                    <input type="text" class="form-control form-control-lg" name="userName" placeholder="Name"/>
                  </div>
  
                  <div class="form-outline mb-4">
                    <input type="email" class="form-control form-control-lg" name="userEmail" placeholder="Email"/>
                    <c:if test="${not empty emailError}">${emailError}</c:if>
                  </div>
  
                  <div class="form-outline mb-4">
                    <input type="password" class="form-control form-control-lg" name="userPassword" placeholder="Password"/>
                    <c:if test="${not empty passwordError}">${passwordError}</c:if>
                  </div>
  
                  <div class="form-outline mb-4">
                    <input type="password" class="form-control form-control-lg" name="pwd2" placeholder="Repeat your password"/>
                    
                  </div>
  
                  <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4">Register</button>
                  </div>
  
                  <p class="text-center text-muted mt-5 mb-0">Have already an account? 
                    <a href="Login.html" class="fw-bold text-body"><u>Login here</u></a></p>
                </form>
  
              </div>
              <!-- 
              <c:if test="${not empty param.userName }">
              <hr/>
              <h3>입력한 값들 출력</h3>
              <ul class="list-group list-group-flush">
              	<li class = "list-group-item">이름 : ${param.userName }</li>
              </ul>
              </c:if>
               -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> 
</body>
</html>

<script>

	async function checkId(doAlarm) {
		const inputId = document.querySelector("input[name='userId']").value;
	    let isValid = 0;
	    // 유효한 경우
		if (validityChecker("userId", userId)) {
			await $.ajax({
				type: "GET",
				url: "<c:url value='/member/IdCheck.do'/>" + "?userId=" + userId,
				dataType: "json",
		        // 중복체크
		        success : (data) => {
					if(JSON.parse(data.isDuplicated)) {
						isValid = false;
						Swal.fire('중복', '다른 아이디를 입력하세요', 'error');
					}
					else {
						isValid = true;
					
			        		Swal.fire('가능', '해당 아이디는 사용 가능합니다', 'success');							
						
					}
				}
			});
			// 유효 + 비중복
			if(isValid) {
				return true;
			}
			// 유효 but 중복
			else {
				return false;
			}
		}
		// 비유효
		else {
			createInvalidAlarm("userId");
			return false;
	    }
	}
	
	function validityChecker(type, data) {
		switch (type) {
			case 'userId':
				const idValid1 = data.length >= 2;
				//const idValid2 = data.match(/[0-9]/) !== null ? true : false; // Number
				const idValid3 = data.match(/[a-zA-Z]/) !== null ? true : false; // English
		    	return idValid1  && idValid3;
		  
		  	default:
		  		return false;
		}
	}
 
	const checkees = {
			userId : "아이디는 2자 이상이어야한다.",
			userName : "이름이 작성되지 않았습니다.",
			userEmail : "이메일이 작성되지 않았습니다",
			userPassword : "비밀번호가 일치하지 않습니다.",
			
	}
	
	function createInvalidAlarm(type) {
		Swal.fire(
				
				  '유효성 확인',
				  checkees[type],
				  'error'
				);
	}

	function isValid(type) {
		const form = document.querySelector("#joinForm");
		switch (type) {
			case 'userId':
				const userId = form.userId.value;
		    	return validityChecker(type, userId);
			case 'userPassword':
			case 'pwd2':
				const userPassword = form.userPassword.value;
				const pwd2 = form.pwd2.value;
				return userPassword == pwd2 && userPassword.length > 0;
			default:
				const name = form.userName.value;
		  		return name.length > 0;
		}
	}
	
	window.addEventListener("submit", function(e) {
		const form = e.target;
		// 유효성 체크
		for(key in checkees) {
			if (!isValid(key)) {
				createInvalidAlarm(key);
				e.preventDefault();
				return false;
			}
		}
		
	
	});

	
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   