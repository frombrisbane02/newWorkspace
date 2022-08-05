<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/Top.jsp"/>
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


</style>
<body>
    <br>
    <br>
    <br>
    <br>
    <div class="container postArea">
        <c:if test="${not empty viewLists}">
            <c:forEach var="list" items="${viewLists}">
                <div class="text-right mr-6">
                    <c:if test="${sessionId==list.userId}">
                        <a href="<c:url value=" /gallery/bbs/Edit.do?no=${list.postNo}" />" class="btn-outline-dark btn-sm">수정</a>
                        <a href="<c:url value=" /gallery/bbs/Delete.do?no=${list.postNo}" />" class="btn-outline-dark btn-sm">삭제</a>
                    </c:if>
                    <a href="<c:url value=" /gallery/GalleryListEdit.do?no=${list.postNo}" />" class="btn-outline-dark btn-sm">목록</a>
                </div>
                <div>
                    <h3 style="text-weight:bold;">&nbsp;${list.postTitle}</h3>
                    <p>&nbsp;${list.postDate} &nbsp; &nbsp; | &nbsp; &nbsp; ${list.postCategory}</p>
                </div>
                <div class="imageArea">
                    <c:forEach var="photo" items="${photoUrls}" varStatus="loop">
                        <img class="postImages" src="${photo.photoUrl}" />
                    </c:forEach>
                </div>
                <div class="textArea text-center" style="margin-top: 50px;">
                    <p>${list.postText}</p>
                </div>
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
						<a href="<c:url value="/mypage/.do?pdNo=${pdNo}"/>">
						<img src="${pageContext.request.contextPath}/resources/img/galleryview/btncart.jpg" style="width:100px;"/>
						</a>
					</div>
					<div class="pdArea m-2 col-xs-6" style="display:inline-block;">
						<a href="<c:url value="/mypage/.do?pdNo=${pdNo}" />">
						<img src="${pageContext.request.contextPath}/resources/img/galleryview/btncartplus.jpg" style="width:100px;"/>
						</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>
    
    
    <!-- Features section-->
    <div class="container">
        <section class="py-5" id="features">
            <div class="container px-2 my-2">
                <div class="row gx-5">
                    <div class="d-inline-flex">
                        <span class="material-symbols-outlined">favorite</span>&nbsp;좋아요&nbsp;<span>${postLikes}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="material-symbols-outlined">visibility</span>&nbsp;조회수&nbsp;<span>${postHits}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </section>
    </div>
 <!-- 작가의 다른 작품 보기 영역!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

    
    
    
    
    
    
    

<!-- 댓글 영역!!!!!!!!!!!!!!!! -->
<div class="container mycomment text-center">
   	<form id="commentform">
   		<div class="">
   			<textarea name="commentarea" id="commentarea" style="min-height: 100px; max-height: 100px; width:1000px;"></textarea>
   		</div>
   		<div class="">
   			<input type="button" value="댓글 등록" onclick="commentAjaxCall('${userId}',${postNo},'${loginUser.userNickname}','${loginUser.userProfile}');" style="width: 1000px;"/>
   		</div>
   	</form> 
</div>



<!-- 기존 댓글 영역!!!!!!!!!!!!!!!! -->
<div class="container mb-5 mt-5">
	<div class="card commentcard">
		<div class="row">
			<div class="col-md-12 motherComment">
				<h4 class="text-left mb-5">댓글</h4>
				<c:choose>
					<c:when test="${empty comments}">
						<h6>등록된 댓글이 없습니다.</h6>
					</c:when>
					<c:otherwise>
					<c:forEach var="comments" items="${comments}" varStatus="loop">
						<c:if test="${comments.CLevel==1}">
		                   <div class="row">
		                       <div class="col-md-12">
		                           <div class="commentmedia">
		                               <a class="pr-3" href="<c:url value="/feed/Artwork.do?userNo=${comments.userNo}"/>">
		                               	<img class="mr-3 rounded-circle" alt="userProfile" src="${comments.userProfile}"/>
		                               </a>
		                               <div class="media-body">
		                                   <div class="row">
		                                       <div class="col-8 d-flex">
		                                       <a class="pr-3" href="<c:url value="/feed/Artwork.do?userNo=${comments.userNo}"/>">
		                                           <h5>${comments.userNickname}</h5>
		                                       </a>
		                                           <span>${comments.CDate}</span>
		                                       </div>
		                                       <div class="col-4">
		                                           <div class="pull-right reply">
		                                               <a href="#"><span><i class="fa fa-reply"></i></span></a>
		                                           </div>
		                                       </div>
		                                   </div>${comments.CText}
	                 	</c:if>
										<c:if test="${comments.parentCNo==comments.CNo}">
					                        <div class="commentmedia mt-4">
					                            <a class="pr-3" href="<c:url value="/feed/Artwork.do?userNo=${comments.userNo}"/>"><img class="rounded-circle" alt="reply" src="${comments.userProfile}"/></a>
					                            <div class="media-body">
					                                <div class="row">
					                                    <div class="col-12 d-flex">
					                                        <a class="pr-3" href="<c:url value="/feed/Artwork.do?userNo=${comments.userNo}"/>">
					                                        	<h5>${comments.userNickname}</h5>
					                                        </a>
					                                		   <span>${comments.CDate}</span>
					                                    </div>
					                                </div>${comments.CText}
												</div>
											</div>
										</c:if>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
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
}

function commentAjaxCall(userId,postNo,userNickname,userProfile){
	
	console.log('userId 들어왔니? %O', userId);
	console.log('postNo 들어왔니?',typeof(postNo));
	console.log('userNickname 들어왔니?%O', userNickname);
	
	var commentText = document.querySelector('#commentarea').value;
	console.log('제가..댓글 뭐라고 썼죠?:',commentText);
	
	 $.ajax({
	        type:'POST',
	        url: "<c:url value='/gallery/post/SubmitComment.do'/>",
	        data:"cText="+$("#commentarea").serialize()+"&userId="+userId+"&postNo="+postNo
	 	}).done(function(data){
	 		
           
	 			//댓글 창 비워주기
	 			$("#commentarea").val("");
                
	 			//댓글 바꿔주기
	 			var commentHTML = "<div class='row'><div class='col-md-12'><div class='commentmedia'><a class='pr-3' href='#'><img class='mr-3 rounded-circle' alt='userProfile' src='"+userProfile+"'/></a><div class='media-body'><div class='row'><div class='col-8 d-flex'><a class='pr-3'><h5>"+userNickname+"</h5></a><span>"+2022-08-05+"</span></div></div>"+commentText;
				document.querySelector('.motherComment').insertAdjacentHTML('beforeend',commentHTML);
	 			
				console.log(commentHTML);
           
	 	}).fail(function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	
	 		console.log('개씨발 망했어요ㅠ');
	 	});
	
}//function




</script>
</html>