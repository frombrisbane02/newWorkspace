<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">

  <form>
     <div id="alert2" role="tabpanel" aria-labelledby="contact-tab" class="tab-pane fade px-4 py-5 show active">
       <div class="comment-post">
         <h1>My Alert</h1>
         <p class="text-muted">See all your alerts on your account</p>
         <hr/>
         <div class="post">
           <h5><a href="post.html">내 포스트에 댓글이 추가되었습니다.</a></h5>
           <button type ="button" class = "close" aria-label = "Close">
             <span aria-hidden = "true">×</span>
           </button>
           <p class="author-category">By <a href="#">윤진이</a> in <a href="">나의 작품</a></p>
           <p class="intro">와 진짜 이쁘다 ㅠㅠ 이거 진짜 사고싶어</p>
           <p class="date-comments"><a href="post.html"><i class="fa fa-calendar-o"></i> June 20, 2022</a></p>
         </div>
       </div>
       <hr/>
       <div class="post">
         <h5><a href="post.html">관리자 공지가 업데이트 되었습니다.</a></h5>
         <button type ="button" class = "close" aria-label = "Close">
           <span aria-hidden = "true">×</span>
         </button>
         <p class="author-category">By <a href="#">관리자</a> in <a href="">공지 페이지</a></p>
         <p class="intro">공지 제목 뿌려줄거에요</p>
         <p class="date-comments"><a href="post.html"><i class="fa fa-calendar-o"></i> June 22, 2022</a></p>
       </div>
       <hr/>
       <div class="post">
         <h5><a href="post.html">관리자가 Q&A 답변을 보냈습니다.</a></h5>
         <button type ="button" class = "close" aria-label = "Close">
           <span aria-hidden = "true">×</span>
         </button>
         <p class="author-category">By <a href="#">관리자</a> in <a href="">해당 페이지</a></p>
         <p class="intro">홍길동님 문의주셔서 감사합니다.</p>
         <p class="date-comments"><a href="post.html"><i class="fa fa-calendar-o"></i> June 22, 2022</a></p>
       </div>
       <hr/>
       <div class="post">
         <h5><a href="post.html">정산이 완료 되었습니다.</a></h5>
         <button type ="button" class = "close" aria-label = "Close">
           <span aria-hidden = "true">×</span>
         </button>
         <p class="author-category">By <a href="#">관리자</a> in <a href="">정산 페이지</a></p>
         <p class="intro">정산이 완료 되었습니다.</p>
         <p class="date-comments"><a href="post.html"><i class="fa fa-calendar-o"></i> June 22, 2022</a></p>
       </div>
     </div>
<!-- End lined tabs -->
 </form>
</body>