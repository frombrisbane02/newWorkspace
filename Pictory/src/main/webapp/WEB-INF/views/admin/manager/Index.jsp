<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Pictory-수익 및 정산 </title>
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
<!--  <script src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>	-->
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<!--  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>	-->
<link rel="preconnect" href="https://fonts.gstatic.com">
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
<!--  <link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />	-->

<!-- Customized Bootstrap Stylesheet -->
<!--  <link href="css/bootstrap.min.css" rel="stylesheet">	-->

<!--font/icon (DASHMIN) -->
<!--  <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">	-->
	
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">	-->

<!--JavaScript Libraries(DASHMIN) -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" ></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>	-->
<!--  
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>	-->

<!--  <script src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>	-->


<link rel="stylesheet" href="<c:url value="/resources/css/admin/admin.css"/>">	
	
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/admin/admin.css"/>">	
	<!--font library-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<style>
*{font-family: 'Noto Sans KR', sans-serif;}
@media all and (min-width: 768px) {
#panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 {
  pointer-events: none;
  cursor: default;
  transform: translate3d(0, 1px, 0);
  box-shadow: none;
  border-right: none;
  background-color: #6e65d5;
}
#panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1.last {
  border-right: 1px solid transparent;
}
#panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 + li {
  border-left: 1px solid #dfdfdf;
}

#panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 label.panel-label::after {
  height: 6px;
}

#panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 {
  pointer-events: none;
  cursor: default;
  transform: translate3d(0, 1px, 0);
  box-shadow: none;
  border-right: none;
  background-color: #6e65d5;
}
#panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2.last {
  border-right: 1px solid transparent;
}
#panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 + li {
  border-left: 1px solid #dfdfdf;
}

#panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 label.panel-label::after {
  height: 6px;
}


label.panel-label:hover {
color: #FFFFFF;
background-color: #6e65d5;
}
i {
    color : #6e65d5;
    }
a {
    color : #6e65d5;
    }
.sidebar .navbar .navbar-nav .nav-link:hover,
.sidebar .navbar .navbar-nav .nav-link.active {
  color: #6e65d5;
  background: #FFFFFF;
  border-color: #6e65d5;
}
button{
 background-color: #6e65d5;
}

/* =========== START ================== */
/* 손가락 모양커서 */
.cur-pointer {
	cursor:pointer;
}

/* 모달 버튼 사이즈 */
.modal-btn {
	width: 75px;
    height: 42px;
}
/* =========== END ================== */

</style>
</head>

<body>
	<div class="container-s position-relative bg-white d-flex p-0">

<!--================================================= Sidebar 시작 ============================================================-->
		
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">
				<a href="/springapp/index.do" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<img class="logo" src="${pageContext.request.contextPath}/resources/img/admin/logo.jpg" alt=""
							style="width: 200px; height: 50px;">
					</h3>
				</a>
				
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
					<!--  	<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/test_img05.jpg" alt=""
							style="width: 40px; height: 40px;">	-->
						<img class="rounded-circle userInfo0" src="${adminUsersDTO.userProfile}" alt="" style="width: 40px; height: 40px;">
							
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
						</div>
					</div>
				<!--  	<div class="ms-3">
						<h6 class="mb-0">${sessionScope.userId}</h6>
						<span>관리자</span>
						<input type="text" id="mainUserId" style="display:none" value="${sessionScope.userId}" />
					</div>	-->
					
					<div class="ms-3">
						<h6 class="mb-0 userInfo1"></h6>
						<span class="userInfo2">관리자</span>
						<input type="text" id="mainUserId" style="display:none" value="${sessionScope.userId}" />
					</div>
					
				</div>
				
				<div class="navbar-nav w-100" >
						<a href="${pageContext.request.contextPath}/admin/Index.do" class="nav-item nav-link"  >
						<i class="fa fa-tachometer-alt me-2"></i>관리자 메인</a>

					<div>
						<a href="${pageContext.request.contextPath}/admin/analysis/Index.do" class="nav-item nav-link" >
             		 	<i class="fa fa-chart-bar me-2"></i>통계 및 회원관리</a>
					</div>

					<div>
						<a href="${pageContext.request.contextPath}/admin/manager/Index.do" class="nav-item nav-link active">
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
				</a>
				<div class="navbar-nav align-items-center ms-auto">
					
					
					<div class="nav-item dropdown">
					<!--  	<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2" src="${pageContext.request.contextPath}/resources/img/admin/test_img05.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex">${sessionScope.userId}</span>
						</a>	-->
						
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2 userInfo0" src="${adminUsersDTO.userProfile}" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex userInfo1"></span>
						</a>
						
						<!--  <div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a class="dropdown-item" data-toggle="modal" data-target="#exampleModalCenter5">내 정보</a>
                            <a href="${pageContext.request.contextPath}/auth/Logout.do" class="dropdown-item">로그아웃</a>
						</div>	-->
						
						<div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a class="dropdown-item cur-pointer" id="myInfo" data-toggle="modal" data-target="#exampleModalCenter5">
							<i class="fa fa-tachometer-alt" style="padding-right: 5px;"></i>
							내 정보
							</a>
                            <a href="${pageContext.request.contextPath}/auth/Logout.do" class="dropdown-item">
                            <i class="fa fa-tachometer-alt" style="padding-right: 5px;"></i>
                            로그아웃
                            </a>
						</div>
						
					</div>
				</div>
			</nav>
			
			<div class="modal fade" id="exampleModalCenter5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">내 정보</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div style="text-align: center;" id="modalfaqUserInfo">
            
                <td class="col-1 align-top border-spacing; 30px;">
                    <img class="rounded-3 flex-shrink-0 modal0" value="${records.userProfile }" alt="userProfile" style="width: 170px; height: 170px;">
                </td>
              
                 <td class="col-8">
                   <div class="row mb-3">
                       <label for="userNo" class="col-3 col-form-label text-left">회원번호</label>
                       <div class="col-5">
                           <input value="${sessionScope.userNo }" readonly  type="text" class="form-control modal1" name="userNO">
                       </div>
                   </div>
				</td>
				
			  
				<td>
                   <div class="row mb-3">
                       <label for="userId" class="col-3 col-form-label text-left">ID</label>
                       <div class="col-7">
                           <input value="${sessionScope.userId }" readonly  type="text" class="form-control modal2" name="userId">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userPassword" class="col-3 col-form-label text-left">비밀번호</label>
                       <div class="col-7">
                           <input value="${sessionScope.userPassword }" readonly type="text" class="form-control modal3" name="userPassword">
                       </div>
                   </div>
				</td>
			
				<td>
                   <div class="row mb-3">
                       <label for="userEmail" class="col-3 col-form-label text-left">이메일</label>
                       <div class="col-7">
                           <input value="${adminUsersDTO.userEmail }" readonly type="text" class="form-control modal4" name="userEmail">
                       </div>
                   </div>
				</td>
				
				<td>
                   <div class="row mb-3">
                       <label for="userName" class="col-3 col-form-label text-left">이름</label>
                       <div class="col-7">
                           <input value="${adminUsersDTO.userName }" readonly type="text" class="form-control modal5" name="userName">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userNickname" class="col-3 col-form-label text-left">닉네임</label>
                       <div class="col-7">
                           <input value="${adminUsersDTO.userNickname }" readonly type="text" class="form-control modal6" name="userNickname">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userSelf" class="col-3 col-form-label text-left">자기소개</label>
                       <div class="col-7">
                           <input value="${adminUsersDTO.userFwer }" readonly type="text" class="form-control modal7" name="userFwer">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFing" class="col-3 col-form-label text-left">팔로잉 수</label>
                       <div class="col-7">
                           <input value="${adminUsersDTO.userFing }" readonly type="text" class="form-control modal8" name="userFing">
                       </div>
                   </div>
                </td>
                
                <td>   
                   <div class="row mb-3">
                       <label for="userFwer" class="col-3 col-form-label text-left">팔로워 수</label>
                       <div class="col-7">
                           <input value="${adminUsersDTO.userFwer }" readonly type="text" class="form-control modal9" name="userFwer">
                       </div>
                   </div>
                </td>
				
            </div> 
        </div>
        <!--  <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary right" >확인</button>
        </div>	-->
		<div class="modal-footer">
          <button type="button" style="width: 75px; height: 45px;" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <!--  <button type="submit" class="right" >확인</button>	-->
        </div>
        
      </div>
    </div>
  </div>
<!--================================================= Navbar 끝 =================================================-->

<!--================================================= 이번주 매출 / 총 매출 / 회원수 / 누적 총 방문자 수 시작 =================================================-->
			
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-line fa-3x "></i>
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
							<i class="fa fa-chart-bar fa-3x "></i>
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
							<i class="fa fa-chart-area fa-3x"></i>
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
							<i class="fa fa-chart-pie fa-3x "></i>
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
			
<!--================================================= 이번주 매출 / 총 매출 / 회원수 / 누적 총 방문자 수 끝 =================================================-->
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
                            <button type="button" id="buttonTitle" class="dropdown-toggle btn-sm" data-toggle="dropdown">
                                검색 키워드
                            </button>
                            <div class="dropdown-menu">
                                <!--   <a class="dropdown-item" href="#">최신순</a>	-->
                                <!--  <a class="dropdown-item-text" href="#">구매/판매 목록</a> -->
                                <a class="dropdown-item searchId" href="#" value="ALL">검색 키워드</a>
                                <a class="dropdown-item searchId" href="#" value="CONSUMER">구매자 아이디</a>
                                <a class="dropdown-item searchId" href="#" value="SELLER">판매자 아이디</a>
                                <a class="dropdown-item searchId" href="#" value="ORDER">주문 번호</a>
                                <a class="dropdown-item searchId" href="#" value="PRODUCT">상품 번호</a>
                            </div>
                        </div>
            
                           <!--search-->
                           <div>
                            <input type="text" id="keyword" placeholder="검색" value="${param.keyword}">
                            <button id="searchClick">검색</button>
                            </div>
                        <!--search-->
                    </div> 
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
										<th class="col-1 text-center">번호</th>
			                            <th class="col-1 text-center">구매자</th>
			                            <th class="col-1 text-center">판매자</th>
			                            <th class="col-2 text-center">주문 번호</th>
			                            <th class="col-2 text-center">상품 번호</th>
			                            <th class="col-2 text-center">상품명</th>
			                            <th class="col-1 text-center">이미지</th>
			                            <th class="col-2 text-center">금액</th>
			                            <th class="col-2 text-center">날짜</th>
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
						
						<!-- 페이지  -->
			            <ul id="dyn_ul" class="pagination" style="justify-content: center;">
						<!--  	  <li class="page-item disabled"><a class="page-link pagination-link" "prev"="">Previous</a></li>
							  <li class="page-item active"><a class="page-link pagination-link">1</a></li>
							  <li class="page-item"><a class="page-link pagination-link">2</a></li>
							  <li class="page-item"><a class="page-link" "next"="">Next</a></li>	-->
					    </ul>
						
						<!-- 페이지  -->
					<!--  	<div class="page">
							
						<a href="?pageNum=<c:out value="${pageDTO.firstPage}"/>&keyword=${pageDTO.keyword}">[첫]</a>
						<c:if test="${pageDTO.prev > 0 }">
							<a href="?pageNum=<c:out value="${pageDTO.prev}"/>&keyword=${pageDTO.keyword}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.lastPage}">
							<c:if test="${pageDTO.pageNum ==  i}">
								<b>
							</c:if>
								페이지 번
								<a href="?pageNum=<c:out value="${i}"/>&keyword=${pageDTO.keyword}"><c:out value="${i}"/></a>
							<c:if test="${pageDTO.pageNum ==  i}">
								</b>
							</c:if>
						</c:forEach>
						<c:if test="${pageDTO.next <= pageDTO.lastPage }">
							<a href="?pageNum=<c:out value="${pageDTO.next}"/>&keyword=${pageDTO.keyword}">[다음]</a>
						</c:if>
						<a href="?pageNum=<c:out value="${pageDTO.lastPage}"/>&keyword=${pageDTO.keyword}">[마지막]</a>
							Recent Sales End
						</div>	-->
						
						
						
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
                            <table class="table table-hover" style="text-align: center;">
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
                            <table class="table table-hover" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th scope="col">비고</th>
                                        <th scope="col">매출 합계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">총 매출</th>
                                        <td id="total_all"></td>
                                    </tr>
									<tr>
                                        <th scope="row">Pictory 매출 (10%수수료)</th>
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
<!-- JS START -->
<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
<!-- JS END -->
</html>
 		