<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link rel="stylesheet" href="<c:url value="/resources/css/notice/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/notice/page2.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/notice.css"/>"/>

    <script src="${pageContext.request.contextPath}/resources/js/notice/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/notice/html5shiv.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/notice/tab.js"></script>
 <!--font library-->
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 <style>
 *{font-family: 'Noto Sans KR', sans-serif;}
 </style>
 </head>
<body>	
   <form method="post" action="<c:url value="/notice/Index.do"/>" accept-charset="UTF-8">
       
   <div>
	  <img class="top_bg" src="<c:url value="/resources/img/notice/qnabg.jpg"/>" style="width:1900px ; height: 300px;">
		</div><br>
		<header id="introduction">
              <br> <h3 style="text-align: center; color: black;">공 지 사 항</h3>
            </header>
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="rounded p-4">
                
                    <table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td>${record.noticeNo}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">글쓴이</th>
				<td>${record.userId }</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성일</th>
				<td>${record.noticeDate}</td>
			</tr>

			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td>${record.noticeTitle}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="10">내 용</th>
			</tr>
			<tr>
				<td colspan="2" class="text-center">${record.noticeContent }</td>
			</tr>
		</tbody>
	</table>
              
            <!-- Widgets End -->
            
            
            
            </div>
        </div><!--  -->
      
    </div><!--  -->

  
    <!-- Template Javascript -->

    <script>
    //Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});
</script>
</body>

</html>