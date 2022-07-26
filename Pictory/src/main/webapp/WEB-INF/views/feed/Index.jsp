<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<link rel="apple-touch-icon" href="img/favicon.png">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/page2.css"/>"/>

    <script src="${pageContext.request.contextPath}/resources/js/feed/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/feed/tab.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/feed/modernizr.js"></script>
    <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>

	
<body>	 
 <!--
 <a href="" class="filter_btn"><img src="<c:url value="/resources/img/gallerylist/test_icon12.png"/>" alt="">Filter</a>
 <div class="img_area" style="background-image: url(<c:url value="/resources/img/gallerylist/test_img12.jpg"/>);">
 -->

<form method="post" action="<c:url value="/feed/Index.do"/>" accept-charset="UTF-8">
	<div class="gray_box">
		<div class="top_bg" style="background-image: url(<c:url value="/resources/img/feed/test_img01.jpg"/>);"></div>
		<div class="main_area">
			<div class="left_pro">
				<div class="top_pro">
					<img src="<c:url value="/resources/img/feed/test_img02.jpg"/>" alt="" class="pro_img">
					<div class="txt_area">
						<h3>홍길동</h3>
						<p class="sub_txt">홍길동입니다 반갑습니다</p>
						<p><img src="<c:url value="/resources/img/feed/test_icon01.png"/>" alt="">대한민국</p>
						<p>고길동님과 둘리님이 팔로우중입니다.</p>
					</div>
				</div>

				<ul class="count_list">
					<li>
						<h3>50</h3>
						<p>게시글</p>
					</li>
					<li>
						<h3>214K</h3>
						<p>좋아요</p>
					</li>
					<li>
						<h3>2</h3>
						<p>팔로잉</p>
					</li>
					<li>
						<h3>30</h3>
						<p>팔로워</p>
					</li>
				</ul>

				<ul class="btn_area">
					<li><a href="" class="black_icon"><img src="<c:url value="/resources/img/feed/test_icon02.png"/>">Following</a></li>
					<li><a href="" class="white_icon"><span></span>DM</a></li>
				</ul>

				<div class="best_project">
					<h3 class="sub_tit">Best Project</h3>
					<div class="img_box" style="background-image: url(<c:url value="/resources/img/feed/test_img03.jpg)"/>"><a href=""><img src="<c:url value="/resources/img/feed/fake01.png"/>" alt=""></a></div>
				</div>

				<div class="about_me">
					<h3 class="sub_tit">About me</h3>
					<p>안녕하세요 저는 홍길동입니다. <br>내 사진 예쁘지 많이 사줘 <br>멋져멋져 내사진 멋져 오오오오오</p>
				</div>

				<div class="contacts">
					<h3 class="sub_tit">Contacts</h3>
					<p><img src="<c:url value="/resources/img/feed/test_icon04.png"/>" alt="">www.hong.co.kr</p>
					<p><img src="<c:url value="/resources/img/feed/test_icon05.png"/>" alt="">010-0000-0000</p>
					<p><img src="<c:url value="/resources/img/feed/test_icon01.png"/>" alt="">서울시 서울구 서울동 12-345</p>
				</div>
			</div>

			<div class="right_list">
				<ul class="top_tab">
					<li class="tab_link tab_ac" data-tab="tab1"><a href="">Artwork <span>1</span></a></li>
					<li class="tab_link" data-tab="tab2"><a href="">Story <span>1</span></a></li>
					<li class="tab_link" data-tab="tab3"><a href="">Likes <span>1</span></a></li>
				</ul>

				<div class="cont_area">
					<div class="tab_cont tab_ac" id="tab1">
						<ul class="cont_list">
							<li class="photo_area">
								<a href="" class="photo_link">					
									<div class="img_area" style="background-image: url(<c:url value="/resources/img/feed/test_img03.jpg"/>);"><img src="<c:url value="/resources/img/feed/fake02.png"/>" alt=""></div>	
									<div class="txt_area">
										<p><img src="<c:url value="/resources/img/feed/test_img02.jpg"/>" alt="" class="pro_p">User name</p>
										<p><img src="<c:url value="/resources/img/feed/test_icon06.png"/>" alt="" class="pro_icon"><span>0</span><img src="<c:url value="/resources/img/feed/test_icon07.png"/>" alt="" class="pro_icon"><span>0</span></p>
									</div>		
								</a>
							</li>
						</ul>
					</div>

					<div class="tab_cont" id="tab2">
						<ul class="story_list">
							<li>
								<a href="">					
									<div class="img_area" style="background-image: url(<c:url value="/resources/img/feed/test_img04.png"/>"><img src="<c:url value="/resources/img/feed/fake03.png"/>" alt=""></div>	
									<div class="txt_area">
										<p class="small"><span class="cate">CATEGORY</span><span class="gray">뭐 넣는건가요</span></p>
										<p class="main_txt">안녕하세요 여기에 글을 넣어주세요 네네네네 반갑습니다 오오오오오오오 멋져멋져 안녕하세요 안녕하세요 여기에 글을 넣어주세요 네네네네 반갑습니다 오오오오오오오 멋져멋져</p>
										<div class="pro_line">
											<p><img src="<c:url value="/resources/img/feed/test_img2.jpg"/>" alt="" class="pro_p">User name</p>
											<p class="gray"><img src="<c:url value="/resources/img/feed/test_icon08.png"/>" alt="" class="pro_icon"><span>0</span><img src="<c:url value="/resources/img/feed/test_icon09.png"/>" alt="" class="pro_icon"><span>0</span></p>
										</div>
									</div>		
								</a>
							</li>
						</ul>
					</div>

					<div class="tab_cont" id="tab3">
						<ul class="cont_list">
							<li class="photo_area">
								<a href="" class="photo_link">					
									<div class="img_area" style="background-image: url(<c:url value="/resources/img/feed/test_img04.jpg"/>"><img src="<c:url value="/resources/img/feed/fake02.png"/>" alt=""></div>	
									<div class="txt_area">
										<p><img src="<c:url value="/resources/img/feed/test_img02.jpg"/>" alt="" class="pro_p">User name</p>
										<p><img src="<c:url value="/resources/img/feed/test_icon06.png"/>" alt="" class="pro_icon"><span>0</span><img src="<c:url value="/resources/img/feed/test_icon07.png"/>" alt="" class="pro_icon"><span>0</span></p>
									</div>		
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>