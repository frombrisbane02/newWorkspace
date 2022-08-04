<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>관리자-통계 및 회원관리</title>
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

<!--================================================= Sidebar 시작 ============================================================-->
		
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">
				<a href="/springapp/index.do" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-hashtag me-2"></i>PICTORY
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
						<h6 class="mb-0">${sessionScope.userId}</h6>
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
		
<!--================================================= Sidebar 끝 ============================================================-->

		<div class="content">

<!--=================================================  Navbar 시작 =================================================  -->
			
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
							class="d-none d-lg-inline-flex">${sessionScope.userId}</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="${pageContext.request.contextPath}/admin/manager/MemberOne.do" class="dropdown-item">내 정보</a>
                            <a href="${pageContext.request.contextPath}/admin/Login.do" class="dropdown-item">로그아웃</a>
						</div>
					</div>
				</div>
			</nav>
			
<!--=================================================  Navbar 끝 =================================================  -->
            
            <div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-line fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">
									이번 주 PICTORY 매출
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
									총 PICTORY 매출
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
								<h6 class="mb-0 text-right" id="weekUser">0명</h6>
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
			
<!--=================================================  Navbar 끝 =================================================  -->
			
<!--================================================= 탭 컨트롤러 시작 =================================================-->

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

<!--================================================= 탭 컨트롤러 끝 =================================================-->

<!--================================================= 탭 리스트 시작 =================================================-->

<ul id="tabs-list" class="bg-light">
<!-- MENU TOGGLE -->
<label id="open-nav-label" for="nav-ctrl"></label>
<li id="li-for-panel-1" class="memberClass" data-test="1">
<label class="panel-label"
      for="panel-1-ctrl">회원 현황</label>
</li><!--INLINE-BLOCK FIX
--> <!--   <li id="li-for-panel-2" class="salesClass" data-test="2">
<label class="panel-label"
      for="panel-2-ctrl">매출 현황</label>	-->
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-3" class="galleryClass" data-test="3">
<label class="panel-label"
      for="panel-3-ctrl">게시물 현황</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-4" class="userClass" data-test="4">
<label class="panel-label"
      for="panel-4-ctrl">회원 리스트 및 정보</label>
</li><!--INLINE-BLOCK FIX
--><!--INLINE-BLOCK FIX
-->
</ul>

<!--================================================= 탭 리스트 끝 =================================================-->

<!--================================================= 회원과 방문객 현황 시작 =================================================-->

<article id="panels">
    <article class="container">
    <section id="panel-1" >
    <main>
        <div class="container-fluid pt-2 px-4">
            <div class="bg-light rounded p-4" >
                <div class="table-responsive">
                    <div class="bg-light rounded p-4">
                    
                        <!--======================== 달력 시작 ==========================-->
                        
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
                         
                        <!--=============================달력 끝 ============================-->
                       
                        <!--======================== 회원과 방문객 현황 차트 시작=============================-->
                        
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h3 class="mb-0">회원일별 차트</h3>
                        </div>
                        <div class="div_chart1">
                    		<!-- <canvas id="earningDayChart" style="width: 100%; max: width 1104px;"></canvas> -->
                        </div>
                    
                 <!--======================== 회원과 방문객 현황 차트 끝=============================-->
                 
                    </div>
                    
                        <!--==================== 회원과 방문객 현황 표 시작 =========================-->
                        
                    <div class="col-sm-3 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">회원 표</h3>
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
                    
                    <!--==================== 회원과 방문객 현황 표 시작 =========================-->
                    
                    <!--====================== 총 회원과 방문객 현황 합계 시작 =========================-->
                    
                    <div class="col-sm-12 col-xl-5">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">총 회원일별 합계</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">회원 합계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">회원</th>
                                        <td id="total_all"></td>
                                    </tr>
                                   <!--    <tr>
                                        <th scope="row">방문객</th>
                                        <td id="total_all1"></td>
                                    </tr>	-->
                                </tbody>
                            </table>
                    </div>
                    
                     <!--====================== 총 회원과 방문객 현황 합계 끝 =========================-->
                     
                </div>

                </div>
            </div>
        </div>
    </main>
    </section>
    
<!--================================================= 회원과 방문객 현황 끝 =================================================-->

<!--================================================= 매출 현황 시작 =================================================-->

<section id="panel-2">
    <main>
<div class="container-fluid pt-4 px-4">
    <div class="bg-light  rounded p-4">
        <div class="table-responsive">
            <div class="bg-light text-center rounded p-4">
            
                <!--======================== 달력 시작 ==========================-->
                
                <div class="sec_cal">
                    <div class="cal_nav">
                      <a href="javascript:;" class="nav-btn go-prev">prev</a>
                      <div class="year-month"></div>
                      <a href="javascript:;" class="nav-btn go-next">next</a>
                    </div>
                </div>
                
                <!--=============================달력 끝 ============================-->
                
                <!--=========================== 매출현황 차트 시작 ========================-->
                
                <div class="d-flex align-items-center justify-content-between mb-4">
                            <h3 class="mb-0">매출 차트</h3>
                </div>
                <div class="div_chart2">
                    <!-- <canvas id="memberDayChart" style="width: 100%; max: width 1104px;"></canvas> -->
                </div>
                
                <!--========================== 매출현황 차트 끝 =================================-->
           
            </div>
            
            <!-- =============================매출현황 표 시작 ================================-->
            
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
                    
                    <!-- =============================매출현황 표 끝 ================================-->
                    
                    <!--=========================== 총 매출현황 합계 시작 =============================-->
                    
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
                    
                     <!--=========================== 총 매출현황 합계 끝 ========================-->
                     
        </div>
    </div>
</div>
</main>
</section>

<!--================================================= 매출 현황 끝 =================================================-->

<!--================================================= 갤러리와 스토리 현황 시작 =================================================-->

<section id="panel-3">
    <main>
<div class="container-fluid pt-4 px-4">
    <div class="bg-light  rounded p-4">
        <div class="table-responsive">
            <div class="bg-light text-center rounded p-4">
                
                <!--============================ 달력 시작 ======================-->
                
                <div class="sec_cal">
                  <div class="cal_nav">
                    <a href="javascript:;" class="nav-btn go-prev">prev</a>
                    <div class="year-month"></div>
                    <a href="javascript:;" class="nav-btn go-next">next</a>
                  </div>
              </div>
              
              <!--========================= 달력 끝 ============================-->
              
              <!--========================== 갤러리와 스토리 현황 차트 시작 ========================-->

                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h3 class="mb-0">갤러리와 스토리 현황 차트</h3>
                </div>
                <div class="div_chart3">
                  <!-- <canvas id="earningMonthChart" style="width:100%; max: width 1104px;"></canvas> -->
                </div>

                <!--========================== 갤러리와 스토리 현황 차트 끝 ========================-->
                
            </div>
            
            <!--========================== 갤러리와 스토리 현황 표 시작 ============================-->
            
            <div class="col-sm-12 col-xl-12">
				<div class="col-sm-10 col-xl-10">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">일별 스토리/갤러리 수 표</h3>
                            <table class="table table-hover">
                                <thead>
                                      <tr class="galleryDateTr1 GSRemove">
                                 <!--       <th scope="col">일자</th>
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
                                    <tr class="galleryCount1 GSRemove">
                                    <!--    <th scope="row">갤러리 수</th>
                                    <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>	-->
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="storyCount1 GSRemove">
                                   <!--     <th scope="row">스토리 수</th>
                                          <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>	-->
                                    </tr>
                                </tbody>
                                <thead>
                                      <tr class="galleryDateTr2 GSRemove">
                                 <!--       <th scope="col">일자</th>
                                        <th scope="col">11일</th>
                                        <th scope="col">12일</th>
                                        <th scope="col">13일</th>
                                        <th scope="col">14일</th>
                                        <th scope="col">15일</th>
                                        <th scope="col">16일</th>
                                        <th scope="col">17일</th>
                                        <th scope="col">18일</th>
                                        <th scope="col">19일</th>
                                        <th scope="col">20일</th>	-->
                                    </tr>	
                                </thead>
                                <tbody>
                                    <tr class="galleryCount2 GSRemove">
                                    <!--    <th scope="row">갤러리 수</th>
                                          <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>	-->
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="storyCount2 GSRemove">
                                    <!--    <th scope="row">스토리 수</th>
                                          <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>	-->
                                    </tr>
                                </tbody>
                                <thead>
                                      <tr class="galleryDateTr3 GSRemove">
                                 <!--     <th scope="col">일자</th>
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
                                    <tr class="galleryCount3 GSRemove">
                                   <!--     <th scope="row">갤러리 수</th>
                                          <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>	-->
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="storyCount3 GSRemove">
                                  <!--      <th scope="row">스토리 수</th>
                                          <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>	-->
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div> <!-- 표 END -->
            
            
            
             <!--     <div class="bg-light rounded h-100 p-4">
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
                                <th scope="row">갤러리</th>
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
                            
                            <tr>
                                <th scope="row">스토리</th>
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
            </div>	-->
            
            <!--========================== 갤러리와 스토리 현황 표 시작 ============================-->
            
             <!--========================== 총 갤러리와 스토리 현황 합계 시작 =========================-->
             
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
						                  <td id="galleryTotal"></td>
						              </tr>
						               <tr>
						                  <th scope="row">스토리</th>
						                  <td id="storyTotal"></td>
						              </tr>
						          </tbody>
						        </table>
						</div>
						
					<!--========================== 총 갤러리와 스토리 현황 합계 끝 =========================-->
        
        	</div>
        </div>
    </div>
</div>
</main>
</section>

<!--================================================= 갤러리와 스토리 현황 끝 =================================================-->

<!--================================================= 회원 리스트 현황 시작 =================================================-->

<section id="panel-4">
  <main>
<div class="container-fluid pt-4 px-4">
  <div class="bg-light  rounded p-4" >
      <div class="table-responsive">
          <div class="bg-light text-center rounded p-4">
          
              
              
              <div class="d-flex align-items-center justify-content-between mb-4">
                  <h3 class="mb-0">회원 리스트</h3>
              </div>
              <div class="container-fluid pt-4 px-4">
                <div class="bg-light  rounded p-4">
                    <div class="searchbox" style="margin-top:10px; margin-bottom:10px;">
                    
                        <!--============== 정렬 (가입일순 / 생년월일 / 주소(시) / ) 시작 ==================-->
                        
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
                        
                        <!--============== 정렬 (가입일순 / 생년월일 / 주소(시) / ) 끝 ==================-->
            
                           <!--================= 검색 시작 =====================-->
                           
                           <div>
                            <input type="text" id="keyword" placeholder="검색">
                            <button type="button" id="searchClick">검색</button>
                            </div>
                            
                      <!--================= 검색 끝 =====================-->
                      
                    </div> 
          
          <!--=========================== 회원 리스트 표 시작 =======================-->
            <table class="table table-hover text-center">
                <thead>
                    <tr class="table-secondary">
						<th class="col-1 text-center">회원 번호</th>
			            <th class="col-2 text-center">아이디</th>
			            <th class="col-2 text-center">비밀번호</th>
			            <th class="col-2 text-center">이메일</th>
			            <th class="col-1 text-center">이름</th>
			            <th class="col-2 text-center">닉네임</th>
			            <th class="col-3 text-center">활동 정지</th>
					</tr>
                </thead>
                <tbody class="table-sm" id="userListAppend">
               <!--   <c:if test="${empty records }" var="isEmpty">
						<tr>
							<td class="text-center" colspan="6">등록된 글이 없습니다.</td>
						</tr>	
				</c:if>
                <c:if test="${not isEmpty }">
                    <c:forEach var="record" items="${records}">
                        <tr>
		                  <td class="text-center">${records.userNo }</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">${records.userId }</a></td>
		                  <td class="text-center">${records.userPassword }</a></td>
		                  <td class="text-center">${records.userEmail }</a></td>
		                  <td class="text-center">${records.userName }</td>
		                  <td class="text-center">${records.userNickname }</td>
		                  <td class="text-center">${records.enabled }</td>
		                </tr>
                    </c:forEach>
                </c:if>	-->
    
    				<!--========================= 회원리스트 예시 시작 ====================-->
    				
            <!--          	<tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">활동정지</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>
                    <tr>
		                  <td class="text-center">1</td>
		                  <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">ADMIN</a></td>
		                  <td class="text-center">1234</a></td>
		                  <td class="text-center">abcd@efgh.com</a></td>
		                  <td class="text-center">안모</td>
		                  <td class="text-center">pictory</td>
		                  <td class="text-center"> <button type="button" class="btn btn-secondary  btn-sm ">복원</button></td>
		                </tr>	-->
		                
                    <!--========================= 회원리스트 예시 끝 =========================-->
                    
                </tbody>
            </table>
            
            <ul id="dyn_ul" class="pagination" style="justify-content: center;">
		<!--  	  <li class="page-item disabled"><a class="page-link pagination-link" "prev"="">Previous</a></li>
			  <li class="page-item active"><a class="page-link pagination-link">1</a></li>
			  <li class="page-item"><a class="page-link pagination-link">2</a></li>
			  <li class="page-item"><a class="page-link" "next"="">Next</a></li>	-->
		   </ul>
            
             <!--=========================== 회원 리스트 표 끝 =======================-->
            
        </div>
        
        <!--================================== 모달 회원 리스트 시작 =========================-->
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
            <div id="modalfaqUserInfo">
                
                
                <td class="col-1 align-top border-spacing; 30px;">
                    <img class="rounded-3 flex-shrink-0 modal0" value="${records.userProfile }" alt="userProfile" style="width: 170px; height: 170px;">
                </td>
                	
              
                 <td class="col-8">
                   <div class="row mb-3">
                       <label for="userNo" class="col-3 col-form-label text-left">회원번호</label>
                       <div class="col-5">
                           <input value="${records.userNo }" readonly  type="text" class="form-control modal1" name="userNO">
                       </div>
                   </div>
				</td>
				
			  
				<td>
                   <div class="row mb-3">
                       <label for="userId" class="col-3 col-form-label text-left">ID</label>
                       <div class="col-7">
                           <input value="${records.userId }" readonly  type="text" class="form-control modal2" name="userId">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userPassword" class="col-3 col-form-label text-left">비밀번호</label>
                       <div class="col-7">
                           <input value="${records.userPassword }" readonly type="text" class="form-control modal3" name="userPassword">
                       </div>
                   </div>
				</td>
			
				<td>
                   <div class="row mb-3">
                       <label for="userEmail" class="col-3 col-form-label text-left">이메일</label>
                       <div class="col-7">
                           <input value="${records.userEmail }" readonly type="text" class="form-control modal4" name="userEmail">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userName" class="col-3 col-form-label text-left">이름</label>
                       <div class="col-7">
                           <input value="${records.userName }" readonly type="text" class="form-control modal5" name="userName">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userNickname" class="col-3 col-form-label text-left">닉네임</label>
                       <div class="col-7">
                           <input value="${records.userNickname }" readonly type="text" class="form-control modal6" name="userNickname">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userSelf" class="col-3 col-form-label text-left">자기소개</label>
                       <div class="col-7">
                           <input value="${records.userFwer }" readonly type="text" class="form-control modal7" name="userFwer">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFing" class="col-3 col-form-label text-left">팔로잉 수</label>
                       <div class="col-7">
                           <input value="${records.userFing }" readonly type="text" class="form-control modal8" name="userFing">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFwer" class="col-3 col-form-label text-left">팔로워 수</label>
                       <div class="col-7">
                           <input value="${records.userFwer }" readonly type="text" class="form-control modal9" name="userFwer">
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
  
  <!--================================== 모달 회원 리스트 끝 =========================-->

</main>
</section>

<!--================================================= 회원 리스트 현황 끝 =================================================-->

</article>
<!-- Chart End -->


</div>
<!-- Content End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>

<!--===================================== 스크립트 시작 =============================-->

<script>

const localhost = 'http://localhost:4040/springapp/admin';
var urlChange = '/userChart.do';
var ppp = 10;
var page = 1;


var monthDay = '';
var dataText = "";
var bbcc = "";
var currentYear = "";
var currentMonth = "";
var thisMonth = "";
var monthText = "";

// 날짜
var startDate = "";
var endDate = "";
 

var tabText = "회원";

var galleryArr = [];


// 차트 관련
var monthArr = [];
var xValues = [];
var yValues = [];
var yValuesTwo = [];

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
	  monthArr = [];
      monthText = "이전달";
      calendarInit();
  });

  // 다음달로 이동
  $('.go-next').on('click', function() {
	  	monthArr = [];
        monthText = "다음달";
        calendarInit();
  });

  // 회원과 현황 탭
  $('.memberClass').on('click', function(){
	   urlChange = '/userChart.do';
        monthText = "";
        tabText = "회원";
        calendarInit();
    });

  // 매출 현황 탭
//    $('.salesClass').on('click', function(){
//        monthText = "";
//        tabText = "매출";
//        calendarInit();
//    });

  //갤러리 현황 탭
    $('.galleryClass').on('click', function(){
	      urlChange = '/galleryChart.do';
          monthText = "";
          tabText = "게시물";
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
			    	
			    	
			    	calendarInit();
			    	
			    	
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
    calendar = document.querySelector('.dates');
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
	 
	 	if(tabText == "회원"){
	 		chartUsersInfo();
	 	}
	 	
	 	if(tabText == "게시물"){
			chartUsersInfo();
	 	}
    
  } // CALENDAR INIT FN END
  
  
  
  var ajaxData = "";

  // 회원 CHRAT 현황 데이터
  function chartUsersInfo(){
	 
  var obj = [{"startDate" : startDate, "endDate" : endDate}];
  
  
  console.log("obj : ", obj);
  	  
 	$.ajax({
	 	url: localhost + urlChange,
	    type: "POST",
	    cache: false,
        dataType: "json",
        contentType: "application/json",
	    data: JSON.stringify(obj),
	    success: function(data){
	    	
	    	
	    	console.log("DATA CHECK : ", data);
	    	
	    	
	    	if(tabText == "회원"){
		    	// 기존 캔버스 삭제
			      $('.div_chart1').find('canvas').remove();
			   	  // 새로 다시 그림
			      $('.div_chart1').append('<canvas id="memberChartID" style="width: 100%; max: width 1104px;"></canvas>');
			   	  
			      $('.thID1').html('');
			      $('.thID2').html('');
			      $('.thID3').html('');
		    	
				  $('.thID_1').html('');
				  $('.thID_2').html('');
				  $('.thID_3').html('');
	    	}else{
			      // 기존 캔버스 삭제
			      $('.div_chart3').find('canvas').remove();
			   	  // 새로 다시 그림
			      $('.div_chart3').append('<canvas id="galleryChartID" style="width: 100%; max: width 1104px;"></canvas>');
			   	  
			      $('.GSRemove').html('');
			      
			      
	    	}
			  			
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
	    
	    
	    if(tabText == "회원"){
		    $('.thID1').append('<th scope="col">일자</th>');
		    $('.thID2').append('<th scope="col">일자</th>');
		    $('.thID3').append('<th scope="col">일자</th>');	    	
	    }else{
		    $('.galleryDateTr1').append('<th scope="col">일자</th>');
		    $('.galleryDateTr2').append('<th scope="col">일자</th>');
		    $('.galleryDateTr3').append('<th scope="col">일자</th>');	    	
	    }
		
	    for(var i = 1; i <= monthArr.length; i++){
	    	var dateValue = i >= 10 ? i : '0' + i;
	    	dateValue = String(dateValue);
	    	var dateVal = yearValue + monthValue + dateValue;
	    	
	    	if(tabText == "회원"){
	    		
		    	if( i <= 10){
		    		$('.thID1').append('<th scope="col">'+ dateValue +'</th>');	
		    	} else if(i <= 20 && i >= 10 ) {
		    		$('.thID2').append('<th scope="col">'+ dateValue +'</th>');
		    	} else {
		    		$('.thID3').append('<th scope="col">'+ dateValue +'</th>');
		    	}
		    	
		    	var obj = {"dateDay" : dateVal, "totalCount" : 0, "idx" : i};
		    			    	
	    	}else{
		    	if( i <= 10){
		    		$('.galleryDateTr1').append('<th scope="col">'+ dateValue +'</th>');	
		    	} else if(i <= 20 && i >= 10 ) {
		    		$('.galleryDateTr2').append('<th scope="col">'+ dateValue +'</th>');
		    	} else {
		    		$('.galleryDateTr3').append('<th scope="col">'+ dateValue +'</th>');
		    	}
	    		
		    	var obj = {"dateDay" : dateVal, "photo" : 0, "story" : 0, "idx" : i};
		    	
	    	}
	    	
	    	
	    	
	    	dateArr.push(obj);
	    	xValues.push(dateValue);
	    }
	    

	 	if(tabText == "회원"){
	 		
			  $('.thID_1').append('<th scope="col">회원수</th>');
			  $('.thID_2').append('<th scope="col">회원수</th>');
			  $('.thID_3').append('<th scope="col">회원수</th>');
	 		
	 		if(ajaxData.length != 0){
			  	  for(var i = 0; i < ajaxData.length; i++){
					  var v =  ajaxData[i];
					  var obj = {"dateDay" : v.dateDay, "totalCount" : v.totalCount};
					  dataArr.push(obj);
				  }
		
			  	  
			  	
			  	  
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
			 			$('.thID_1').append('<td>'+ v.totalCount +'</td>');
			 		
			 		}else if(i <= 20 && i > 10){
						  $('.thID_2').append('<td>'+ v.totalCount +'</td>');
			 		}else{
			 			  $('.thID_3').append('<td>'+ v.totalCount +'</td>');	
			 		}
			 		
			 		
			 		
			 		 sum += v.totalCount;
			 		$('#total_all').text(sum);
			 		
			 		yValues.push(v.totalCount);
			 	}	 			
	 		}else{
	 			
	 			for(var i = 0; i < xValues.length; i++){
	 				
			 		if(i < 10){
			 			$('.thID_1').append('<td>0</td>');
			 		
			 		}else if(i <= 20 && i > 10){
						  $('.thID_2').append('<td>0</td>');
			 		}else{
			 			  $('.thID_3').append('<td>0</td>');	
			 		}
	 			
			 		
	 				 yValues.push(0);
	 			}
	 			
		 			$('#total_all').text(0);
	 		}	 	  
	 		
		// 차트 세팅
 		  new Chart("memberChartID", {
 				  type: "bar",
 				  data: {
 				    labels: xValues,
 				    datasets: [
 		                { label: '회원 수', backgroundColor: "rgba(30, 144, 255, 1)", data: yValues }
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
	 	
	 	
	 	if(tabText == "게시물"){
	 		
	 		$('.galleryCount1').append('<th scope="row">갤러리 수</th>');
	 		$('.galleryCount2').append('<th scope="row">갤러리 수</th>');
	 		$('.galleryCount3').append('<th scope="row">갤러리 수</th>');
	 		
	 		$('.storyCount1').append('<th scope="row">스토리 수</th>');
	 		$('.storyCount2').append('<th scope="row">스토리 수</th>');
	 		$('.storyCount3').append('<th scope="row">스토리 수</th>');
	 		
	 		
	 		if(ajaxData.length != 0){

		 		
		 		
			  	  for(var i = 0; i < dateArr.length; i++){
			  		  var v = dateArr[i];
			  		  
			  		  for(var y = 0; y < ajaxData.length; y++){
			  			  var vv = ajaxData[y];
			  			  
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
				 			$('.galleryCount1').append('<td>'+ v.photo +'</td>');
				 			$('.storyCount1').append('<td>'+ v.story +'</td>');
				 		
				 		}else if(i <= 20 && i > 10){
							  $('.galleryCount2').append('<td>'+ v.photo +'</td>');
							  $('.storyCount2').append('<td>'+ v.story +'</td>');
				 		}else{
				 			  $('.galleryCount3').append('<td>'+ v.photo +'</td>');
				 			  $('.storyCount3').append('<td>'+ v.story +'</td>');
				 		}
				
					 sum += v.photo;
					 sum2 += v.story;
					
					 yValues.push(v.photo);
					 yValuesTwo.push(v.story);
				 }
				 		
		 			$('#galleryTotal').text(sum);
		 			$('#storyTotal').text(sum2);
				 
	 		}else{
	 			
	 			
	 			for(var i = 0; i < xValues.length; i++){
	 				
	 				if(i < 10){
			 			  $('.galleryCount1').append('<td>0</td>');
			 			  $('.storyCount1').append('<td>0</td>');
			 		
			 		}else if(i <= 20 && i > 10){
						  $('.galleryCount2').append('<td>0</td>');
						  $('.storyCount2').append('<td>0</td>');	
			 		}else{
			 			  $('.galleryCount3').append('<td>0</td>');	
			 			  $('.storyCount3').append('<td>0</td>');	
			 		}
	 				
	 				
					 yValues.push(0);
					 yValuesTwo.push(0);	
	 			}
	 			
	 			$('#galleryTotal').text(0);
	 			$('#storyTotal').text(0);
	 		}

	 		
			// 차트 세팅
			  new Chart("galleryChartID", {
					  type: "bar",
					  data: {
					    labels: xValues,
					    datasets: [
			                { label: '갤러리 수', backgroundColor: "rgba(30, 144, 255, 1)", data: yValues }
			              , { label: '스토리 수', backgroundColor: "rgba(24, 154, 155, 1)", borderColor:"red", data: yValuesTwo }
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
	  
  }
  
  
  
  
  
//======================================= 회원 정보 ===============================================================
  //회원 정보
  	$('.userClass').on('click', function(){
  		userAjax();
  	});
  
  
  	var userData = "";

  // 회원 리스트 조회
  	function userAjax(){
			
	 	$.ajax({
		 	url: localhost + "/userData.do",
		    type: "POST",
		    cache: false,
	        dataType: "json",
		    data: {
		    	'userNo' : 0,
		    	'enabled' : 0,
		    	'userId' : ""
		    },
		    success: function(data){
				
				userData = data;
				pagingFn();
				memberSetting(data);
				
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
		  });
  	}
  
  	// 회원 리스트 세팅
  	function memberSetting(data){
  		
  		$('#userListAppend').html('');
  		
  		
  		if(data.length == 0){
			innerHtml += '<tr>';
			innerHtml += '<td class="text-center" colspan="6">회원이 없습니다.</td>';
			innerHtml += '</tr>';
			$('#userListAppend').append(innerHtml);  			
  			return false;
  		}
  		
  		
		for(var i = 0; i < data.length; i++){
			var v = data[i];
			
			if(v.enabled == 1){
				var buttonName = "활동정지";
			}else{
				var buttonName = "복원";
			}
			
			var innerHtml = "";	
			innerHtml += '<tr>';
			innerHtml += 	'<td class="text-center">'+ v.userNo +'</td>';
			innerHtml +=	'<td class="text-center"><a class="primary modalShow" data-toggle="modal" data-target="#exampleModalCenter" data-userno='+ v.userNo +'>'+ v.userId +'</a></td>';
			innerHtml +=	'<td class="text-center">'+ v.userPassword +'</a></td>';
			innerHtml +=	'<td class="text-center">'+ v.userEmail +'</a></td>';
			innerHtml +=	'<td class="text-center">'+ v.userName +'</td>';
			innerHtml +=	'<td class="text-center">'+ v.userNickname +'</td>';
			innerHtml +=	'<td class="text-center"> <button type="button" class="btn btn-secondary btn-sm btnClick" data-userno='+ v.userNo +' data-enabled='+ v.enabled +'>'+ buttonName +'</button></td>';
			innerHtml += '</tr>';
			$('#userListAppend').append(innerHtml);
		}
  	}
  	
  	
  	// 모달 세팅
  	$(document).on("click", '.modalShow',function(){
  		var userNo = $(this).data("userno");  		
  		for(var i = 0; i < userData.length; i++){
  			var v = userData[i];
  			if(userNo == v.userNo){
  				$('.modal0').val(v.userProfile);
  				$('.modal1').val(v.userNo);
  				$('.modal2').val(v.userId);
  				$('.modal3').val(v.userPassword);
  				$('.modal4').val(v.userEmail);
  				$('.modal5').val(v.userName);
  				$('.modal6').val(v.userNickname);
  				$('.modal7').val(v.userSelf);
  				$('.modal8').val(v.userFing);
  				$('.modal9').val(v.userFwer);
  			}
  		}
  	});
  	
  	
  	// 활동 정지 버튼
  	$(document).on('click', '.btnClick', function(){
  		var userNo = $(this).data('userno');
		var enabled = $(this).data('enabled');
		
			if(enabled == 1){
				var enData = 2;
			}else{
				var enData = 1;
			}
  		
  		 $.ajax({
 		    url: localhost + "/userData.do",
 		    type: "POST",
 		    cache: false,
 		    dataType: "json",
 		    data: {
 		    	
 		    	'userNo' : userNo,
 		    	'enabled' : enData,
 		    	'userId' : ""
 		    	
 		    },
 		    success: function(data){
 				
 				var check = "";
 				 				
 				for(var i = 0; i < data.length; i++){
 					var v = data[i];
 					
 					if(userNo == v.userNo && enabled != v.enabled){
 						check = "success";
 					}
 				}
 				 				
				if(check == "success"){
					alert("업데이트 되었습니다");
				}else{
					alert("업데이트에 실패 했습니다");	
				}
			
					memberSetting(data);
 				
 		    }, error: function (request, status, error){
 		    	alert("Error");
 		    }
 		  });
  	});
  	
  	
  	// 검색 버튼
  	$('#searchClick').on('click', function(){
  		searchFn();
  	});
  	
  	//엔터키
   $("#keyword").on("keyup",function(key){
		if(key.keyCode==13) {
			searchFn();
	     }
	});
  	
  	// 회원 검색
  	function searchFn(){
		var keyword = $("#keyword").val();
  		
  		if(keyword == ""){
  			alert("검색어를 입력해주세요");
  			return false;
  		}
  		
  		
 		 $.ajax({
  		    url: localhost + "/userData.do",
  		    type: "POST",
  		    cache: false,
  		    dataType: "json",
  		    data: {
  		    	
  		    	'userId' : keyword,
 		    	'userNo' : 0,
 		    	'enabled' : 0
  		    	
  		    },
  		    success: function(data){
			 memberSetting(data);
  				
  		    }, error: function (request, status, error){
  		    	alert("Error");
  		    }
  		});
  	}
  	
  	// 페이징
  	function pagingFn(){
  		
  		$('.pagination').html('');
  		
  		var pagingHTML = "";
   			pagingHTML += '<li class="page-item disabled"><a class="page-link pagination-link" "prev"="">Previous</a></li>';
  		
  		for(var i = 1; i <= 10; i++){
  			
  			if(i == 1){
  				pagingHTML += '<li class="page-item active"><a class="page-link pagination-link">'+ i +'</a></li>';
  				
  			}else{
  				pagingHTML += '<li class="page-item"><a class="page-link pagination-link">'+ i +'</a></li>';	
  			}
  			
  						
  		}
  		
	  		pagingHTML += '<li class="page-item"><a class="page-link" "next"="">Next</a></li>';
  		
  		$('.pagination').append(pagingHTML);
  	}
  	

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
 		