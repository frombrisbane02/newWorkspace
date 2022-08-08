<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uploadmap/map.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>지도</title>
</head>
<body>

    <div class="container">
    <button id="completebtn">나가기ㅎ</button>
        <div id="menu_wrap" class="bg_white">
            <div class="option">                
                <form class="form">
                <input type="hidden" name="lnglat" id="a-lnglat" value="" />
                    <input type="text" value="" id="keyword" size="15">                         
                    <button id="search" class="search-button" type="submit">검색하기</button> 
                </form>                            
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>       
        
        <div class="map_wrap">
            <div id="map"></div>
            <div id="clickLatlng"></div>
        </div>
    </div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=13e2904db019b8976886a50562f1211f&libraries=services,clusterer,drawing"></script>
    <script src="${pageContext.request.contextPath}/resources/js/uploadmap/uploadmap.js"></script>
<script>

$('#completebtn').click(function(){
	
	opener.document.getElementById('postText').value = "지도지도지도";
	var a = $('#a-lnglat').value
	console.log('저기요....',a);
	
})


</script>
</body>
</html>