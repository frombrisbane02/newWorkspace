<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>mylike</title>
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
				<h4 style="font-weight: bold;"><i class="fa-solid fa-heart" style="color:red"></i> 좋아요 한 포스트</h4>
				<a href="<c:url value="/mypage/Index.do"/>" class="filter_btn text-center"><i class="fa-solid fa-circle-left"> 마이페이지로 돌아가기</i></a>
			</div>				
		</div>
			
		<ul class="gall_list_wrap list-unstyled">
			<c:forEach var="likePost" items="${likePostList}">
			<li class="photo_area">	
				<a href="<c:url value="/gallery/GalleryView.do?postNo=${likePost.postNo}"/>" class="photo_link">					
					<div class="img_area" style="background-image: url(${likePost.photoUrl});">
						<img src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png" alt="">
					</div>	
					<div class="txt_area">
						<p><img src="${likePost.postUserProfile}" alt="" class="pro_p">${likePost.postUserNickName}</p>
					</div>						
				</a>
				<ul class="hover_btn list-unstyled">
					<li><a href="<c:url value="/mypage/LikeDelete.do"/>"><i class="fa-solid fa-heart-crack"> 좋아요 취소</i></a></li>
				</ul>
			</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>