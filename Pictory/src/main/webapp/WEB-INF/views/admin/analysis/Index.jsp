<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Picktory-매출 통계 페이지 </title>
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
<li id="li-for-panel-1" class="memberClass">
<label class="panel-label"
      for="panel-1-ctrl">회원과 방문객 현황</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-2" class="salesClass">
<label class="panel-label"
      for="panel-2-ctrl">매출 현황</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-3" class="galleryClass">
<label class="panel-label"
      for="panel-3-ctrl">게시물 현황</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-4">
<label class="panel-label"
      for="panel-4-ctrl">회원 리스트 및 정보</label>
</li><!--INLINE-BLOCK FIX
--><!--INLINE-BLOCK FIX
-->

</ul>

<!--일일매출 시작-->
<article id="panels">
    <article class="container">
    <section id="panel-1" >
    <main>
        <div class="container-fluid pt-2 px-4">
            <div class="bg-light rounded p-4" >
                <div class="table-responsive">
                    <div class="bg-light rounded p-4">
                        <!--달력 시작-->
                        <div class="sec_cal">
                            <div class="cal_nav">
                              <a href="javascript:;" class="nav-btn go-prev">prev</a>
                              <div class="year-month" id="year-month"></div>
                              <a href="javascript:;" class="nav-btn go-next">next</a>
                            </div>
                            <div class="cal_wrap">
                              <div class="dates"></div>
                            </div>
                         </div>
                        <!--달력 끝-->
                        <!--일일매출차트 시작-->
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h3 class="mb-0">회원과 방문객 차트</h3>
                        </div>
                        <div class="div_chart1">
                    		<!-- <canvas id="earningDayChart" style="width: 100%; max: width 1104px;"></canvas> -->
                        </div>
                    
                <!--일일매출차트 끝-->   
                    </div>
                        <!--일일매출표 시작-->
                    <div class="col-sm-3 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">회원과 방문객 표</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr class="thID1">
                                  <!--     <th scope="col">일자</th>
                                        <th scope="col">1일</th>
                                        <th scope="col">2일</th>
                                        <th scope="col">3일</th>
                                        <th scope="col">4일</th>
                                        <th scope="col">5일</th>
                                        <th scope="col">6일</th>
                                        <th scope="col">7일</th>
                                        <th scope="col">8일</th>
                                        <th scope="col">9일</th>
                                        <th scope="col">10일</th> --> 
                                    </tr>
                                    <tr></tr>
                                </thead>
                                <tbody>
                                  <tr class="thID_1">
                                 <!--       <th scope="row">매출</th>
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
                                <tbody>
                                  <tr class="thID_1_1">
                                 <!--       <th scope="row">매출</th>
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
                                <thead>
                                    <tr class="thID2">
                                    <!--    <th scope="col">일자</th>
                                          <th scope="col">11일</th>
                                        <th scope="col">12일</th>
                                        <th scope="col">13일</th>
                                        <th scope="col">14일</th>
                                        <th scope="col">15일</th>
                                        <th scope="col">16일</th>
                                        <th scope="col">17일</th>
                                        <th scope="col">18일</th>
                                        <th scope="col">19일</th>
                                        <th scope="col">20일</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                      <tr class="thID_2">
                                <!--        <th scope="row">매출</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>
                                    </tr> -->
                                </tbody>
                                <tbody>
                                      <tr class="thID_2_1">
                                <!--        <th scope="row">매출</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>
                                    </tr> -->
                                </tbody>
                                <thead>
                                    <tr class="thID3">
                                      <!--  <th scope="col">일자</th>
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
                                      <tr class="thID_3">
                               <!--         <th scope="row">매출</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>
                                    </tr> -->
                                </tbody>
                                <tbody>
                                      <tr class="thID_3_1">
                               <!--         <th scope="row">매출</th>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>100</td>
                                        <td>200</td>
                                        <td>300</td>
                                        <td>300</td>
                                    </tr> -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--일일매출표 끝-->
                    <!--총 매출 합계 시작-->
                    <div class="col-sm-12 col-xl-5">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">현재 총 회원과 방문객 합계</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">현재 회원과 방문객 합계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">회원</th>
                                        <td id="total_all"></td>
                                    </tr>
                                     <tr>
                                        <th scope="row">방문객</th>
                                        <td id="total_all1"></td>
                                    </tr>
                                </tbody>
                            </table>
                    </div>
                     <!--총 매출 합계 끝-->
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
                                    <tr class="thID1">
                                    <!--<th scope="col">회원수</th>
                                        <th scope="col">1일</th>
                                        <th scope="col">2일</th>
                                        <th scope="col">3일</th>
                                        <th scope="col">4일</th>
                                        <th scope="col">5일</th>
                                        <th scope="col">6일</th>
                                        <th scope="col">7일</th>
                                        <th scope="col">8일</th>
                                        <th scope="col">9일</th>
                                        <th scope="col">10일</th>-->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="thID_1">
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
                                        <td>300</td> -->
                                    </tr>
                                </tbody>
                                <thead>
                                    <tr class="trID2">
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
                                    <tr class="thID_2">
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
                                    <tr class="thID3">
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
                                    <tr class="thID_3">
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
                            <h3 class="mb-4">현재 총 매출합계</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">현재 매출 합계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">매출</th>
                                        <td id="total_all"></td>
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
<!--달매출 시작-->
<section id="panel-3">
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
              </div>
              <!--달력 끝-->

                <!--월별 매출 차트 시작-->
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h3 class="mb-0">갤러리와 스토리 현황 차트</h3>
                </div>
                <div class="div_chart3">
                  <!-- <canvas id="earningMonthChart" style="width:100%; max: width 1104px;"></canvas> -->
                </div>

                
                 <!--월별 매출 차트 끝-->
            </div>
            <!--월별 매출 표 시작-->
            <div class="col-sm-12 col-xl-10">
                <div class="bg-light rounded h-100 p-4">
                    <h3 class="mb-4">갤러리와 스토리 현황 표</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">월별</th>
                                <th scope="col">1월</th>
                                <th scope="col">2월</th>
                                <th scope="col">3월</th>
                                <th scope="col">4월</th>
                                <th scope="col">5월</th>
                                <th scope="col">6월</th>
                                <th scope="col">7월</th>
                                <th scope="col">8월</th>
                                <th scope="col">9월</th>
                                <th scope="col">10월</th>
                                <th scope="col">11월</th>
                                <th scope="col">12월</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">매출</th>
                                <td>150</td>
                                <td>300</td>
                                <td>200</td>
                                <td>200</td>
                                <td>200</td>
                                <td>150</td>
                                <td>300</td>
                                <td>200</td>
                                <td>200</td>
                                <td>200</td>
                                <td>200</td>
                                <td>200</td>
                            </tr>
                        </tbody>
                    </table>
            </div>
             <!--월별 매출 표 끝-->
             <!--총 매출 합계 시작-->
<div class="col-sm-12 col-xl-7">
    <div class="bg-light rounded h-100 p-4">
        <h3 class="mb-4">현재 총 갤러리와 스토리 현황 합계</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">현재 갤러리와 스토리 현황 합계</th>
                </tr>
            </thead>
            <tbody>
              <tr>
                  <th scope="row">갤러리</th>
                  <td id="total_all"></td>
              </tr>
               <tr>
                  <th scope="row">스토리</th>
                  <td id="total_all1"></td>
              </tr>
          </tbody>
        </table>
</div>
 <!--총 매출 합계 끝-->
        </div>
        
        </div>
    </div>
</div>
</main>
</section>
<!--달 매출 끝-->

<section id="panel-4">
  <main>
<div class="container-fluid pt-4 px-4">
  <div class="bg-light  rounded p-4" >
      <div class="table-responsive">
          <div class="bg-light text-center rounded p-4">
              <!--월별 매출 차트 시작-->
              <div class="d-flex align-items-center justify-content-between mb-4">
                  <h3 class="mb-0">회원 리스트</h3>
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
                                <a class="dropdown-item" href="#">최신순</a>
                                <a class="dropdown-item" href="#">구매자 아이디</a>
                                <a class="dropdown-item" href="#">판매자 아이디</a>
                                <a class="dropdown-item-text" href="#">구매/판매 목록</a>
                            </div>
                        </div>
            
                           <!--search-->
                           <div>
                            <input type="text" placeholder="검색">
                            <button>검색</button>
                            </div>
                        <!--search-->
                    </div> 
          

            <!-- Sales Chart Start -->
            <table class="table table-hover text-center">
                <thead>
                    <tr class="table-secondary text-center">
                        <th>회원번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>주소</th>
                        <th>가입일</th>
                        <th>활동정지</th>
                    </tr>
                </thead>
                <tbody class="table-sm">
                
                <c:if test="${not isEmpty }">
                    <c:forEach var="record" items="${records}">
                        <tr>
                            <td>2</td>
                        <td><a href="memberOne.html">lee</a></td>
                        <td>이놈</td>
                        <td class="text-center">88-06-22</td>
                        <td class="text-center">여</td>
                        <td>(47545) 부산광역시 연제구 중앙대로 1001 부산광역시청 1층 민원실 </td>
                        <td class="text-center">21-12-29</td>
                        <td> <button type="button" class="btn btn-secondary  btn-sm">활동정지</button></td>	
                        </tr>
                    </c:forEach>
                </c:if>
    
    <!-- 회원리스트 예시 시작 -->
                    <tr>
                        <td>2</td>
                        <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">lee</a></td>
                        <td>이놈</td>
                        <td class="text-center">88-06-22</td>
                        <td class="text-center">여</td>
                        <td>(47545) 부산광역시 연제구 중앙대로 1001 부산광역시청 1층 민원실 </td>
                        <td class="text-center">21-12-29</td>
                        <td> <button type="button" class="btn btn-secondary  btn-sm">활동정지</button></td>
                    </tr>
                    <tr>
                       <td>3</td>
                        <td><a href="memberOne.html">jenom</a></td>
                        <td>저놈</td>
                        <td class="text-center"> 02-05-08 </td>
                        <td class="text-center">비공개</td>
                        <td>(03048) 서울특별시 종로구 청와대로 1 </td>
                        <td class="text-center">22-02-08 </td>
                        <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="memberOne.html">lee</a></td>
                        <td>이놈</td>
                        <td class="text-center">88-06-22</td>
                        <td class="text-center">여</td>
                        <td>(47545) 부산광역시 연제구 중앙대로 1001 부산광역시청 1층 민원실 </td>
                        <td class="text-center">21-12-29</td>
                        <td> <button type="button" class="btn btn-secondary  btn-sm">활동정지</button></td>
                    </tr>
                    <tr>
                       <td>3</td>
                        <td><a href="memberOne.html">jenom</a></td>
                        <td>저놈</td>
                        <td class="text-center"> 02-05-08 </td>
                        <td class="text-center">비공개</td>
                        <td>(03048) 서울특별시 종로구 청와대로 1 </td>
                        <td class="text-center">22-02-08 </td>
                        <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="memberOne.html">lee</a></td>
                        <td>이놈</td>
                        <td class="text-center">88-06-22</td>
                        <td class="text-center">여</td>
                        <td>(47545) 부산광역시 연제구 중앙대로 1001 부산광역시청 1층 민원실 </td>
                        <td class="text-center">21-12-29</td>
                        <td> <button type="button" class="btn btn-secondary  btn-sm">활동정지</button></td>
                    </tr>
                    <tr>
                       <td>3</td>
                        <td><a href="memberOne.html">jenom</a></td>
                        <td>저놈</td>
                        <td class="text-center"> 02-05-08 </td>
                        <td class="text-center">비공개</td>
                        <td>(03048) 서울특별시 종로구 청와대로 1 </td>
                        <td class="text-center">22-02-08 </td>
                        <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="memberOne.html">lee</a></td>
                        <td>이놈</td>
                        <td class="text-center">88-06-22</td>
                        <td class="text-center">여</td>
                        <td>(47545) 부산광역시 연제구 중앙대로 1001 부산광역시청 1층 민원실 </td>
                        <td class="text-center">21-12-29</td>
                        <td> <button type="button" class="btn btn-secondary  btn-sm">활동정지</button></td>
                    </tr>
                    <tr>
                       <td>3</td>
                        <td><a href="memberOne.html">jenom</a></td>
                        <td>저놈</td>
                        <td class="text-center"> 02-05-08 </td>
                        <td class="text-center">비공개</td>
                        <td>(03048) 서울특별시 종로구 청와대로 1 </td>
                        <td class="text-center">22-02-08 </td>
                        <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
                    </tr>
                    <!-- 회원리스트 예시 끝 -->
                </tbody>
            </table>
            <!-- Widgets End -->
            
        </div>
        
        <!-- 모달 -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">회원 상세내역</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div>
                
                
                <td class="col-1 align-top border-spacing; 30px;">
                    <img class="rounded-3 flex-shrink-0 " value="${param.userProfile }" alt="userProfile" style="width: 170px; height: 170px;">
                </td>
                	
              
                 <td class="col-8">
                   <div class="row mb-3">
                       <label for="userNo" class="col-3 col-form-label text-left">회원번호</label>
                       <div class="col-5">
                           <input value="${param.userNo }" readonly  type="text" class="form-control" name="userNO">
                       </div>
                   </div>
				</td>
				
			  
				<td>
                   <div class="row mb-3">
                       <label for="userId" class="col-3 col-form-label text-left">ID</label>
                       <div class="col-7">
                           <input value="${param.userId }" readonly  type="text" class="form-control" name="userId">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userPassword" class="col-3 col-form-label text-left">비밀번호</label>
                       <div class="col-7">
                           <input value="${param.userPassword }" readonly type="text" class="form-control" name="userPassword">
                       </div>
                   </div>
				</td>
			
				<td>
                   <div class="row mb-3">
                       <label for="userEmail" class="col-3 col-form-label text-left">이메일</label>
                       <div class="col-7">
                           <input value="${param.userEmail }" readonly type="text" class="form-control" name="userEmail">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userName" class="col-3 col-form-label text-left">이름</label>
                       <div class="col-7">
                           <input value="${param.userName }" readonly type="text" class="form-control" name="userName">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userNickname" class="col-3 col-form-label text-left">닉네임</label>
                       <div class="col-7">
                           <input value="${param.userNickname }" readonly type="text" class="form-control" name="userNickname">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userSelf" class="col-3 col-form-label text-left">자기소개</label>
                       <div class="col-7">
                           <input value="${param.userFwer }" readonly type="text" class="form-control" name="userFwer">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFing" class="col-3 col-form-label text-left">팔로잉 수</label>
                       <div class="col-7">
                           <input value="${param.userFing }" readonly type="text" class="form-control" name="userFing">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFwer" class="col-3 col-form-label text-left">팔로워 수</label>
                       <div class="col-7">
                           <input value="${param.userFwer }" readonly type="text" class="form-control" name="userFwer">
                       </div>
                   </div>
                </td>
				
            </div> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary right" >확인</button>
        </div>
      </div>
    </div>
  </div>
  
</main>
</section>
</article>
<!-- Chart End -->

<!-- Footer Start -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light rounded-top p-4">
        <div class="row">
            <div class="col-12 col-sm-6 text-center text-sm-start">
                &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
            </div>
            <div class="col-12 col-sm-6 text-center text-sm-end">
                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                Designed By <a href="https://htmlcodex.com">HTML Codex</a>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
</div>
<!-- Content End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>


<script>

var monthDay = '';
var dataText = "";
var bbcc = "";
var currentYear = "";
var currentMonth = "";
var thisMonth = "";
var monthText = "";

var tabText = "회원";


var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

  //달력
  $(document).ready(function() {
      calendarInit();
  });

  //Sidebar Toggler
  $('.sidebar-toggler').click(function () {
      $('.sidebar, .content').toggleClass("open");
      return false;
  });

  //차트
  function calendarInit(){
    // 날짜 정보 가져오기
    // var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    // var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    // var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    // var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
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


    var xValues = [];
    var yValues = [];
    var monthArr = [];


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

    var objSetting = "";

    if(tabText == "회원"){

      // 기존 캔버스 삭제
    $('.div_chart1').find('canvas').remove();
        // 새로 다시 그림
    $('.div_chart1').append('<canvas id="memberDayChart" style="width: 100%; max: width 1104px;"></canvas>');
      bbcc = "memberDayChart";
      
    }else if(tabText == "매출"){

      // 기존 캔버스 삭제
    $('.div_chart2').find('canvas').remove();

    // 새로 다시 그림
    $('.div_chart2').append('<canvas id="salseChartID" style="width: 100%; max: width 1104px;"></canvas>');
    bbcc = "salseChartID";

    }else if(tabText == "게시물"){
    // 기존 캔버스 삭제
    $('.div_chart3').find('canvas').remove();

    // 새로 다시 그림
    $('.div_chart3').append('<canvas id="galleryChartID" style="width: 100%; max: width 1104px;"></canvas>');
      bbcc = "galleryChartID";
    }

      var yValuesTwo = [];

      for(var i = 1; i <= monthArr.length; i++){
          var randomNumber = Math.floor( Math.random() * 5 + 2);
          var randomNumber1 = Math.floor( Math.random() * 3 + 2);
          xValues.push(i + "일");
          yValues.push(randomNumber);
          
          if(tabText != "매출"){
            yValuesTwo.push(randomNumber1);
          }
      }

   
      

  // 차트 세팅
      if(tabText == "회원" || tabText == "게시물"){

        new Chart(bbcc, {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [
                     { backgroundColor: "rgba(30, 144, 255, 1)", data: yValues }
                    ,{ backgroundColor: "rgba(24, 154, 155, 1)", borderColor:"red", data: yValuesTwo }
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


    }else if(tabText == "매출"){

      new Chart(bbcc, {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{ backgroundColor: "rgba(30, 144, 255, 1)", data: yValues }]
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
      
  } // CALENDAR INIT FN END

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
  // 회원과 방문객 현황
  
  $('.memberClass').on('click', function(){
        monthText = "";
        tabText = "회원";
        calendarInit();
    });

  // 매출 현황
    $('.salesClass').on('click', function(){
        monthText = "";
        tabText = "매출";
        calendarInit();
    });

  //갤러리 현황
    $('.galleryClass').on('click', function(){
          monthText = "";
          tabText = "게시물";
          calendarInit();
    });  

//=========================================================================


// function calendarInit() {

// // 날짜 정보 가져오기
// var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
// var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
// var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
// var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

// var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
// // 달력에서 표기하는 날짜 객체


// var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
// var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
// var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

// // kst 기준 현재시간
// // console.log(thisMonth);

// // 캘린더 렌더링
// renderCalender(thisMonth);

// function renderCalender(thisMonth) {

//   var aaArr = [];
//   var now = new Date();
//   var month_now = now.getMonth()+1
//   var year_now = now.getFullYear();

//     // 렌더링을 위한 데이터 정리
//     currentYear = thisMonth.getFullYear();
//     currentMonth = thisMonth.getMonth();
//     currentDate = thisMonth.getDate();
    
//     // 이전 달의 마지막 날 날짜와 요일 구하기
//     var startDay = new Date(currentYear, currentMonth, 0);
//     var prevDate = startDay.getDate();
//     var prevDay = startDay.getDay();

//     // 이번 달의 마지막날 날짜와 요일 구하기
//     var endDay = new Date(currentYear, currentMonth + 1, 0);
//     var nextDate = endDay.getDate();
//     var nextDay = endDay.getDay();

//     // console.log(prevDate, prevDay, nextDate, nextDay);

//     if(month_now == currentMonth + 1 && currentYear == year_now){
//       $('.go-next').hide();
//     }else{
//       $('.go-next').show();
//     }
    
//     // 현재 월 표기
//     $('.year-month').text(currentYear + '.' + (currentMonth + 1));

//     // 렌더링 html 요소 생성
//     calendar = document.querySelector('.dates')
//     calendar.innerHTML = '';
//     $(".dates").hide();
//     // 지난달
//     for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
//         calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
//     }
//     // 이번달
//     for (var i = 1; i <= nextDate; i++) {
//         calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>';
        
//         aaArr.push(i);
//     }

//         if(dataText == "매출"){
//           salseFn(aaArr.length);
//         }else{
//           memberInfoFn(aaArr.length);      
//         }
    
    
      
    
//     // 다음달
//     for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {        	
//         calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
//     }

//     // 오늘 날짜 표기
//     if (today.getMonth() == currentMonth) {
//         todayDate = today.getDate();
//         var currentMonthDate = document.querySelectorAll('.dates .current');
//         currentMonthDate[todayDate -1].classList.add('today');
//     }
// }

// // 이전달로 이동
// $('.go-prev').on('click', function() {
//     monthDay = '';
//     thisMonth = new Date(currentYear, currentMonth - 1, 1);
//     renderCalender(thisMonth);

//     if(dataText == "매출"){
//         salseFn($('.current').length);
//       }else{
//         memberInfoFn($('.current').length);
//       }
// });

// // 다음달로 이동
// $('.go-next').on('click', function() {
//     thisMonth = new Date(currentYear, currentMonth + 1, 1);
//     renderCalender(thisMonth);
//     if(dataText == "매출"){
//         salseFn($('.current').length);
//       }else{
//         memberInfoFn($('.current').length);
//       }
//   });
// }

// // 매출
// $('.salesClass').on('click', function(){
//       console.log('매출 클릭 확인');
//       dataText = "매출";
//       calendarInit();
// });

// // 게시물
// $('.galleryClass').on('click', function(){
//       console.log('게시물 클릭 확인');
//       dataText = "게시물";
//       calendarInit();
// });

// /*
//     달력 렌더링 할 때 필요한 정보 목록 

//     현재 월(초기값 : 현재 시간)
//     금월 마지막일 날짜와 요일
//     전월 마지막일 날짜와 요일
// */




// //============================================================================

// // },{
// // 			      backgroundColor: "rgba(24, 154, 155, 1)",
// // 			      borderColor:"red",
// // 				    data: yValues1


//   //매출
//   function salseFn(monthDay){
//     console.log('매출FN 확인');
//     var toArr = [];
// 		var yArr = [];
// 		var yArr1 = [];
		
// 		$('.thID1').html('');
// 		$('.thID2').html('');
// 		$('.thID3').html('');
		
// 		$('.thID_1').html('');
// 		$('.thID_2').html('');
// 		$('.thID_3').html('');
		
// 		$('.thID_1_1').html('');
// 		$('.thID_2_1').html('');
// 		$('.thID_3_1').html('');
		
// 		$('.thID1').append('<th scope="col">일자</th>');
// 		$('.thID2').append('<th scope="col">일자</th>');
// 		$('.thID3').append('<th scope="col">일자</th>');
// 		$('.thID_1').append('<th scope="col">회원</th>');
// 		$('.thID_2').append('<th scope="col">회원</th>');
// 		$('.thID_3').append('<th scope="col">회원</th>');
// 		$('.thID_1_1').append('<th scope="col">방문객</th>');
// 		$('.thID_2_1').append('<th scope="col">방문객</th>');
// 		$('.thID_3_1').append('<th scope="col">방문객</th>');
		
		
// 		for(var i = 1; i <= monthDay; i++){	
			
// 			var mm = Math.floor( Math.random() * 5 + 2);
// 			var zz = Math.floor( Math.random() * 5 + 5);
		
// 			if(i <= 10){
// 				$('.thID1').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_1').append('<td>'+ mm +'</td>');
// 				$('.thID_1_1').append('<td>'+ zz +'</td>');
				
// 			}	
// 			if( i > 10 && i <= 20){
// 				$('.thID2').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_2').append('<td>'+ mm +'</td>');
// 				$('.thID_2_1').append('<td>'+ zz +'</td>');
// 			}
			
// 			if( i > 20){
// 				$('.thID3').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_3').append('<td>'+ mm +'</td>');
// 				$('.thID_3_1').append('<td>'+ zz +'</td>');
// 			}
			
// 			var bb = i + "일";
// 			toArr.push(bb);
// 			yArr.push(mm);
// 			yArr1.push(zz);
// 		}
		
// 		let sum = 0;
// 		let sum1 = 0;

// 		for (let i = 0; i < yArr.length; i++) {
// 		    sum += yArr[i];
// 		}
		
// 		$('#total_all').text(sum);
		
// 		for (let i = 0; i < yArr1.length; i++) {
// 		    sum1 += yArr1[i];
// 		}
		
// 		$('#total_all1').text(sum1);
		
// 		var xValues = toArr;
// 	    var yValues = yArr;
// 	    var yValues1 = yArr1;

//             		// 기존 캔버스 삭제
// 		 $('#memberDayChart').remove();
//         // 새로 다시 그림
//         $('#div_memberDayChart').append('<canvas id="memberDayChart" style="width: 100%; max: width 1104px;"></canvas>');
//         bbcc = "memberDayChart";

//         new Chart(bbcc, {
// 			  type: "bar",
// 			  data: {
// 			    labels: xValues,
// 			    datasets: [{
// 			      backgroundColor: "rgba(30, 144, 255, 1)",
// 			      data: yValues
// 			    }]
// 			  },
// 			  options: {
// 			    legend: {display: true},
// 			    scales: {
// 			      yAxes: [{
// 			        ticks: {
// 			          beginAtZero: true
// 			        }
// 			      }],
// 			    }
// 			  }
// 			});
//   }

  
//   //회원
// 	function memberInfoFn(monthDay){

//       if(dataText == '게시물'){
//         // 기존 캔버스 삭제
//         $('#earningMonthChart').remove();
//         // 새로 다시 그림
//         $('#div_gallery').append('<canvas id="earningMonthChart" style="width: 100%; max: width 1104px;"></canvas>');
//         bbcc = "earningMonthChart";

//       }else{
//         // 기존 캔버스 삭제
//         $('#earningDayChart').remove();
//         // 새로 다시 그림
//         $('#div_earningDayChart').append('<canvas id="earningDayChart" style="width: 100%; max: width 1104px;"></canvas>');
//         bbcc = "earningDayChart";
//     }
		

		
// 		var toArr = [];
// 		var yArr = [];
// 		var yArr1 = [];
		
// 		$('.thID1').html('');
// 		$('.thID2').html('');
// 		$('.thID3').html('');
		
// 		$('.thID_1').html('');
// 		$('.thID_2').html('');
// 		$('.thID_3').html('');
		
// 		$('.thID_1_1').html('');
// 		$('.thID_2_1').html('');
// 		$('.thID_3_1').html('');
		
// 		$('.thID1').append('<th scope="col">일자</th>');
// 		$('.thID2').append('<th scope="col">일자</th>');
// 		$('.thID3').append('<th scope="col">일자</th>');
// 		$('.thID_1').append('<th scope="col">회원</th>');
// 		$('.thID_2').append('<th scope="col">회원</th>');
// 		$('.thID_3').append('<th scope="col">회원</th>');
// 		$('.thID_1_1').append('<th scope="col">방문객</th>');
// 		$('.thID_2_1').append('<th scope="col">방문객</th>');
// 		$('.thID_3_1').append('<th scope="col">방문객</th>');
		
		
// 		for(var i = 1; i <= monthDay; i++){	
			
// 			var mm = Math.floor( Math.random() * 5 + 2);
// 			var zz = Math.floor( Math.random() * 5 + 5);
		
// 			if(i <= 10){
// 				$('.thID1').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_1').append('<td>'+ mm +'</td>');
// 				$('.thID_1_1').append('<td>'+ zz +'</td>');
				
// 			}	
// 			if( i > 10 && i <= 20){
// 				$('.thID2').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_2').append('<td>'+ mm +'</td>');
// 				$('.thID_2_1').append('<td>'+ zz +'</td>');
// 			}
			
// 			if( i > 20){
// 				$('.thID3').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_3').append('<td>'+ mm +'</td>');
// 				$('.thID_3_1').append('<td>'+ zz +'</td>');
// 			}
			
// 			var bb = i + "일";
// 			toArr.push(bb);
// 			yArr.push(mm);
// 			yArr1.push(zz);
// 		}
		
// 		let sum = 0;
// 		let sum1 = 0;

// 		for (let i = 0; i < yArr.length; i++) {
// 		    sum += yArr[i];
// 		}
		
// 		$('#total_all').text(sum);
		
// 		for (let i = 0; i < yArr1.length; i++) {
// 		    sum1 += yArr1[i];
// 		}
		
// 		$('#total_all1').text(sum1);
		
// 		var xValues = toArr;
// 	    var yValues = yArr;
// 	    var yValues1 = yArr1;
	    
// 		var barColors = [
		 
// 		];

// 		new Chart(bbcc, {
// 			  type: "bar",
// 			  data: {
// 			    labels: xValues,
// 			    datasets: [{
// 			      backgroundColor: "rgba(30, 144, 255, 1)",
// 			      data: yValues
			
// 			    },{
// 			      backgroundColor: "rgba(24, 154, 155, 1)",
// 			      borderColor:"red",
// 				  data: yValues1
				
// 			    }]
// 			  },
// 			  options: {
// 			    legend: {display: true},
// 			    scales: {
// 			      yAxes: [{
// 			        ticks: {
// 			          beginAtZero: true
// 			        }
// 			      }],
// 			    }
// 			  }
// 			});	
// 	}

</script>

<script>
//일일별 매출
//var xValues = ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일", "15일",
//    "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일", "26일", "27일", "28일", "29일", "30일", "31일"];
//var yValues = [150, 300, 550, 650, 600, 800, 950, 1200, 800, 300, 260, 790, 430, 460, 760, 320, 210, 970, 230, 760, 320, 
//	210, 970, 230,760, 320, 210, 970, 230, 210, 970];
//var barColors = [
 
//];

//new Chart("earningDayChart", {
//	  type: "bar",
//	  data: {
//	    labels: xValues,
//	    datasets: [{
//	      backgroundColor: "rgba(30, 144, 255, 1)",
//	      data: yValues
//	    }]
//	  },
//	  options: {
//	    legend: {display: false},
//	    scales: {
//	      yAxes: [{
//	        ticks: {
//	          beginAtZero: true
//	        }
//	      }],
//	    }
//	  }
//	});
</script>

<script>
//주차별 매출
// function zz(monthDay){
		
// 		// 기존 캔버스 삭제
// 		 $('#memberDayChart').remove();
// 		// 새로 다시 그림
// 		 $('#div_memberDayChart').append('<canvas id="memberDayChart" style="width: 100%; max: width 1104px;"></canvas>');
		
// 		var toArr = [];
// 		var yArr = [];
	
		
// 		$('.thID1').html('');
// 		$('.thID2').html('');
// 		$('.thID3').html('');
		
// 		$('.thID_1').html('');
// 		$('.thID_2').html('');
// 		$('.thID_3').html('');
	
		
// 		$('.thID1').append('<th scope="col">일자</th>');
// 		$('.thID2').append('<th scope="col">일자</th>');
// 		$('.thID3').append('<th scope="col">일자</th>');
// 		$('.thID_1').append('<th scope="col">회원</th>');
// 		$('.thID_2').append('<th scope="col">회원</th>');
// 		$('.thID_3').append('<th scope="col">회원</th>');
		
		
		
// 		for(var i = 1; i <= monthDay; i++){	
			
// 			var mm = Math.floor( Math.random() * 5 + 2);
			
		
// 			if(i <= 10){
// 				$('.thID1').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_1').append('<td>'+ mm +'</td>');
		
				
// 			}	
// 			if( i > 10 && i <= 20){
// 				$('.thID2').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_2').append('<td>'+ mm +'</td>');
		
// 			}
			
// 			if( i > 20){
// 				$('.thID3').append('<th scope="col">'+ i +'일</th>');
// 				$('.thID_3').append('<td>'+ mm +'</td>');
		
// 			}
			
// 			var bb = i + "일";
// 			toArr.push(bb);
// 			yArr.push(mm);
	
// 		}
		
// 		let sum = 0;


// 		for (let i = 0; i < yArr.length; i++) {
// 		    sum += yArr[i];
// 		}
		
// 		$('#total_all').text(sum);
		
		
// 		var xValues = toArr;
// 	    var yValues = yArr;
	 
	    
// 		var barColors = [
		 
// 		];

// 		new Chart("memberDayChart", {
// 			  type: "bar",
// 			  data: {
// 			    labels: xValues,
// 			    datasets: [{
// 			      backgroundColor: "rgba(30, 144, 255, 1)",
// 			      data: yValues
			
// 			    }]
// 			  },
// 			  options: {
// 			    legend: {display: false},
// 			    scales: {
// 			      yAxes: [{
// 			        ticks: {
// 			          beginAtZero: true
// 			        }
// 			      }],
// 			    }
// 			  }
// 			});
		
// 	}
</script>

<!-- <script>
	function queryVisit(by) {
		console.log(by.value);
		$.ajax({
			type: "GET",
			url: "<c:url value="/admin/analysis/VisitSummary.do"/>" + "?by=" + by.value,
			dataType: "json",
			data : {
		//obj 방식으로 쓴다 (키 : 밸류)
			},
			success : (data) => {
				document.querySelector("#status").innerHTML =  data.visitData;
			}
		});
	}
</script> -->
</html>
 		