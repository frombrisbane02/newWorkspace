<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

   <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
   <link rel="apple-touch-icon" href="img/favicon.png">

   <link rel="stylesheet" href="<c:url value="/resources/css/faq/common.css"/>"/>
   <link rel="stylesheet" href="<c:url value="/resources/css/gallerylist/gallerylist.css"/>"/>   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

   <script src="${pageContext.request.contextPath}/resources/js/gallerylist/html5shiv.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/gallerylist/tab.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/gallerylist/modernizr.js"></script>
   <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>


<script>
    //Navbar script
    $(document).ready(function() {
        var navbarOffest = $(".navbar").offset().top;
    
        $(window).on("scroll", function() {
        var navbarHeight = $(".navbar").outerHeight();
    
        if ($(window).scrollTop() >= navbarOffest) {
            $(".navbar").addClass("navbar-fixed-top");
            $("body").css("padding-top", navbarHeight + "px");
        } else {
            $(".navbar").removeClass("navbar-fixed-top");
            $("body").css("padding-top", "0");
        }
        });
    });
</script>
<body>   
   <div class="gall_list">
      <div class="top_filter">
         <div class="filter_left">
            <a href="" class="filter_btn"><img src="<c:url value="/resources/img/gallerylist/test_icon12.png"/>" alt="">Filter</a>
            <p class="count"><span>384</span> results found</p>
         </div>            
         <div class="sort_area">
            <a href="" class="sort_ac">Sort by: <span>Popular</span><img src="<c:url value="/resources/img/gallerylist/test_icon10.png"/>" alt=""></a>
            <ul class="sort_list">
               <li class="sort_sel"><a href="">Popular <img src="<c:url value="/resources/img/gallerylist/test_icon11.png"/>" alt=""></a></li>
               <li><a href="">Sort 2 <img src="<c:url value="/resources/img/gallerylist/test_icon11.png"/>" alt=""></a></li>
               <li><a href="">Sort 3 <img src="<c:url value="/resources/img/gallerylist/test_icon11.png"/>" alt=""></a></li>
               <li><a href="">Sort 4 <img src="<c:url value="/resources/img/gallerylist/test_icon11.png"/>" alt=""></a></li>
               <li><a href="">Sort 5 <img src="<c:url value="/resources/img/gallerylist/test_icon11.png"/>" alt=""></a></li>
            </ul>
         </div>
      </div>
      <script>
         $(window).load(function(){
            $('.sort_ac').toggle(function(){
               $('.sort_list').slideDown();
               $('img',this).css("transform","rotate(180deg)");
               return false;
            },function(){
               $('.sort_list').slideUp();
               $('img',this).css("transform","rotate(0deg)");
                 return false;
            });
         });
      </script>

      <ul class="fil_sel_list">
         <li>
            <a href=""><img src="<c:url value="/resources/img/gallerylist/test_icon16.png"/>" alt=""></a>
            <p>Clean all</p>
         </li>

         <li>
            <a href=""><img src="<c:url value="/resources/img/gallerylist/test_icon16.png"/>" alt=""></a>
            <p>CATEGORY 1</p>
         </li>

         <li>
            <a href=""><img src="<c:url value="/resources/img/gallerylist/test_icon16.png"/>" alt=""></a>
            <p>CATEGORY 2</p>
         </li>

         <li>
            <a href=""><img src="<c:url value="/resources/img/gallerylist/test_icon16.png"/>" alt=""></a>
            <p>CATEGORY 4</p>
         </li>

         <li>
            <a href=""><img src="<c:url value="/resources/img/gallerylist/test_icon16.png"/>" alt=""></a>
            <p>COLOR 2</p>
         </li>
      </ul>

      <ul class="gall_list_wrap">
         <li class="photo_area">
            <a href="" class="photo_link">               
               <div class="img_area" style="background-image: url(<c:url value="/resources/img/gallerylist/test_img12.jpg"/>);"><img src="<c:url value="/resources/img/gallerylist/fake03.png"/>" alt=""></div>   

               <div class="txt_area">
                  <p><img src="<c:url value="/resources/img/gallerylist/test_img02.jpg"/>" alt="" class="pro_p">User name</p>
                  <p><img src="<c:url value="/resources/img/gallerylist/test_icon06.png"/>" alt="" class="pro_icon"><span>0</span><img src="<c:url value="/resources/img/gallerylist/test_icon07.png"/>" alt="" class="pro_icon"><span>0</span></p>
               </div>                  
            </a>

            <ul class="hover_btn">
               <li><a type="button" onclick="toggleLikeIt(this)" class="btn btn-success cart" id="likeit-10001"><img src="<c:url value="/resources/img/gallerylist/test_icon06.png"/>" alt="">Like</a></li>
               <li><a type="button" onclick="toggleCart(this)" class="btn btn-success cart" id="cart-10001">Add Cart</a></li>
               <!-- 구입 완료시 add Cart를 Save 버튼으로 변경필요 -->   
               <li><a type="button" href="<c:url value="/gallery/Download.do?filename=10003"/>" class="btn btn-primary download" id="download10003">Save</a></li>
            </ul>
            <div class="hover_txt">
               <h3>Marietta Modern Farmhouse</h3>
               <p class="sub_txt">Farmhouse Laundry Room</p>
               <p class="bot_txt">United Kingdom</p>
            </div>
         </li>
      </ul>
   </div>

   <div class="filter_modal">
      <div class="modal_white">
         <a href="" class="close_modal"><img src="<c:url value="/resources/img/gallerylist/test_icon13.png"/>" alt=""></a>
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
                     <label for="filter1-1"><a class="link-primary category" id="bottomType_0">일러스트</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter1-2" checked="checked">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter1-2"><a class="link-primary category" id="bottomType_1">사진</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter1-3">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter1-3"><a class="link-primary category" id="bottomType_2">회화</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter1-4" checked="checked">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter1-4"><a class="link-primary category" id="bottomType_3">캘리그라피</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter1-5">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter1-5"><a class="link-primary category" id="bottomType_4">패턴</a></label>
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
                     <label for="filter2-1"><a class="link-primary category" id="bottomColor_0">흰색</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter2-2" checked="checked">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter2-2"><a class="link-primary category" id="bottomColor_1">빨강</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter2-3">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter2-3"><a class="link-primary category" id="bottomColor_2">파랑</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter2-4">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter2-4"><a class="link-primary category" id="bottomColor_3">주황</a></label>
                  </div>

                  <div class="sel_box">
                     <div class="check_wrap">
                        <input type="checkbox" id="filter2-5">
                        <div class="check_btn"></div>
                     </div>
                     <label for="filter2-5"><a class="link-primary category" id="bottomColor_4">노랑</a></label>
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
   
   <!-- 재현이가 넣은 script 일단 넣어둠.. -->
   <script>
   function toggleCart(button) {
		const articleNo =  button.id.split("-")[1];
		const doCart = button.innerHTML.indexOf("U") == -1;
		
		$.ajax({
			type: "GET",
			url: "<c:url value="/Cart.do"/>" + "?no=" + articleNo + "&doCart=" + doCart,
			dataType: "json",
			success : (data) => {
				document.querySelector("#cartSpan").innerHTML = data.noList + "가 카트에 " + (doCart ? "등록" : "비등록") + "됐습니다.";
				if (doCart) {
					button.setAttribute("class", "btn btn-danger");
					button.innerHTML = "UnCart";
				} else {
					button.setAttribute("class", "btn btn-success");
					button.innerHTML = "Add Cart";
				}
				
			},
			fail : (err) => {
				console.log(err);
			}
		});
	}

	function toggleLikeIt(button) {
		const articleNo =  button.id.split("-")[1];
		const doLike = button.innerHTML.indexOf("C") == -1;
		
		$.ajax({
			type: "GET",
			url: "<c:url value="/mypage/likeit/Like.do"/>" + "?no=" + articleNo + "&doLike=" + doLike,
			dataType: "json",
			success : (data) => {
				document.querySelector("#likeSpan").innerHTML = data.noList + "가 좋아요에 " + (doLike ? "등록" : "비등록") + "됐습니다.";
				if (doLike) {
					button.setAttribute("class", "btn btn-danger");
					button.innerHTML = "Cancel Like";
				} else {
					button.setAttribute("class", "btn btn-success");
					button.innerHTML = "Like";
				}
			},
			fail : (err) => {
				console.log(err);
			}
		});
	}
	
	window.addEventListener('DOMContentLoaded', () => {
		const categories = document.querySelectorAll("a.category");
		const carts = document.querySelectorAll("a.cart");
		const downloads = document.querySelectorAll("a.download");
		const purchases = document.querySelectorAll("a.purchase");
		const saleFilter = document.querySelector("#saleFilter");
		const recentFilter = document.querySelector("#recentFilter");

		Array.prototype.forEach.call(categories, function(aTag) {
			aTag.addEventListener("click", categoryQuery, false);
		});
		/*
		Array.prototype.forEach.call(carts, function(aTag) {
			aTag.addEventListener("click", cartQuery, false);
		});
		*/
		Array.prototype.forEach.call(purchases, function(aTag) {
			aTag.addEventListener("click", purchaseQuery, false);
		});
		saleFilter.addEventListener("click", saleQuery, false);
		recentFilter.addEventListener("click", recentQuery, false);

		let category;
		let catValue;
		let searchColumn = "${param.searchColumn}".length != 0 ? "${param.searchColumn}" : undefined;
		let searchWord = "${param.searchWord}".length != 0 ? "${param.searchWord}" : undefined;
		let sortType;
		let page;
		
		function categoryQuery() {
			catValue = this.innerHTML;
			if (this.id.indexOf("Color") != -1) {
				category = "color";
			} else if (this.id.indexOf("Tag") != -1) {
				category = "tag";
			} else {
				category = "type";
			}			
			let targetURL = "<c:url value="/gallery/article/List.do"/>?";
			targetURL = completeTargetURL(targetURL);
			
			
	        $.ajax({
				type: "GET",
				url: targetURL,
				dataType: "json",
		        success : (data) => {
		        	let result = targetURL;
		        	result += "<br/>";
		        	data.forEach((article) => {
		        		result += article.title;
		        	})
					document.querySelector("#articleListSpan").innerHTML =  result;
				},
				fail : (err) => {
					console.log(err);
				}
			});
		}
		
		function saleQuery() {
			let targetURL = "<c:url value="/gallery/article/List.do"/>?";
			sortType = "sale"
			targetURL = completeTargetURL(targetURL);

	        $.ajax({
				type: "GET",
				url: targetURL,
				dataType: "json",
		        success : (data) => {
		        	console.log(data);
		        	let result = targetURL;
		        	result += "<br/>";
		        	data.forEach((article) => {
		        		result += article.title;
		        	})
					document.querySelector("#articleListSpan").innerHTML =  result;
				}
			});
		}

		function recentQuery() {
			let targetURL = "<c:url value="/gallery/article/List.do"/>?";
			sortType = "recent";
			targetURL = completeTargetURL(targetURL);
			
	        $.ajax({
				type: "GET",
				url: targetURL,
				dataType: "json",
		        success : (data) => {
		        	let result = targetURL;
		        	result += "<br/>";
		        	data.forEach((article) => {
		        		result += article.title;
		        	})
					document.querySelector("#articleListSpan").innerHTML =  result;
				}
			});
		}
		
		function completeTargetURL(targetURL) {
			if (category !== undefined) {
				if (! targetURL.endsWith("?")) {
					targetURL += "&"
				}
				targetURL += "category=" + category;
			}
			if (catValue !== undefined) {
				if (! targetURL.endsWith("?")) {
					targetURL += "&"
				}
				targetURL += "catValue=" + catValue;
			}
			if (searchColumn !== undefined) {
				if (! targetURL.endsWith("?")) {
					targetURL += "&"
				}
				targetURL += "searchColumn=" + searchColumn;
			}
			if (searchWord !== undefined) {
				if (! targetURL.endsWith("?")) {
					targetURL += "&"
				}
				targetURL += "&searchWord=" + searchWord;
			}
			if (sortType !== undefined) {
				if (! targetURL.endsWith("?")) {
					targetURL += "&"
				}
				targetURL += "sortType=" + sortType;
			}
			return targetURL;
		}
		
		function purchaseQuery() {
			const articleNo = this.id.split("purchase")[1];
	        $.ajax({
				type: "GET",
				url: "<c:url value="/Purchase.do"/>"+"?no="+articleNo,
				dataType: "json",
		        success : (data) => {
					document.querySelector("#purchaseSpan").innerHTML = data.noList + "가 구매됐습니다.";
				}
			});
		}
		
		//
		// LOAD function으로 뺄 영역
		//
		const recommendDIV = document.querySelector("#recommendDIV");
		const topCreatorDIV = document.querySelector("#topCreatorDIV");
		
		// innerHTML에 들어가는 데이터는 하드코딩이 아닌 요청으로 이뤄질 예정
		recommendDIV.innerHTML = `
			<div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_1"><span>브런치 먹는 날</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_2"><span>빈티지</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_3"><span>여름</span></a></div>
		    </div>
		    <div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		    </div>
		`;
		
		// innerHTML에 들어가는 데이터는 하드코딩이 아닌 요청으로 이뤄질 예정
		topCreatorDIV.innerHTML = `
		    <div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_1"><span>브런치 먹는 날</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_2"><span>빈티지</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_3"><span>여름</span></a></div>
		    </div>
		    <div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		    </div>
		`;
	});
   </script>
   
	<h5><span id="cartSpan"></span></h5>
	<h5><span id="likeSpan"></span></h5>
	<h5><span id="purchaseSpan"></span></h5>
	<h5><span id="downloadSpan"></span></h5>
</body>
</html>