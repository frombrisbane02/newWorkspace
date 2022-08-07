<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>mypage_index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--font library-->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  <!--icon css-->
  <script src="https://kit.fontawesome.com/4e5169080d.js" crossorigin="anonymous"></script>
  <!--bootstrap-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <!--jquery-->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.avatar {
    display: inline-block;
    position: relative;
    width: 3rem;
    height: 3rem;
    text-align: center;
    border: #e7e7e7;
    border-radius: 50%;
    background: #fff;
    box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 15%);
    line-height: 3rem;
    max-width: 100%;
}

.avatar.avatar-xxl {
    width: 14rem;
    min-width: 14rem;
    height: 14rem;
    line-height: 14rem;
}

.modal-dialog.modal-80size {
  width: 60%;
  height: 60%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 60%;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

.modal-body{
  font-size: 13px;
}


</style>

<body>
<div class="content">

</div>

<div class="container">

</br>
</br>
</br>
</br>
</br>

    <!-- Team member  -->
    <form action="/springapp/mypage/updateProfile.do" method="POST" enctype="multipart/form-data">
	    <div class="col-lg-3 col-md-6 text-center" style="margin-left: 400px;">
	      <a href="team-member.html">
	        <img class="avatar avatar-xxl p-2 mb-4" src="${memDTO.userProfile}">
	      </a>
	      <h3 class="h4 mb-1 text-uppercase">${memDTO.userNickname}</h3>
	      <ul class="list-inline">
	       	<li class="list-inline-item mr-3"><a class="filter_btn text-reset" data-toggle="modal" data-target="#changePicModal" href="#">
	        	<i class="fa-solid fa-camera-retro" ></a></i>
	        </li>
	        <li class="list-inline-item mr-3"><a class="filter_btn text-reset" data-toggle="modal" data-target="#changeProfileModal" href="#">
	        	<i class="fa-solid fa-address-card"></a></i>
	        </li>
	       	<li class="list-inline-item mr-3"><a class="filter_btn text-reset" data-toggle="modal" data-target="#changePwdModal" href="#">
	        	<i class="fa-solid fa-lock"></a></i>
	        </li>
	        
	      </ul>
	      <p class="small small text-gray-600">${memDTO.userSelf}</p>
	    </div>
	    
	    <!-- 회원정보 수정 모달 (비밀번호 모달은 아래에) -->
		<div class="modal modal-center" id="changeProfileModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
		  <div class="modal-dialog modal-80size modal-center" role="document">
		    <div class="modal-content modal-80size">
		      <div class="modal-header">
		        <h5 class="modal-title" id="myModalLabel">프로필 변경</h5>
		      </div>
		      <div class="modal-body">
	      		  <div class="form-group col-xs-2">
				    <label for="password_old">프로필 사진을 업로드 해주세요</label>
				    <div>  
		               <input type="file" style="color:#595959" name="image">
		            </div>
				  </div> 
				  <div class="form-group col-xs-2">
				    <label for="name">이름</label>
				    <input type="text" class="form-control" name="userName" aria-describedby="nameHelp" style="border-width:2px" value="${memDTO.userName}">
				  </div>
				  <div class="form-group col-xs-2">
				    <label for="nickName">닉네임</label>
				    <input type="text" class="form-control" name="userNickname" aria-describedby="nickNameHelp" style="border-width:2px" value="${memDTO.userNickname}">
				  </div>
				  <div class="form-group col-xs-2">
				    <label for="nickName">이메일</label>
				    <input type="text" class="form-control" name="userEmail" aria-describedby="emailHelp" style="border-width:2px" value="${memDTO.userEmail}">
				  </div>
				  <div class="form-group">
				    <label for="nickName">한줄소개</label>
				    <input type="text" class="form-control" name="userSelf" aria-describedby="selfHelp" style="border-width:2px" value="${memDTO.userSelf}">
				  </div>	  
		      </div>
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-sm bg-dark text-white px-lg-5 mt-2">변경내용 저장</button>
		        <button class="btn btn-sm bg-dark text-white px-lg-5 mt-2" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
    </form>
    
   	<!-- 비밀번호 변경 모달 -->
	<div class="modal modal-center" id="changePwdModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-80size modal-center" role="document">
	    <div class="modal-content modal-80size">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalLabel">프로필 변경</h5>
	      </div>
	      <div class="modal-body">
			  <div class="form-group col-xs-2">
			    <label for="password_old">현재 비밀번호</label>
			    <input id="password_old" type="password" class="form-control" value="${memDTO.userPassword}" aria-describedby="passwordHelp" style="border-width:2px" readonly>
			  </div>
			  <div class="form-group col-xs-2">
			    <label for="password_1">변경할 비밀번호</label>
			    <input id="password_1" type="password" class="form-control" aria-describedby="password1Help" style="border-width:2px">
			  </div>  
			  <div class="form-group col-xs-2">
			    <label for="password_2">비밀번호 확인</label>
			    <input id="password_2" type="password" class="form-control" aria-describedby="password2Help" style="border-width:2px">
			  </div> 
	      </div>
	      <div class="modal-footer">
	      	<button type="submit" class="btn btn-sm bg-dark text-white px-lg-5 mt-2" onclick = "editLogic()">변경내용 저장</button>
	        <button class="btn btn-sm bg-dark text-white px-lg-5 mt-2" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
    


    <hr/>
    <!-- IMAGE BOX-->
    <div class="mb-2">
      <div class="row gy-4">
        <div class="col-lg-4">
          <div class="box-image">
              <div class="mb-2">
                <a id="mylike" href="<c:url value="/mypage/Like.do"/>">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/mypage/mypage_01.jpg" alt="...">
                </a>
              </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="box-image">
              <div class="mb-2">
                <a id="mysales" href="<c:url value="/mypage/Profit.do"/>">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/mypage/mypage_02.jpg" alt="...">
                </a>
              </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="box-image">
              <div class="mb-2">
                <a id="mycart" href="<c:url value="/mypage/Cart.do"/>">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/mypage/mypage_03.jpg" alt="...">
                </a>
              </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="mb-5">
      <div class="row gy-4">
        <div class="col-lg-4">
          <div class="box-image">
              <div class="mb-2">
                <a id="myphotobook" href="<c:url value="/mypage/Buy.do"/>">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/mypage/mypage_04.jpg" alt="...">
                </a>
              </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="box-image">
              <div class="mb-2">
                <a id="myalarm" href="<c:url value="/mypage/Alarm.do"/>">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/mypage/mypage_05.jpg" alt="...">
                </a>
              </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="box-image">
              <div class="mb-2">
                <a id="qna" href="<c:url value="/faq/Index.do"/>">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/mypage/mypage_06.jpg" alt="...">
                </a>
              </div>
          </div>
        </div>
      </div>
    </div>
</div>

</body>

<script>
$("#changeProfileModal").css("z-index", "1500");
$("#changePwdModal").css("z-index", "1500");
$("#changePicModal").css("z-index", "1500");

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

</html>

