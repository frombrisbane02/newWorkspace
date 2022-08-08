<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/WEB-INF/views/Top.jsp"/>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1">
	<title>Gallery</title>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<link rel="apple-touch-icon" href="img/favicon.png">
	<link rel="stylesheet" type="text/css" href="http://localhost:4040/springapp/resources/css/galleryview/common.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:4040/springapp/resources/css/gallerylist/gallerylist.css">

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
				<a href="" class="filter_btn"><img src="<c:url value="/resources/img/story/test_icon12.png"/>"alt="">Filter</a>
				<p class="count"><span>${fn:length(lists)}</span>개의 글</p>
			</div>
			<!-- sort area 삭제함 -->
		</div>
		<ul class="fil_sel_list">
		<!-- 여기 선택한 필터 리스트 목록 갖고와서 foreach로 뿌리면서 엑스<도 기능하고, 엑스 눌렀을때 체크 해제되게 기능구현  -->
			<spen id='view_content_order'>
			<li>
				<a href=""><img src="<c:url value="/resources/img/story/test_icon16.png"/>" alt=""></a>
				<p>Clean all</p>
			</li>
			</spen>

		</ul>
		

		<ul class="gall_list_wrap">
		<!-- li~li까지 데이터 저장후 받아와서 foreach로 뿌리기 -->
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
							<p><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="" class="pro_icon"><span>${list.postLikes}</span><img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon07.png" alt="" class="pro_icon"><span>${list.commentCount}</span></p>
						</div>		
					</a>
					<!-- 좋아요 버튼 -->
					<ul class="hover_btn">
						<li><a id="aprevent${list.postNo}" href="${list.postNo}">
							<c:if test="${list.likeornot == 1}">
								<img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png" alt="">
							</c:if>
							<c:if test="${list.likeornot == 0}">
								<img src="${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png" alt="">
							</c:if>
					Like</a></li>
						<!-- 판매글이면 카트 버튼이 있어야함 근데 걔가 카트를 넣었다? 그러면 다른 걸로 뿌려야함 -->
						
						<c:if test="${list.postSellorNot==1}">
						<li><a href="${list.postNo}">Cart</a></li>
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
	<!--
				<div class="fil_wrap">
					<p class="filter_tit">COLOR</p>
					<div class="select_area">
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="black"  id="black">
								<div class="check_btn"></div>
							</div>
							<label for="black">BLACK</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="white" id="white">
								<div class="check_btn"></div>
							</div>
							<label for="white">WHITE</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="red" id="red">
								<div class="check_btn"></div>
							</div>
							<label for="red">RED</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox"  name="postCategory" value="blue" id="blue" >
								<div class="check_btn"></div>
							</div>
							<label for="blue">BLUE</label>
						</div>

						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox"  name="postCategory" value="green" id="green">
								<div class="check_btn"></div>
							</div>
							<label for="green">GREEN</label>
						</div>
						
						<div class="sel_box">
							<div class="check_wrap">
								<input type="checkbox" name="postCategory" value="pink" id="pink" >
								<div class="check_btn"></div>
							</div>
							<label for="pink">PINK</label>
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
					</div>
				</div>					 -->

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
	
	   // 카테고리 value 영어로 받아와서 한글로 바꿔서 출력하기
	   /*
	   $(document).ready(function(){
		   
		   var category= $('.bot_txt').text();
		   
		   switch(category){
		   	case "etc":
		   		$('.bot_txt').text("기타"); break;
		   		
		   	case "landscape":
		   		$('.bot_txt').text("풍경"); break;
		   	case "object":
		   		$('.bot_txt').text("정물"); break;
		   	default: $('.bot_txt').text("인물"); break;
		   }
		   
	 });*/
	   
	   /*
	   var category = document.querySelector('.bot_txt').value;
	   console.log('원래 카테',category);
	   if(category=='etc'){
		   var catekor = '기타';
		   document.querySelector('.bot_txt').value=catekor;
		   console.log('바뀐 카테',document.querySelector('.bot_txt').value);
	   }
	   */
	
	
	
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
			
		});

		

		
		
		
		$(".hover_btn>li>a").click(function(e){  
			
         const postNo = $(this).attr('href');
         const userId = document.getElementById('getuserId').value;
         console.log(e.target.id);
         console.log('postNo :', postNo);
         console.log('userId :', userId);
         var likesrc = $(this).children("img").attr("src")==='${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png' ? "${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png" : "${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png";
     	$(this).children('img').attr('src',likesrc);

         $.ajax({
                 type:"POST",
                 url:"<c:url value='post/Likes.do'/>",
                 data: "postNo="+postNo+"&userId="+userId
                 }).done(function(data){
                	
                    //var srcsrc = ($(this).children("img").attr('src')==='${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png')) ? '${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png' : '${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png';
                	//$(this).children('img').attr('src',srcsrc);
                	 
                	 //var anchor = $('#aprevent'+postNo);
                	 //if($('#aprevent'+postNo))
                	 
                	 /*
                	 if(data==1){
                		 
                		 $(this).children('img').attr("src","${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png");
                		 //$(".hover_btn>li>a>img").attr("src","${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06.png");
                		 console.log("좋아요 취소1",data);
                	 }else if(data==0 && postNo){
                		 $(this).children('img').attr("src","${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png");
                		 //$(".hover_btn>li>a>img").attr("src","${pageContext.request.contextPath}/resources/img/gallerylist/test_icon06red.png");
                		 console.log("좋아요 2",data);
                     	 }*/
                		
              }).fail(function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              
                 console.log('무슨 실패입니까?');
              });
         
         e.preventDefault();
         console.log('e.preventDefault() 실행');
         
      });
	

		
				
		//=============filter 배열에 저장 후 보여주기================
		
		/*
		//해시태그 추가시 배열에 저장 후 보여주기
		var filters=[];
		function addfilter(){
		    
		    var filter = document.querySelector(".postCategory").value;
		    console.log(filter);
		    //tags[] 배열에 저장(컨트롤러 보낼용도)
		    filters.push(filter);
		    console.log(filters);
		    var ul = document.querySelector("#hashtaglist");
		
		    var li = document.createElement('li');
		    li.innerHTML="#"+filter+" ";
		    li.style.display = "none";
		    li.style.display = "inline";
		
		    ul.appendChild(li);
		    document.querySelector(".postCategory").value="";
		    
		    filters.join;
		    document.querySelector('#filters').value=filters;
		
		};
	*/
		
		/*
		//=====================
			$(document).ready(function(){
		
		//===종근 - 클릭시 태그 생성 ==============================================
			/*
			var num = 0;
			function add_table(){
			    var table_add = document.getElementById('view_content_order');
			    div = document.createElement("div"); 
			    var table = "<table id='row_"+num+"'><tr><td>...</td></tr></table>" ;
			    div.innerHTML = table;
			    table_add.appendChild(div);
			    num++;
			}
			function add_table1(txt,gid){ 
			 var table_add = document.getElementById('view_content_order');
			 div = document.createElement("div"); 
			 var table = "<table width='100%' id='row_"+gid+"'><tr><td>"+txt+"</td></tr></table>" ;
			 div.innerHTML = table;
			 table_add.appendChild(div);
			 num++; 
			}
			function del_table(gid){
			    var table_add = document.getElementById('view_content_order');
			    var table_del = document.getElementById('row_'+gid);
			    table_add.removeChild(table_del.parentNode);
			}
			
			function add_list(chk,txt,gid)
			{
			 if(chk.checked==true)
			 {
			  add_table1(txt,gid);
			 }
			 else
			 {
			  del_table(gid)  
			 }
			}
			*/
		//==================================================
			
		//===========종근(필터 Ajax)
		  $(document).ready(function(){
            
            $("#apply").click(function() {
                //배열 선언
                var checkArray = [];
                
                $('input[name="postCategory"]:checked').each(function(i){//체크된 리스트 저장
                	checkArray.push($(this).val());
                });
                
                console.log('checkArray :', checkArray);
                
                var checkParams = {
                        //"user"      : $("#user").val(), //유저 저장
                        "checkList" : checkArray        //체크배열 저장
                    };
                console.log('checkParams :', checkParams);
                //ajax 호출
                $.ajax({
                    url         :   "<c:url value="/gallery/filter.do"/>",
                    dataType    :   "json",
                    contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                    type        :   "post",
                    data        :   checkParams,
                    success     :   function(result){
 						console.log(result)
 						console.log(result[0].postTitle)
 						
                         
                    },
                    error       :   function(request, status, error){
                        console.log("AJAX_ERROR(종근)");
                    }
                });
                
            })
            
        });
			
			//===========================
	</script>
</body>
</html>