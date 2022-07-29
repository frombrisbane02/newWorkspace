<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/Top.jsp" />


<!-- 스토리 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/faq/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/faq/modernizr.js"></script>


<script src="${pageContext.request.contextPath}/resources/js/faq/tab.js"></script>
 
 

<link rel="stylesheet"
	href="<c:url value="/resources/css/faq/common.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/story/story.css"/>" />


<!-- 
<div class="container">    
	<h2>스토리</h2>
	<h3>category: ${category}</h3>
	<h3>catValue: ${catValue}</h3>
	
	
	
<div class="category_list_wrap" id="category_list_wrap" style="visibility: visible;">	
	<div id="innerDiscover">
		<h2 class="tit_discover"><span class="blind">Discover</span></h2>	
		<div id="tabDiscover">
			<ul>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=전체"/>" id="bottomType_0">전체</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=일상"/>" id="bottomType_1">일상</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=연애"/>" id="bottomType_2">연애</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=여행"/>" id="bottomType_3">여행</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=디자인"/>" id="bottomType_4">디자인</a></li>
			</ul>
		</div>
	</div>
</div>
 -->




<div class="gray_box">
	<div class="top_bg" style="background-image: url(<c:url value="/resources/img/story/test_img01.jpg"/>);"></div>
	
	<div class="main_area">
	
		<div class="right_list">
			<ul class="top_tab">
				<li class="tab_link tab_ac" data-tab="tab1"><a href="">최신순</a></li>
				<li class="tab_link" data-tab="tab2"><a href="">인기순</a></li>
			</ul>

			<div class="cont_area">
				<div class="tab_cont tab_ac" id="tab1">
					<ul class="story_list">
					
					
					<c:if test="${empty returnValue}" var="isEmpty">
					데이터가없어요....(못 받아옴???)) 
					</c:if>
					 
					 
					<c:if test="${not isEmpty}">
						<c:forEach var="record" items="${returnValue}" varStatus="loop">
						<li>
							<a href="<c:url value="/story/virtualprocess.do"/>">
								<div class="img_area" style="background-image: url(<c:url value="/upload/img/${record.userId}/${record.storyThumbnail}"/>);">
								<img src="<c:url value="/resources/img/story/fake03.png"/>" alt="">
							
								</div>

								<div class="txt_area">
									<p class="small">
										<span class="cate">CATEGORY</span><span class="gray">풍경</span>
									</p>
									<p class="main_txt">${record.storyDescription}</p>
										
									<div class="pro_line">
										<p>
											<img src="<c:url value="/resources/img/story/test_img02.jpg"/>" alt="" class="pro_p">${record.userNickname}
										</p>
										<p class="gray">
											<img
												src="<c:url value="/resources/img/story/test_icon08.png"/>"
												alt="" class="pro_icon"><span>0</span><img
												src="<c:url value="/resources/img/story/test_icon09.png"/>"
												alt="" class="pro_icon"><span>0</span>
										</p>
									</div>
								</div>
							</a>
						</li>
						</c:forEach>
					</c:if>

					</ul>
					
				</div>


				<div class="tab_cont" id="tab2">
					<ul class="story_list">
						<li>
						<a href="<c:url value="/story/virtualprocess.do"/>">
								<div class="img_area"
									style="background-image: url(<c:url value="/resources/img/story/test_img03.jpg"/>);">
									<img src="<c:url value="/resources/img/story/fake03.png"/>" alt="">
								</div>

								<div class="txt_area">
									<p class="small">
										<span class="cate">CATEGORY</span><span class="gray">뭐
											넣는건가요</span>
									</p>
									<p class="main_txt">스토리 설명글이 여기에  스토리 스토리 설명글  몇자로 제한 하는거죠?? 스토리 설명글이 여기에 스토리 설명글이 여기에 </p>
									<div class="pro_line">
										<p>
											<img
												src="<c:url value="/resources/img/story/test_img02.jpg"/>"
												alt="" class="pro_p">User name
										</p>
										<p class="gray">
											<img src="#"
												alt="" class="pro_icon"><span>0</span><img
												src="<c:url value="/resources/img/story/test_icon09.png"/>"
												alt="" class="pro_icon"><span>0</span></p></div>
								</div>
						</a></li>

					</ul>
				</div>


			</div>
		</div>
	</div>
	<!-- </div> -->