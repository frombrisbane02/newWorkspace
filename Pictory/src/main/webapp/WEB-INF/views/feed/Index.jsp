<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/page2.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/dm.css"/>"/>

    <script src="${pageContext.request.contextPath}/resources/js/feed/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/feed/modernizr.js"></script>
    

	
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
						
						<p><img src="<c:url value="/resources/img/feed/test_icon01.png"/>" alt="">대한민국</p>
						<!-- <p>고길동님과 둘리님이 팔로우중입니다.</p> 나중에 구현 -->
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
					<li><a href="<c:url value="/message/message_list.do"/>" class="white_icon" id="addClass"><span></span>DM</a></li>
					
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
				<ul class="top_tab" role="tablist" id="tab" >
					<li class="tab_link" data-tab="tab1"><a href="Artwork">Artwork <span>갤러리 글수</span></a></li>
					<li class="tab_link" data-tab="tab2"><a href="FeedStory">Story <span>스토리 글수</span></a></li>
					<li class="tab_link" data-tab="tab3"><a href="Likes">Likes <span>좋아요 한 글</span></a></li>
				</ul>
				
        			<div id="myTab2Content" class="tabContent">
          <!-- 데이터 뿌려주기 -->
        	</div>
        
			
		</div>
	</div>
</form>
</body>

</html>

 <script>
	$(document).ready(function(){
		//처음 시작할 땐 MypageProfile이 나와야한다.
		$(".tabContent").load("<c:url value='/feed/Story.do'/>");
		
		//탭 클릭시마다 
		$("#tab li a").on("click", function(e){
			e.preventDefault();
			
			var page=$(this).attr("href");
			console.log("<c:url value='/feed/"+page+".do'/>");
			///
			$(".tabContent").load("<c:url value='/feed/"+page+".do'/>");
		});
	});
</script>