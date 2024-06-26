<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>myBuy</title>
		<meta charset="utf-8">
		<!--font library-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--icon css-->
		<script src="https://kit.fontawesome.com/4e5169080d.js" crossorigin="anonymous"></script>
		<!--gallery css-->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/gallerylist.css"/>">
		<!--bootstrap-->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<!--jquery-->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  </head>

	  <style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		input {
			display: block;
			padding: 0 25px;
			height: 50px;
			line-height: 50px;
			color: #ffffff;
			font-size: 13px;
			background: rgba(0, 0, 0, 0.5);
			border-radius: 5px;
			transition: 0.3s;
		}
		input:hover {
			text-decoration: none;
			background: #6e65d5;
		}
	  </style>

<body>
	<div class="content">
	
	</div>

</br>
</br>
</br>


	<div class="gall_list">
		<div class="top_filter">
			<div class="filter_left">
				<h4 style="font-weight: bold;"><i class="fa-solid fa-box-archive" style="color:#6e65e5"></i> 구매 한 포스트</h4>
				<a href="<c:url value="/mypage/Index.do"/>" class="filter_btn text-center"><i class="fa-solid fa-circle-left"> 마이페이지로 돌아가기</i></a>
			</div>				
		</div>
			
		<ul class="gall_list_wrap list-unstyled">
			<c:forEach var="buyPost" items="${BuyPostList}">
			<li class="photo_area">
				<a href="<c:url value="/gallery/GalleryView.do?postNo=${buyPost.postNo}"/>" class="photo_link">					
					<div class="img_area" style="background-image: url(${buyPost.photoUrl});">
						<img src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png" alt="">
					</div>	
					<div class="txt_area">
						<p><img src="${buyPost.postUserProfile}" alt="" class="pro_p">${buyPost.postUserNickName}</p>
					</div>					
				</a>
				<form action="<c:url value="/mypage/download.do"/>" method="get">
					<input type="hidden" name="name" value="${buyPost.photoUrl}" />
					<ul class="hover_btn list-unstyled">
						<input type="submit" value="사진 다운로드" />
					</ul>	
				</form>				
			</li>
			</c:forEach>
		</ul>
	</div>
</body>

</html>