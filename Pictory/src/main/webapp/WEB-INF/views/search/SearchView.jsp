<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/Top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchView</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<link rel="apple-touch-icon" href="img/favicon.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/upload/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/gallerylist/gallerylist.css">

<script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search/Searchstyle.css">
<script src="${pageContext.request.contextPath}/resources/js/search/Search.js"></script>

</head>
<body>
	</br>
	</br>
	</br>
	</br>
	</br>
	
	<div>
		<div class="form-group row" style="padding-left: 100px;">
			<select id="" name="" class="form-control col-sm-1" style="width: 150px;">
				<option value="gallery" selected>작품</option>
				<option value="users">사람</option>
			</select> 
			<select id="postCategory" name="postCategory" class="form-control col-sm-1" style="width: 150px;"">
				<option value="">카테고리</option>
				<option value="figure">인물</option>
				<option value="object">정물</option>
				<option value="landscape">풍경</option>
				<option value="etc">기타</option>
			</select> 
			<select id="" name="" class="form-control col-sm-1" style="width: 150px;">
				<option value="recent" selected>최신순</option>
				<option value="search">조회순</option>
				<option value="like">좋아요순</option>
			</select>

			<div class="chk_sale">
				<input type="checkbox" id="chk_sale" class="ipt_chk"> <label
					for="chk_sale">판매중인 사진 보기</label>
			</div>
		</div>
	</div>

	<div>
		<h6 style="text-align: left; padding-left: 80px;">검색 결과 : ${fn:length(lists)} 건</h6>
	</div>



	<div class="gall_list">
		<ul class="gall_list_wrap list-unstyled">
			<!-- li~li까지 데이터 저장후 받아와서 foreach로 뿌리기 -->
			<c:if test="${empty lists}" var="isEmpty">
				<li>검색결과없음</li>
			</c:if>
			<c:if test="${categorys=='landscape'}" var="isEmpty">
				
				풍경 사진들
				
			</c:if>
			<c:if test="${categorys=='figure'}" var="isEmpty">
				
				
				
			</c:if>
			<c:if test="${not isEmpty}">
				<c:forEach var="list" items="${lists}" varStatus="loop">
					<li class="photo_area">
					<a href="<c:url value="/gallery/GalleryView.do?postNo=${list.postNo}"/>
					"class="photo_link">
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
										alt="" class="pro_icon"><span>${list.postLikes}</span><img
										src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png"
										alt="" class="pro_icon"><span>0</span>
								</p>
							</div>
					</a>

						<ul class="hover_btn">
							<li><a href=""><img
									src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png"
									alt="">Like</a></li>
							<li><a href="">Save</a></li>
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
						</div></li>
				</c:forEach>
			</c:if>
			<!-- ===========================절취선================================= -->
		</ul>
	</div>


<!-- <script>
	var select = '${postCategory}';
	var trans_select = select.split(",");
	for(var i=0;i<trans_select.length;i++){
		var index = trans_select[i]-1;
		$("option").eq(index).prop("selected",true)
	}

</script> -->
 <script type="text/javascript">
	  $(function(e){
		$('#postCategory').change(function(e){
	
			var postCategory = document.getElementById('postCategory').value;
			
			console.log("ajax들어가기 전")
		
		  $.ajax({
			type:"POST",
			url:"<c:url value='Category.do'/>",
			data:"postCategory="+postCategory
		}).done(function(data){
			console.log("postCategrorwrrwrsry",postCategory);
		}).fail(function(data){
			console.log("실패다",data);
		}); 
		  
		  e.preventDefault();
		  console.log('e.preventDefault() 실행');
	});
		
	  });
		
		
	


		
	
	
	
	
	
	

</script>
</body>
</html>