<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Gallery View</title>

        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <link rel="apple-touch-icon" href="img/galleryview/favicon.png">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css"  />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources//resources/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/page1.css">

        <script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>

    
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/galleryview/favicon.png">
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/img/galleryview/favicon.png">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/galleryview/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/galleryview/page1.css">
        
    </head>
    <body class="d-flex flex-column h-100">
    <div class="container">
    	<div class="title">
    		<h3>제목영역</h3>
    	</div>
    </div>
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <!-- Header-->
            <header class="bg-dark">
                    <div class="container">
                        <div class="row align-items-center justify-content-center">
                            <img class="rounded-3" src="./img/galleryview/test_img03.jpg" alt="..." style="width:max-content;height:max-content"/>
                        </div>
                    </div>
            </header>
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-2 my-2">
                    <div class="row gx-5">
                        <div class="d-inline-flex">
                            <span class="material-symbols-outlined">favorite</span>좋아요 <span> 100</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="material-symbols-outlined">visibility</span>조회수 <span> 200</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="material-symbols-outlined">shopping_cart</span>장바구니
                        </div>
                    </div>
                </div>
            </section>
            <!-- Testimonial section-->
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
                                            <a href="page2.html"><img src="img/galleryview/test_img02.jpg" alt="" class="pro_img"></a>
                                            <div class="txt_area">
                                                <h3>내이름은 닉네임</h3>
                                                <p class="sub_txt">여기는 한줄 소개 오오오</p>
                                                <p class="loca"><img src="img/galleryview/test_icon01.png" alt="">서울시 강남구 논현동</p>
                                            </div>
                                        </div>
                                        <div class="count">
                                            <a href="">Follow</a>
                                            <ul>
                                                <li>
                                                    <h3>7,300</h3>
                                                    <p>Likes</p>
                                                </li>
                                                <li>
                                                    <h3>50</h3>
                                                    <p>Artwork</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="photo_area">
                                        <div class="swiper mySwiper">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide" style="background-image: url(${pageContext.request.contextPath}/resources/img/galleryview/test_img03.jpg);"><a href=""><img src="img/galleryview/fake04.png" alt=""></a></div>
                                                <div class="swiper-slide" style="background-image: url(${pageContext.request.contextPath}/resources/img/galleryview/test_img04.jpg);"><a href=""><img src="img/galleryview/fake04.png" alt=""></a></div>
                                                <div class="swiper-slide" style="background-image: url(${pageContext.request.contextPath}/resources/img/galleryview/test_img05.jpg);"><a href=""><img src="img/galleryview/fake04.png" alt=""></a></div>
                                                <div class="swiper-slide" style="background-image: url(${pageContext.request.contextPath}/resources/img/galleryview/test_img06.jpg);"><a href=""><img src="img/galleryview/fake04.png" alt=""></a></div>
                                                <div class="swiper-slide" style="background-image: url(${pageContext.request.contextPath}/resources/img/galleryview/test_img07.jpg);"><a href=""><img src="img/galleryview/fake04.png" alt=""></a></div>
                                                <div class="swiper-slide" style="background-image: url(${pageContext.request.contextPath}/resources/img/galleryview/test_img08.jpg);"><a href=""><img src="img/galleryview/fake04.png" alt=""></a></div>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Blog preview section
            <section class="py-5">
                <div class="container">
                    <kbd>댓글</kbd>
                    <br/>
                    <br/>
                    <br/>
                    <div class="row">
                        <div class="pro_area_comment d-inline-flex">
                            <div class="top_area">
                                    <a href="page2.html"><img src="img/galleryview/test_img02.jpg" alt="" class="pro_img_comment"></a>
                                    <div class="txt_area">
                                        <h3>내이름은 닉네임</h3>
                                        <p>사진이 너무 이뻐요오오오오오오오오오오오오오오오 최고고고고고고고</p>
                                        <p>2022-07-16</p>
                                        <div>
                                            <button class="btn btn-light btn-sm">수정</button>
                                            <button class="btn btn-light btn-sm" style="padding-left: 10px">삭제</button>
                                            <button class="btn btn-light btn-sm" style="padding-left: 10px">답글</button>
                                        </div>
                                    </div>
                            </div>  
                        </div>
                        <hr/>
                        <div class="pro_area">
                            <div class="top_area">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/galleryview/test_img02.jpg" alt="" class="pro_img_comment"></a>
                                <div class="txt_area">
                                    <h3>내이름은 닉네임</h3>
                                    <p>헐........................너무 이뻐.................사고싶어.........</p>
                                    <p>2022-07-16</p>
                                    <div>
                                        <button class="btn btn-light btn-sm">수정</button>
                                        <button class="btn btn-light btn-sm" style="padding-left: 10px">삭제</button>
                                        <button class="btn btn-light btn-sm" style="padding-left: 10px">답글</button>
                                    </div>
                                    <div class="py-5 pt-1">
                                        <div class="top_area">
                                            <span class="material-symbols-outlined">subdirectory_arrow_right</span>
                                            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/galleryview/test_img02.jpg" alt="" class="pro_img_comment"></a>
                                            <div class="txt_area">
                                                <h3>내이름은 닉네임</h3>
                                                <p>대박인듯.................................................</p>
                                                <p>2022-07-16</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr/>
                    </div>
                </div>
            </section>-->
        </main>

        <script>
            var swiper = new Swiper(".mySwiper", {
              slidesPerView: "auto",
              spaceBetween: 20,
              navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
              },
            });
          </script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
    </body>
</html>