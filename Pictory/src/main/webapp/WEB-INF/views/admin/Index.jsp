<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Picktory-관리자 메인</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--font/icon (DASHMIN) -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/AdminInex.css">

<!--JavaScript Libraries(DASHMIN) -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/AdminIndex.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css"
	rel="stylesheet" />

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

			<!-- Sale & Revenue Start -->
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
									회원 수
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
			<!-- Sale & Revenue End -->


			<!-- Sales Chart Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-light text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">주차별 매출</h6>
								
							</div>
							<canvas id="earningChart" style="width: 100%; max: width 1104px;"></canvas>
						</div>
					</div>

					<div class="col-sm-12 col-xl-6">
						<div class="bg-light text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">주차별 방문자 수</h6>
							
							</div>
							<canvas id="visitChart" style="width: 100%; max-width: 1104px"></canvas>
						</div>
					</div>
				</div>
			</div>

			<!-- Sales Chart End -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-light text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">주차별 회원 수</h6>
								
							</div>
							<canvas id="memberChart" style="width: 100%; max-width: 1104px"></canvas>
						</div>
					</div>

					<div class="col-sm-12 col-xl-6">
						<div class="bg-light text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">주차별 갤러리/스토리 비율</h6>
							
							</div>
							<canvas id="galleryChart" style="width: 100%; max-width: 1104px"></canvas>
						</div>
					</div>
				</div>
			</div>


			<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light  rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">최근 구매 / 판매 목록</h6>
						<a href="recentPurchase.html">모든 구매 / 판매 목록 보기</a>
					</div>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
									<th><input class="check all" type="checkbox"></th>
									<th class="col-1 text-center">글번호</th>
									<th class="col-2 text-center">구매/판매 일자</th>
									<th class="col-2 text-center">구매자 아이디</th>
									<th class="col-1 text-center">구매자 이름</th>
									<th class="col-2 text-center">판매자 아이디</th>
									<th class="col-1 text-center">판매자 이름</th>
									<th class="col-2 text-center">구매목록</th>
									<th class="col-1 text-center">금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input class="check" type="checkbox"></td>
									<td>3</td>
									<td class="text-center">22-06-22</td>
									<td><a href="memberOne.html">KOSMO</a></td>
									<td class="text-center">가길동</td>
									<td><a href="memberOne.html">ASG</a></td>
									<td class="text-center">안모씨</td>
									<td><a href="#">경복궁.jpg</a></td>
									<td>500원</td>
								</tr>

								<tr>
									<td><input class="check" type="checkbox"></td>
									<td>3</td>
									<td class="text-center">22-06-16</td>
									<td><a href="memberOne.html">AKAJAKA</a></td>
									<td class="text-center">마길동</td>
									<td><a href="memberOne.html">KYK</a></td>
									<td class="text-center">김모씨</td>
									<td><a href="#">롯데월드.jpg</a></td>
									<td>500원</td>
								</tr>

								<tr>
									<td><input class="check" type="checkbox"></td>
									<td>3</td>
									<td class="text-center">22-06-02</td>
									<td><a href="memberOne.html">KBS</a></td>
									<td class="text-center">라길동</td>
									<td><a href="memberOne.html">JYJ</a></td>
									<td class="text-center">정모씨</td>
									<td><a href="#">대관령 양떼목장.jpg</a></td>
									<td>500원</td>
								</tr>

								<tr>
									<td><input class="check" type="checkbox"></td>
									<td>2</td>
									<td class="text-center">22-05-24</td>
									<td><a href="memberOne.html">BBC</a></td>
									<td class="text-center">다길동</td>
									<td><a href="memberOne.html">LJH</a></td>
									<td class="text-center">이모씨</td>
									<td><a href="#">선유도해수욕장.jpg</a></td>
									<td>500원</td>
								</tr>

								<tr>
									<td><input class="check" type="checkbox"></td>
									<td>1</td>
									<td class="text-center">22-05-12</td>
									<td><a href="memberOne.html">NHK</a></td>
									<td class="text-center">나길동</td>
									<td><a href="memberOne.html">YJG</a></td>
									<td class="text-center">윤모씨</td>
									<td><a href="#">소요산.jpg</a></td>
									<td>500원</td>
								</tr>
							</tbody>
						</table>
						<!-- Recent Sales End -->
					</div>
				</div>

				<!-- Widgets Start -->
				<div class="container-fluid pt-4 px-4">
					<div class="row g-4">
						<!-- <div class="col-sm-12 col-md-6 col-xl-4">
							<div class="h-100 bg-light rounded p-4">
								<div
									class="d-flex align-items-center justify-content-between mb-2">
									<h6 class="mb-0">공지사항</h6>
									<a href="adminNotice.html">모든 공지사항 보기</a>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img02.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">Picktory</a>
											</h6>
											<small>10 분 전</small>
										</div>
										<span><a href="adminNoticeDetail.html">[공지사항]
												공지사항입니다</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img02.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">Picktory</a>
											</h6>
											<small>4 일 전</small>
										</div>
										<span><a href="adminNoticeDetail.html">[공지사항]
												공지사항입니다</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img02.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">Picktory</a>
											</h6>
											<small>7 일 전</small>
										</div>
										<span><a href="adminNoticeDetail.html">[공지사항]
												공지사항입니다</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center pt-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img02.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">Picktory</a>
											</h6>
											<small>10 일 전</small>
										</div>
										<span><a href="adminNoticeDetail.html">[공지사항]
												공지사항입니다</a></span>
									</div>
								</div>
							</div>
						</div> -->
						<div class="col-sm-12 col-md-6 col-xl-6">
							<div class="h-100 bg-light rounded p-4">
								<div
									class="d-flex align-items-center justify-content-between mb-2">
									<h6 class="mb-0">Q&A</h6>
									<a href="q&a.html">모든 Q&A 보기</a>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img01.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">Jhon Doe</a>
											</h6>
											<small>13 분 전</small>
										</div>
										<span><a href="q&aDetail.html">구매는 어떻게 해야하나요?</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img01.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">SG An</a>
											</h6>
											<small>15 분 전</small>
										</div>
										<span><a href="q&aDetail.html">활동을 어떻게 해야하나요?</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img01.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 jusify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">JH Lee</a>
											</h6>
											<small>20 분 전</small>
										</div>
										<span><a href="q&aDetail.html">이용을 어떻게 해야하나요?</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center pt-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img01.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">YK Kim</a>
											</h6>
											<small>1 일 전</small>
										</div>
										<span><a href="q&aDetail.html">채팅을 어떻게 해야하나요?</a></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-xl-6">
							<div class="h-100 bg-light rounded p-4">
								<div
									class="d-flex align-items-center justify-content-between mb-2">
									<h6 class="mb-0">신고리스트</h6>
									<a href="report.html">모든 신고리스트 보기</a>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img04.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">SG An</a>
											</h6>
											<small>8 분 전</small>
										</div>
										<span><a href="reportDetail.html">갤러리 [123번] 신고합니다</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img04.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">JH Lee</a>
											</h6>
											<small>21 분 전</small>
										</div>
										<span><a href="reportDetail.html">갤러리 [115번] 신고합니다</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img04.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">YK Kim</a>
											</h6>
											<small>25 분 전</small>
										</div>
										<span><a href="reportDetail.html">스토리 [22번] 신고합니다</a></span>
									</div>
								</div>
								<div class="d-flex align-items-center pt-3">
									<img class="rounded-circle flex-shrink-0"
										src="img/test_img04.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">
												<a href="memberOne.html">YJ Jung</a>
											</h6>
											<small>1 일 전</small>
										</div>
										<span><a href="reportDetail.html">채팅 [11번] 신고합니다</a></span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- Widgets End -->

			</div>
			<!--  -->
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
		<!--  -->

		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
		<!-- Template Javascript -->
		<script>
		//주차별 매출 (메인에 보여주기)
		var xValues = ["1주차", "2주차", "3주차", "4주차", "5주차"];
		var yValues = [155, 300, 550, 650,600];
		var barColors = [
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)"
		 
		];
		
		new Chart("earningChart", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    scales: {
			      yAxes: [{
			        ticks: {
			          beginAtZero: true
			        }
			      }],
			    }
			  }
			});
		</script>
		<script>
		//주차별 방문자 수 (메인에 보여주기)
		var xValues = ["1주차", "2주차", "3주차", "4주차", "5주차"];
		var yValues = [99, 135, 170, 130, 190];
		var barColors = [
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)",
		  "rgba(30, 144, 255, 1)"
		 
		];
		
		new Chart("visitChart", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    scales: {
			      yAxes: [{
			        ticks: {
			          beginAtZero: true
			        }
			      }],
			    }
			  }
			});
		</script>
		<script>
		//주차별 회원 수 (메인에 보여주기)
		var xValues = ["1주차", "2주차", "3주차", "4주차","5주차"];
		var yValues = [10, 25, 37, 45, 52];

		new Chart("memberChart", {
		  type: "line",
		  data: {
		    labels: xValues,
		    datasets: [{
		      fill: false,
		      lineTension: 0,
		      backgroundColor: "rgba(30, 144, 255, 1)",
		      borderColor: "rgba(30, 144, 255, 1)",
		      data: yValues
		    }]
		  },
		  options: {
		    legend: {display: false},
		    scales: {
		     
		    }
		  }
		});
		</script>
		<script>
		//갤러리와 스토리 도넛비율
		var xValues = ["갤러리", "스토리"];
		var yValues = [55, 42];
		var barColors = [
		  "dodgerblue",
		  "#00aba9",
		  
		];
		
		new Chart("galleryChart", {
		  type: "doughnut",
		  data: {
		    labels: xValues,
		    datasets: [{
		      backgroundColor: barColors,
		      data: yValues
		    }]
		  },
		  options: {
		    responsive : false,
		    title: {
		      display: false
		      
		    }
		  }
		});
		// Sidebar Toggler
	    $('.sidebar-toggler').click(function () {
	        $('.sidebar, .content').toggleClass("open");
	        return false;
	    });


	    // Progress Bar
	    $('.pg-bar').waypoint(function () {
	        $('.progress .progress-bar').each(function () {
	            $(this).css("width", $(this).attr("aria-valuenow") + '%');
	        });
	    }, {offset: '80%'});
		</script>
		
		
</body>

</html>

