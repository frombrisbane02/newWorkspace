<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">
    
    <!--내 저장소-->
    
        <div id="Buy2" role="tabpanel" aria-labelledby="buy-tab" class="tab-pane px-4 py-5 show active">
          <div class="rounded mb-5">
            <!-- 내가 좋아요 한 사진/ 내가 구매한 사진 -->
              <div id="Buy" role="tabpanel" aria-labelledby="buy-tab" class="tab-pane fade px-4 py-5 show active">
                  <div class="tab_cont tab_ac">
                    <ul class="cont_list">
                    <c:forEach var="buyPost" items="${BuyPostList}">
                      <li class="photo_area">
                        <a href="" class="photo_link">					
                          <div class="img_area" style="background-image: url(${buyPost.photoUrl});">
                          	<img src="${buyPost.photoUrl}" alt="">
                          </div>	
                          <div class="txt_area">
                            <p>
                            	<img src="${buyPost.postUserProfile}" alt="" class="pro_p">
                            		${buyPost.postUserNickName}
                            </p>
                            <p>
								<img src="<c:url value="/resources/img/mypage/test_icon08.png"/>" alt="" class="pro_icon_down">
                            </p>
                          </div>		
                        </a>
                     
                      	</li>
                      </c:forEach> 
                    </ul>
                  </div>
              </div>

            </div>
            <!-- End rounded tabs -->
          </div>