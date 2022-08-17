<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchView</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<link rel="apple-touch-icon" href="img/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/upload/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/gallerylist/gallerylist.css">

<script
	src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/search/Searchstyle.css">
<script
	src="${pageContext.request.contextPath}/resources/js/search/Search.js"></script>

</head>
<body>

	</br>
	</br>
	</br>
	</br>

	<div>
		<div class="form-group row" style="padding-left: 100px;">
			<!-- <select id="" name="" class="form-control col-sm-1" style="width: 150px;">
				<option value="gallery" selected>작품</option>
				<option value="users">사람</option>
			</select>  -->
			<select id="postCategory" name="postCategory"
				class="form-control col-sm-1" style="width: 150px;"">
				<option value="">카테고리</option>
				<option value="figure">인물</option>
				<option value="object">정물</option>
				<option value="landscape">풍경</option>
				<option value="" id="">동물</option>
				<option value="" id="">음식</option>
				<option value="etc">기타</option>
			</select>
			<!-- <select id="" name="" class="form-control col-sm-1" style="width: 150px;">
				<option value="recent" selected>최신순</option>
				<option value="search">조회순</option>
				<option value="like">좋아요순</option>
			</select> -->

			<div class="chk_sale" style="margin-left: 20px; margin-top: 8px;">
				<input type="checkbox" id="chk_sale" class="ipt_chk" name="chkbox">
				<label for="chk_sale">판매중인 사진 보기</label>
			</div>
		</div>
	</div>

	<div>
		<h6 style="text-align: left; padding-left: 80px;">
			검색 결과 : <span id="listLength">${fn:length(lists)}</span> 건
		</h6>
	</div>



	<div class="gall_list">
		<ul class="gall_list_wrap list-unstyled">
			<!-- li~li까지 데이터 저장후 받아와서 foreach로 뿌리기 -->
			<c:if test="${empty lists}" var="isEmpty">
				<li>검색결과없음</li>
			</c:if>

			<c:if test="${not isEmpty}">
				<c:forEach var="list" items="${lists}" varStatus="loop">
					<li
						class="photo_area cate_${list.postCategory} sell_${list.postSellorNot}">
						<a
						href="<c:url value="/gallery/GalleryView.do?postNo=${list.postNo}"/>
					"
						class="photo_link">
							<div class="img_area"
								style="background-image: url(${list.photoUrl});">
								<img
									src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png"
									alt="">
							</div>

							<div class="txt_area">
								<p>
									<img src="${list.userProfile}" alt="" class="pro_p">${list.userNickname}</p>
								<p>
									<img
										src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png"
										alt="" class="pro_icon"><span id="plike${list.postNo}">${list.postLikes}</span><img
										src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png"
										alt="" class="pro_icon"><span>${list.commentCount}</span>
								</p>
							</div>
					</a>

						<ul class="hover_btn list-unstyled">
							<!-- 좋아요 버튼 -->
							<li><a id="aprevent${list.postNo}" href="${list.postNo}">
									<c:if test="${list.likeornot == 1}">
										<img
											src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png"
											alt="">
									</c:if> <c:if test="${list.likeornot == 0}">
										<img
											src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png"
											alt="">
									</c:if>Like
							</a></li>

							<!-- 판매글 카트 버튼-->
							<c:if test="${list.postSellorNot==1}">
								<li><a id="cart${list.postNo}" href="${list.postNo}"> <c:if
											test="${list.cartornot==0}">
											<img
												src="${pageContext.request.contextPath}/resources/img/gallerylist/nocart.png"
												alt="">
										</c:if> <c:if test="${list.cartornot==1}">
											<img
												src="${pageContext.request.contextPath}/resources/img/gallerylist/yescart.png"
												alt="">
										</c:if> Cart
								</a></li>
							</c:if>
						</ul>

						<div class="hover_txt">
							<h3>${list.postTitle}</h3>
							<p class="sub_txt">
								<c:forEach var="hash" items="${hashs}" varStatus="loop">
									<c:if test="${hash.postNo==list.postNo}">
								#${hash.hashtag}
								</c:if>


								</c:forEach>
							</p>
							<p class="bot_txt">${list.postCategory}</p>
						</div>
					</li>
				</c:forEach>
			</c:if>
			<!-- ===========================절취선================================= -->
		</ul>
	</div>

	<form>
		<input id="getuserId" type="hidden" value="${userId}" />
	</form>


	<!-- 카테고리 검색 -->
	<script type="text/javascript">	  
  $(document).ready(function(){
		$('#postCategory').change(function(){
			$('.photo_area').hide();
			$('.cate_' + $(this).val()).show();
			$('#listLength').text($('.cate_' + $(this).val()).length);
		});		
	});
  <!-- 판매중인 사진 보기 -->
  $(document).ready(function(){
	  $('#chk_sale').click(function(){
		  if($("#chk_sale").prop("checked")){
			  $("input[type=checkbox]").prop("checked",true);  
			  $('.photo_area').hide(); 
			  $('.sell_' +'1').show();
			  $('#listLength').text($('.sell_' + '1').length);
		  }else{
			  $("input[type=checkbox]").prop("checked",false); 
			  $('.photo_area').show(); 
			  $('#listLength').text($('.sell_' + '2').length + Number($('.sell_' + '1').length));
		  }		  
	  });
  });
  
  <!-- 좋아요 -->
   $(".hover_btn > li:nth-child(1) >a").click(function(e){  
		
      const postNo = $(this).attr('href');
      const postNum = Number(postNo);
      const userId = document.getElementById('getuserId').value;
      console.log('postNo:',postNo);
  	  console.log('userId:',userId);
      
      var likesrc = $(this).children("img").attr("src")==='${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png' ? "${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png" : "${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png";
  	$(this).children('img').attr('src',likesrc);
  	
  	$.ajax({
	        type:"POST",
	        url:"<c:url value='search/Likes.do'/>",
	        data: "postNo="+postNo+"&userId="+userId
	        }).done(function(data){
	        	console.log('성공했냐');
	        	console.log('postNo',postNo)
	        	console.log('userId',userId)
	       	 $('li:nth-last-child('+ postNum +') > a > div> p > span:nth-child(2)').text(data);
	       
	   	
	     }).fail(function(request,status,error){
	       console.log('제정신이냐')
	     });   
	e.preventDefault(); 
	}); 
	
	
	//cart 담기 버튼
	$(".hover_btn > li:nth-child(2) >a").click(function(e){  
		
     const postNo = $(this).attr('href');
     const userId = document.getElementById('getuserId').value;
     var cartsrc = $(this).children("img").attr("src")==='${pageContext.request.contextPath}/resources/img/gallerylist/nocart.png' ? "${pageContext.request.contextPath}/resources/img/gallerylist/yescart.png" : "${pageContext.request.contextPath}/resources/img/gallerylist/nocart.png";
 	$(this).children('img').attr('src',cartsrc);
 	

     $.ajax({
             type:"POST",
             url:"<c:url value='search/CartInList.do'/>",
             data: "postNo="+postNo+"&userId="+userId
             }).done(function(data){
            		
          }).fail(function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          });
     
     e.preventDefault();
  });
  
  

</script>
</body>
</html>