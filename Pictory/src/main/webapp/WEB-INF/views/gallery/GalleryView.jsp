<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/Top.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>view</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

     <!-- Core theme CSS (includes Bootstrap)-->
     <link href="css/styles.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/page1.css">



 
     <link rel="shortcut icon" type="image/x-icon" href="img/galleryview/favicon.png">
     <link rel="apple-touch-icon" href="img/galleryview/favicon.png">
     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/galleryview/common.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/galleryview/page1.css">

     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    
     <!-- Bootstrap icons-->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
     <link rel="shortcut icon" type="image/x-icon" href="img/galleryview/favicon.png">
     <link rel="apple-touch-icon" href="img/galleryview/favicon.png">
     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
	 <script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>
     <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
     <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>

</head>
<style>
    .postImages {
	display: block;
	width: auto;
	height: auto;
	max-width: 1000px;
	margin-bottom: 10px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
       <c:if test="${not empty viewLists}">
    	<c:forEach var="list" items="${viewLists}">
    	<div class="text-right mr-6">
    	<c:if test="${sessionId==list.userId}">
	    	<a href="<c:url value="/gallery/bbs/Edit.do?no=${list.postNo}"/>" class="btn-outline-dark btn-sm">수정</a>
	    	<a href="<c:url value="/gallery/bbs/Delete.do?no=${list.postNo}"/>" class="btn-outline-dark btn-sm">삭제</a>
	    </c:if>
	    	<a href="<c:url value="/gallery/GalleryListEdit.do?no=${list.postNo}"/>" class="btn-outline-dark btn-sm">목록</a>
		</div>
        <div>
            <h3 style="text-weight:bold;">&nbsp;${list.postTitle}</h3>
            <p>&nbsp;${list.postDate} &nbsp; &nbsp; | &nbsp; &nbsp; ${list.postCategory}</p>
        </div>
        
        <div class="imageArea">
        <c:forEach var="photo" items="${photoUrls}" varStatus="loop" >
            <img class="postImages" src="${photo.photoUrl}"/>
        </c:forEach>
        </div>
        <div class="textArea">
        	<p>${list.postText}</p>
        </div>
		</c:forEach>
		
        <!-- Features section-->
        <section class="py-5" id="features">
            <div class="container px-2 my-2">
                <div class="row gx-5">
                    <div class="d-inline-flex">
                        <span class="material-symbols-outlined">favorite</span>좋아요<span>${postLikes}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="material-symbols-outlined">visibility</span>조회수<span>${postHits}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
                       <c:if test="${postSellorNot==1}">
	                        <span class="material-symbols-outlined">shopping_cart</span>장바구니
	                        </div>
	                        <div class="text-right">
	                        <span class="material-symbols-outlined">shopping_cart</span>결제하기
	                        </div>
                       </c:if>
                </div>
            </div>
        </section>
        
        
        <!-- 작가의 다른 작품 더 보기 섹션 -->
        <div class="bg-light">
                <div class="container">
                    <div class="row align-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="list_wrap">
                                <kbd>작가의 다른 작품 더 보기</kbd>
                                <br/>
                                <br/>
                                <div class="list_line">
                                    <div class="pro_area">
                                        <div class="top_area">
                                            <a href="page2.html"><img src="${userProfile}" alt="" class="pro_img"></a>
                                            <div class="txt_area">
                                                <h3>${userNickname}</h3>
                                                <!-- <p class="sub_txt">여기는 한줄 소개 오오오</p> 
                                                <p class="loca"><img src="${pageContext.request.contextPath}/resources/img/galleryview/test_icon01.png" alt=""></p>-->
                                            </div>
                                        </div>
                                        <div class="count">
                                            <a href="">Follow</a>
                                            <ul>
                                                <li>
                                                    <h3>${postLikes}</h3>
                                                    <p>Likes</p>
                                                </li>
                                              
                                                <li>
                                             		<h3>${otherWorks}</h3>
                                                    <p>Artwork</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <c:if test="${not empty infoLists}">
                                      <div class="photo_area">
                                        <div class="swiper mySwiper">
                                            <div class="swiper-wrapper">
			                                     <c:forEach var="info" items="${infoLists}" varStatus="loop">
			                                         <div class="swiper-slide" style="background-image: url(${info.photoUrl});">
			                                         <a href="<c:url value="/gallery/GalleryView.do?postNo=${info.postNo}"/>">
			                                         <img src="${pageContext.request.contextPath}/resources/img/galleryview/fake04.png" alt="">
			                                         </a>
			                                     </c:forEach>
		                                      	</div>
		                                     	</div>
		                                </div>
                                            <div class="swiper-button-next"></div>
                                            <div class="swiper-button-prev"></div>
                                        </div>
                                    </div>
                                    <script>
                                      var swiper = new Swiper(".mySwiper", {
                                        slidesPerView: "auto",
                                        spaceBetween: 20,
                                        navigation: {
                                          nextEl: ".swiper-button-next",
                                          prevEl: ".swiper-button-prev",
                                        },
                                        autoplay: {
                                          delay: 2000,
                                        },
                                      });
                                    </script>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</c:if>



    </div>
</body>
</html>