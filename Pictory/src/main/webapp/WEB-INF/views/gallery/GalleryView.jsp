<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
     <link rel="stylesheet" type="text/css" href="css/common.css">
     <link rel="stylesheet" type="text/css" href="css/page1.css">

     <script src="js/gallerylist/modernizr.js"></script>
     <script src="js/gallerylist/html5shiv.js"></script>
     <script src="js/gallerylist/tab.js"></script>
     <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
     <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>

 
     <link rel="shortcut icon" type="image/x-icon" href="img/galleryview/favicon.png">
     <link rel="apple-touch-icon" href="img/galleryview/favicon.png">
     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
     <link rel="stylesheet" type="text/css" href="css/galleryview/common.css">
     <link rel="stylesheet" type="text/css" href="css/galleryview/page1.css">

     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    
     <!-- Bootstrap icons-->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
     <link rel="shortcut icon" type="image/x-icon" href="img/galleryview/favicon.png">
     <link rel="apple-touch-icon" href="img/galleryview/favicon.png">
     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
    	<c:forEach var="list" items="${viewLists}" >
        <div>
            <h3>${list.postTitle}</h3>
            <p>${list.postDate} &nbsp; &nbsp; | &nbsp; &nbsp; ${list.postCategory}</p>
        </div>
        
        <div class="imageArea">
        <c:forEach var="photo" items="${photoUrls}" varStatus="loop" >
            <img class="postImages" src="${photo.photoUrl}"/>
            </c:forEach>
        </div>
        <div class="textArea">
        	<p>${list.postText}</p>
        </div>
		
        <!-- Features section-->
        <section class="py-5" id="features">
            <div class="container px-2 my-2">
                <div class="row gx-5">
                    <div class="d-inline-flex">
                        <span class="material-symbols-outlined">favorite</span>좋아요 <span>${list.postLikes}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="material-symbols-outlined">visibility</span>조회수 <span>${list.postHits}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="material-symbols-outlined">shopping_cart</span>장바구니
                    </div>
                </div>
            </div>
        </section>
      </c:forEach>
	</c:if>



    </div>
</body>
</html>