<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>myAlarm</title>
		<meta charset="utf-8">
		<!--gallery css-->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/gallerylist.css"/>">
		<!--font library-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--icon css-->
		<script src="https://kit.fontawesome.com/4e5169080d.js" crossorigin="anonymous"></script>
		<!--bootstrap-->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<!--jquery-->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  </head>

	  <style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
	  </style>

<body>
	<div class="content">
	
	</div>

	</br>
	</br>
	</br>
	</br>
	</br>
	
	<div class="gall_list">
		<div class="top_filter">
			<div class="filter_left">
				<h4 style="font-weight: bold;"><i class="fa-solid fa-bell" style="color:rgb(74, 210, 255)"></i> 나의 알람</h4>
				<a href="<c:url value="/mypage/Index.do"/>" class="filter_btn text-center"><i class="fa-solid fa-circle-left"> 마이페이지로 돌아가기</i></a>
			</div>				
		</div>			
		<div class="row">
			<div class="col-md-12">
				<form action="<c:url value="/mypage/UpdateAlert.do"/>" method="post">	 
					<c:forEach var="alarm" items="${alarmList}">
						<div class="card mb-2">
							<ul class="list-unstyled">
								<!--FIRST LIST ITEM-->
								<li class="media pt-3"> 
									<span class="round pt-2">
										<img src="https://img.icons8.com/bubbles/100/000000/groups.png" class="align-self-start mr-3">
									</span>
									<div class="media-body">
										<input type="hidden" value="${alarm.alarmNo}" name="alarmNo"/>
										<h6 class="user pt-2 ">${alarm.eventUser}</h6>
										<p class="text">${alarm.subject}</p>
										<p class="text">${alarm.content}</p>							
										<p class="text"><small>${alarm.alarmDate}</small></p>
										<button type="submit" >알람확인</button>
									</div>
								</li>
							</ul>
						</div>
					</c:forEach>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>