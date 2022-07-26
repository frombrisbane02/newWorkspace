<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Picktory-매출 통계 페이지 </title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">
	
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--font/icon (DASHMIN) -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!--JavaScript Libraries(DASHMIN) -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/admin.css">
    <!--bootstrap-->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/AdminInex.css">
	<script
	src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/AdminIndex.css"
	rel="stylesheet" />
    <title>Document</title>
        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
        
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
<style>
:root {
    --primary: #009CFF;
    --light: #F3F6F9;
    --dark: #191C24;
}

.back-to-top {
    position: fixed;
    display: none;
    right: 45px;
    bottom: 45px;
    z-index: 99;
}


/*** Spinner ***/
#spinner {
    opacity: 0;
    visibility: hidden;
    transition: opacity .5s ease-out, visibility 0s linear .5s;
    z-index: 99999;
}

#spinner.show {
    transition: opacity .5s ease-out, visibility 0s linear 0s;
    visibility: visible;
    opacity: 1;
}


/*** Button ***/
.btn {
    transition: .5s;
}

button {
  background: #009CFF;
  color: #FFFFFF;
  border: 0px;
  height: 30px;
}

.btn.btn-primary {
    color: #FFFFFF;
}

.btn-square {
    width: 38px;
    height: 38px;
}

.btn-sm-square {
    width: 32px;
    height: 32px;
}

.btn-lg-square {
    width: 48px;
    height: 48px;
}

.btn-square,
.btn-sm-square,
.btn-lg-square {
    padding: 0;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-weight: normal;
    border-radius: 50px;
}


/*** Layout ***/
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    width: 250px;
    height: 100vh;
    overflow-y: auto;
    background: var(--light);
    transition: 0.5s;
    z-index: 999;
}

.content {
    margin-left: 250px;
    min-height: 100vh;
    background: #FFFFFF;
    transition: 0.5s;
}

@media (min-width: 992px) {
    .sidebar {
        margin-left: 0;
    }

    .sidebar.open {
        margin-left: -250px;
    }

    .content {
        width: calc(100% - 250px);
    }

    .content.open {
        width: 100%;
        margin-left: 0;
    }
}

@media (max-width: 991.98px) {
    .sidebar {
        margin-left: -250px;
    }

    .sidebar.open {
        margin-left: 0;
    }

    .content {
        width: 100%;
        margin-left: 0;
    }
}


/*** Navbar ***/
.sidebar .navbar .navbar-nav .nav-link {
    padding: 7px 20px;
    color: var(--dark);
    font-weight: 500;
    border-left: 3px solid var(--light);
    border-radius: 0 30px 30px 0;
    outline: none;
}

.sidebar .navbar .navbar-nav .nav-link:hover,
.sidebar .navbar .navbar-nav .nav-link.active {
    color: var(--primary);
    background: #FFFFFF;
    border-color: var(--primary);
}

.sidebar .navbar .navbar-nav .nav-link i {
    width: 40px;
    height: 40px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: #FFFFFF;
    border-radius: 40px;
}

.sidebar .navbar .navbar-nav .nav-link:hover i,
.sidebar .navbar .navbar-nav .nav-link.active i {
    background: var(--light);
}

.sidebar .navbar .dropdown-toggle::after {
    position: absolute;
    top: 15px;
    right: 15px;
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    transition: .5s;
}

.sidebar .navbar .dropdown-toggle[aria-expanded=true]::after {
    transform: rotate(-180deg);
}

.sidebar .navbar .dropdown-item {
    padding-left: 25px;
    border-radius: 0 30px 30px 0;
}

.content .navbar .navbar-nav .nav-link {
    margin-left: 25px;
    padding: 12px 0;
    color: var(--dark);
    outline: none;
}

.content .navbar .navbar-nav .nav-link:hover,
.content .navbar .navbar-nav .nav-link.active {
    color: var(--primary);
}

.content .navbar .sidebar-toggler,
.content .navbar .navbar-nav .nav-link i {
    width: 40px;
    height: 40px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: #FFFFFF;
    border-radius: 40px;
}

.content .navbar .dropdown-toggle::after {
    margin-left: 6px;
    vertical-align: middle;
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    transition: .5s;
}

.content .navbar .dropdown-toggle[aria-expanded=true]::after {
    transform: rotate(-180deg);
}

@media (max-width: 575.98px) {
    .content .navbar .navbar-nav .nav-link {
        margin-left: 15px;
    }
}


/*** Date Picker ***/
.bootstrap-datetimepicker-widget.bottom {
    top: auto !important;
}

.bootstrap-datetimepicker-widget .table * {
    border-bottom-width: 0px;
}

.bootstrap-datetimepicker-widget .table th {
    font-weight: 500;
}

.bootstrap-datetimepicker-widget.dropdown-menu {
    padding: 10px;
    border-radius: 2px;
}

.bootstrap-datetimepicker-widget table td.active,
.bootstrap-datetimepicker-widget table td.active:hover {
    background: var(--primary);
}

.bootstrap-datetimepicker-widget table td.today::before {
    border-bottom-color: var(--primary);
}


/*** Testimonial ***/
.progress .progress-bar {
    width: 0px;
    transition: 2s;
}


/*** Testimonial ***/
.testimonial-carousel .owl-dots {
    margin-top: 24px;
    display: flex;
    align-items: flex-end;
    justify-content: center;
}

.testimonial-carousel .owl-dot {
    position: relative;
    display: inline-block;
    margin: 0 5px;
    width: 15px;
    height: 15px;
    border: 5px solid var(--primary);
    border-radius: 15px;
    transition: .5s;
}

.testimonial-carousel .owl-dot.active {
    background: var(--dark);
    border-color: var(--primary);
}


/**new**/

.searchbox{
    display: flex;
    justify-content: space-between;
width: 97%;
}



@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400|Inconsolata);
:root {
  --primary: #009CFF;
  --light: #F3F6F9;
  --dark: #191C24;
}

.back-to-top {
  position: fixed;
  display: none;
  right: 45px;
  bottom: 45px;
  z-index: 99;
}
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    width: 250px;
    height: 100vh;
    overflow-y: auto;
    background: var(--light);
    transition: 0.5s;
    z-index: 999;
}
.content {
  margin-left: 250px;
  min-height: 100vh;
  background: #FFFFFF;
  transition: 0.5s;
}
@media (min-width: 992px) {
    .sidebar {
        margin-left: 0;
    }

    .sidebar.open {
        margin-left: -250px;
    }
    .content {
      width: calc(100% - 250px);
  }

  .content.open {
      width: 100%;
      margin-left: 0;
  }
}

@media (max-width: 991.98px) {
    .sidebar {
        margin-left: -250px;
    }

    .sidebar.open {
        margin-left: 0;
    }

    .content {
        width: 100%;
        margin-left: 0;
    }
}
/*** Navbar ***/
.sidebar .navbar .navbar-nav .nav-link {
    padding: 7px 20px;
    color: var(--dark);
    font-weight: 500;
    border-left: 3px solid var(--light);
    border-radius: 0 30px 30px 0;
    outline: none;
}

.sidebar .navbar .navbar-nav .nav-link:hover,
.sidebar .navbar .navbar-nav .nav-link.active {
    color: var(--primary);
    background: #FFFFFF;
    border-color: var(--primary);
}

.sidebar .navbar .navbar-nav .nav-link i {
    width: 40px;
    height: 40px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: #FFFFFF;
    border-radius: 40px;
}

.sidebar .navbar .navbar-nav .nav-link:hover i,
.sidebar .navbar .navbar-nav .nav-link.active i {
    background: var(--light);
}

.sidebar .navbar .dropdown-toggle::after {
    position: absolute;
    top: 15px;
    right: 15px;
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    transition: .5s;
}

.sidebar .navbar .dropdown-toggle[aria-expanded=true]::after {
    transform: rotate(-180deg);
}

.sidebar .navbar .dropdown-item {
    padding-left: 25px;
    border-radius: 0 30px 30px 0;
}
.content .navbar .navbar-nav .nav-link {
  margin-left: 25px;
  padding: 12px 0;
  color: var(--dark);
  outline: none;
}
.content .navbar .navbar-nav .nav-link:hover,
.content .navbar .navbar-nav .nav-link.active {
    color: var(--primary);
}
.content .navbar .sidebar-toggler,
.content .navbar .navbar-nav .nav-link i {
    width: 40px;
    height: 40px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: #FFFFFF;
    border-radius: 40px;
}
.content .navbar .dropdown-toggle[aria-expanded=true]::after {
  transform: rotate(-180deg);
}
@media (max-width: 575.98px) {
  .content .navbar .navbar-nav .nav-link {
      margin-left: 15px;
  }
}
.bootstrap-datetimepicker-widget.bottom {
  top: auto !important;
}

.bootstrap-datetimepicker-widget .table * {
  border-bottom-width: 0px;
}

.bootstrap-datetimepicker-widget .table th {
  font-weight: 500;
}

.bootstrap-datetimepicker-widget.dropdown-menu {
  padding: 10px;
  border-radius: 2px;
}

.bootstrap-datetimepicker-widget table td.active,
.bootstrap-datetimepicker-widget table td.active:hover {
  background: var(--primary);
}

.bootstrap-datetimepicker-widget table td.today::before {
  border-bottom-color: var(--primary);
}


/*** Testimonial ***/
.progress .progress-bar {
  width: 0px;
  transition: 2s;
}


/*** Testimonial ***/
.testimonial-carousel .owl-dots {
  margin-top: 24px;
  display: flex;
  align-items: flex-end;
  justify-content: center;
}

.testimonial-carousel .owl-dot {
  position: relative;
  display: inline-block;
  margin: 0 5px;
  width: 15px;
  height: 15px;
  border: 5px solid var(--primary);
  border-radius: 15px;
  transition: .5s;
}

.testimonial-carousel .owl-dot.active {
  background: var(--dark);
  border-color: var(--primary);
}
ul#tabs-list {
  list-style: none;
  text-align: left;
  border-bottom: 1px solid #009CFF;
  margin: 0;
  
}

label.panel-label {
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  display: block;
  width: 100%;
  color: #111;
  cursor: pointer;
  background-color: #ecf0f1;
  transition-property: background-color, color;
  transition-duration: 200ms;
}
label.panel-label:hover {
  color: #FFFFFF;
  background-color: #009CFF;
}

#panels {
  background-color: #FFFFFF;
}
#panels .container {
  margin: 0 auto;
  width: 100%;
}
#panels section header label.panel-label {
  padding: 12px 24px;
  box-sizing: border-box;
}
#panels section main {
  box-sizing: border-box;
  max-height: 0;
  opacity: 0;
  transition: opacity 600ms;
  overflow-y: hidden;
  width: auto;
}

#panel-1-ctrl:checked ~ #panels #panel-1 main {
  max-height: initial;
  opacity: 1;
  padding: 48px 24px;
}

#panel-2-ctrl:checked ~ #panels #panel-2 main {
  max-height: initial;
  opacity: 1;
  padding: 48px 24px;
}

#panel-3-ctrl:checked ~ #panels #panel-3 main {
  max-height: initial;
  opacity: 1;
  padding: 48px 24px;
}


@media all and (max-width: 767px) {
  #nav-ctrl:checked ~ #tabs-list #li-for-panel-1 {
    max-height: 46px;
    opacity: 1;
    
  }

  #nav-ctrl:checked ~ #tabs-list #li-for-panel-2 {
    max-height: 46px;
    opacity: 1;
  }

  #nav-ctrl:checked ~ #tabs-list #li-for-panel-3 {
    max-height: 46px;
    opacity: 1;
  }

  

  #open-nav-label {
    display: block;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    cursor: pointer;
  }

  #nav-ctrl:checked ~ #tabs-list #open-nav-label {
    display: none;
    
  }

  #close-nav-label {
    display: block;
    max-height: 0;
    overflow-y: hidden;
    background-color: #444444;
    color: #ecf0f1;
    padding: 0px;
    transition: max-height 200ms;
    cursor: pointer;
    text-transform: uppercase;
    font-size: 12px;
    line-height: 22px;
    letter-spacing: 1px;
    
  }

  #nav-ctrl:checked ~ #tabs-list #close-nav-label {
    max-height: 36px;
    opacity: 1;
    padding: 12px 24px;
  }

  #tabs-list {
    position: relative;
  }
  #tabs-list label.panel-label {
    padding: 12px 0;
  }
  #tabs-list #li-for-panel-1 {
    max-height: 0;
    overflow-y: hidden;
    transition: max-height 200ms;
    
  }
  #tabs-list #li-for-panel-2 {
    max-height: 0;
    overflow-y: hidden;
    transition: max-height 200ms;
  }
  #tabs-list #li-for-panel-3 {
    max-height: 0;
    overflow-y: hidden;
    transition: max-height 200ms;
  }
  

  #panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 {
    max-height: 46px;
    opacity: 1;
   
  }


  #panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 {
    max-height: 46px;
    opacity: 1;
  }


  #panel-3-ctrl:checked ~ #tabs-list #li-for-panel-3 {
    max-height: 46px;
    opacity: 1;
  }

  #panels .container {
    width: 100%;
  }
  #panels section header {
    display: block;
  }
}
@media all and (min-width: 768px) {
  #panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 {
    pointer-events: none;
    cursor: default;
    transform: translate3d(0, 1px, 0);
    box-shadow: none;
    border-right: none;
    background-color: #009CFF;
  }
  #panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1.last {
    border-right: 1px solid transparent;
  }
  #panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 + li {
    border-left: 1px solid #dfdfdf;
  }

  #panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 label.panel-label::after {
    height: 6px;
  }

  #panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 {
    pointer-events: none;
    cursor: default;
    transform: translate3d(0, 1px, 0);
    box-shadow: none;
    border-right: none;
    background-color: #009CFF;
  }
  #panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2.last {
    border-right: 1px solid transparent;
  }
  #panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 + li {
    border-left: 1px solid #dfdfdf;
  }

  #panel-2-ctrl:checked ~ #tabs-list #li-for-panel-2 label.panel-label::after {
    height: 6px;
  }

  #panel-3-ctrl:checked ~ #tabs-list #li-for-panel-3 {
    pointer-events: none;
    cursor: default;
    transform: translate3d(0, 1px, 0);
    box-shadow: none;
    border-right: none;
    background-color: #009CFF;
  }
  #panel-3-ctrl:checked ~ #tabs-list #li-for-panel-3.last {
    border-right: 1px solid transparent;
  }
  #panel-3-ctrl:checked ~ #tabs-list #li-for-panel-3 + li {
    border-left: 1px solid #dfdfdf;
  }

  #panel-3-ctrl:checked ~ #tabs-list #li-for-panel-3 label.panel-label::after {
    height: 6px;
  }

  ul#tabs-list {
    text-align: left;
    border-bottom: 1px solid #dfdfdf;
  }
  ul#tabs-list li {
    display: inline-block;
    text-align: center;
    font-size: 0.875em;
    width: 18%;
    box-shadow: 0px -2px 2px rgba(0, 0, 0, 0.05);
    border-right: 1px solid #dfdfdf;
    position: relative;
  }
  ul#tabs-list li:hover {
    transition: none;
    border-right: none;
  }
  ul#tabs-list li:hover.last {
    border-right: 1px solid transparent;
  }
  ul#tabs-list li:hover + li {
    border-left: 1px solid #FFFFFF;
  }
  ul#tabs-list li label.panel-label {
    position: relative;
    padding: 24px 0;
  }
  
  ul#tabs-list li label.panel-label:hover {
    padding-top: 25px;
  }
  ul#tabs-list li label.panel-label:hover::after {
    height: 6px;
  }

  #open-nav-label,
#close-nav-label {
    display: none;
  }

  #nav-ctrl {
    display: none;
  }
}
@media all and (min-width: 900px) {
  main {
    width: 70%;
    margin: 0 auto;
    
  }
}
.panel-radios {
  position: fixed;
  left: 50%;
  top: 10px;
  width: 20px;
  opacity: 0.5;
  z-index: 99;
}
.panel-radios:nth-child(1) {
  transform: translateX(-50px);
}
.panel-radios:nth-child(2) {
  transform: translateX(-30px);
}
.panel-radios:nth-child(3) {
  transform: translateX(-10px);
}
.panel-radios:nth-child(4) {
  transform: translateX(10px);
}
.panel-radios:nth-child(5) {
  transform: translateX(30px);
}
.panel-radios:nth-child(6) {
  top: 30px;
  transform: translateX(-10px);
  display: block;
}



#introduction {
  width: 100%;
  margin: 0 auto;
  padding: 48px 24px;
  color: white;
  
}
#introduction h1 {
  font-weight: 300;
  text-align: center;
}


main p {
  line-height: 1.8;
}
main hr {
  margin: 12px 0;
  border-top: 1px solid #dfdfdf;
}




#demo-child-toggle {
  display: none;
}


#demo-parent {
  margin-top: 8px;
}

code,
code {
  padding: 2px 6px;
}

pre {
  padding: 12px;
  line-height: 1.6;
}
pre strong {
  color: #444444;
  font-weight: normal;
}



/* section calendar */

.sec_cal {
  width: 360px;
  margin: 0 auto;
  font-family: "NotoSansR";
}

.sec_cal .cal_nav {
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: 700;
  font-size: 48px;
  line-height: 78px;
}

.sec_cal .cal_nav .year-month {
  width: 300px;
  text-align: center;
  line-height: 1;
}

.sec_cal .cal_nav .nav {
  display: flex;
  border: 1px solid #333333;
  border-radius: 5px;
}

.sec_cal .cal_nav .go-prev,
.sec_cal .cal_nav .go-next {
  display: block;
  width: 50px;
  height: 78px;
  font-size: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

.sec_cal .cal_nav .go-prev::before,
.sec_cal .cal_nav .go-next::before {
  content: "";
  display: block;
  width: 20px;
  height: 20px;
  border: 3px solid #000;
  border-width: 3px 3px 0 0;
  transition: border 0.1s;
}

.sec_cal .cal_nav .go-prev:hover::before,
.sec_cal .cal_nav .go-next:hover::before {
  border-color: #009CFF;
}

.sec_cal .cal_nav .go-prev::before {
  transform: rotate(-135deg);
}

.sec_cal .cal_nav .go-next::before {
  transform: rotate(45deg);
}

.sec_cal .cal_wrap {
  padding-top: 40px;
  position: relative;
  margin: 0 auto;
}

.sec_cal .cal_wrap .days {
  display: flex;
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #ddd;
}

.sec_cal .cal_wrap::after {
  top: 368px;
}

.sec_cal .cal_wrap .day {
  display:flex;
  align-items: center;
  justify-content: center;
  width: calc(100% / 7);
  text-align: left;
  color: #999;
  font-size: 12px;
  text-align: center;
  border-radius:5px
}

.current.today {background: rgb(242 242 242);}

.sec_cal .cal_wrap .dates {
  display: flex;
  flex-flow: wrap;
  height: 290px;
}

.sec_cal .cal_wrap .day:nth-child(7n -1) {
  color: #3c6ffa;
}

.sec_cal .cal_wrap .day:nth-child(7n) {
  color: #ed2a61;
}

.sec_cal .cal_wrap .day.disable {
  color: #ddd;
}
</style>
</head>

<body>
    <div class="container-s position-relative bg-white d-flex p-0">

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="${pageContext.request.contextPath}/admin/Index.do" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>PICKTORY</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/test_img05.jpg" alt="" style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Picktory</h6>
                        <span>관리자</span>
                    </div>
                </div>
                    <div class="navbar-nav w-100">
                        <a href="${pageContext.request.contextPath}/admin/Index.do" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>관리자 메인</a>
                        
                        <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>통계</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="${pageContext.request.contextPath}/admin/analysis/VisitChart.do" class="dropdown-item">방문자 수(일/주/월)</a>
                                <a href="${pageContext.request.contextPath}/admin/analysis/SalesChart.do" class="dropdown-item">매출(일/주/월)</a>
                                <a href="${pageContext.request.contextPath}/admin/analysis/MemberChart.do" class="dropdown-item">회원 수(일/주/월)</a>
                                <a href="${pageContext.request.contextPath}/admin/analysis/GalleryStoryChart.do" class="dropdown-item">갤러리 / 스토리(일/주/월)</a>
                            </div>
                        </div>
            
                    <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>회원관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/admin/manager/MemberList.do" class="dropdown-item">회원정보</a>
                            <a href="${pageContext.request.contextPath}/admin/manager/RecentPurchase.do" class="dropdown-item">최근 구매/판매 목록</a>
                            <a href="#" class="dropdown-item">즐겨찾기 목록</a>
                            <a href="#" class="dropdown-item">최근 게시물 및 댓글 목록</a>
                        </div>
                    </div>
                   
                 <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Q&A 및 공지</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="${pageContext.request.contextPath}/admin/notice/AdminNotice.do" class="dropdown-item">공지사항</a>
                    <a href="${pageContext.request.contextPath}/admin/notice/QNA.do" class="dropdown-item">Q&A</a>
                    <a href="${pageContext.request.contextPath}/admin/notice/Report.do" class="dropdown-item">신고리스트</a>
                </div>
             </div>
                    <a href="##" class="nav-item nav-link"><i class="fa fa-table me-2"></i>수익 정산관리</a>


                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <div class="content">

            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0 justify-content-end">
                <a href="Index.do" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-envelope me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">메세지</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/user.jpg" alt=""
                                        style="width: 40px; height: 40px;">
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/user.jpg" alt=""
                                        style="width: 40px; height: 40px;">
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/user.jpg" alt=""
                                        style="width: 40px; height: 40px;">
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all message</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">알람</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Profile updated</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">New user added</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Password changed</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all notifications</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="${pageContext.request.contextPath}/resources/img/test_img05.jpg" alt=""
                                style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">Picktory</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="${pageContext.request.contextPath}/admin/MemberOne.do" class="dropdown-item">내 정보</a>
                            <a href="${pageContext.request.contextPath}/admin/Login.do" class="dropdown-item">로그아웃</a>
                        </div>
                    </div>
                </div>
            </nav>
            
<!-- TAB CONTROLLERS -->
<input id="panel-1-ctrl"
class="panel-radios" type="radio" name="tab-radios" checked>
<input id="panel-2-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="panel-3-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="panel-4-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="panel-5-ctrl"
class="panel-radios" type="radio" name="tab-radios">
<input id="nav-ctrl"
class="panel-radios" type="checkbox" name="nav-checkbox">


<header id="introduction" class="bg-light">
    <h3 style="text-align: center; color: black;">일 / 주 / 월 갤러리 / 스토리 통계</h3>
</header>

<!-- TABS LIST -->
<ul id="tabs-list" class="bg-light">
<!-- MENU TOGGLE -->
<label id="open-nav-label" for="nav-ctrl"></label>
<li id="li-for-panel-1">
<label class="panel-label"
      for="panel-1-ctrl">일별 총 갤러리/스토리 수</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-2">
<label class="panel-label"
      for="panel-2-ctrl">주차별 총 갤러리/스토리 수</label>
</li><!--INLINE-BLOCK FIX
--><li id="li-for-panel-3">
<label class="panel-label"
      for="panel-3-ctrl">월별 총 갤러리/스토리 수</label>
</li><!--INLINE-BLOCK FIX
--><!--INLINE-BLOCK FIX
-->

</ul>

<!--일일매출 시작-->
<article id="panels">
    <div class="container">
    <section id="panel-1" >
    <main>
        <div class="container-fluid pt-2 px-4">
            <div class="bg-light  rounded p-4">
                <div class="table-responsive">
                    <div class="bg-light text-center rounded p-4">
                     <!--달력 시작-->
                     <div class="sec_cal">
                        <div class="cal_nav">
                          <a href="javascript:;" class="nav-btn go-prev">prev</a>
                          <div class="year-month"></div>
                          <a href="javascript:;" class="nav-btn go-next">next</a>
                        </div>
                        <div class="cal_wrap">
                          <div class="dates"></div>
                        </div>
                     </div>
                    <!--달력 끝-->
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h5 class="mb-0">일별 갤러리 수</h5>
                                    </div>
                                    <div id="div_galleryDayChart">
                                    <canvas id="galleryDayChart" style="width:100%; max: width 1104px;"></canvas>
                                    </div>
                                </div>
                            </div>
        
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h5 class="mb-0">일별 스토리 수</h5>
                                    </div>
                                    <div id=div_storyDayChart">
                                    <canvas id="storyDayChart" style="width:100%; max: width 1104px;"></canvas>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h4 class="mb-0">현재 일별 갤러리/스토리 비율</h4>
                            </div>
                            <canvas id="galleryStoryDayChart" style="height: 370px; width:100%;max-width:600px"></canvas>
                        </div>
                    </div>

                    <div class="col-sm-10 col-xl-10">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">일별 스토리/갤러리 수 표</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr class="thID1">
                                      <!--    <th scope="col">일자</th>
                                        <th scope="col">1일</th>
                                        <th scope="col">2일</th>
                                        <th scope="col">3일</th>
                                        <th scope="col">4일</th>
                                        <th scope="col">5일</th>
                                        <th scope="col">6일</th>
                                        <th scope="col">7일</th>
                                        <th scope="col">8일</th>
                                        <th scope="col">9일</th>
                                        <th scope="col">10일</th>-->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="thID_1">
                                       <!--   <th scope="row">갤러리 수</th> 
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>-->
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="thID_1_1">
                                        <!-- <th scope="row">스토리 수</th>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td> -->
                                    </tr>
                                </tbody>
                                <thead>
                                    <tr class="thID2">
                                       <!--   <th scope="col">일자</th>
                                        <th scope="col">11일</th>
                                        <th scope="col">12일</th>
                                        <th scope="col">13일</th>
                                        <th scope="col">14일</th>
                                        <th scope="col">15일</th>
                                        <th scope="col">16일</th>
                                        <th scope="col">17일</th>
                                        <th scope="col">18일</th>
                                        <th scope="col">19일</th>
                                        <th scope="col">20일</th>-->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="thID_2">
                                       <!--   <th scope="row">갤러리 수</th>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>-->
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="thID_2_1">
                                    <!--     <th scope="row">스토리 수</th>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td> -->
                                    </tr>
                                </tbody>
                                <thead>
                                    <tr class="thID3">
                                     <!--     <th scope="col">일자</th>
                                        <th scope="col">21일</th>
                                        <th scope="col">22일</th>
                                        <th scope="col">23일</th>
                                        <th scope="col">24일</th>
                                        <th scope="col">25일</th>
                                        <th scope="col">26일</th>
                                        <th scope="col">27일</th>
                                        <th scope="col">28일</th>
                                        <th scope="col">29일</th>
                                        <th scope="col">30일</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="thID_3">
                                      <!--    <th scope="row">갤러리 수</th>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>-->
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="thID_3_1">
                                      <!--    <th scope="row">스토리 수</th>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>3</td>-->
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--일일매출표 끝-->
                    <!--총 방문자 합계 시작-->
<div class="col-sm-12 col-xl-7">
    <div class="bg-light rounded h-100 p-4">
        <h3 class="mb-4">현재 총 누적 갤러리/스토리 수 합계</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">현재 총 누적 갤러리/스토리 합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">갤러리 수</th>
                    <td>43</td>
                </tr>
                <tr>
                    <th scope="row">스토리 수</th>
                    <td>43</td>
                </tr>
            </tbody>
        </table>
</div>
 <!--총 방문자 합계 끝-->
                </div>
            </div>
        </div>
    </main>
    </section>
<!--일일매출 끝-->
<!--주매출 시작-->
<section id="panel-2">
    <main>
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light  rounded p-4">
                <div class="table-responsive">
                    <div class="bg-light text-center rounded p-4">
                        <!--달력 시작-->
                    <div class="sec_cal">
                        <div class="cal_nav">
                          <a href="javascript:;" class="nav-btn go-prev">prev</a>
                          <div class="year-month"></div>
                          <a href="javascript:;" class="nav-btn go-next">next</a>
                        </div>
                    </div>
                    <!--달력 끝-->
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h5 class="mb-0">주차별 갤러리 수</h5>
                                    </div>
                                    <canvas id="galleryWeekChart" style="width:100%; max: width 1104px;"></canvas>
                                </div>
                            </div>
        
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h5 class="mb-0">주차별 스토리 수</h5>
                                    </div>
                                    <canvas id="storyWeekChart" style="width:100%;max-width:600px"></canvas>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-12">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h4 class="mb-0">지난 주차별 갤러리/스토리 비율</h4>
                                    </div>
                                    <canvas id="galleryStoryWeekChart" style="height: 370px; width:100%;max-width:600px"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-10">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">주차별 갤러리 / 스토리 표</h3>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">주차</th>
                                        <th scope="col">1주차</th>
                                        <th scope="col">2주차</th>
                                        <th scope="col">3주차</th>
                                        <th scope="col">4주차</th>
                                        <th scope="col">5주차</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">스토리 수</th>
                                        <td>15</td>
                                        <td>30</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">갤러리 수</th>
                                        <td>15</td>
                                        <td>30</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                    </tr>
                                </tbody>
                            </table>
             </div>
        </div>
<!--주차별 표 차트 끝-->
<!--총 누적 방문자 수 합계 시작-->
<div class="col-sm-12 col-xl-7">
    <div class="bg-light rounded h-100 p-4">
        <h3 class="mb-4">현재 총 누적 갤러리 / 스토리 수 합계</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">현재 총 누적 갤러리 / 스토리 수 합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">갤러리 수</th>
                    <td>643</td>
                </tr>
                <tr>
                    <th scope="row">스토리 수</th>
                    <td>343</td>
                </tr>
            </tbody>
        </table>
</div>
        </div>
        <!--총 누적 방문자 수 합계 끝-->
    </div>
</div>
</main>
</section>
<!--주매출 끝-->
<!--달매출 시작-->
<section id="panel-3">
    <main>
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light  rounded p-4">
                <div class="table-responsive">
                    <div class="bg-light text-center rounded p-4">
                        <!--달력 시작-->
                    <div class="sec_cal">
                        <div class="cal_nav">
                          <a href="javascript:;" class="nav-btn go-prev">prev</a>
                          <div class="year-month"></div>
                          <a href="javascript:;" class="nav-btn go-next">next</a>
                        </div>
                    </div>
                    <!--달력 끝-->
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h5 class="mb-0">월별 갤러리 수</h5>
                                    </div>
                                    <canvas id="galleryMonthChart" style="width:100%; max: width 1104px;"></canvas>
                                </div>
                            </div>
        
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h5 class="mb-0">월별 스토리 수</h5>
                                    </div>
                                    <canvas id="storyMonthChart" style="width:100%;max-width:600px"></canvas>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-12">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h4 class="mb-0">지난 월별 갤러리/스토리 비율</h4>
                                    </div>
                                    <canvas id="galleryStoryMonthChart" style="height: 370px; width:100%;max-width:600px"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h3 class="mb-4">월별 총 갤러리 / 스토리 표</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">월별</th>
                                <th scope="col">1월</th>
                                <th scope="col">2월</th>
                                <th scope="col">3월</th>
                                <th scope="col">4월</th>
                                <th scope="col">5월</th>
                                <th scope="col">6월</th>
                                <th scope="col">7월</th>
                                <th scope="col">8월</th>
                                <th scope="col">9월</th>
                                <th scope="col">10월</th>
                                <th scope="col">11월</th>
                                <th scope="col">12월</th>
                            </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">스토리 수</th>
                                        <td>15</td>
                                        <td>30</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>15</td>
                                        <td>30</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">갤러리 수</th>
                                        <td>15</td>
                                        <td>30</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>15</td>
                                        <td>30</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                        <td>20</td>
                                    </tr>
                                </tbody>
                            </table>
             </div>
        </div>
<!--주차별 표 차트 끝-->
<!--총 누적 방문자 수 합계 시작-->
<div class="col-sm-12 col-xl-7">
    <div class="bg-light rounded h-100 p-4">
        <h3 class="mb-4">현재 총 누적 갤러리 / 스토리 수 합계</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">현재 총 누적 갤러리 / 스토리 수 합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">갤러리 수</th>
                    <td>643</td>
                </tr>
                <tr>
                    <th scope="row">스토리 수</th>
                    <td>343</td>
                </tr>
            </tbody>
        </table>
</div>
        </div>
        <!--총 누적 방문자 수 합계 끝-->
    </div>
</div>
</main>
</section>
<!--달 매출 끝-->
</article>
<!-- Chart End -->

<!-- Footer Start -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light rounded-top p-4">
        <div class="row">
            <div class="col-12 col-sm-6 text-center text-sm-start">
                &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
            </div>
            <div class="col-12 col-sm-6 text-center text-sm-end">
                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                Designed By <a href="https://htmlcodex.com">HTML Codex</a>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
</div>
<!-- Content End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>



</body>

<script>
//달력
var monthDay = '';
//달력
$(document).ready(function() {
    calendarInit();
});
/*
    달력 렌더링 할 때 필요한 정보 목록 

    현재 월(초기값 : 현재 시간)
    금월 마지막일 날짜와 요일
    전월 마지막일 날짜와 요일
*/

function calendarInit() {

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
   // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {
    	
    	var aaArr = [];
       	var now = new Date();
    	var month_now = now.getMonth()+1
    	var year_now = now.getFullYear();

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();
        
        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        if(month_now == currentMonth + 1 && currentYear == year_now){
        	$('.go-next').hide();
        }else{
        	$('.go-next').show();
        }
        
        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar.innerHTML = '';
        $(".dates").hide();
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>';
            
            aaArr.push(i);
        }
        
        	aa(aaArr.length);
        	
        
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {        	
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate -1].classList.add('today');
        }
    }

    // 이전달로 이동
    $('.go-prev').on('click', function() {
    	monthDay = '';
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
        aa($('.current').length);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth);
        aa($('.current').length);
    });
}

function aa(monthDay){
	
	
	// 기존 캔버스 삭제
	 $('#galleryDayChart').remove();
	
	// 새로 다시 그림
	 $('#div_galleryDayChart').append('<canvas id="galleryDayChart" style="width: 100%; max: width 1104px;"></canvas>');
	
	var toArr = [];
	var yArr = [];
	
	
	$('.thID1').html('');
	$('.thID2').html('');
	$('.thID3').html('');
	
	$('.thID_1').html('');
	$('.thID_2').html('');
	$('.thID_3').html('');
	
	$('.thID_1_1').html('');
	$('.thID_2_1').html('');
	$('.thID_3_1').html('');
	
	$('.thID1').append('<th scope="col">일자</th>');
	$('.thID2').append('<th scope="col">일자</th>');
	$('.thID3').append('<th scope="col">일자</th>');
	$('.thID_1').append('<th scope="col">갤러리 수</th>');
	$('.thID_2').append('<th scope="col">갤러리 수</th>');
	$('.thID_3').append('<th scope="col">갤러리 수</th>');
	$('.thID_1_1').append('<th scope="col">스토리 수</th>');
	$('.thID_2_1').append('<th scope="col">스토리 수</th>');
	$('.thID_3_1').append('<th scope="col">스토리 수</th>');
	
	
	
	for(var i = 1; i <= monthDay; i++){	
		
		var mm = Math.floor( Math.random() * 500 + 100);
		var ff = Math.floor( Math.random() * 500 + 100);
		
		if(i <= 10){
			$('.thID1').append('<th scope="col">'+ i +'일</th>');
			$('.thID_1').append('<td>'+ mm +'</td>');
			$('.thID_1_1').append('<td>'+ ff +'</td>');
			
		}	
		if( i > 10 && i <= 20){
			$('.thID2').append('<th scope="col">'+ i +'일</th>');
			$('.thID_2').append('<td>'+ mm +'</td>');
			$('.thID_2_1').append('<td>'+ ff +'</td>');
		}
		
		if( i > 20){
			$('.thID3').append('<th scope="col">'+ i +'일</th>');
			$('.thID_3').append('<td>'+ mm +'</td>');
			$('.thID_3_1').append('<td>'+ ff +'</td>');
		}
		
		var bb = i + "일";
		toArr.push(bb);
		yArr.push(mm);
		
	}
	
	let sum = 0;

	for (let i = 0; i < yArr.length; i++) {
	    sum += yArr[i];
	}
	
	$('#total_all').text(sum);
	
	var xValues = toArr;
    var yValues = yArr;

	var barColors = [
	 
	];

	new Chart("galleryDayChart", {
		  type: "bar",
		  data: {
		    labels: xValues,
		    datasets: [{
		      backgroundColor: "rgba(30, 144, 255, 1)",
		      data: yValues
		    }]
		  },
		  options: {
		    legend: {display: false},
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true
		        }
		      }],
		    }
		  }
		});
	
}




</script>

<script>
//일일별 갤러리
//var xValues = ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일", "15일",
//    "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일", "26일", "27일", "28일", "29일", "30일", "31일"];
//var yValues = [2, 4, 1, 5, 7, 2, 10, 12, 8, 3, 2, 4, 1, 5, 7, 2, 10, 12, 8, 3, 2, 4, 1, 5, 7, 2, 10, 12, 8, 3];
//var barColors = [
  
//];

//new Chart("GalleryDayChart", {
//	  type: "bar",
//	  data: {
//	    labels: xValues,
//	    datasets: [{
//	      backgroundColor: "rgba(30, 144, 255, 1)",
//	      data: yValues
//	    }]
//	  },
//	  options: {
//	    legend: {display: false},
//	    scales: {
//	      yAxes: [{
//	        ticks: {
//	          beginAtZero: true
//	        }
//	      }],
//	    }
//	  }
//	});
</script>

<script>
//일일별 스토리
//var xValues = ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일", "15일",
//    "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일", "26일", "27일", "28일", "29일", "30일", "31일"];
//var yValues = [5, 7, 2, 10, 12, 8, 3, 2, 4, 1, 5, 7, 2, 10, 12, 8, 3, 2, 4, 1, 5, 7, 2, 10, 12, 8, 3, 2, 4, 1];
//var barColors = [
  
//];

//new Chart("storyDayChart", {
//	  type: "bar",
//	  data: {
//	    labels: xValues,
//	    datasets: [{
//	      backgroundColor: "rgba(30, 144, 255, 1)",
//	      data: yValues
//	    }]
//	  },
//	  options: {
//	    legend: {display: false},
//	    scales: {
//	      yAxes: [{
//	        ticks: {
//	          beginAtZero: true
//	        }
//	      }],
//	    }
//	  }
//	});
</script>

<script>
//일일별 갤러리와 스토리 비율
var xValues = ["갤러리", "스토리"];
var yValues = [5, 3];
var barColors = [
  "dodgerblue",
  "#00aba9",
  
];

new Chart("galleryStoryDayChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    responsive : false,
    title: {
      display: false
      
    }
  }
});
</script>

<script>
//주차별 매출
var xValues = ["1주차", "2주차", "3주차", "4주차", "5주차"];
var yValues = [99, 135, 170, 130, 190];
var barColors = [
  
 ];

new Chart("visitWeekChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: "rgba(30, 144, 255, 1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }],
	    }
	  }
	});
</script>

<script>
//월별 매출
var xValues = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
var yValues = [99, 135, 170, 130, 190, 180, 270, 244, 436, 342, 234, 544];
var barColors = [
  
 ];

new Chart("visitMonthChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: "rgba(30, 144, 255, 1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }],
	    }
	  }
	});
</script>

<script>
//주차별 갤러리
var xValues = ["1주차", "2주차", "3주차", "4주차", "5주차"];
var yValues = [20, 40, 10, 50, 70];
var barColors = [
  
];

new Chart("galleryWeekChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: "rgba(30, 144, 255, 1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }],
	    }
	  }
	});
</script>

<script>
//주차별 갤러리
var xValues = ["1주차", "2주차", "3주차", "4주차", "5주차"];
var yValues = [50, 70, 20, 100, 120];
var barColors = [
  
];

new Chart("storyWeekChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: "rgba(30, 144, 255, 1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }],
	    }
	  }
	});
</script>

<script>
//주차별 갤러리와 스토리 비율
var xValues = ["갤러리", "스토리"];
var yValues = [32, 45];
var barColors = [
  "dodgerblue",
  "#00aba9",
  
];

new Chart("galleryStoryWeekChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    responsive : false,
    title: {
      display: false
      
    }
  }
});
</script>

<script>
//월별 갤러리
var xValues = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
var yValues = [210, 410, 110, 510, 710, 210, 410, 110, 510, 710, 123, 532];
var barColors = [
  
];

new Chart("galleryMonthChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: "rgba(30, 144, 255, 1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }],
	    }
	  }
	});
</script>

<script>
//월별 갤러리
var xValues = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
var yValues = [510, 710, 210, 1100, 1120, 510, 710, 210, 1100, 1120, 234, 523];
var barColors = [
  
];

new Chart("storyMonthChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: "rgba(30, 144, 255, 1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }],
	    }
	  }
	});
</script>

<script>
//주차별 갤러리와 스토리 비율
var xValues = ["갤러리", "스토리"];
var yValues = [450, 450];
var barColors = [
  "dodgerblue",
  "#00aba9",
  
];

new Chart("galleryStoryMonthChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    responsive : false,
    title: {
      display: false
      
    }
  }
});
</script>

<script>
	function querySales(by) {
		console.log(by.value);
		$.ajax({
			type: "GET",
			url: "<c:url value="/admin/analysis/SalesSummary.do"/>" + "?by=" + by.value,
			dataType: "json",
			success : (data) => {
				document.querySelector("#status").innerHTML =  data.salesData;
			}
		});
	}
</script>

<script>
//Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});
</script>

</html>