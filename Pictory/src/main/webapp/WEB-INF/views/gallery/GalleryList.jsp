<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1">
	<title>Gallery</title>

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
</head>
<body>
<br>
<br>
<br>
<br>
	<div class="gall_list">
		<div class="top_filter">
			<div class="filter_left">
				<a href="" class="filter_btn"><img src="img/test_icon12.png" alt="">Filter</a>
				<p class="count"><span>384</span> results found</p>
			</div>
			<!-- sort area 삭제함 -->
		</div>
		<ul class="fil_sel_list" style="list-style-type: none;">
		<!-- 여기 선택한 필터 리스트 목록 갖고와서 foreach로 뿌리면서 엑스<도 기능하고, 엑스 눌렀을때 체크 해제되게 기능구현  -->
		
			<li>
				<a href=""><img src="img/test_icon16.png" alt=""></a>
				<p>Clean all</p>
			</li>

			<li>
				<a href=""><img src="img/test_icon16.png" alt=""></a>
				<p>CATEGORY 1</p>
			</li>

			<li>
				<a href=""><img src="img/test_icon16.png" alt=""></a>
				<p>CATEGORY 2</p>
			</li>

			<li>
				<a href=""><img src="img/test_icon16.png" alt=""></a>
				<p>CATEGORY 4</p>
			</li>

			<li>
				<a href=""><img src="img/test_icon16.png" alt=""></a>
				<p>COLOR 2</p>
			</li>
		</ul>
		

		<ul class="gall_list_wrap">
		<!-- li~li까지 데이터 저장후 받아와서 foreach로 뿌리기 -->
		<c:if test="${empty lists}" var="isEmpty">
			    <li> There is NO POST YET</li>
		</c:if>
		<c:if test="${not isEmpty}">
		     <c:forEach var="list" items="${lists}" varStatus="loop">
			<li class="photo_area">
				<a href="" class="photo_link">					
					<div class="img_area" style="background-image: url(${list.photoUrl});"><img src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png" alt=""></div>	

					<div class="txt_area">
						<p><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_img02.jpg" alt="" class="pro_p">${list.userNickname}</p>
						<p><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="" class="pro_icon"><span>${list.postLikes}</span><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png" alt="" class="pro_icon"><span>0</span></p>
					</div>						
				</a>

				<ul class="hover_btn">
					<li><a href=""><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="">Like</a></li>
					<li><a href="">Save</a></li>
				</ul>
				
				<div class="hover_txt">
					<h3>${list.postTitle}</h3>
					<p class="sub_txt">HASHTAG(NULLCHECK)</p>
					<p class="bot_txt">${list.postCategory}</p>
				</div>
			</li>
			</c:forEach>
			</c:if>
	<!-- ===========================절취선================================= -->
		</ul>
	</div>

	<div class="filter_modal">
		<div class="modal_white">
			<a href="" class="close_modal"><img src="img/test_icon13.png" alt=""></a>
			<h3>Filter content just for you</h3>
			<form action="">
				<div class="fil_wrap">
					<p class="filter_tit">CATEGORY</p>
					<div class="select_area">
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter1-1" checked="checked">
								<div class="check_btn"></div>
							</div>
							<label for="filter1-1">CATEGORY 1</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter1-2" checked="checked">
								<div class="check_btn"></div>
							</div>
							<label for="filter1-2">CATEGORY 2</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter1-3">
								<div class="check_btn"></div>
							</div>
							<label for="filter1-3">CATEGORY 3</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter1-4" checked="checked">
								<div class="check_btn"></div>
							</div>
							<label for="filter1-4">CATEGORY 4</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter1-5">
								<div class="check_btn"></div>
							</div>
							<label for="filter1-5">CATEGORY 5</label>
						</div>
					</div>
				</div>

				<div class="fil_wrap">
					<p class="filter_tit">COLOR</p>
					<div class="select_area">
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter2-1">
								<div class="check_btn"></div>
							</div>
							<label for="filter2-1">COLOR 1</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter2-2" checked="checked">
								<div class="check_btn"></div>
							</div>
							<label for="filter2-2">COLOR 2</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter2-3">
								<div class="check_btn"></div>
							</div>
							<label for="filter2-3">COLOR 3</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter2-4">
								<div class="check_btn"></div>
							</div>
							<label for="filter2-4">COLOR 4</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter2-5">
								<div class="check_btn"></div>
							</div>
							<label for="filter2-5">COLOR 5</label>
						</div>
					</div>
				</div>	

				<div class="fil_wrap">
					<p class="filter_tit">HASHTAG</p>
					<div class="select_area">
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter3-1">
								<div class="check_btn"></div>
							</div>
							<label for="filter3-1">HASHTAG 1</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter3-2">
								<div class="check_btn"></div>
							</div>
							<label for="filter3-2">HASHTAG 2</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter3-3">
								<div class="check_btn"></div>
							</div>
							<label for="filter3-3">HASHTAG 3</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter3-4">
								<div class="check_btn"></div>
							</div>
							<label for="filter3-4">HASHTAG 4</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" id="filter3-5">
								<div class="check_btn"></div>
							</div>
							<label for="filter3-5">HASHTAG 5</label>
						</div>
					</div>
				</div>					

				<div class="btn_area">
					<input type="button" value="RESET" class="reset_btn">
					<input type="button" value="APPLY" class="apply_btn">
				</div>
			</form>
		</div>
	</div>

	<script>
		$(window).load(function(){
			$('.filter_btn').click(function(){
				$('.filter_modal').addClass('mo_ac');
				return false;
			});

			$('.close_modal').click(function(){
				$('.filter_modal').removeClass('mo_ac');
				return false;
			});
		});
	</script>
</body>
</html>