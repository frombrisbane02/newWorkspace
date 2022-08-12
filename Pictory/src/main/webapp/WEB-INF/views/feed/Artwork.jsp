<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>

	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<link rel="apple-touch-icon" href="img/favicon.png">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/gallerylist/gallerylist.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/feed/page2.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/feed/common.css">

<ul class="gall_list_wrap">
		<!-- li~li까지 데이터 저장후 받아와서 foreach로 뿌리기 -->
		<c:if test="${empty listsreply}" var="isEmpty">
			    <li> There is NO POST YET</li>
		</c:if>
		<c:if test="${not isEmpty}">
		     <c:forEach var="list" items="${replpostNo}" varStatus="loop">
				<li class="photo_area">
					<a href="<c:url value="/gallery/GalleryView.do?postNo=${list.postNo}"/>" class="photo_link">					
						<div class="img_area" style="background-image: url(${list.photoUrl});"><img src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png" alt=""></div>	
	
						<div class="txt_area">
							<p><img src="${list.userProfile}" alt="" class="pro_p">${list.userNickname}</p>
							<p><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="" class="pro_icon"><span>${list.postLikes}</span><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png" alt="" class="pro_icon"><span>${list.commentCount}</span></p>
						</div>
					</a>
	
					<ul class="hover_btn">
						<li><a href="" ><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="">Like</a></li>
						<!-- <li><a href=""></a></li> -->
					</ul>
					
					<div class="hover_txt">
						<h3>${list.postTitle}</h3>
						
						<p class="sub_txt">
						 <c:forEach var="hash" items="${hashs}" varStatus="loop">
							 <c:if test="${hash.postNo==list.postNo}">
							#${hash.hashtag}
							</c:if>
						</c:forEach>
						</p>
						<p class="bot_txt">${list.postCategory}</p>
					</div>
				</li>
				
			</c:forEach>
		</c:if>
		</ul>
	
	
</body>
</html>