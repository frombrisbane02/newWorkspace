<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/Top.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Upload</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>

<body> 
<br>
<br>
<br>
<br>
<div class="container">
	<div class="card-deck">
		<div class="card">
		  	<a id="notsell" href="<c:url value="/gallery/post/Upload2.do?sellornot=notsell"/>">
		      <img class="card-img" src="${pageContext.request.contextPath}/resources/img/upload/notsell.jpg" alt="notsell" />
		    </a>
		</div>
		<div class="card">
			<a id="sell" href="<c:url value="/gallery/post/Upload2.do?sellornot=sell"/>">
				<img class="card-img" src="${pageContext.request.contextPath}/resources/img/upload/sell.jpg" alt="sell"/>
			</a>
		</div>
	</div>
</div> <!-- container -->



</body>
</html>
