<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Picktory-수익 및 정산 </title>
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
  <link href="css/admin.css" rel="stylesheet" />     

</head>

<body>
	<div class="container-s position-relative bg-white d-flex p-0">

		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">
				<a href="/springapp/index.do" class="navbar-brand mx-4 mb-3">
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
									이번 주 PICKTORY 매출
								</p>
								<h6 class="mb-0 text-right" id="weekPay">0원</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-bar fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									총 PICKTORY 매출
								</p>
								<h6 class="mb-0 text-right" id="totalPay">0원</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-area fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									이번 주 가입한 회원 수
								</p>
								<h6 class="mb-0 text-right" id="weekUser" >0명</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-pie fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									총 회원 수
								</p>
								<h6 class="mb-0 text-right" id="totalUser">0명</h6>
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
<li id="li-for-panel-1" class="memberClass">
<label class="panel-label"
      for="panel-1-ctrl">최근 거래 내역</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-2" class="salesClass">
<label class="panel-label"
      for="panel-2-ctrl">회원 매출 및 PICTORY 매출 현황</label>
</li><!--INLINE-BLOCK FIX
-->
<!--INLINE-BLOCK FIX
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
                  <h3 class="mb-0">최근 구매 / 판매 목록</h3>
              </div>
     
					<div class="searchbox" style="margin-top:10px; margin-bottom:10px; ">
                        <!--정렬 (가입일순 / 생년월일 / 주소(시) / )-->
                        <div class="dropdown" style="margin-left: 20px;">
                            <button type="button" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                검색 키워드
                            </button>
                            <div class="dropdown-menu">
                                <!--   <a class="dropdown-item" href="#">최신순</a>	-->
                                <a class="dropdown-item searchId" href="#" value="consumer">구매자 아이디</a>
                                <a class="dropdown-item searchId" href="#" value="seller">판매자 아이디</a>
                                <!--  <a class="dropdown-item-text" href="#">구매/판매 목록</a> -->
                            </div>
                        </div>
            
                           <!--search-->
                           <div>
                            <input type="text" id="keyword" placeholder="검색">
                            <button id="searchClick">검색</button>
                            </div>
                        <!--search-->
                    </div> 
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
										<th class="col-1 text-center">글 번호</th>
			                            <th class="col-1 text-center">구매자<br> 아이디</th>
			                            <th class="col-1 text-center">판매자<br> 아이디</th>
			                            <th class="col-2 text-center">주문 일련 번호</th>
			                            <th class="col-2 text-center">상품 일련 번호</th>
			                            <th class="col-2 text-center">상품명</th>
			                            <th class="col-1 text-center">주문<br> 합계금액</th>
			                            <th class="col-1 text-center">주문<br> 날짜</th>
									</tr>
							</thead>
							<tbody class="tr_append">
						<!--  	<c:if test="${empty records }" var="isEmpty">
								<tr>
									<td class="text-center" colspan="6">등록된 글이 없습니다.</td>
								</tr>	
							</c:if>
								<c:if test="${not isEmpty }">
				                    <c:forEach var="records" items="${records }">
				                         <tr>
				                            <td class="text-center">${record.postNo}</td>
				                            <td class="text-center">${record.id}</a></td>
				                            <td class="text-center">${record.id}</a></td>
				                            <td class="text-center">${record.paymentNo}</td>
				                            <td class="text-center">${record.pdNo}</a></td>
				                            <td class="text-center">${record.photoName}</td>
				                            <td class="text-center">${record.paymentTotal}</td>
				                            <td class="text-center">${record.paymentDate}</td>
				                        </tr>
				                    </c:forEach>
				                </c:if>	-->
							<!-- 최근 구매/ 판매 목록 글 쐈을때의 예시 -->
							<!--  	 <tr>
		                            <td class="text-center">5</td>
		                            <td class="text-center"><a href="#">BROKEROW</a></td>
		                            <td class="text-center"><a href="memberOne.html">SAMURAI</a></td>
		                            <td class="text-center">324352</td>
		                            <td class="text-center"><a href="memberOne.html">2335</a></td>
		                            <td class="text-center">경복궁.jpg</td>
		                            <td class="text-center">500원</td>
		                            <td class="text-center">22-06-16</td>
		                        </tr>

								<tr>
		                            <td class="text-center">6</td>
		                            <td class="text-center"><a href="#">BROKEROW</a></td>
		                            <td class="text-center"><a href="memberOne.html">SAMURAI</a></td>
		                            <td class="text-center">324352</td>
		                            <td class="text-center"><a href="memberOne.html">2335</a></td>
		                            <td class="text-center">경복궁.jpg</td>
		                            <td class="text-center">500원</td>
		                            <td class="text-center">22-06-16</td>
		                        </tr>

								<tr>
		                            <td class="text-center">7</td>
		                            <td class="text-center"><a href="#">BROKEROW</a></td>
		                            <td class="text-center"><a href="memberOne.html">SAMURAI</a></td>
		                            <td class="text-center">324352</td>
		                            <td class="text-center"><a href="memberOne.html">2335</a></td>
		                            <td class="text-center">경복궁.jpg</td>
		                            <td class="text-center">500원</td>
		                            <td class="text-center">22-06-16</td>
		                        </tr>

								<tr>
		                            <td class="text-center">1</td>
		                            <td class="text-center"><a href="#">BROKEROW</a></td>
		                            <td class="text-center"><a href="memberOne.html">SAMURAI</a></td>
		                            <td class="text-center">324352</td>
		                            <td class="text-center"><a href="memberOne.html">2335</a></td>
		                            <td class="text-center">경복궁.jpg</td>
		                            <td class="text-center">500원</td>
		                            <td class="text-center">22-06-16</td>
		                        </tr>	-->
							</tbody>
						</table>
						<!-- Recent Sales End -->
					</div>
				</div>
    </main>
    </section>
<!--일일매출 끝-->
<!--주매출 시작-->
<section id="panel-2">
    <main>
<div class="container-fluid pt-4 px-4">
    <div class="bg-light  rounded p-4">
        <div class="table-responsive">
            <div class="bg-light text-center rounded p-4">
                <!--달력 시작-->
                <div class="sec_cal">
                    <div class="cal_nav">
                      <a href="javascript:;" class="nav-btn go-prev">prev</a>
                      <div class="year-month"></div>
                      <a href="javascript:;" class="nav-btn go-next">next</a>
                    </div>
					<div class="cal_wrap">
                      <div class="dates"></div>
                    </div>
                </div>
                <!--달력 끝-->
                <!--주차별 매출 차트 시작-->
                <div class="d-flex align-items-center justify-content-between mb-4">
                            <h3 class="mb-0">매출 차트</h3>
                </div>
                <div class="div_chart2">
                    <!-- <canvas id="memberDayChart" style="width: 100%; max: width 1104px;"></canvas> -->
                </div>
                <!--주차별 매출 차트 끝-->
            </div>
            <!--주차별 매출 표 시작-->
             <div class="col-sm-10 col-xl-10">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">총 매출 표</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr class="thID1 removeClass">
                                    <!--  	<th scope="col">일자</th>
                                        <th scope="col">1일</th>
                                        <th scope="col">2일</th>
                                        <th scope="col">3일</th>
                                        <th scope="col">4일</th>
                                        <th scope="col">5일</th>
                                        <th scope="col">6일</th>
                                        <th scope="col">7일</th>
                                        <th scope="col">8일</th>
                                        <th scope="col">9일</th>
                                        <th scope="col">10일</th>	-->
                                    </tr>
                                </thead>
                                <tbody>
                                      <tr class="thID_1 removeClass">
                                  <!--      <th scope="row">회원수</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>	--> 
                                    </tr> 
									<tr class="thID_11 removeClass">
                                   <!--   <th scope="row">회원수2</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>	--> 
                                    </tr>	
                                </tbody>
                                <thead>
                                    <tr class="thID2 removeClass">
                                     <!--     <th scope="col">회원수</th>
                                        <th scope="col">11일</th>
                                        <th scope="col">12일</th>
                                        <th scope="col">13일</th>
                                        <th scope="col">14일</th>
                                        <th scope="col">15일</th>
                                        <th scope="col">16일</th>
                                        <th scope="col">17일</th>
                                        <th scope="col">18일</th>
                                        <th scope="col">19일</th>
                                        <th scope="col">20일</th>-->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="thID_2 removeClass">
                                    <!--     <th scope="row">회원수</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>--> 
                                    </tr>
									<tr class="thID_21 removeClass">
                                    <!--     <th scope="row">회원수</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>--> 
                                    </tr>
                                </tbody>
                                <thead>
                                    <tr class="thID3 removeClass">
                                      <!--  <th scope="col">회원수</th>
                                        <th scope="col">21일</th>
                                        <th scope="col">22일</th>
                                        <th scope="col">23일</th>
                                        <th scope="col">24일</th>
                                        <th scope="col">25일</th>
                                        <th scope="col">26일</th>
                                        <th scope="col">27일</th>
                                        <th scope="col">28일</th>
                                        <th scope="col">29일</th>
                                        <th scope="col">30일</th> --> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="thID_3 removeClass">
                                     <!--   <th scope="row">회원수</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td> --> 
                                    </tr>
									<tr class="thID_31 removeClass">
                                     <!--   <th scope="row">회원수</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td> --> 
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--일일매출표 끝-->
                    <!--총 매출 합계 시작-->
                    <div class="col-sm-12 col-xl-5">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">총 매출합계</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">매출 합계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">총 매출</th>
                                        <td id="total_all"></td>
                                    </tr>
									<tr>
                                        <th scope="row">Picktory 매출 (10%수수료)</th>
                                        <td id="total_all2"></td>
                                    </tr>
                                     
                                </tbody>
                            </table>
                    </div>
                     <!--총 매출 합계 끝-->
        </div>
    </div>
</div>
</main>
</section>
<!--주매출 끝-->

<!--달 매출 끝-->

</article>
<!-- Chart End -->


</div>
<!-- Content End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>

<script>
//   window.pagObj = $('#pagination').twbsPagination({
//        totalPages: [[$(dataListPage.totalPages)]], // 전체 페이지
//        startPage: parseInt([[$(dataListPage.number)]] + 1), // 시작(현재) 페이지
//        visiblePages: 10, // 최대로 보여줄 페이지
//        prev: "‹", // Previous Button Label
//        next: "›", // Next Button Label
//        first: '«', // First Button Label
//        last: '»', // Last Button Label
//        onPageClick: function (event, page) { // Page Click event
//            console.info("current page : " + page);
//        }
//    }).on('page', function (event, page) {
//        searchDataList(page);
//    });

</script>

<script>

const localhost = 'http://localhost:4040/springapp/admin';

var monthDay = '';
var dataText = "";
var bbcc = "";
var currentYear = "";
var currentMonth = "";
var thisMonth = "";
var monthText = "";

// 차트
var monthArr = [];

var tabText = "회원";

  $(document).ready(function() {
	  salesOfWeek();
  });

  //Sidebar Toggler
  $('.sidebar-toggler').click(function () {
      $('.sidebar, .content').toggleClass("open");
      return false;
  });
  
  
  // 이전달로 이동
  $('.go-prev').on('click', function() {
      monthText = "이전달";
      calendarInit();
  });

  // 다음달로 이동
  $('.go-next').on('click', function() {
        monthText = "다음달";
        calendarInit();
  });

  // 탭 클릭
  // 최근 거래내역
  $('.memberClass').on('click', function(){
	  	paymentListAjax();
    });

  // 차트 탭
    $('.salesClass').on('click', function(){
    	calendarInit();
    });
  
  
  
	// 한 주
	function weekDate(){
	
		var currentDay = new Date();  
		var theYear = currentDay.getFullYear();
		var theMonth = currentDay.getMonth();
		var theDate  = currentDay.getDate();
		var theDayOfWeek = currentDay.getDay();
		 
		var thisWeek = [];
	 
		for(var i = 0; i < 7; i++) {
		  var resultDay = new Date(theYear, theMonth, theDate - (i + theDayOfWeek) + 7 );
		  
		  var yyyy = resultDay.getFullYear();
		  var mm = Number(resultDay.getMonth()) + 1;
		  var dd = resultDay.getDate();
		 
		  mm = String(mm).length === 1 ? '0' + mm : mm;
		  dd = String(dd).length === 1 ? '0' + dd : dd;
		 
		  thisWeek[i] = yyyy + mm + dd;
		}
				
		return thisWeek.sort();
	}
  
  
  
	function salesOfWeek(){
		var weekArr = [];
		var week = weekDate();
		var obj = {"startDate" : week[0], "endDate" : week[6]};
		
		weekArr.push(obj);
		
		 $.ajax({
			 	url: localhost + '/salesofweek.do',
			    type: "POST",
			    cache: true,
			    dataType: "json",
			    contentType: "application/json",
			    data: JSON.stringify(weekArr),
			    success: function(data){
			    	
			    	
			    	for(var i = 0; i < data.length; i++){
			    		var v = data[i];
			    		
			    		$('#weekPay').text(v.payWeek + '원');
			    		$('#totalPay').text(v.payTotal + '원');
			    		$('#weekUser').text(v.userWeek + '명');
			    		$('#totalUser').text(v.userTotal + '명');
			    	}
			    	
			    	
			    	paymentListAjax();
			    	
			    	
			    }, error: function (request, status, error){
			    	alert("Error");
			    }
		  });
	}


    //차트
    function calendarInit(){
  	  
  	  monthArr = [];
  	  
      // 날짜 정보 가져오기
       var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
       var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
       var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
       var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
       
       
       
          if(monthText == "이전달"){
            thisMonth = new Date(currentYear, currentMonth - 1, 1);  
          }else if(monthText == "다음달"){
            thisMonth = new Date(currentYear, currentMonth + 1, 1);
          }else{
            thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
          }
      
      // 달력에서 표기하는 날짜 객체
          currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
          currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
      var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

      var now = new Date();
      var month_now = now.getMonth()+1
      var year_now = now.getFullYear();


      // 렌더링을 위한 데이터 정리
      currentYear = thisMonth.getFullYear();
      currentMonth = thisMonth.getMonth();
      currentDate = thisMonth.getDate();
      
      // 이전 달의 마지막 날 날짜와 요일 구하기
      var startDay = new Date(currentYear, currentMonth, 0);
      var prevDate = startDay.getDate();
      var prevDay = startDay.getDay();

      // 이번 달의 마지막날 날짜와 요일 구하기
      var endDay = new Date(currentYear, currentMonth + 1, 0);
      var nextDate = endDay.getDate();
      var nextDay = endDay.getDay();

      // 현재 월 표기
       $('.year-month').text(currentYear + '.' + (currentMonth + 1));

      // 렌더링 html 요소 생성
      calendar = document.querySelector('.dates')
      calendar.innerHTML = '';
      $(".dates").hide();

      // 지난달
      for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
      }
      // 이번달
      for (var i = 1; i <= nextDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>';
          monthArr.push(i);
      }
     

      if(month_now == currentMonth + 1 && currentYear == year_now){
        $('.go-next').hide();
      }else{
        $('.go-next').show();
      }

      // 다음달
      for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {        	
          calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
      }

      // 오늘 날짜 표기
      if (today.getMonth() == currentMonth) {
          todayDate = today.getDate();
          var currentMonthDate = document.querySelectorAll('.dates .current');
          currentMonthDate[todayDate -1].classList.add('today');
      }
      
  	var year = String(thisMonth.getFullYear());
  	var month = String(thisMonth.getMonth() + 1);
  	
	  	month = month >= 10 ? month : '0' + month;
	  	startDate = year + month + "01";
  	 
  	 var today = new Date(year, month, 0);
  	 var year = today.getFullYear();
  	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
  	 
  	 
  	 var day = ('0' + today.getDate()).slice(-2);
  	 endDate = year + month + day;
  	 
  		paymentChartAjax()
      
    } // CALENDAR INIT FN END

  
  var ajaxData = "";
  
  	// 차트 데이터
  	function paymentChartAjax(){
    	
    	var obj = [{"startDate" : startDate, "endDate" : endDate}];
    	
     	$.ajax({
    	 	url: localhost + "/paymentChart.do",
    	    type: "POST",
    	    cache: false,
            dataType: "json",
            contentType: "application/json",
    	    data: JSON.stringify(obj),
    	    success: function(data){
    	    	
    	    	
			      // 기존 캔버스 삭제
			      $('.div_chart2').find('canvas').remove();
			   	  // 새로 다시 그림
			      $('.div_chart2').append('<canvas id="paymentChartID" style="width: 100%; max: width 1104px;"></canvas>');
			   	  
			   	  $('.removeClass').html('');
    	    	
    	    	ajaxData = data;
    	    	
  				chartSetting();
    			
    	    }, error: function (request, status, error){
    	    	alert("Error");
    	    }
    	  });
  	}
    
    // 차트 세팅
    function chartSetting(){
   
    	
	    var xValues = [];
	    var yValues = [];
	    var yValuesTwo = [];
	 	  
		var yearValue = endDate.substring(0, 4);
		var monthValue = endDate.substring(4, 6);
		var sum = 0;
		var sum2 = 0;
		var dateArr = [];
	    var dataArr = [];
	    var dataArr2 = [];
	   
	    
	    $('.thID1').append('<th scope="col">일자</th>');
	    $('.thID2').append('<th scope="col">일자</th>');
	    $('.thID3').append('<th scope="col">일자</th>');
	    
	    
	    $('.thID_1').append('<th scope="row">총 매출</th>');
	    $('.thID_2').append('<th scope="row">총 매출</th>');
	    $('.thID_3').append('<th scope="row">총 매출</th>');
	    
	    $('.thID_11').append('<th scope="row">매출 (10%수수료)</th>');
	    $('.thID_21').append('<th scope="row">매출 (10%수수료)</th>');
	    $('.thID_31').append('<th scope="row">매출 (10%수수료)</th>');
	    
	    
		
	    for(var i = 1; i <= monthArr.length; i++){
	    	var dateValue = i >= 10 ? i : '0' + i;
	    	
	    	
	    	if( i <= 10 ){
	    		$('.thID1').append('<th scope="col">'+ dateValue +'</th>');
	    	}else if(i >= 10 && i <= 20){
	    		$('.thID2').append('<th scope="col">'+ dateValue +'</th>');
	    	}else{
	    		$('.thID3').append('<th scope="col">'+ dateValue +'</th>');
	    	}
	    	
	    	
	    	dateValue = String(dateValue);
	    	var dateVal = yearValue + monthValue + dateValue;
	    	
	    	
	    	var obj = {'dateDay' : dateVal, "paymentTotal" : 0,  "persent" : 0, "idx" : i};
	    	
	    	dateArr.push(obj);
	    	xValues.push(dateValue);
	    }
    	
	    
	    for(var i = 0; i < ajaxData.length; i++){
	    	var v = ajaxData[i];
	    	var obj = { "paymentTotal" : v.paymentTotal, "persent" : v.persent, "dateDay" : v.dateDay };
	    	dataArr.push(obj);
	    }
 		
 		if(ajaxData.length != 0){
	 		
		  	  for(var i = 0; i < dateArr.length; i++){
		  		  var v = dateArr[i];
		  		  
		  		  for(var y = 0; y < dataArr.length; y++){
		  			  var vv = dataArr[y];
		  			  
		  			  if(v.dateDay == vv.dateDay){
		  				vv.idx = v.idx;
		  				dataArr2.push(vv);
		  			  }
		  		  }
		  	  }
		    
			  	var aaArr = [...new Set([...dataArr2, ...dateArr])];
			  	var aa = aaArr.filter(
	  				(arr, index, callback) => index === callback.findIndex(t => t.idx === arr.idx));
			  	
			  	
			 //정렬
			  var geResult = aa.sort(function (a, b) {
			  	    return a.idx - b.idx;
			  });
			 
			 
			 for(var i = 0; i < geResult.length; i++){
				 var v = geResult[i];
				 				 
					if(i < 10){
			 		    $('.thID_1').append('<td>'+ v.paymentTotal +'</td>');
			 		    $('.thID_11').append('<td>'+ v.persent +'</td>');
			 		
			 		}else if(i <= 20 && i > 10){
			 		    $('.thID_2').append('<td>'+ v.paymentTotal +'</td>');
			 		    $('.thID_21').append('<td>'+ v.persent +'</td>');
			 		}else{
			 		    $('.thID_3').append('<td>'+ v.paymentTotal +'</td>');
				 		$('.thID_31').append('<td>'+ v.persent +'</td>');
			 		}
			
				 sum += v.paymentTotal;
				 sum2 += v.persent;
				
				 yValues.push(v.paymentTotal);
				 yValuesTwo.push(v.persent);
			 }
			 		
	 			$('#total_all').text(sum);
	 			$('#total_all2').text(sum2);
			 
 		}else{
 			
 			
 			for(var i = 0; i < xValues.length; i++){
 				
				if(i < 10){
		 		    $('.thID_1').append('<td>0</td>');
		 		    $('.thID_11').append('<td>0</td>');
		 		
		 		}else if(i <= 20 && i > 10){
		 		    $('.thID_2').append('<td>0</td>');
		 		    $('.thID_21').append('<td>0</td>');
		 		}else{
		 		    $('.thID_3').append('<td>0</td>');
			 		$('.thID_31').append('<td>0</td>');
		 		}
 				
 				
				 yValues.push(0);
				 yValuesTwo.push(0);	
 			}
 			
 			$('#total_all').text(sum);
 			$('#total_all2').text(sum2);
 		}
    	
    	
		// 차트 세팅
		  new Chart("paymentChartID", {
				  type: "bar",
				  data: {
				    labels: xValues,
				    datasets: [
		                { label: '총 매출', backgroundColor: "rgba(30, 144, 255, 1)", data: yValues }
		              , { label: 'Picktory 매출 (10%수수료)', backgroundColor: "rgba(24, 154, 155, 1)", borderColor:"red", data: yValuesTwo }
		    ]
				  },
				  options: {
				    legend: {display: true},
				    scales: {
				      yAxes: [{
				        ticks: {
				          beginAtZero: true
				        }
				      }],
				    }
				  }
				});
    }
  	
  


  
  
  	var choiceValue = "";
  	
    // 최근거래내역 정렬
    $('.searchId').on('click', function(){
    	choiceValue = $(this).attr('value');
    	paymentSearchAjax();
    });
    
    // 검색 클릭
    $('#searchClick').on('click', function(){
    	console.log("검색 클릭 클릭");
    	paymentSearchAjax();
    });
  
  
  	var ajaxData = "";
  
  
  	function paymentListAjax(){
  	
  	 	$.ajax({
  		 	url: localhost + '/paymentList.do',
  		    type: "POST",
  		    cache: false,
  	        dataType: "json",
  	        contentType: "application/json",
  	      	data: {
  	      		
  	      	},
  		    success: function(data){
  		    	
  		  		$('.tr_append').html('');
  		    	
  		    	ajaxData = data;
  		    	
  		    	paymentSetting();
  		    	
  		    }, error: function (request, status, error){
  		    	alert("Error");
  		    }
  		});
  	}
  	
  	
  	// 검색
  	function paymentSearchAjax(){
  		
  		var keyword =  $('#keyword').val();
  		
  		if(!keyword){
  			alert("검색 키워드를 입력해주세요");
  			return false;
  		}
  		
		var obj = {"keyword" : keyword};
  		
  	 	$.ajax({
  		 	url: localhost + '/paymentSearch.do',
  		    type: "POST",
  		    cache: false,
  	        dataType: "json",
  	        contentType: "application/json",
  	      	data : JSON.stringify(obj),
  		    success: function(data){

  		  		$('.tr_append').html('');
  		    	
  		    	ajaxData = data;
  		    	paymentSetting();
  		    	
  		    	
  		    }, error: function (request, status, error){
  		    	alert("Error");
  		    }
  		});
  	}
  	
  	
  	
  	function paymentSetting(){
  		
  		console.log("ajaxData : ", ajaxData);
  		
		if(ajaxData.length == 0){
			var paymentHTML = "";
			
			paymentHTML += '<tr>';
			paymentHTML += '<td class="text-center" colspan="12">최근 구매 / 판매 목록이 없습니다.</td>';
			paymentHTML += '<tr>';
			
			$('.tr_append').append(paymentHTML);
			return false;
		}  		

  			
  		for(var i = 0; i < ajaxData.length; i++){
  			var v = ajaxData[i];
  			
  			var paymentHTML = "";
  			
  			var payDate = v.paymentDate.substring(0, 10);
  			
  			var num = i + 1;
  			
  			paymentHTML += '<tr>';
  			paymentHTML += '<td class="text-center">'+ num +'</td>';
  		    paymentHTML += '<td class="text-center">'+ v.seller +'</a></td>';
  		    paymentHTML += '<td class="text-center">'+ v.consumer +'</a></td>';
  		    paymentHTML += '<td class="text-center">'+ v.paymentNo +'</td>';
  		    paymentHTML += '<td class="text-center"><a href="#">'+ v.pdNo +'</a></td>';
  		    paymentHTML += '<td class="text-center">'+ v.photoName +'</td>';
  		    paymentHTML += '<td class="text-center">'+ v.paymentTotal +'원</td>';
  		    paymentHTML += '<td class="text-center">'+ payDate +'</td>';
  		    paymentHTML += '</tr>';
        	$('.tr_append').append(paymentHTML);
  		}  		
  	}

</script>
</html>
 		