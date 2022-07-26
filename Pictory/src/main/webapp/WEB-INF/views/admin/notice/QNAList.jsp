<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Picktory-관리자 메인</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--font/icon (DASHMIN) -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/AdminInex.css">

<!--JavaScript Libraries(DASHMIN) -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/AdminIndex.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/AdminIndex.css"
	rel="stylesheet" />

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
				<a href="Index.do" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-hashtag me-2"></i>PICKTORY
					</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
						<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/test_img05.jpg" alt=""
							style="width: 40px; height: 40px;">
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
					<a href="Index.do" class="nav-item nav-link active"><i
						class="fa fa-tachometer-alt me-2"></i>관리자 메인</a>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>통계</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="analysis/VisitorChart.do" class="dropdown-item">방문자
								수(일/주/월)</a> <a href="analysis/SalesChart.do" class="dropdown-item">매출(일/주/월)</a>
							<a href="analysis/MemberChart.do" class="dropdown-item">회원 수(일/주/월)</a>
							<a href="analysis/GalleryStoryChart.do" class="dropdown-item">갤러리 /
								스토리(일/주/월)</a>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>회원관리</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="manager/MemberList.do" class="dropdown-item">회원정보</a> <a
								href="manager/RecentPurchase.do" class="dropdown-item">최근 구매/판매 목록</a>
							<a href="#" class="dropdown-item">즐겨찾기 목록</a> <a href="#"
								class="dropdown-item">최근 게시물 및 댓글 목록</a>

						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Q&A
							및 공지</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="${pageContext.request.contextPath}/admin/notice/AdminNoticeList.do" class="dropdown-item">공지사항</a> 
							<a href="notice/QNAList.do" class="dropdown-item">Q&A</a>
							<a href="notice/ReportList.do" class="dropdown-item">신고리스트</a>
						</div>
					</div>
					<a href="##" class="nav-item nav-link"><i
						class="fa fa-table me-2"></i>수익 정산관리</a>


				</div>
			</nav>
		</div>
		<!-- Sidebar End -->


		<div class="content">

			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0 justify-content-end">
				<a href="Index.do" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-hashtag"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0 text-left"> <i
					class="fa fa-bars text-left"></i>
				</a>
				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-envelope me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">메세지</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
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
									<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/user.jpg" alt=""
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
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">알람</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">공지사항이 업로드 되었습니다</h6> <small>15
									분 전</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Q&A가 등록되었습니다</h6> <small>20 분
									전</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">신고가 들어왔습니다</h6> <small>25 분 전</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">더 보기</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2" src="${pageContext.request.contextPath}/resources/img/admin/test_img05.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex">Picktory</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="${pageContext.request.contextPath}/admin/manager/MemberOne.do" class="dropdown-item">내 정보</a>
                            <a href="${pageContext.request.contextPath}/admin/Login.do" class="dropdown-item">로그아웃</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->
            <header id="introduction" class="bg-light">
                <h3 style="text-align: center; color: black;">Q & A</h3>
            </header>
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light  rounded p-4">
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
                           <div>
                            <input type="text" placeholder="검색">
                            <button>검색</button>
                            </div>
                        <!--search-->
                    </div> 
          

            <!-- Sales Chart Start -->
            <table class="table table-hover text-center">
                <thead>
                  <tr class="table-secondary text-center">
                      <th class="col-1">번호</th>
                      <th class="col-7">제목</th>
                      <th class="col-2">아이디</th>
                      <th class="col-1">이름</th>
                      <th class="col-1">조회수</th>
                      <th class="col-1">작성일</th>
                    </tr>
                </thead>
                <tbody class="table-sm">
					<c:if test="${empty records }" var="isEmpty">
						<tr>
							<td class="text-center" colspan="6">등록된 글이 없습니다.</td>
						</tr>	
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach var="record" items="${records}">
							<tr>
								<td>${record.qnaNo}</td>				
								<td class="text-left"><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do"?no=${record.qnaNo}"/>${record.qnaTitle}</a></td>
								<td>${record.userId}</td>	
								<td>${record.userName}</td>
								<td>${record.viewCount}</td>		
								<td>${record.qnaDate}</td>	
							</tr>
						</c:forEach>
					</c:if>
					
              <!-- Q&A 예시 시작 -->
                    <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
                    
                     <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
                    
                     <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
                    
                     <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
                    
                     <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
                    
                     <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
                    
                     <tr>
                      <td>4</td>
                      <td><a href="${pageContext.request.contextPath}/admin/notice/QNADetail.do">[Q&A] 관리자는 어떻게 해야하나요?</a></td>
                      <td><a href="memberOne.html">JH Lee</a></td>
                      <td class="text-center">이모씨</td>
                      <td class="text-center">9</td>
                      <td class="text-center">22-05-22</td>
                    </tr>
              <!-- Q&A 예시 끝 -->
              
               </tbody>
           </table>
            <!-- Widgets End -->
            <ul id="dyn_ul" class="pagination" style="justify-content: center;">
	    <!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>	    
	    <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
	  </ul>
        </div><!--  -->
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
    </div><!--  -->

    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
</body>
<script>
    //Sidebar Toggler
$('.sidebar-toggler').click(function () {
    $('.sidebar, .content').toggleClass("open");
    return false;
});
</script>
</html>