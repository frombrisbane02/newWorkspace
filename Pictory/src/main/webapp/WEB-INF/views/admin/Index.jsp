<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>관리자-메인</title>
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

<!--================================================= Sidebar 시작 ============================================================-->
		
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
		
<!--================================================= Sidebar 끝 =================================================-->


		

<!--================================================= Navbar 시작================================================= -->
			
			<div class="content">
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
							<a class="dropdown-item" data-toggle="modal" data-target="#exampleModalCenter">내 정보</a>
                            <a href="${pageContext.request.contextPath}/auth/Logout.do" class="dropdown-item">로그아웃</a>
						</div>
					</div>
				</div>
			</nav>
			
<!--================================================= Navbar 끝 =================================================-->

<!--================================================= 이번주 매출 / 총 매출 / 회원수 / 누적 총 방문자 수 시작 =================================================-->
			
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
			
<!--================================================= 이번주 매출 / 총 매출 / 회원수 / 누적 총 방문자 수 끝 =================================================-->

<!--================================================= 주차별 차트 시작 =================================================-->
			
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
			
<!--================================================= 주차별 차트 끝 =================================================-->

<!--================================================= 최근 구매 / 판매 목록 시작 =================================================-->
			
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light  rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">최근 구매 / 판매 목록</h6>
						
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
							<tbody>
							<c:if test="${empty records }" var="isEmpty">
								<tr>
									<td class="text-center" colspan="12">등록된 글이 없습니다.</td>
								</tr>	
							</c:if>
								<c:if test="${not isEmpty }">
				                    <c:forEach var="records" items="${records }">
				                         <tr>
				                            <td class="text-center">${record.postNo}</td>
				                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">${record.id}</a></td>
				                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">${record.id}</a></td>
				                            <td class="text-center">${record.paymentNo}</td>
				                            <td class="text-center">${record.pdNo}</a></td>
				                            <td class="text-center">${record.photoName}</td>
				                            <td class="text-center">${record.paymentTotal}</td>
				                            <td class="text-center">${record.paymentDate}</td>
				                        </tr>
				                    </c:forEach>
				                </c:if>
				                
							<!--======================= 예시 게시물 표현 시작 =======================-->
								 
								 <tr>
		                            <td class="text-center">5</td>
		                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">BROKEROW</a></td>
		                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">SAMURAI</a></td>
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
		                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">BROKEROW</a></td>
		                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">SAMURAI</a></td>
		                            <td class="text-center">324352</td>
		                            <td class="text-center"><a href="memberOne.html">2335</a></td>
		                            <td class="text-center">경복궁.jpg</td>
		                            <td class="text-center">500원</td>
		                            <td class="text-center">22-06-16</td>
		                        </tr>

								<tr>
		                            <td class="text-center">1</td>
		                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">BROKEROW</a></td>
		                            <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">SAMURAI</a></td>
		                            <td class="text-center">324352</td>
		                            <td class="text-center"><a href="memberOne.html">2335</a></td>
		                            <td class="text-center">경복궁.jpg</td>
		                            <td class="text-center">500원</td>
		                            <td class="text-center">22-06-16</td>
		                        </tr>
							</tbody>
						</table>
					</div>
				</div>
				
<!--================================================= 최근 구매 / 판매 목록 끝 =================================================-->

<!--================================================= 모달 구매자 / 판매자 아이디 시작 =================================================-->
        
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
                    <img class="rounded-3 flex-shrink-0 " value="${records.userProfile }" alt="userProfile" style="width: 170px; height: 170px;">
                </td>
                	
              
                 <td class="col-8">
                   <div class="row mb-3">
                       <label for="userNo" class="col-3 col-form-label text-left">회원번호</label>
                       <div class="col-5">
                           <input value="${records.userNo }" readonly  type="text" class="form-control" name="userNO">
                       </div>
                   </div>
				</td>
				
			  
				<td>
                   <div class="row mb-3">
                       <label for="userId" class="col-3 col-form-label text-left">ID</label>
                       <div class="col-7">
                           <input value="${records.userId }" readonly  type="text" class="form-control" name="userId">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userPassword" class="col-3 col-form-label text-left">비밀번호</label>
                       <div class="col-7">
                           <input value="${records.userPassword }" readonly type="text" class="form-control" name="userPassword">
                       </div>
                   </div>
				</td>
			
				<td>
                   <div class="row mb-3">
                       <label for="userEmail" class="col-3 col-form-label text-left">이메일</label>
                       <div class="col-7">
                           <input value="${records.userEmail }" readonly type="text" class="form-control" name="userEmail">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userName" class="col-3 col-form-label text-left">이름</label>
                       <div class="col-7">
                           <input value="${records.userName }" readonly type="text" class="form-control" name="userName">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userNickname" class="col-3 col-form-label text-left">닉네임</label>
                       <div class="col-7">
                           <input value="${records.userNickname }" readonly type="text" class="form-control" name="userNickname">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userSelf" class="col-3 col-form-label text-left">자기소개</label>
                       <div class="col-7">
                           <input value="${records.userFwer }" readonly type="text" class="form-control" name="userFwer">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFing" class="col-3 col-form-label text-left">팔로잉 수</label>
                       <div class="col-7">
                           <input value="${records.userFing }" readonly type="text" class="form-control" name="userFing">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFwer" class="col-3 col-form-label text-left">팔로워 수</label>
                       <div class="col-7">
                           <input value="${records.userFwer }" readonly type="text" class="form-control" name="userFwer">
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
  
 <!--================================================= 모달 구매자 / 판매자 아이디 끝 =================================================-->

<!--================================================= 공지사항 시작 =================================================-->
				
				<div class="container-fluid pt-4 px-4">
					<div class="row g-4">
						 <div class="col-sm-12 col-md-4 col-xl-4">
							<div class="h-100 bg-light rounded p-4">
							<h6 class="mb-0">공 지 사 항</h6>
							<br>
								<table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-2">번호</th>
                      <th class="col-5">제목</th>
                      <th class="col-2">아이디</th>
                      <th class="col-1">작성일</th>
                      
                    </tr>
                </thead>
                <tbody class="table-sm">
					<c:if test="${empty records }" var="isEmpty">
						<tr>
							<td class="text-center" colspan="10">등록된 글이 없습니다.</td>
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
					</c:if>
					
			<!--======================= 예시 게시물 표현 시작 =======================-->
			                 <tr>
			                      <td class="text-center">1</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">공지사항입니다</a></td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">2</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">공지사항입니다</a></td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">3</td>
			                      <td><a href="adminNoticeDetail.html">공지사항입니다</a></td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">4</td>
			                      <td><a href="adminNoticeDetail.html">공지사항입니다</a></td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			             </tbody>
		              </table>
		      <!--======================= 예시 게시물 표현 끝 =======================-->
		              
					</div>
				  </div> 
				  
<!--================================================= 공지사항 끝 =================================================-->
				  
<!--================================================= 모달 공지사항 시작 =================================================-->
				  
        <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
				<td class="text-white">${records.noticeNo}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">아이디</th>
				<td class="text-white">${records.noticeId}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">등록일</th>
				<td class="text-white">${records.noticeDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td class="text-white">${records.noticeTitle}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-white">${records.noticeContent}</td>
			</tr>
		</tbody>
	</table>
</div>
</form>	
				
            </div> 
        </div>
        <div class="modal-footer">
        <c:if test="${sessionScope.user_Id eq records.userId }">
 			<a href="<c:url value="/Controller/EditController.KOSMO?no=${records.noticeNo}&title=${records.noticeTitle}&content=${records.noticeContent}"/>"class="btn btn-primary" >수정</a>
			<a href="<c:url value="/Controller/DeleteController.KOSMO?no=${records.noticeNo}"/>" class="btn btn-primary">삭제</a> 
		</c:if>
          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
<!--================================================= 모달 공지사항 보기 끝 =================================================-->

 <!--================================================= 모달 공지사항 수정 시작 =================================================-->
        
        <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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

<!--================================================= 모달 공지사항 수정 끝 =================================================-->
						
<!--================================================= Q & A 시작 =================================================-->
						
						<div class="col-sm-12 col-md-6 col-xl-4">
							<div class="h-100 bg-light rounded p-4">
							<h6 class="mb-0">Q & A</h6>
							<br>
								<table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-2">번호</th>
                      <th class="col-5">제목</th>
                      <th class="col-2">아이디</th>
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
                                <td class="text-center">${records.qnaNo }</td>
                                <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">${records.qnaTitle }</a></td>
                                <td class="text-center">${records.userId }</a></td>
                                <td class="text-center">${records.qnaDate }</td>
                          </tr>
						</c:forEach>
					</c:if>
					
			<!--============================ 예시 게시물 표현 시작 ============================-->
			                 
			                 <tr>
			                      <td class="text-center">1</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">2</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">5</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter1">질문이 있습니다</a></td>
			                      <td class="text-center">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			       </tbody>
              </table>
              		</div>
						</div>
						
						<!--============================ 예시 게시물 표현 끝 ============================-->
						
<!--================================================= Q & A 끝 =================================================-->

<!--================================================= 신고리스트 시작 =================================================-->
						
						<div class="col-sm-12 col-md-6 col-xl-4">
							<div class="h-100 bg-light rounded p-4">
							<h6 class="mb-0">신 고 리 스 트</h6>
							<br>
								<table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-2">번호</th>
                      <th class="col-5">제목</th>
                      <th class="col-2">아이디</th>
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
                                <td class="text-center"><a class="primary" data-toggle="modal" data-target="#exampleModalCenter4">신고합니다</a></td>
                                <td class="text-center"><a href="memberOne.html">Picktory</a></td>
                                <td class="text-center">22-06-22</td>
                          </tr>
						</c:forEach>
					</c:if>
					
			<!--============================ 예시 게시물 표현 시작 ============================-->
			                 <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter4">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter4">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter4">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a class="primary" data-toggle="modal" data-target="#exampleModalCenter4">신고합니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                			                
		    <!--============================ 예시 게시물 표현 끝 ============================-->
		    
              	</tbody>
              </table>
							</div>
						</div>
						
<!--================================================= 신고리스트 끝 =================================================-->

<!--================================================= 모달 신고리스트 시작 =================================================-->

					<div class="modal fade" id="exampleModalCenter4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
  
  <!--================================================= 모달 신고리스트 끝 =================================================-->
  
					</div>
				</div>
				<!-- Widgets End -->

			</div>
			<!--  -->
			
		</div>
		<!--  -->

		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
		
		
		
<!--================================================= 자바스크립트 시작 =================================================-->
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

<script type="text/javascript">
	$(document).ready(function() {
		console.log("관리자페이지 메인");
//		test();
	});
	
	function test() {
		
		$.ajax({
			url : "Index.do",
			type : 'GET',
			data : {
				name : "홍길동",
				age : "10",
				gender : "남"
			},
			success : function(data)) {
				console.log("AJAX DATA CHECK : ", data);
		     },
			error : function() {
				alert("error");
			}
		});
	}

</script>

</html>

