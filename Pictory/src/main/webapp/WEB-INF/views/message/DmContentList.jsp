<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/page2.css"/> "/>
	<link rel="stylesheet" href="<c:url value="/resources/css/feed/dm.css"/> "/>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/feed/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/feed/modernizr.js"></script>
	<script>
	console.log("콘텐츠 로드됨?")
	</script>
<c:forEach var="tmp" items="${clist }">
	
	<c:choose>
		<c:when test="${sessionScope.userId ne tmp.sendNick }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
				<a href="other_profile.do?other_nick=${tmp.sendNick }">
					<img src="${tmp.userProfile }" alt="">
				</a>
			</div>
			<div class="received_msg">
				<div class="received_withd_msg">
					<p>${tmp.dmContent }</p>
					<span class="time_date"> ${tmp.sendTime }</span>
				</div>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메세지 -->
		<div class="outgoing_msg">
			<div class="sent_msg">
				<p>${tmp.dmContent }</p>
				<span class="time_date"> ${tmp.sendTime }</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>


</c:forEach>