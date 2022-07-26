<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">
    
    <!--내 저장소-->
    
        <div id="save2" role="tabpanel" aria-labelledby="profile-tab" class="tab-pane px-4 py-5 show active">
          <div class="rounded mb-5">
            <!-- 내가 좋아요 한 사진/ 내가 구매한 사진 -->
            <ul id="myTab" role="tablist" class="nav nav-tabs nav-pills flex-column flex-sm-row text-center bg-light border-0 rounded-nav">
              <li class="nav-item flex-sm-fill">
                <a id="like-tab" data-toggle="tab" href="#like" role="tab" aria-controls="like" aria-selected="true" class="nav-link border-0 text-uppercase font-weight-bold active" style="background-color: #2E2E2E;">Pictures I Liked</a>
              </li>
              <li class="nav-item flex-sm-fill">
                <a id="buy-tab" data-toggle="tab" href="#buy" role="tab" aria-controls="buy" aria-selected="false" class="nav-link border-0 text-uppercase font-weight-bold" style="background-color: #2E2E2E;">Pictures I bought</a>
              </li>
            </ul>

              <div id="like" role="tabpanel" aria-labelledby="like-tab" class="tab-pane fade px-4 py-5 show active">
                  <div class="tab_cont tab_ac">
                    <ul class="cont_list">
                      <li class="photo_area">
                        <a href="" class="photo_link">					
                          <div class="img_area" style="background-image: url(<c:url value="/resources/img/mypage/test_img01.jpg"/>);"><img src="<c:url value="/resources/img/mypage/test_img01.jpg"/>" alt=""></div>	
                          <div class="txt_area">
                            <p><img src="<c:url value="/resources/img/mypage/test_img03.jpg"/>" alt="" class="pro_p">User name</p>
                            <p><img src="<c:url value="/resources/img/mypage/test_icon06.png"/>" alt="" class="pro_icon"><span>0</span><img src="<c:url value="/resources/img/mypage/test_icon07.png"/>" alt="" class="pro_icon"><span>0</span></p>
                          </div>		
                        </a>
                      </li>
                    </ul>
                  </div>
              </div>
              <div id="buy" role="tabpanel" aria-labelledby="buy-tab" class="tab-pane fade px-4 py-5">
                <div class="tab_cont tab_ac">
                  <ul class="cont_list">
                    <li class="photo_area">
                      <a href="" class="photo_link">					
                        <div class="img_area" style="background-image: url(<c:url value="/resources/img/mypage/test_img01.jpg"/>);"><img src="<c:url value="/resources/img/mypage/test_img01.jpg"/>" alt=""></div>	
                        <div class="txt_area">
                          <p><img src="<c:url value="/resources/img/mypage/test_img03.jpg"/>" alt="" class="pro_p">User name</p>
                          <p><img src="<c:url value="/resources/img/mypage/test_icon08.png"/>" alt="" class="pro_icon_down"></p>
                        </div>		
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- End rounded tabs -->
          </div>
</body>