<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchView</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<link rel="apple-touch-icon" href="img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/upload/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/gallerylist/gallerylist.css">

	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search/Searchstyle.css">
	<script	src="${pageContext.request.contextPath}/resources/js/search/Search.js"></script>



</head>
<body>
	</br>
	</br>
	</br>
	</br>
	</br>
	<div class="form-group has-search">
		<span class="fa fa-search form-control-feedback"></span> <input
			type="search" class="form-control" placeholder="Search">
	</div>
	<div>
		<ul class="nav">
			<li class="button-dropdown"><a href="#" class="dropdown-toggle">작품
					<span></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#" class="selected" data-value="gallery">작품</a></li>

					<li><a href="#" class="selected" data-value="users">사람</a></li>
				</ul></li>

			<li class="button-dropdown"><a href="#" class="dropdown-toggle">인물
					<span></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#" class="selected" data-value="figure">인물</a></li>
					<li><a href="#" class="selected" data-value="object">정물</a></li>
					<li><a href="#" class="selected" data-value="landscape">풍경</a></li>
					<li><a href="#" class="selected" data-value="etc">기타</a></li>
				</ul></li>

			<li class="button-dropdown"><a href="#" class="dropdown-toggle">최신순
					<span></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#" class="selected" data-value="recent">최신순</a></li>
					<li><a href="#" class="selected" data-value="select">조회순</a></li>
					<li><a href="#" class="selected" data-value="sale">좋아요순</a></li>
				</ul></li>

			<div class="chk_sale">
				<input type="checkbox" id="chk_sale" class="ipt_chk"> <label
					for="chk_sale">판매중인 사진 보기</label>
			</div>
		</ul>



	<div class="gall_list">
			<ul class="gall_list_wrap">
				<!-- li~li까지 데이터 저장후 받아와서 foreach로 뿌리기 -->
				<c:if test="${empty lists}" var="isEmpty">
					<li>검색결과없음</li>
				</c:if>
				<c:if test="${not isEmpty}">
					<c:forEach var="list" items="${lists}" varStatus="loop">
						<li class="photo_area"><a
							href="<c:url value="/gallery/GalleryView.do?postNo=${list.postNo}"/>"
							class="photo_link">
								<div class="img_area"
									style="background-image: url(${list.photoUrl});">
									<img
										src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png"
										alt="">
								</div>

								<div class="txt_area">
									<p>
										<img src="${list.userProfile}" alt="" class="pro_p">${list.userNickname}</p>
									<p>
										<img
											src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png"
											alt="" class="pro_icon"><span>${list.postLikes}</span><img
											src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png"
											alt="" class="pro_icon"><span>0</span>
									</p>
								</div>
						</a>

							<ul class="hover_btn">
								<li><a href=""><img
										src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png"
										alt="">Like</a></li>
								<li><a href="">Save</a></li>
							</ul>

							<div class="hover_txt">
								<h3>${list.postTitle}</h3>
								<p class="sub_txt">HASHTAG(NULLCHECK)</p>
								<p class="bot_txt">${list.postCategory}</p>
							</div></li>
					</c:forEach>
				</c:if>
				<!-- ===========================절취선================================= -->
			</ul>
		</div>
	</div>
</body>
</html>