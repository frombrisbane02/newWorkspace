<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<title>Navbar.html</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<script>
    //Navbar script
    $(document).ready(function() {
        // Calculating the distance from the top of the page to the initial position of the navbar, and store it in a variable
        var navbarOffest = $(".navbar").offset().top;
    
        $(window).on("scroll", function() {
        var navbarHeight = $(".navbar").outerHeight();
    
        if ($(window).scrollTop() >= navbarOffest) {
            $(".navbar").addClass("navbar-fixed-top");
            $("body").css("padding-top", navbarHeight + "px");
        } else {
            $(".navbar").removeClass("navbar-fixed-top");
            $("body").css("padding-top", "0");
        }
        });
    });
</script>


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
                        <li class="nav-item">
                            <a href="<c:url value="/feed/Index.do"/>" id="nava">Feed</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/gallery/Index.do"/>" id="nava">Gallery</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/story/StoryIndex.do"/>">Story</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/Index.do"/>">Admin</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/gallery/post/Upload1.do"/>">Upload</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/auth/Login.do"/>">Login</a>
                        </li>
                        <!-- 쳇봇 나중에 lightframe으로 하단에서 접근 할 수 있도록 변경할 예정, 임시로 nav에 만들었습니다. -->
                        <li class="nav-item">
                            <a href="<c:url value="/Chatbot.do"/>">Chatbot</a>
                        </li>
                        <!-- Dropdown -->   
                        <li class="dropdown">Service
                            <div class="dropdown-content">
                                <a href="<c:url value="/notice/Index.do"/>" id="nava">Notice</a>
                                <a href="<c:url value="/faq/Index.do"/>" id="nava">FaQ</a>
                            </div>
                        </li>

                        <li class="dropdown">
                            <img src="${pageContext.request.contextPath}/resources/img/userIcon.png"
                                    style="width:30px; height:30px" />
                            <div class="dropdown-content">
                               <a href="<c:url value="/mypage/Index.do"/>" id="nava">My PICTORY</a> 
                                <a href="#" id="nava">Notification</a>
                                <a href="#" id="nava">Message</a>
                            </div>
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
    
</body>
</html>