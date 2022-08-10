<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>PICTORY</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ScrollButton.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>

<style>
	#show:hover {
    	content: url('http://localhost:4040/springapp/upload/img/chatbotHi.png');
	}
	.background {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100vh;
	  background-color: rgba(0, 0, 0, 0.3);
	  z-index: 1000;
	  
	  /* 숨기기 */
	  z-index: -1;
	  opacity: 0;
	}
	
	.show {
	  opacity: 1;
	  z-index: 1000;
	  transition: all .5s;
	}
	
	.window {
	  position: relative;
	  width: 100%;
	  height: 100%;
	}
	
	.popup {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: #ffffff;
	  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	  
	  /* 임시 지정 */
	  width: 100px;
	  height: 100px;
	  
	  /* 초기에 약간 아래에 배치 */
	  transform: translate(-50%, -40%);
	}
	
	.show .popup {
	  transform: translate(-50%, -50%);
	  transition: all .5s;
	}
</style>

<body>


    <div class="content">
        <nav class="navbar navbar-expand-xl navbar-light fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="<c:url value="/index.do" />">PICTORY</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav navbar-left ">
                    	<% if(session.getAttribute("userId")==null){ %>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Login.do"/>" id="nava">Feed</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Login.do"/>" id="nava">Gallery</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Login.do"/>">Story</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Login.do"/>">Upload</a>
                        </li>
                        <%}else{ %>
                        <li class="nav-item">
                            <a href="<c:url value="/feed/Index.do"/>" id="nava">Feed</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/gallery/GalleryList.do"/>" id="nava">Gallery</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/story/StoryIndex.do"/>">Story</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/gallery/post/Upload1.do"/>">Upload</a>
                        </li>
                        <%} %>
                        
                        <% if(session.getAttribute("userId")==null){ %>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Login.do"/>">Login</a>
                        </li>
                        <%}else{ %>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Logout.do"/>">Logout</a>
                        </li>
                        <%} %>
                        
                        <!-- Dropdown -->   
                        <li class="dropdown">Service
                            <div class="dropdown-content">
                                <a href="<c:url value="/notice/Index.do"/>" id="nava">Notice</a>
                                <a href="<c:url value="/faq/Index.do"/>" id="nava">FaQ</a>
                                <% if(session.getAttribute("userId")=="ADMIN"){ %>
                                <a href="<c:url value="/admin/Index.do"/>" id="nava">Admin</a>
                                <%}%>
                            </div>
                        </li>

                        <li class="dropdown">
                            <img src="${pageContext.request.contextPath}/resources/img/userIcon.png"
                                    style="width:30px; height:30px" />
                            <div class="dropdown-content">
                               <a href="<c:url value="/mypage/Index.do"/>" id="nava">My PICTORY</a>
                               <a href="#" id="nava">Message</a>
                            </div>
                        </li>
                        
                        <li class="nav-item">
                        	<img src="${pageContext.request.contextPath}/resources/img/notification.png"
                                    style="width:30px; height:30px" />
                            <a href="#"></a>
                        </li>

                        <!-- Navbar Form -->
                        <form action="<c:url value="/search/Search.do"/>" method="post" class="navbar-form navbar-right">
                            <div class="form-group d-inline-flex">
                                <input name="searchName" id="searchName" type="text" class="form-control" placeholder="Search">
                                <button type="submit" class="btn">Submit</button>
                            </div>
                        </form>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    
    <!-- 쳇봇 버튼 -->
	<div style="position:fixed; bottom:8.3rem; right:-0.6rem; z-index:99;"> 
		<a href='#'>
		  <img src="<c:url value="http://localhost:4040/springapp/upload/img/chatbot.png"/>" style="width:100px" id="show"> 
		</a>
	</div>
    
   <!-- 스크롤 버튼 -->
	<div class="topBtn"><img src="<c:url value="http://localhost:4040/springapp/resources/img/topbutton.png"/>" style="width:50px;"></div>
    <div class="bottomBtn"><img src="<c:url value="http://localhost:4040/springapp/resources/img/downbutton.png"/>" style="width:50px;"></div>
    
    
</body>
<script>



var topBtn = document.querySelector(".topBtn");
var bottomBtn = document.querySelector(".bottomBtn");


topBtn.addEventListener("click", function(){
    window.scrollTo(document.body.scrollHeight,0);
    
});

bottomBtn.addEventListener("click", function(){
    window.scrollTo(0,document.body.scrollHeight);
    
});

$(document).ready(function(){ 
	   $('#show').on("click", function(){
	      window.open('<c:url value="/Chatbot.do"/>','_blank','toolbar=no, menubar=no, width=500, height=800').focus();
	   });
	});

</script>
</html>