<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<link rel="stylesheet" href="<c:url value="/resources/css/notice/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/notice/page2.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/notice.css"/>"/>

    <script src="${pageContext.request.contextPath}/resources/js/notice/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/notice/html5shiv.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/notice/tab.js"></script>
 
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
                
                    <div class="searchbox" style="margin-top:10px; margin-bottom:10px; ">
                        <!--정렬 (가입일순 / 생년월일 / 주소(시) / )-->
                        <div class="dropdown" style="margin-left: 20px;">
                   
                            <button type="button" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
                                정렬
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">날짜</a>
                                <a class="dropdown-item" href="#">구매자</a>
                                <a class="dropdown-item-text" href="#">구매목록</a>
                            </div>
                        </div>
                           <!--search-->
                           <div align="right">
                           <input type="text" placeholder="검색">
                            <button class="btn btn-primary btn-sm" type="button" onclick="location.href='joinUs.jsp' ">검색</button>
                            </div>
                        <!--search-->
                   
                   
          	</div>

            <!-- Sales Chart Start -->
            <div class="table-responsive">
            <table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-1">번호</th>
                      <th class="col-6">제목</th>
                      <th class="col-1">아이디</th>
                      <th class="col-1">작성일</th>
                    </tr>
                </thead>
                <tbody class="table-sm">
					<c:if test="${empty list}" var="isEmpty">
						<tr>
							<td colspan="4">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
						<c:if test="${not isEmpty}">
							<c:forEach var="record" items="${list}" varStatus="loop">
								<tr>
									<td>${record.noticeNo}</td>				
									<td class="text-left">${record.noticeTitle}</td>
									<td>${record.userNo}</td>	
									<td>${record.noticeDate}</td>	
								</tr>
							</c:forEach>
						</c:if>
					
					
			<!-- 예시 게시물 표현 시작-->
			                 <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="${pageContext.request.contextPath}/notice/NoticeView.do">공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="${pageContext.request.contextPath}/notice/NoticeView.do">공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			               <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="${pageContext.request.contextPath}/notice/NoticeView.do">공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="${pageContext.request.contextPath}/notice/NoticeView.do">공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="${pageContext.request.contextPath}/notice/NoticeView.do">공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
			                
			                <tr>
			                      <td class="text-center">5</td>
			                      <td><a href="${pageContext.request.contextPath}/notice/NoticeView.do">공지사항입니다</a></td>
			                      <td><a href="memberOne.html">Picktory</a></td>
			                      <td class="text-center">22-06-22</td>
			                </tr>
		    <!-- 예시 게시물 표현 끝-->
		    
              	</tbody>
              </table>
              <div>
              <button class="btn btn-primary btn-sm" style="float: right;" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/notice/UserNoticeWrite.do' ">작성</button>
              </div>
            <!-- Widgets End -->
            
            <ul id="dyn_ul" class="pagination" style="justify-content: center;">
	    <!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>	    
	    <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
	  </ul>
            
            </div>
        </div><!--  -->
      
    </div><!--  -->

  
    <!-- Template Javascript -->
   <script>
        function pagination(){
		var req_num_row=5;
		var $tr=jQuery('tbody tr');
		var total_num_row=$tr.length;
		var num_pages=0;
		if(total_num_row % req_num_row ==0){
			num_pages=total_num_row / req_num_row;
		}
		if(total_num_row % req_num_row >=1){
			num_pages=total_num_row / req_num_row;
			num_pages++;
			num_pages=Math.floor(num_pages++);
		}
  
    jQuery('.pagination').append("<li class=\"page-item\"><a class=\"page-link\" \"prev\">Previous</a></li>");
  
		for(var i=1; i<=num_pages; i++){
			jQuery('.pagination').append("<li class=\"page-item\"><a class=\"page-link\">"+i+"</a></li>");
      jQuery('.pagination li:nth-child(2)').addClass("active");
      jQuery('.pagination a').addClass("pagination-link");
		}
  
    jQuery('.pagination').append("<li class=\"page-item\"><a class=\"page-link\" \"next\">Next</a></li>");
  
		$tr.each(function(i){
      jQuery(this).hide();
      if(i+1 <= req_num_row){
				$tr.eq(i).show();
			}
		});
  
		jQuery('.pagination a').click('.pagination-link', function(e){
			e.preventDefault();
			$tr.hide();
			var page=jQuery(this).text();
			var temp=page-1;
			var start=temp*req_num_row;
      var current_link = temp;
      
      jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");
    
			for(var i=0; i< req_num_row; i++){
				$tr.eq(start+i).show();
			}
      
      if(temp >= 1){
        jQuery('.pagination li:first-child').removeClass("disabled");
      }
      else {
        jQuery('.pagination li:first-child').addClass("disabled");
      }
            
		});
  
    jQuery('.prev').click(function(e){
        e.preventDefault();
        jQuery('.pagination li:first-child').removeClass("active");
    });

    jQuery('.next').click(function(e){
        e.preventDefault();
        jQuery('.pagination li:last-child').removeClass("active");
    });

	}

jQuery('document').ready(function(){
	pagination();
  
  jQuery('.pagination li:first-child').addClass("disabled");
  
});
    </script>
    <script>
    //Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});
</script>
</body>

</html>