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
   <form method="post" action="<c:url value="/notice/noticeView.do"/>" accept-charset="UTF-8">W
   <div>
	  <img class="top_bg" src="<c:url value="/resources/img/notice/qnabg.jpg"/>" style="width:1900px ; height: 300px;">
		</div><br>
		<header id="introduction">
			<h3 style="text-align: center; color: black;">공 지 사 항 상 세 내 용</h3>
		</header>
		<!-- Sale & Revenue Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="rounded p-4">
					
			   
				<!--jumbotron-->
				
		  
			<!--container-->
			<div class="container">
			<br>
				<form method="post" action="">   
					  <input type ="hidden" value= "${param.qnaNo }" name="no">
					  <div class="form-group">
					<h4 style="color:#484554;">제목</h4>
					<input placeholder="제목을 입력하세요"  type="text" class="form-control" name="title"  >
				  </div>
				  
				  <div class="form-group">
					<h4 style="color:#484554;">내용</h4>
					<textarea class="form-control" rows="5" name="content"></textarea>
				  </div>
				</form>	
			</div>
		   
</div><!--content End  -->

</div><!--  -->
</form>
  
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
 
    //Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});
</script>
</body>

</html>