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

	<!-- Actual search box -->
	<div class="form-group has-search">
		<span class="fa fa-search form-control-feedback"></span>
		<input type="search" class="form-control" placeholder="Search">
	</div>

	<ul class="nav">

		<li class="button-dropdown">
		  <a href="#" class="dropdown-toggle">
			작품 <span></span>
		  </a>
		  <ul class="dropdown-menu">
			<li>
			  <a href="#">
				작품
			  </a>
			</li>
			<li>
			  <a href="#">
				스토리
			  </a>
			</li>
			<li>
			  <a href="#">
				사람
			  </a>
			</li>
		  </ul>
		</li>
		<li class="button-dropdown">
		  <a href="#" class="dropdown-toggle">
			인물 <span></span>
		  </a>
		  <ul class="dropdown-menu">
			<li>
			  <a href="#">
				인물
			  </a>
			</li>
			<li>
			  <a href="#">
				정물
			  </a>
			</li>
			<li>
			  <a href="#">
				풍경
			  </a>
			</li>
			<li>
			  <a href="#">
				기타
			  </a>
			</li>
		  </ul>
		</li>
		<li class="button-dropdown">
		  <a href="#" class="dropdown-toggle">
			최신순 <span></span>
		  </a>
		  <ul class="dropdown-menu">
			<li>
			  <a href="#">
				최신순
			  </a>
			</li>
			<li>
			  <a href="#">
				조회순
			  </a>
			</li>
			<li>
			  <a href="#">
				구매순
			  </a>
			</li>
		  </ul>
		</li>
	  </ul>
	
</body>

</html>