<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>view</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
     <!-- Bootstrap icons-->
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
	<script type="text/javascript">
	document.oncontextmenu = function(){return false;}
	</script>
    

</head>
<style>
    .postImages {
	display: block;
	width: auto;
	height: auto;
	max-width: 1000px;
	margin-bottom: 10px;
	margin-left: auto;
	margin-right: auto;
	}
	
	.postImages_sell{
		display: block;
		width: 100%; 
		height: auto;
		max-width: 1000px;
		margin-bottom: 10px;
		margin-left: auto;
		margin-right: auto;
	}
	
    body {
        display: grid;
        place-items: center;
    }

    .commentcard {
        position: relative;
        display: flex;
        padding: 20px;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        border-style: none;
        
    }

    .commentmedia img {
        width: 60px;
        height: 60px;
    }

    .reply a {
        text-decoration: none;
    }
    
    .mapdiv{
	margin-left: auto;
	margin-right: auto;
	margin-top:10px;
	margin-bottom:10px;
	}

    .watermarkpic{
	  position: absolute;
	  bottom: 0;
	  top:0;
	  left:50%;
	  transform: translate(-50%);
	  height:100%;
	  z-index:1;
	  opacity:0.7;
	  no-repeat;
	  width:100%;
	  max-width: 1000px;
	  
    }
	
	a {
	 text-decoration-line:none;
	}
	
	.profileimg{
	
	width:100%;
	height:100%;
	
	
	}
	
</style>
<body>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <br>
    <br>
    <br>
    <br>
    <div class="container postArea">
        <c:if test="${not empty viewLists}">
            <c:forEach var="list" items="${viewLists}">
                <div class="text-right mr-6">
                    <c:if test="${sessionId==list.userId}">
                        <a href="<c:url value=" /gallery/bbs/Edit.do?no=${list.postNo}"/>" class="btn-outline-dark btn-sm">수정</a>
                        <a href="<c:url value=" /gallery/bbs/Delete.do?no=${list.postNo}"/>" class="btn-outline-dark btn-sm">삭제</a>
                    </c:if>
                    <a href="<c:url value="/gallery/GalleryList.do"/>" class="btn-outline-dark btn-sm">목록</a>
                </div>
                <div>
                    <h3 class="postTitleArea" style="text-weight:bold;">&nbsp;${list.postTitle}</h3>
                    <p>&nbsp;${list.postDate} &nbsp; &nbsp; | &nbsp; &nbsp; ${list.postCategory}</p>
                </div>
                <div class="imageArea">
                    <c:forEach var="photo" items="${photoUrls}" varStatus="loop">
	                    <c:if test="${not empty isSellorNot}">
	                    <!-- 동글아 여기야 여기 -->
	                    
	                    <div class="sell_div" style="position:relative; margin:0 auto;">
		                    	<img class="watermarkpic" src="${pageContext.request.contextPath}/resources/img/galleryview/waternarkpic.png" alt="">
		                    	<img class="postImages_sell" src="${photo.photoUrl}" alt="">
		                </div>
		                
		                 <!-- 동글아 여기야 여기 -->
		                <p class="text-center"><small>* 자동 워터마크 적용된 이미지로 구매시 원본을 다운로드할 수 있습니다.</small></p>
	                    </c:if>
	                    <c:if test="${empty isSellorNot}">
	                        <img class="postImages" src="${photo.photoUrl}" />
	                    </c:if>
                    </c:forEach>
                </div>
                <div class="textArea text-center" style="margin-top: 50px;">
                    <p>${list.postText}</p>
                </div>
                <c:if test="${not empty lat}">
                	<div class="mapdiv d-flex justify-content-center" id="map" style=" width:500px; height:350px;"></div>
                </c:if>
                	<div id="map" style="display: none;"></div>
                	<input type="hidden" id="alat" name="alat" value="${lat}">
                	<input type="hidden" id="alng" name="alng" value="${lng}">
            </c:forEach>
        </c:if>
    </div>
    
    <!-- 결제하면 결제용 영역 장바구니, 가격, 결제 버튼 들어가게 만들어주기 -->
	<c:if test="${not empty isSellorNot}">
		<div class="card" style="width: 600px; margin-top: 100px;">
			<div class="card-body">
				<div class="pdTitleArea text-left">
					<h5 class="card-title">${postTitle}</h5>
				</div>
				<div class="card-title text-right">
						<h6 id="pdPrice">${pdPrice}원</h6>
				</div>
				<div class="row">
					<div class="pdArea m-2 col-xs-6" style="display:inline-block;">
						<a href="<c:url value="/mypage/Cart.do"/>">
						<img src="${pageContext.request.contextPath}/resources/img/galleryview/gotocart.png" style="width:100px;"/>
						</a>
					</div>
					<div class="pdArea addCart m-2 col-xs-6" style="display:inline-block;">
					
					<c:if test="${isCart==0}">
						<a id="cart${pdNo}" href="${pdNo}">
						<img src="${pageContext.request.contextPath}/resources/img/galleryview/addcart.png" style="width:100px;"/>
					</c:if>
					<c:if test="${isCart==1}">
						<a id="cart${pdNo}" href="${pdNo}">
						<img src="${pageContext.request.contextPath}/resources/img/galleryview/minuscart.png" style="width:100px;"/>
					</c:if>
						</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>
    <!-- Features section    <div class="container">
        <section class="py-5" id="features">
            <div class="container px-2 my-2">
                <div class="row gx-5">
                    <div class="d-inline-flex">
                        <span class="material-symbols-outlined">favorite</span>&nbsp;좋아요&nbsp;<span>${viewLists[0].postLikes}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="material-symbols-outlined">visibility</span>&nbsp;조회수&nbsp;<span>${viewLists[0].postHits}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </section>
    </div>
    -->
    
 <!-- 작가의 다른 작품 보기 영역(작가 프로필, 글 좋아요) -->
<div class="container mt-5 mb-5 bg-white" style="width:40%;">
    <div class="row no-gutters">
        <div class="col-md-4 col-lg-4">
        	<img class="profileimg" src="${createrProfile}">
        </div>
        <div class="col-md-8 col-lg-8">
            <div class="d-flex flex-column">
                <div class="d-flex flex-row justify-content-between align-items-center p-5 text-dark">
	                    <h3 class="display-5">${createrNickname}</h3>
	                </div> 
	                <div class="p-3">
	                    <h6>${createrPostCount}개의 글을 보유한 크리에이터입니다.</h6>
	                </div>
	                <div class="d-flex flex-row justify-content-center text-white">
	                	<button class="btn btn-sm btn-outline-dark mr-1"><a style="text-decoration:none; color:black;" href="<c:url value="/feed/FeedIndex.do?userNo=${createrUserNo}"/>">FEED</a></button>
	                	<button class="btn btn-sm btn-outline-dark mr-1"><a style="text-decoration:none; color:black;" href="${createrUserNo}">LIKE</a></button>
	                	<button class="btn btn-sm btn-outline-dark mr-1 diabled" >FOLLOW</button>
	                	<button class="btn btn-sm btn-outline-dark diabled" >DM</button>
	                </div>
            </div>
        </div>
    </div>
</div>
    
    
    
    

<!-- 댓글 영역!!!!!!!!!!!!!!!! -->
<div class="container mycomment text-center mt-5">
   	<form id="commentform">
   		<div class="">
   			<textarea name="commentarea" id="commentarea" style="min-height: 100px; max-height: 100px; width:1000px;"></textarea>
   		</div>
   		<div class="">
   			<input class="btn btn-dark text-white" type="button" value="댓글 등록" onclick="commentAjaxCall('${userId}',${postNo},'${loginUser.userNickname}','${loginUser.userProfile}');" style="width: 1000px;"/>
   		</div>
   	</form> 
</div>



<!-- 기존 댓글 영역!!!!!!!!!!!!!!!! -->
<div class="container mb-5 mt-5">
	<div class="card commentcard">
		<div class="row">
			<h4 class="text-left mb-5">댓글</h4>
			<div class="col-md-12 motherComment">
				<c:choose>
					<c:when test="${empty comments}">
						<h6 class="noComments">등록된 댓글이 없습니다.</h6>
					</c:when>
					<c:otherwise>
					<c:forEach var="comments" items="${comments}" varStatus="loop">
						<c:if test="${comments.CLevel==1}">
		                   <div class="row mt-3 mb-3">
		                       <div class="col-md-12">
		                           <div class="commentmedia">
		                               <a class="pr-3" href="<c:url value="/feed/FeedIndex.do?userNo=${comments.userNo}"/>">
		                               	<img class="mr-3 rounded-circle" style="width:30px; height:30px;" alt="userProfile" src="${comments.userProfile}"/>
		                               </a>
		                               <div class="media-body">
		                                   <div class="row">
		                                       <div class="col-8 d-flex">
		                                       <a class="pr-3" href="<c:url value="/feed/FeedIndex.do?userNo=${comments.userNo}"/>" style="text-decoration:none; color: black; text-weight:bold;">
		                                           <h6>${comments.userNickname}</h6>
		                                       </a>
		                                           <span>${comments.CDate}</span>
		                                       </div>
		                                    </div>
		                                       <div class="col-4">
		                                           <div class="pull-right reply">
		                                               <a href="#"><span><i class="fa fa-reply"></i></span></a>
		                                           </div>
		                                       </div>
		                                </div>${comments.CText}
		                             </div>
								</div>
							</div>
	                 	</c:if>
	                 </c:forEach>
					</div>
				</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<br>
<br>
<br>
<br>
<br>


</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=13e2904db019b8976886a50562f1211f&libraries=services,clusterer,drawing"></script>
<script>

	window.onload = function(){
		
		if(document.querySelector('#pdPrice')){
		var money = document.querySelector('#pdPrice').innerHTML;
		
		 var regx = new RegExp(/(-?\d+)(\d{3})/);
	     var bExists = money.indexOf(".", 0);//0번째부터 .을 찾는다.
	     var strArr = money.split('.');
	     while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
	         //정수 부분에만 콤마 달기 
	         strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
	     }
	     if (bExists > -1) {
	    	 money = strArr[0] + "." + strArr[1];
	     } else { 
	    	 money = strArr[0];
	     }
	     console.log(money);
	     
	     document.querySelector('#pdPrice').innerHTML = money;
		}
	};//function

	
	//댓글 등록처리
	function commentAjaxCall(userId,postNo,userNickname,userProfile){
		
		var commentText = document.querySelector('#commentarea').value;
		
		 $.ajax({
		        type:'POST',
		        url: "<c:url value='/gallery/post/SubmitComment.do'/>",
		        data:"cText="+$("#commentarea").serialize()+"&userId="+userId+"&postNo="+postNo
		 	}).done(function(data){
		 		
		 			//댓글 창 비워주기
		 			$("#commentarea").val("");
	
		 			var date = new Date();
		 			var today = date.getFullYear() +"-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
	                
		 			//댓글 바꿔주기
		 			var commentHTML = "<div class='row'><div class='col-md-12'><div class='commentmedia'><a class='pr-3' href=#><img class='mr-3 rounded-circle' alt='userProfile' src='"+userProfile+"' style='width:30px; height:30px;'/></a><div class='media-body'><div class='row'><div class='col-8 d-flex'><a class='pr-3'><h5>"+userNickname+"</h5></a><span>"+today+"</span></div></div>"+commentText;
					document.querySelector('.motherComment').insertAdjacentHTML('afterbegin',commentHTML);
					
					$(".noComments").hide();
					
		 	}).fail(function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 	});
	}//function
	

	//카트 ajax 처리
	$(".addCart>a").click(function(e){
		
        const pdNo = $(this).attr('href');
        console.log('pdNo :', pdNo);

        var likesrc = $(this).children("img").attr("src")==='${pageContext.request.contextPath}/resources/img/galleryview/addcart.png' ? "${pageContext.request.contextPath}/resources/img/galleryview/minuscart.png" : "${pageContext.request.contextPath}/resources/img/galleryview/addcart.png";
    	$(this).children('img').attr('src',likesrc);

        $.ajax({
                type:"POST",
                url:"<c:url value='/gallery/post/AddCartInView.do'/>",
                data: "pdNo="+pdNo
                }).done(function(data){
               	}).fail(function(request,status,error){
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             });
        
        e.preventDefault();
     });

	
	
	//지도 넣은 경우 보여줄것
	if(document.getElementById('alat').value != null){
		
		var lat = document.getElementById('alat').value;
		var lng = document.getElementById('alng').value;
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
		        level: 4 //지도 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);//지도 생성
		
		var imageSrc = "${pageContext.request.contextPath}/resources/img/uploadmap/mapicon.png", //마커 이미지   
		    imageSize = new kakao.maps.Size(30, 30), //마커이미지의 크기
		    imageOption = {offset: new kakao.maps.Point(10, 20)}; // 마커이미지 옵션
		      
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다
		
		// 마커 생성
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    image: markerImage // 마커이미지 설정 
		});
		
		// 마커 표시
		marker.setMap(map);
		
		var postTitle = $('.postTitleArea').html();
		var iwContent = '<div style="padding:5px;"><p style="font-size:10px; text-align:center; font-weight:bold;">'+postTitle+'</p></div>',
		    iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition,
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);	
	}

	
	


</script>
</html>