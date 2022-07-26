<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1">
	<title>Search</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search/Searchstyle.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/search/Search.js"></script>

</head>

<body>
	</br>
	</br>
	</br>
	</br>
	</br>
	
	<!-- Actual search box -->
	<div class="form-group has-search">
		<span class="fa fa-search form-control-feedback"></span>
		<input type="search" class="form-control" placeholder="Search">
	</div>
	<div>
		<ul class="nav">
			<li class="button-dropdown">
			  <a href="#" class="dropdown-toggle">작품 <span></span></a>
			  <ul class="dropdown-menu">
				<li ><a href="#" class="selected"  data-value="gallery">작품</a></li>
				<li ><a href="#" class="selected"  data-value="story">스토리</a></li>
				<li ><a href="#" class="selected"  data-value="users">사람</a></li>
			  </ul>
			</li>
			
			<li class="button-dropdown">
			  <a href="#" class="dropdown-toggle">인물 <span></span></a>
			  <ul class="dropdown-menu">
				<li ><a href="#" class="selected"  data-value="figure">인물</a></li>
				<li ><a href="#" class="selected"  data-value="object">정물</a></li>
				<li ><a href="#" class="selected"  data-value="landscape">풍경</a></li>
				<li ><a href="#" class="selected"  data-value="etc">기타</a></li>
			  </ul>
			</li>
			
			<li class="button-dropdown">
			  <a href="#" class="dropdown-toggle">최신순 <span></span></a>
			  <ul class="dropdown-menu">
				<li ><a href="#" class="selected"  data-value="recent">최신순</a></li>
				<li ><a href="#" class="selected"  data-value="select">조회순</a></li>
				<li ><a href="#" class="selected"  data-value="sale">구매순</a></li>
			  </ul>
			</li>
			
			<div class="chk_sale">
				<input type="checkbox" id="chk_sale" class="ipt_chk">
				<label for="chk_sale">판매중인 사진 보기</label>
			</div>
		</ul>
		<div id="searchContent">
		<!-- 메뉴 선택에 따른 페이지 보여주기 -->
		여기에 데이타 뿌려줍니다
		</div>
	</div>
	
</body>

 <script>
 	
    //자스 통해 위에 div에 검색된 데이터들을 뿌려주는 방법을 모색중... 
     
 	//window.onload = function(){
 	//	var searchContent=document.getElementsByTagName("a");
 	//	searchContent.onclick = data;
 	//}
 	//function data(){
 	//	alert('검색결과입니다');
 	//}
 
 
 	
</script>

</html>