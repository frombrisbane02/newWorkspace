<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Picktory-공지사항 및 Q&A </title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">
	
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--font/icon (DASHMIN) -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!--JavaScript Libraries(DASHMIN) -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/admin.css">
    <!--bootstrap-->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/AdminInex.css">
	<script
	src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/AdminIndex.css"
	rel="stylesheet" />
    <title>Document</title>
        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
        
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/js/admin/index.js"></script>
        <link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css"
	rel="stylesheet" />
  <script src="${pageContext.request.contextPath}/resources/js/admin/index.js"></script>
  <link href="css/admin.css" rel="stylesheet" />
<style>

</style>
</head>

<body>
	<div class="container-s position-relative bg-white d-flex p-0">

		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">
				<a href="Index.do" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-hashtag me-2"></i>PICKTORY
					</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
						<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/test_img05.jpg" alt=""
							style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
						</div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0">Picktory</h6>
						<span>관리자</span>
					</div>
				</div>
				<div class="navbar-nav w-100">
					<a href="${pageContext.request.contextPath}/admin/Index.do" class="nav-item nav-link active">
					<i class="fa fa-tachometer-alt me-2"></i>관리자 메인</a>

					<div>
						<a href="${pageContext.request.contextPath}/admin/analysis/Index.do" class="nav-item nav-link">
              <i class="fa fa-chart-bar me-2"></i>통계 및 회원관리</a>
					</div>

					<div>
						<a href="${pageContext.request.contextPath}/admin/manager/Index.do" class="nav-item nav-link">
              <i class="far fa-file-alt me-2"></i>수익 및 정산</a>
					</div>
					
					<div>
						<a href="${pageContext.request.contextPath}/admin/notice/Index.do" class="nav-item nav-link">
              			<i class="far fa-file-alt me-2"></i>공지사항 및 Q & A</a>
					</div>
        </div>
			</nav>
		</div>
		<!-- Sidebar End -->


		<div class="content">

			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0 justify-content-end">
				<a href="Index.do" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-hashtag"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0 text-left"> <i
					class="fa fa-bars text-left"></i>
				</a>
				<div class="navbar-nav align-items-center ms-auto">
					
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">알람</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">공지사항이 업로드 되었습니다</h6> <small>15
									분 전</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Q&A가 등록되었습니다</h6> <small>20 분
									전</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">신고가 들어왔습니다</h6> <small>25 분 전</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">더 보기</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2" src="${pageContext.request.contextPath}/resources/img/admin/test_img05.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex">Picktory</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="${pageContext.request.contextPath}/admin/manager/MemberOne.do" class="dropdown-item">내 정보</a>
                            <a href="${pageContext.request.contextPath}/admin/Login.do" class="dropdown-item">로그아웃</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->
            <div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-line fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									이번 주 매출
								</p>
								<h6 class="mb-0 text-right">$1234</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-bar fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									총 매출
								</p>
								<h6 class="mb-0 text-right">$56853</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-area fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									오늘 방문자 수
								</p>
								<h6 class="mb-0 text-right">42명</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-pie fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									누적 총 방문자 수
								</p>
								<h6 class="mb-0 text-right">2352명</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- TAB CONTROLLERS -->
<input id="panel-1-ctrl"
class="panel-radios" type="radio" name="tab-radios" checked>
<input id="panel-2-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="panel-3-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="panel-4-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="panel-5-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="nav-ctrl"
class="panel-radios" type="checkbox" name="nav-checkbox">
<br>



<!-- TABS LIST -->
<ul id="tabs-list" class="bg-light">
<!-- MENU TOGGLE -->
<label id="open-nav-label" for="nav-ctrl"></label>
<li id="li-for-panel-1" class="noticeTab tabClick" data-tab_title="공지">
<label class="panel-label"
      for="panel-1-ctrl">공지사항</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-2" class="qnaTab tabClick" data-tab_title="qna">
<label class="panel-label"
      for="panel-2-ctrl">Q & A</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-3" class="reportTab tabClick" data-tab_title="신고">
<label class="panel-label"
      for="panel-3-ctrl">신고 리스트</label>
</li><!--INLINE-BLOCK FIX
-->
</li><!--INLINE-BLOCK FIX
--><!--INLINE-BLOCK FIX
-->

</ul>

<!--일일매출 시작-->
<article id="panels">
    <article class="container">
    <section id="panel-1" >
    <main>
        <div class="container-fluid pt-4 px-4">
  <div class="bg-light  rounded p-4" >
      <div class="table-responsive">
          <div class="bg-light text-center rounded p-4">
              <!--월별 매출 차트 시작-->
              <div class="d-flex align-items-center justify-content-between mb-4">
                  <h3 class="mb-0">공지사항</h3>
              </div>
              

              
              <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded p-4">                
                    <div class="searchbox" style="margin-top:10px; margin-bottom:10px; ">

                        <!--정렬 (가입일순 / 생년월일 / 주소(시) / )-->
                        <div class="dropdown" style="margin-left: 20px;">
                            <button type="button" style="width: 160px; height: 31px;" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                정렬
                            </button>
                            <div class="dropdown-menu">
                            	<a class="dropdown-item orderClick" href="#" value="ASC">내림차순</a>
                                <a class="dropdown-item orderClick" href="#" value="DESC">오름차순</a>
                             <!--     <a class="dropdown-item" href="#">구매자</a>
                                <a class="dropdown-item-text" href="#">구매목록</a>	-->
                            </div>
                        </div>
            
                           <!--search-->
                       <!--    <div>
						  	<select id="" class="form-select form-select-lg mb-3" style="width:210px;height:28px;">
								<option value="0" selected>전체</option>
								<option value="1">제목</option>
								<option value="2">아이디</option>
							</select>	                           
                           </div>	-->
                           
                           <div>
                            <input type="text" id="noticeKeyword" placeholder="검색">
                            <button class="btn btn-primary btn-sm" type="button" onclick="noticeListFn();">검색</button>
                            </div>
                        <!--search-->
                    </div> 
          

            <!-- Sales Chart Start -->
            <div class="table-responsive">
            <table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-1">번호</th>
                      <th class="col-6">제목</th>
                      <th class="col-1">아이디</th>
                      <th class="col-1">작성일</th>
                      
                    </tr>
                </thead>
                <tbody class="table-sm" id="tr_notice" >
				<!--  	<c:if test="${empty records }" var="isEmpty">
						<tr>
							<td class="text-center" colspan="6">등록된 글이 없습니다.</td>
						</tr>	
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach var="record" items="${records}">
							<tr>
                                <td class="text-center">${records.noticeNo }</td>
                                <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">${records.noticeTitle }</a></td>
                                <td><a href="memberOne.html">${records.noticeId }</a></td>
                                <td class="text-center">${records.noticeDate }</td>
                          </tr>
						</c:forEach>
					</c:if>	-->
					
			<!-- 예시 게시물 표현 시작-->
			              <!--   <tr>
			                      <td class="text-center">1</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">[공지사항] 공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">2</td>
			                      <td><a href="adminNoticeDetail.html">[공지사항] 공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">3</td>
			                      <td><a href="adminNoticeDetail.html">[공지사항] 공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">4</td>
			                      <td><a href="adminNoticeDetail.html">[공지사항]  공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="adminNoticeDetail.html">[공지사항] 공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">6</td>
			                      <td><a href="adminNoticeDetail.html">[공지사항] 공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>	-- >
		    <!-- 예시 게시물 표현 끝-->
		    
              	</tbody>
              </table>
              <div>
              <button class="btn btn-primary btn-sm" style="float: right;" type="button" data-toggle="modal"  data-target="#exampleModalCenter3">작성</button>
              </div>
              
              
              
              <!-- 모달로 공지사항 보기-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">공 지 사 항</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div>
                
                
                <form method="post" action="">   
                         <div class="container">
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td class="text-black modalNo" id="modalNo" >${records.noticeNo}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">아이디</th>
				<td class="text-black" id="modalID">${records.noticeId}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">등록일</th>
				<td class="text-black" id="modalDate" >${records.noticeDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td class="text-black"><input type="text" class="form-control" id="modalTitle" placeholder="제목을 입력하세요" /></td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-black" >
					<textarea class="form-control" rows="5" id="modalContent"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>	
				
            </div> 
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-primary" id="updateNoticeBtn">수정</button>
         <button type="button" class="btn btn-primary modelDeleteBtn" id="deleteNoticeBtn">삭제</button>
         <button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>
<!--          <c:if test="${sessionScope.user_Id eq records.userId }">
 			<a href="<c:url value="/Controller/EditController.KOSMO?no=${records.noticeNo}&title=${records.noticeTitle}&content=${records.noticeContent}"/>"class="btn btn-primary" >수정</a>
			<a href="<c:url value="/Controller/DeleteController.KOSMO?no=${records.noticeNo}"/>" class="btn btn-primary">삭제</a> 
		</c:if>
          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>	-->
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- 모달로 공지사항 쓰기-->
 <div class="modal fade hide" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content" id="modalClose">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">공 지 사 항 작 성</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body"><div>
                
                
	<!--  <form method="post" action=""> -->   
	<div class="container">
	<table class="table table-bordered">
		<tbody class="table-sm">
<!--  		<c:forEach var="record" items="${records}">
			<tr>
			<c:if test="${sessionScope.user_Id eq record.userId }">
				<th class="w-25 bg-dark text-white text-center">아이디</th>
				<td class="text-white">${records.userId}</td>
			</c:if>
			</tr>
		</c:forEach>	-->
			<tr>
				<th class="w-25 bg-dark text-white text-center left">제목</th>
				<td class="text-white"><input type="text" id="noInsertTitle" class="form-control" placeholder="제목을 입력하세요" name="title"></td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-white"><textarea id="noInsertContent" placeholder="내용을 입력하세요" class="form-control" rows="5" name="content"></textarea></td>
			</tr>
		</tbody>
	</table>
</div>
<!--  </form>	-->	
				
            </div> 
        </div>
        
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" id="noticeInsertBtn">작성</button>
        	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>          	
        </div>
        
      <!--    <div class="modal-footer">
        <c:if test="${sessionScope.user_Id eq records.userId }">
 			<a href="<c:url value="/Controller/EditController.KOSMO?no=${records.noticeNo}&title=${records.noticeTitle}&content=${records.noticeContent}"/>"class="btn btn-primary" >작성</a>
		</c:if>
          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>
        </div>	-->
      </div>
    </div>
  </div>
  
  <!-- 모달로 공지사항 수정-->
        <div class="modal fade" id="exampleModalCenter4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">공 지 사 항 수 정</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div>
                
                
                <form method="post" action="">   
                         <div class="container">
	<table class="table table-bordered">
		<tbody class="table-sm">
		<c:forEach var="record" items="${records}">
			<tr>
			<c:if test="${sessionScope.user_Id eq record.userId }">
				<th class="w-25 bg-dark text-white text-center">아이디</th>
				<td class="text-white">${records.userId}</td>
			</c:if>
			</tr>
		</c:forEach>
			<tr>
				<th class="w-25 bg-dark text-white text-center left">제목</th>
				<td class="text-white"><input type="text" class="form-control" placeholder="제목을 입력하세요" name="title"></td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-white"><textarea class="form-control" rows="5" name="content"></textarea></td>
			</tr>
		</tbody>
	</table>
</div>
</form>	
				
            </div> 
        </div>
        <div class="modal-footer">
        <c:if test="${sessionScope.user_Id eq records.userId }">
 			<a href="<c:url value="/Controller/EditController.KOSMO?no=${records.noticeNo}&title=${records.noticeTitle}&content=${records.noticeContent}"/>"class="btn btn-primary" >작성</a>
		</c:if>
          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
    </main>
    </section>
<!--일일매출 끝-->
<!--주매출 시작-->
<section id="panel-2">
    <main>
<div class="container-fluid pt-4 px-4">
  <div class="bg-light  rounded p-4" >
      <div class="table-responsive">
          <div class="bg-light text-center rounded p-4">
              <!--월별 매출 차트 시작-->
              <div class="d-flex align-items-center justify-content-between mb-4">
                  <h3 class="mb-0">Q & A</h3>
              </div>
              <div class="container-fluid pt-4 px-4">
                <div class="bg-light  rounded p-4">
                    <div class="searchbox" style="margin-top:10px; margin-bottom:10px; ">
                        <!--정렬 (가입일순 / 생년월일 / 주소(시) / )-->
                        <div class="dropdown" style="margin-left: 20px;">
                            <button type="button" style="width: 160px; height: 31px;" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                정렬
                            </button>
                            <div class="dropdown-menu">
                            	<a class="dropdown-item orderClick" href="#" value="ASC">내림차순</a>
                                <a class="dropdown-item orderClick" href="#" value="DESC">오름차순</a>
                            </div>
                        </div>
            
                           <!--search-->
                           <div>
                            <input type="text" id="qnaKeyword" placeholder="검색">
                            <button class="btn btn-primary btn-sm" type="button" onclick="noticeListFn();">검색</button>
                            </div>
                        <!--search-->
                    </div> 
          

            <!-- Sales Chart Start -->
            <div class="table-responsive">
            <table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-1">번호</th>
                      <th class="col-6">제목</th>
                      <th class="col-1">아이디</th>
                      <th class="col-1">작성일</th>
                      
                    </tr>
                </thead>
                <tbody class="table-sm" id="qnaTbody">
				<!--  	<c:if test="${empty records }" var="isEmpty">
						<tr>
							<td class="text-center" colspan="6">등록된 글이 없습니다.</td>
						</tr>	
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach var="record" items="${records}">
							<tr>
                                <td class="text-center">${records.qnaNo }</td>
                                <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">${records.qnaTitle }</a></td>
                                <td class="text-center">${records.userId }</a></td>
                                <td class="text-center">${records.qnaDate }</td>
                          </tr>
						</c:forEach>
					</c:if>	-->
					
			<!-- 예시 게시물 표현 시작-->
			           <!--        <tr>
			                      <td class="text-center">1</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">결제시스템에 질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">2</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">결제시스템에 질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">5</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">결제시스템에 질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">결제시스템에 질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">결제시스템에 질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">결제시스템에 질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>	-->
		    <!-- 예시 게시물 표현 끝-->
		    
              	</tbody>
              </table>
             
              
              
              <!-- 모달 Q & A 보기  -->
        <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">Q & A</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div>
                
                
                <form method="post" action="">   
                         <div class="container">
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td class="text-black" id="modalQnaNo"></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">아이디</th>
				<td class="text-black" id="modalQnaId"></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">등록일</th>
				<td class="text-black" id="modalQnaDate"></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td class="text-black" id="modalQnaTitle"></td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-black" id="modalQnaContent"></td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">답 변</th>
			</tr>
			<tr>
				<td colspan="2" class="text-black">
					<textarea id="modalQnaAnswer" placeholder="답변내용을 입력하세요" class="form-control" rows="5" name="content"></textarea>
				</td>
			</tr>
			
		</tbody>
	</table>
</div>
</form>	
				
            </div> 
        </div>
        <div class="modal-footer">
      <!--    <c:if test="${sessionScope.user_Id eq records.userId }">
 			<a href="<c:url value="/Controller/EditController.KOSMO?no=${records.qnaNo}&title=${records.qnaTitle}&content=${records.qnaContent}"/>"class="btn btn-primary" >답장</a>
			<a href="<c:url value="/Controller/DeleteController.KOSMO?no=${records.qnaNo}"/>" class="btn btn-primary">삭제</a> 
		</c:if>	-->
		
			<button type="button" id="modalQnaClick" class="btn btn-primary right">답장</button>
			<button type="button" id="modalQnaDelete" class="btn btn-primary right modelDeleteBtn">삭제</button>
          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</main>
</section>
<!--주매출 끝-->
<!--달매출 시작-->
<section id="panel-3">
    <main>
<div class="container-fluid pt-4 px-4">
  <div class="bg-light  rounded p-4" >
      <div class="table-responsive">
          <div class="bg-light text-center rounded p-4">
              <!--월별 매출 차트 시작-->
              <div class="d-flex align-items-center justify-content-between mb-4">
                  <h3 class="mb-0">신고리스트</h3>
              </div>
              <div class="container-fluid pt-4 px-4">
                <div class="bg-light  rounded p-4">
                    <div class="searchbox" style="margin-top:10px; margin-bottom:10px; ">
                        <!--정렬 (가입일순 / 생년월일 / 주소(시) / )-->
                        <div class="dropdown" style="margin-left: 20px;">
                            <button type="button" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                정렬
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">날짜</a>
                                <a class="dropdown-item" href="#">구매자</a>
                                <a class="dropdown-item-text" href="#">구매목록</a>
                            </div>
                        </div>
            
                           <!--search-->
                           <div>
                            <input type="text" placeholder="검색">
                            <button class="btn btn-primary btn-sm" type="button" onclick="location.href='joinUs.jsp' ">검색</button>
                            </div>
                        <!--search-->
                    </div> 
          

            <!-- Sales Chart Start -->
            <div class="table-responsive">
            <table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-1">번호</th>
                      <th class="col-6">제목</th>
                      <th class="col-1">아이디</th>
                      <th class="col-1">작성일</th>
                      
                    </tr>
                </thead>
                <tbody class="table-sm">
					<c:if test="${empty records }" var="isEmpty">
						<tr>
							<td class="text-center" colspan="6">등록된 글이 없습니다.</td>
						</tr>	
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach var="record" items="${records}">
							<tr>
                                <td class="text-center">5</td>
                                <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
                                <td class="text-center"><a href="memberOne.html">Picktory</a></td>
                                <td class="text-center">22-06-22</td>
                          </tr>
						</c:forEach>
					</c:if>
					
			<!-- 예시 게시물 표현 시작-->
			                 <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter2">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
		    <!-- 예시 게시물 표현 끝-->
		    
              	</tbody>
              </table>
             
              
              <!-- 모달 신고접수 받기 보기 -->
        <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">신고 접수 받기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div>
                
                
                <form method="post" action="">   
                         <div class="container">
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td class="text-white">${records.qnaNo}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">아이디</th>
				<td class="text-white">${records.userId}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">등록일</th>
				<td class="text-white">${records.qnaDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td class="text-white">${records.qnaTitle}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-white">${records.qnaContent}</td>
			</tr>
		</tbody>
	</table>
</div>
</form>	
				
            </div> 
        </div>
        <div class="modal-footer">
        <c:if test="${sessionScope.user_Id eq records.userId }">
 			<a href="<c:url value="/Controller/EditController.KOSMO?no=${records.qnaNo}&title=${records.qnaTitle}&content=${records.qnaContent}"/>"class="btn btn-primary" >접수받기</a>
			<a href="<c:url value="/Controller/DeleteController.KOSMO?no=${records.qnaNo}"/>" class="btn btn-primary">삭제</a> 
		</c:if>
          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
</main>
</section>

</article>
<!-- Chart End -->


</div>
<!-- Content End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>


<script>

const localhost = 'http://localhost:4040/springapp/admin';
var tabText = '공지';
var orderby = "ASC";

//Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});

var noticeAjaxData = "";
var URLInfo = "/noticeList.do";

  $(document).ready(function() {
		noticeListFn();
  });
  
  
  $('#modalQnaClick').on('click', function(){
	 	alert("준비중입니다");
	 	return false;
  });
  
  //탭 클릭
  $(document).on('click', '.tabClick', function(){
	 
	 tabText = $(this).data('tab_title');
	 
	 if(tabText == "공지"){
		 URLInfo = "/noticeList.do";
		 noticeListFn();
	 }else if(tabText == "qna"){
		 URLInfo = "/qnaList.do";
		 noticeListFn();
	 }else{
//		 URLInfo = "/reportList.do";
	 }
  });
  
  
  // 공지사항 정렬
  $('.orderClick').on('click', function(){
	  orderby = $(this).attr('value');
	  noticeListFn();
  });
  
  // 데이터 AJAX
  function noticeListFn(){
	  
	  
	  if(tabText == "공지"){
		  var noticeKeyword = $('#noticeKeyword').val();
		  var obj = { "orderby" : orderby, "noticeKeyword" :  noticeKeyword};
	  } 
		  
	  if(tabText == "qna"){
		  var qnaKeyword = $('#qnaKeyword').val();
		  var obj = { "orderby" : orderby, "qnaKeyword" :  qnaKeyword};		  
	  }

	 $.ajax({
		    url: localhost + URLInfo,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    contentType: "application/json",
		    data: JSON.stringify(obj),
		    success: function(data){
		    		    	
		    	noticeAjaxData = data;
		    	
		    	$('#tr_notice').html('');
		    	$('#qnaTbody').html('');
		    	
		    	noticeSettingFn();
		    	
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
	  });
  }
  
  
  
  
  // 리스트 세팅
  function noticeSettingFn(){
	  
		if(tabText == "공지" && noticeAjaxData.length == 0){
			var noticeHTML = '';
			noticeHTML += '<tr>'
			noticeHTML	+= '<td class="text-center" colspan="6">등록된 글이 없습니다.</td>'
		    noticeHTML += '</tr>'
			$('#tr_notice').append(noticeHTML);
		   	return false;
		}
		
		if(tabText == "qna" && noticeAjaxData.length == 0){
			var qnaHTML = '';
			qnaHTML += '<tr>'
			qnaHTML += '<td class="text-center" colspan="6">등록된 글이 없습니다.</td>'
			qnaHTML += '</tr>'
			$('#qnaTbody').append(qnaHTML);
			return false;
		}
	  
	  if(tabText == "공지"){
		  for(var i = 0; i < noticeAjaxData.length; i++){
			  var noticeHTML = '';
			  var v = noticeAjaxData[i];
			  var noDate = v.noticeDate.substring(0, 10);
			  	  noticeHTML += '<tr>'
				  noticeHTML += '<td class="text-center">'+ v.noticeNo +'</td>'
				  noticeHTML += '<td><a class="primary modalClick" data-modal_no='+ v.noticeNo +' data-toggle="modal" data-target="#exampleModalCenter">[공지사항] '+ v.noticeTitle +'</a></td>'
				  noticeHTML += '<td>'+ v.userId +'</td>'
				  noticeHTML += '<td class="text-center">'+ noDate +'</td>'
				  noticeHTML += '</tr>'
				  $('#tr_notice').append(noticeHTML);
		  }  
	  }else if(tabText == 'qna'){
		  for(var i = 0; i < noticeAjaxData.length; i++){
			  var qnaHTML = '';
			  var v = noticeAjaxData[i];
			  
			  var qnDate = v.qnaDate.substring(0, 10);
			 	  qnaHTML += '<tr>'
				  qnaHTML += '<td class="text-center">'+ v.qnaNo +'</td>'
				  qnaHTML += '<td class="text-center"><a class="primary modalClick" data-modal_no='+ v.qnaNo +' data-toggle="modal" data-target="#exampleModalCenter1">'+ v.qnaTitle +'</a></td>'
				  qnaHTML += '<td class="text-center">'+ v.userId +'</a></td>'
				  qnaHTML += '<td class="text-center">'+ qnDate +'</td>'
				  qnaHTML += '</tr>'				  
				  $('#qnaTbody').append(qnaHTML);
		  }		  
	  }
  }
  
  
  // 모달 클릭
  $(document).on('click', '.modalClick', function(){
	  var modalNo = $(this).data('modal_no');
	  if(tabText == '공지'){
		  for(var i = 0; i < noticeAjaxData.length; i++){
			  var v = noticeAjaxData[i];
			  var noDate = v.noticeDate.substring(0, 10);
			  if(modalNo == v.noticeNo){
				  $('#modalNo').text(v.noticeNo);
				  $('#modalID').text(v.userId);
				  $('#modalDate').text(noDate);
				  $('#modalTitle').val(v.noticeTitle);
				  $('#modalContent').val(v.noticeContent);
				  $('#updateNoticeBtn').val(v.noticeNo);
				  $('#deleteNoticeBtn').val(v.noticeNo);
			  }
		  }  
	  }else if(tabText == 'qna'){
		  for(var i = 0; i < noticeAjaxData.length; i++){
			  var v = noticeAjaxData[i];
			  var qnDate = v.qnaDate.substring(0, 10);
			  if(modalNo == v.qnaNo){
				  $('#modalQnaNo').text(v.qnaNo);
				  $('#modalQnaId').text(v.userId);
				  $('#modalQnaDate').text(qnDate);
				  $('#modalQnaTitle').text(v.qnaTitle);
				  $('#modalQnaContent').text(v.qnaContent);
				  $('#modalQnaClick').val(v.qnaNo);
				  $('#modalQnaDelete').val(v.qnaNo);
			  }
		  }
	  }
  });
  
  // 공지사항 업데이트
  $('#updateNoticeBtn').on('click',function(){
	  
	  var noticeTitle = $('#modalTitle').val();
	  var noticeContent = $('#modalContent').val();
	  var noticeNo = $(this).val();
	  var obj = {"noticeNo" : noticeNo, "noticeTitle" : noticeTitle, "noticeContent" : noticeContent};
	  
	// 모달창 삭제
	   $('#updateNoticeBtn').attr('data-dismiss', "modal");
	  
		 $.ajax({
			    url: localhost + "/noticeUpdate.do",
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    contentType: "application/json",
			    data: JSON.stringify(obj),
			    success: function(data){
					if(data == false){
						alert("업데이트에 실패했습니다");
						return false;
					}else{
						alert("업데이트 되었습니다");
						noticeListFn();
					}
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
  });
  
  // 공지사항 삭제
  $('.modelDeleteBtn').on('click', function(){

		  var deleteMessage = confirm('공지사항을 삭제하시겠습니까?');
		  if(!deleteMessage){
			  alert("취소 되었습니다");
			  return false;
		  }
		  
		if(tabText == '공지'){
		 var noticeNo = $(this).val();
		 var obj = { "noticeNo" : noticeNo };
		 var delUrl = "/noticeDelete.do";
		 // 모달창 삭제
		 $('#deleteNoticeBtn').attr('data-dismiss', "modal");
				 
		}else if(tabText == 'qna'){
		 var qnaNo = $(this).val();
		 var obj = { "qnaNo" : qnaNo };
		 var delUrl = "/qnaDelete.do";
		// 모달창 삭제
		 $('#modalQnaDelete').attr('data-dismiss', "modal");
		}
	    
		 $.ajax({
			    url: localhost + delUrl,
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    data: obj,
			    success: function(data){
					if(data == false){
						alert("삭제가 안 되었습니다");
						return false;
					}else{
						alert("삭제 되었습니다");
						noticeListFn();
					}
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
  });
  
  // 공지사항 등록
  $('#noticeInsertBtn').on('click', function(){
	 	  
	  var noticeTitle = $("#noInsertTitle").val();
	  var noticeContent = $("#noInsertContent").val();
	  var obj = [{"userNo" : 2, "noticeTitle" : noticeTitle, "noticeContent" : noticeContent}];
	  
	  // 모달창 삭제
	  $('#noticeInsertBtn').attr('data-dismiss', "modal");
	  
	 $.ajax({
		    url: localhost + "/noticeInsert.do",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    contentType: "application/json",
		    data: JSON.stringify(obj),
		    success: function(data){
		    	if(data == false){
		    		alert("등록에 실패 했습니다");
		    		return false;
		    	}else{
		    		alert("등록 되었습니다");
		    		$("#noInsertTitle").val('');
		    		$("#noInsertContent").val('');
		    		
		    		noticeListFn();
		    	}
		    	
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
	  });
  });
  
</script>
</html>
 		