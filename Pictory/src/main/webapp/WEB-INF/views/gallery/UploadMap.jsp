<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uploadmap/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uploadmap/map.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Map</title>

</head>
<body>
    <div class="container">
        
        <div id="menu_wrap" class="bg_white">
            <div class="option">                
                <form class="form">
                    <input type="text" value="" id="keyword" size="15">                         
                    <button id="search" class="search-button" type="submit">검색하기</button> 
                </form>                            
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>       
        
        <div class="map_wrap">
            <div id="map">
            <div id="clickLatlng"></div>
        </div>
        
    </div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=13e2904db019b8976886a50562f1211f&libraries=services,clusterer,drawing"></script>
    <script src="${pageContext.request.contextPath}/resources/js/uploadmap/map.js"></script>
<script>

//모달 열기
function modalOpen() {
  Swal.fire({
    title: '<strong>HTML <u>example</u></strong>',
    width: 1430,
    html:
    '<iframe width="1350" height="700" src="map.html" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
    showCloseButton: true,
    showCancelButton: true,
    focusConfirm: false,
    confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> Select',
    confirmButtonAriaLabel: 'Thumbs up, great!',
    cancelButtonText:
    '<i class="fa fa-thumbs-down"></i>Cancel',
    cancelButtonAriaLabel: 'Thumbs down'
  }).then((result) => {
    if (result.isConfirmed) {
      console.log(123);
    } else {
      console.log(456);
    }
  })
}



//버튼 클릭리스너 달기
document.querySelector('#modal_btn').addEventListener('click', modalOpen);



</script>
</body>
</html>