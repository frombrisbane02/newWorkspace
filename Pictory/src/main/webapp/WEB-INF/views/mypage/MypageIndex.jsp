<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">

<body>
  <form>
  <div class="container py-5">
    <!-- For demo purpose -->
    <div class="row mb-5">
      <div class="col-lg-8 text-white py-4 text-center mx-auto">
        <h1 class="display-4">MY PAGE</h1>
        <h6>Pictory My Picture Story</h6>
      </div>
    </div>
    <!-- End -->
  

    <div class="p-5 bg-white rounded shadow mb-5">
        <!-- Lined tabs-->
        <ul id="myTab2" role="tablist" class="nav nav-tabs nav-pills with-arrow lined flex-column flex-sm-row text-center">
          <li class="nav-item flex-sm-fill">
            <a id="home2-tab" data-toggle="tab" href="Profile" role="tab" aria-controls="profile2" aria-selected="true" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 active">Profile</a>
          </li>
          <li class="nav-item flex-sm-fill">
            <a id="Like2-tab" data-toggle="tab" href="Like" role="tab" aria-controls="like2" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0">Like</a>
          </li>
          <li class="nav-item flex-sm-fill">
            <a id="Buy2-tab" data-toggle="tab" href="Buy" role="tab" aria-controls="Buy2" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0">Storage</a>
          </li>
          <li class="nav-item flex-sm-fill">
            <a id="cart2-tab" data-toggle="tab" href="Cart" role="tab" aria-controls="cart2" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0">Cart</a>
          </li>
          <li class="nav-item flex-sm-fill">
            <a id="sell2-tab" data-toggle="tab" href="Profit" role="tab" aria-controls="sell2" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0">Profit</a>
          </li>
          <li class="nav-item flex-sm-fill">
            <a id="alert2-tab" data-toggle="tab" href="Alert" role="tab" aria-controls="alert2" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0">Alert</a>
          </li>
        </ul>
        <div id="myTab2Content" class="tab-content">
          <!-- 데이터 뿌려주기 -->
        </div>
        <!-- End lined tabs -->
    </div>
  </div>
 </form>
</body>

 
 <script>
	$(document).ready(function(){
		//처음 시작할 땐 MypageProfile이 나와야한다.
		$(".tab-content").load("<c:url value='/mypage/Profile.do'/>");
		
		//탭 클릭시마다 
		$("#myTab2 li a").on("click", function(e){
			e.preventDefault();
			
			var page=$(this).attr("href");
			console.log("<c:url value='/mypage/"+page+".do'/>");
			///
			$(".tab-content").load("<c:url value='/mypage/"+page+".do'/>");
		});
	});
</script>