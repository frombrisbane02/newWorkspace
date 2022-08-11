<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1">
	<title>Gallery</title>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<link rel="apple-touch-icon" href="img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/galleryview/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/gallerylist/gallerylist.css">

	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>

<br>
<br>
<br>
<br>
	<div class="gall_list">
		<div class="top_filter">
			<div class="filter_left">
				<button type="button" class="filter_btn"><img src="<c:url value="/resources/img/story/test_icon12.png"/>"alt="">Filter</button>
				<p class="count"  id="cartegoryCount"><span>${fn:length(lists)}</span>개의 글</p>
			</div>
		</div>
		
		<ul class="fil_sel_list" id="cartegoryList">
		<!-- 기 선택한 필터 리스트 목록 갖고와서 foreach로 뿌리면서 엑스<도 기능하고, 엑스 눌렀을때 체크 해제되게 기능구현  -->

		</ul>
		
	<!-- ===========================글 리스트================================= -->
		<ul class="gall_list_wrap" id="resultList">
		<c:if test="${empty lists}" var="isEmpty">
			    <li> There is NO POST YET</li>
		</c:if>
		<c:if test="${not isEmpty}">
		     <c:forEach var="list" items="${lists}" varStatus="loop">
				<li class="photo_area">
					<a href="<c:url value="/gallery/GalleryView.do?postNo=${list.postNo}"/>" class="photo_link">					
						<div class="img_area" style="background-image: url(${list.photoUrl});"><img src="${pageContext.request.contextPath}/resources/img/gallerylist/fake02.png" alt=""></div>	
	
						<div class="txt_area">
							<p><img src="${list.userProfile}" alt="" class="pro_p">${list.userNickname}</p>
							<p><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="" class="pro_icon"><span id="plike${list.postNo}">${list.postLikes}</span><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png" alt="" class="pro_icon"><span>${list.commentCount}</span></p>
						</div>		
					</a>
					
					<ul class="hover_btn">
					
						<!-- 좋아요 버튼 -->
						<li><a id="aprevent${list.postNo}" href="${list.postNo}">
							<c:if test="${list.likeornot == 1}">
								<img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png" alt="">
							</c:if>
							<c:if test="${list.likeornot == 0}">
								<img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="">
							</c:if>Like</a></li>

						<!-- 판매글 카트 버튼-->
						<c:if test="${list.postSellorNot==1}">
							<li><a id="cart${list.postNo}" href="${list.postNo}">
								<c:if test="${list.cartornot==0}">
									<img src="${pageContext.request.contextPath}/resources/img/gallerylist/nocart.png" alt="">
								</c:if>
								<c:if test="${list.cartornot==1}">
									<img src="${pageContext.request.contextPath}/resources/img/gallerylist/yescart.png" alt="">
								</c:if>
							Cart</a></li>
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
		</ul>
	</div>

	<div class="filter_modal">
		<div class="modal_white">
			<a href="" class="close_modal"><img src="<c:url value="/resources/img/story/test_icon13.png"/>" alt=""></a>
			<h3>Filter content just for you</h3>
			<form action="">
				<div class="fil_wrap">
					<p class="filter_tit">CATEGORY</p>
					<div class="select_area">
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="landscape" id="landscape">
								<div class="check_btn"></div>
							</div>
							<label for="landscape">풍경(landscape)</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="figure" id="figure" >
								<div class="check_btn"></div>
							</div>
							<label for="figure">인물(figure)</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="animal" id="animal">
								<div class="check_btn"></div>
							</div>
							<label for="animal">동물(animal)</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="food" id="food" >
								<div class="check_btn"></div>
							</div>
							<label for="food">음식(food)</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="object" id="object" >
								<div class="check_btn"></div>
							</div>
							<label for="object">사물(object)</label>
						</div>
						
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="etc" id="etc">
								<div class="check_btn"></div>
							</div>
							<label for="etc">기타(etc)</label>
						</div>
						
					</div>
				</div>
	

				<div id=modal class="btn_area">
					<input type="reset" value="RESET" class="reset_btn">
					<button type="button" id="apply" value="APPLY" class="apply_btn">APPLY</button>
				</div>
			</form>
		</div>
	</div>
	 			  <form>
			         <input id="getuserId" type="hidden" value="${userId}"/>
			      </form>
			      
			      
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
			

			$('.apply_btn').click(function(){
				$('.filter_modal').removeClass('mo_ac');
				return false;
			});
			
		});//load

		
		
		$(".hover_btn > li:nth-child(1) >a").click(function(e){  
			
         const postNo = $(this).attr('href');
         const postNum = Number(postNo);
         const userId = document.getElementById('getuserId').value;
         
         var likesrc = $(this).children("img").attr("src")==='${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png' ? "${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png" : "${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png";
     	$(this).children('img').attr('src',likesrc);

         $.ajax({
                 type:"POST",
                 url:"<c:url value='post/Likes.do'/>",
                 data: "postNo="+postNo+"&userId="+userId
                 }).done(function(data){
                	 $('li:nth-last-child('+ postNum +') > a > div> p > span:nth-child(2)').text(data);
                
            	
              }).fail(function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              });   
         e.preventDefault(); 
      });
	
			
		//===========종근(필터 Ajax)
		  $(document).ready(function(){
            
            $("#apply").click(function() {
                //배열 선언
                var checkArray = [];
                
                $('input[name="postCategory"]:checked').each(function(i){//체크된 리스트 저장
                	checkArray.push($(this).val());
                });
                                
                var checkParams = {
                        //"user"      : $("#user").val(), //유저 저장
                        "checkList" : checkArray        //체크배열 저장
                    };
                //console.log('checkParams :', checkParams);
                //ajax 호출
                $.ajax({
                    url         :   "<c:url value="/gallery/filter.do"/>",
                    dataType    :   "json",
                    contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                    type        :   "post",
                    data        :   checkParams,
                    success     :   function(result){
                   				 	$('#cartegoryCount').empty();
                    				$('#resultList').empty();
                    				$('#cartegoryList').empty();
                    				var html ='';
                    				
                    				var count=$(
                    				'<p class="count">'+'<span>'+result.length+'</span>개의 글</p>'
                    				);
                    				$('#cartegoryCount').append(count);
    
                    				

                    				
                    			for(var i=0 ; i<checkArray.length ; i++){
                    				var cartegory= $('<li>'+
             								'<a href="">'+'<img src="<c:url value="/resources/img/story/test_icon16.png"/>" alt="">'+'</a>'+
             								'<p>'+checkArray[i]+'</p>'+
             							'</li>')
             						
             							$('#cartegoryList').append(cartegory);
                    			};
                    				
                    				
             						result.forEach(function(item, index){
             							
             							var localhost = 'http://localhost:4040';
             							
             							
             							html = $('<li class="photo_area">' +
             		 							'<a href="<c:url value="/gallery/GalleryView.do?postNo='+item.postNo+'"/>" class="photo_link">'	+
             		 									'<div class="img_area" style="background-image: url('+item.photoUrl+');">'+'<img src="'+localhost+'/springapp/resources/img/gallerylist/fake02.png" alt="">'+'</div>'+
             		 									'<div class="txt_area">'+
             		 										'<p>'+'<img src="'+item.userProfile+'" alt="" class="pro_p">'+item.userNickname+'</p>'+
             		 										'<p>'+'<img src="'+localhost+'/springapp/resources/img/gallerylist/test_icon06.png" alt="" class="pro_icon">'+'<span>'+item.postLikes+'</span>'+'<img src="http://localhost:4040/springapp/resources/img/gallerylist/test_icon07.png" alt="" class="pro_icon">'+'<span>'+item.commentCount+'</span>'+'</p>'+
             		 									'</div>'+
             		 								'</a>'+
             		 								'<ul class="hover_btn">'+
             		 								'<li>'+'<a id='+item.postNo+' href='+item.postNo+'>'+
             		 									'<c:if test='+item.likeornot == 1+'>'+
             		 										'<img src="$'+localhost+'/springapp/resources/img/gallerylist/test_icon06red.png" alt="">'+
             		 									'</c:if>'+
             		 									'<c:if test='+item.likeornot == 0+'>'+
             		 										'<img src="$'+localhost+'/springapp/resources/img/gallerylist/test_icon06.png" alt="">'+
             		 									'</c:if>'+
             		 							'Like'+'</a>'+'</li>'+
             		 								'<c:if test='+item.postSellorNot==1+'>'+
             		 								'<li>'+'<a href='+item.postNo+'>Cart+'</a>'+'</li>'+
             		 								'</c:if>'+
             		 		               '</ul>'+
             		 			                  	'<div class="hover_txt">'+
             		 									'<h3>'+item.postTitle+'</h3>'+
             		 									'<p class="sub_txt">'+
             		 									 '<c:forEach var="hash" items='+item.hashs+' varStatus="loop">'+
             		 										 '<c:if test='+item.postNo==item.postNo+'>'+
             		 										+#item.hashtag+
             		 										'</c:if>'+
             		 									'</c:forEach>'+
             		 									'</p>'+
             		 									'<p class="sub_txt">'+
             		 									'</p>'+
             		 									'<p class="bot_txt">'+item.postCategory+'</p>'+
             		 								'</div>'+
             		 							'</li>');
             		 							
             							
             									
             		 							$('#resultList').append(html);	
             		 						
             		 							});
                    			
             						
                         
                    },
                    error       :   function(request, status, error){
                    }
                });
                
            })
            
        });
		
		
		
		//cart 담기 버튼
		$(".hover_btn > li:nth-child(2) >a").click(function(e){  
			
         const postNo = $(this).attr('href');
         const userId = document.getElementById('getuserId').value;
         
         var cartsrc = $(this).children("img").attr("src")==='${pageContext.request.contextPath}/resources/img/gallerylist/nocart.png' ? "${pageContext.request.contextPath}/resources/img/gallerylist/yescart.png" : "${pageContext.request.contextPath}/resources/img/gallerylist/nocart.png";
     	$(this).children('img').attr('src',cartsrc);
     	

         $.ajax({
                 type:"POST",
                 url:"<c:url value='post/CartInList.do'/>",
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