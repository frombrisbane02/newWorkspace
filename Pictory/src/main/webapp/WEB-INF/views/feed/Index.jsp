<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1">
	<title>Feed</title>

	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<link rel="apple-touch-icon" href="img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/galleryview/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/gallerylist/gallerylist.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/feed/feedstory.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/feed/page2.css">

	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>

<body>
<form method="post" action="<c:url value="/feed/Index.do?userNo=${feedInfo.userNo}"/>" accept-charset="UTF-8">
	<div class="gray_box">
		<div class="top_bg" style="background-image: url(<c:url value="/resources/img/feed/test_img01.jpg"/>);"></div>
		<div class="main_area">
			<div class="left_pro">
				<div class="top_pro">
					<img src="${feedInfo.userProfile}" alt="" class="pro_img">
					<div class="txt_area">
						<h3>${feedInfo.userNickname}</h3>
						
						<p><img src="<c:url value="/resources/img/feed/test_icon01.png"/>" alt="">대한민국</p>
						<!-- <p>고길동님과 둘리님이 팔로우중입니다.</p> 나중에 구현 -->
					</div>
				</div>
				<ul class="count_list">
					<li>
						<h3>${feedInfo.postNo}</h3>
						<p>게시글</p>
					</li>
					<li>
						<h3>${feedInfo.postLikes}</h3>
						<p>좋아요</p>
					</li>
					<li>
						<h3>${feedInfo.userFing}</h3>
						<p>팔로잉</p>
					</li>
					<li>
						<h3>${feedInfo.userFwer}</h3>
						<p>팔로워</p>
					</li>
				</ul>
				<ul class="btn_area">
					<li><a href="" class="black_icon"><img src="${pageContext.request.contextPath}/resources/img/feed/test_icon02.png"/>Following</a></li>
					<li><a href="" class="white_icon" id="addClass" style="color:black;">DM</a></li>
					
				</ul>
				<div class="best_project">
					<h3 class="sub_tit">Best Project</h3>
					<div class="img_box" style="background-image: url(${pageContext.request.contextPath}/resources/img/feed/test_img03.jpg)">
						<a href="">
							<img src="${pageContext.request.contextPath}/resources/img/feed/fake01.png" alt="">
						</a>
					</div>
				</div>
				<div class="about_me">
					<h3 class="sub_tit">About me</h3>
					<p>${feedInfo.userSelf}</p>
				</div>
				<div class="contacts">
					<h3 class="sub_tit">Contacts</h3>
					<p><img src="<c:url value="/resources/img/feed/test_icon04.png"/>" alt="">이거는 뭘까요</p>
					<p><img src="<c:url value="/resources/img/feed/test_icon05.png"/>" alt="">010-0000-0000</p>
					<p><img src="<c:url value="/resources/img/feed/test_icon01.png"/>" alt="">서울시 서울구 서울동 12-345</p>
				</div>
			</div>
			<div class="right_list">
				<ul class="top_tab" role="tablist" id="tab">
					<li class="tab_link" data-tab="tab1"><a href="Artwork" style="color:black;">Artwork <span>갤러리 글수</span></a></li>
					<li class="tab_link" data-tab="tab2"><a href="FeedStory" style="color:black;">Story <span>스토리 글수</span></a></li>
					<li class="tab_link" data-tab="tab3"><a href="Likes" style="color:black;">Likes <span>좋아요 한 글</span></a></li>
				</ul>
				
        			<div id="myTab2Content" class="tabContent">
          <!-- 데이터 뿌려주기 -->
        	</div>
        <div id="dmContent" class="dmList">
          <!-- 데이터 뿌려주기 -->
        	</div>
		</div>
	</div>
</form>
</body>
</html>

 <script>
	$(document).ready(function(){
		
		$(".tabContent").load("<c:url value='/feed/Artwork.do?userNo=${feedInfo.userNo}'/>");
		//$(".tabContent").load("<c:url value='/feed/Artwork.do'/>");
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
	<script>
	/*$(document).ready(function(){
		
		//탭 클릭시마다 
		
		$("#addClass").on("click", function(e){
			e.preventDefault();
			$(".dmList").load("<c:url value='/feed/FeedIndex.do'/>");
			$('#sidebar_secondary').addClass('popup-box-on')
		});
			///
			 $("#removeClass").click(function () {
				  $('#sidebar_secondary').removeClass('popup-box-on');
				    });
		});
		*/
	</script>