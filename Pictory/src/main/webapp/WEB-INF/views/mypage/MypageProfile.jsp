<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">

     <!--프로필 변경-->
     <div id="profile2" role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-4 py-5 show active">
       <div class="box">
         <h1>My Account</h1>
         <p class="text-muted">Change your personal details or your password here.</p>
         <br/>
         <h3>비밀번호 변경</h3>
         <form>
           <div class="row">
             <div class="col-md-6">
               <div class="form-group">
                 <label for="password_old">현재 비밀번호</label>
                 <input id="password_old" type="password" class="form-control" value="${memDTO.userPassword}" >
               </div>
             </div>
           </div>
           <div class="row">
             <div class="col-md-6">
               <div class="form-group">
                 <label for="password_1">변경할 비밀번호</label>
                 <input id="password_1" type="password" class="form-control">
               </div>
             </div>
             <div class="col-md-6">
               <div class="form-group">
                 <label for="password_2">변경 비밀번호 확인</label>
                 <input id="password_2" type="password" class="form-control">
               </div>
             </div>
           </div>
           <!-- /.row-->
           <div class="col-md-12 text-right">
             <button type="button" class="btn btn-dark" style="color:#eeeeee" onclick = "editLogic()"><i class="fa fa-save"></i>비밀번호 변경</button>
           </div>
         </form>
         <h3 class="mt-5">나의 프로필 변경</h3>
         <form action="/springapp/mypage/updateProfile.do" method="POST" enctype="multipart/form-data">
           <div class="product same-height text-center align-items-center">   
             <div class="front"><img src="<c:url value="/resources/img/mypage/${memDTO.userProfile}"/>" alt="" class="img-fluid"></div>
             <div>  
               <input type="file" style="color:#595959" name="image">
             </div>
           </div>
           <br/>
           <div class="row">
             <div class="col-md-6">
               <div class="form-group">
                 <label for="firstname">이름</label>
                 <input id="firstname" type="text" class="form-control" value="${memDTO.userName}" name="userName" >
               </div>
             </div>
             <div class="col-md-6">
               <div class="form-group">
                 <label for="lastname">닉네임</label>
                 <input id="lastname" type="text" class="form-control" value="${memDTO.userNickname}" name="userNickname" >
               </div>
             </div>
           </div>
           <!-- /.row-->
           <div class="row">
             <div class="col-md-6">
               <div class="form-group">
                 <label for="company">이메일</label>
                 <input id="company" type="text" class="form-control" value="${memDTO.userEmail}" name="userEmail" >
               </div>
             </div>
           </div>
           <!-- /.row-->
           <div class="row">
             <div class="col-md-12">
               <div class="form-group">
                 <label for="email">한줄 소개</label>
                 <input id="email" type="text" class="form-control" value="${memDTO.userSelf}" name="userSelf" >
               </div>
             </div>
             <div class="col-md-12 text-right">
               <button type="submit" class="btn btn-dark" style="color:#eeeeee" ><i class="fa fa-save"></i>변경내용 저장</button>
             </div>
           </div>
         </form>
       </div>
     </div>
</body>


<script>

function editLogic () {
	const pwOld = $('#password_old').val();
	const pw1 = $('#password_1').val();
	const pw2 = $('#password_2').val();
		
	if (pw1 !== pw2) {
		alert("비밀번호와 비밀번호 확인이 맞지 않습니다.");
	} else {
	
		$.ajax({
			url: '/springapp/mypage/password.do',
			type: 'POST',
			data: {"pw" : pw1},
			success: function (result) {
				if (result === 1) {
					alert("수정이 완료되었습니다.");
					location.reload();
				}  else {
					alert("수정이 실패하였습니다.");
				}
			}
		})
	}
}


</script>