<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/resources/js/faq/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/faq/modernizr.js"></script>


<script src="${pageContext.request.contextPath}/resources/js/faq/tab.js"></script>
 
 

<link rel="stylesheet"
	href="<c:url value="/resources/css/feed/common.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/story/story.css"/>" />
	
	
    
<div class="gray_box">
	
	<div class="main_area">
	
		

			<div class="cont_area">
				
					<ul class="story_list">
					
					
					<c:if test="${empty returnValue}" var="isEmpty">
					데이터가없어요....(못 받아옴???)) 
					</c:if>
					 
					 
					<c:if test="${not isEmpty}">
						<c:forEach var="record" items="${returnValue}" varStatus="loop">
						<li>
							<a href="<c:url value="/story/virtualprocess.do?sNo=${record.SNo}"/>">
								<div class="img_area" style="background-image: url(<c:url value="${record.storyThumbnail}"/>);">
								<img src="<c:url value="/resources/img/story/fake03.png"/>" alt="">
								
							
								</div>

								<div class="txt_area">
									<p class="small">
										<span class="cate">CATEGORY</span><span class="gray">풍경</span>
									</p>
									<p class="main_txt">${record.storyDescription}</p>
										
									<div class="pro_line">
										<p>
											<img src="<c:url value="${record.userProfile}"/>" alt="" class="pro_p">${record.userNickname}
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
				</div>
				</div>
			