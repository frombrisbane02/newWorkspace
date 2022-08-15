<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Upload</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>
<style>
*{font-family: 'Noto Sans KR', sans-serif;}

body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<body> 
<br>
<br>
<br>
<br>
<div class="container">
	<div class="card-deck">
		<div class="card">
		  	<a id="notsell" href="<c:url value="/gallery/post/Upload2.do?sellornot=notsell"/>">
		      <img class="card-img" src="${pageContext.request.contextPath}/resources/img/upload/sell.png" alt="notsell" />
		    </a>
		</div>
		<div class="card">
			<a id="sell" href="<c:url value="/gallery/post/Upload2.do?sellornot=sell"/>">
				<img class="card-img" src="${pageContext.request.contextPath}/resources/img/upload/notsell.png" alt="sell"/>
			</a>
		</div>
	</div>
</div> <!-- container -->



</body>
</html>
