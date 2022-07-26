<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">    
	<h2>갤러리</h2>
	
	<h4>당신을 위한 컨텐츠</h4>
	<div id="recommendDIV">
	</div>
	
	<h4>탑 크리에이터</h4>
	<div id="topCreatorDIV">
	</div>
	
	<div id="innerDiscover">
		<h2 class="tit_discover"><span class="blind">Discover</span></h2>	
		<div id="tabDiscover">
			<ul>
				<li id="tabCategory">
				<span>유형별</span>
				<ul>
					<li><a class="link-primary category" id="bottomType_0">일러스트</a></li>
					<li><a class="link-primary category" id="bottomType_1">사진</a></li>
					<li><a class="link-primary category" id="bottomType_2">회화</a></li>
					<li><a class="link-primary category" id="bottomType_3">캘리그라피</a></li>
					<li><a class="link-primary category" id="bottomType_4">패턴</a></li>
				</ul>
				</li>
				<li id="tabTag">
				<span>태그별</span>
				<ul>
					<li><a class="link-primary category" id="bottomTag_0">전체</a></li>
					<li><a class="link-primary category" id="bottomTag_1">커플</a></li>
					<li><a class="link-primary category" id="bottomTag_2">행복한 우리집</a></li>
					<li><a class="link-primary category" id="bottomTag_3">꽃</a></li>
					<li><a class="link-primary category" id="bottomTag_4">사랑</a></li>
				</ul>
				</li>
				<li id="tabColor">
				<span>색상별</span>
				<ul>
					<li><a class="link-primary category" id="bottomColor_0">흰색</a></li>
					<li><a class="link-primary category" id="bottomColor_1">빨강</a></li>
					<li><a class="link-primary category" id="bottomColor_2">파랑</a></li>
					<li><a class="link-primary category" id="bottomColor_3">주황</a></li>
					<li><a class="link-primary category" id="bottomColor_4">노랑</a></li>
				</ul>
				</li>
			</ul>
		</div>
	</div>
</div>

<h3>검색 결과 = <span id="articleListSpan">${articleList }</span></h3>


<h3>정렬</h3>
<ul>
<li><a type="button" class="btn btn-warning sale-filter" id="saleFilter">판매중 사진만 보기</a></li>
<li><a type="button" class="btn btn-warning recent-filter" id="recentFilter">최신순</a></li>
</ul>

<h3><span id="cartSpan"></span></h3>
<h3><span id="likeSpan"></span></h3>
<h3><span id="purchaseSpan"></span></h3>
<h3><span id="downloadSpan"></span></h3>

<ul>
<li>
	<img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre">
	<a href="<c:url value="/gallery/View.do?no=10001"/>">글10001</a>
	<a type="button" onclick="toggleCart(this)" class="btn btn-success cart" id="cart-10001">카트</a>
	<a type="button" onclick="toggleLikeIt(this)" class="btn btn-success cart" id="likeit-10001">좋아요</a>
	<a type="button" class="btn btn-primary purchase" id="purchase10001">구매</a>
</li>
<li>
	<img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre">
	<a href="<c:url value="/gallery/View.do?no=10002"/>">글10002</a>
	<a type="button" onclick="toggleCart(this)" class="btn btn-success cart" id="cart-10002">카트</a>
	<a type="button" onclick="toggleLikeIt(this)" class="btn btn-success cart" id="likeit-10002">좋아요</a>
	<a type="button" href="<c:url value="/gallery/Download.do?filename=10002"/>" class="btn btn-primary download" id="download10002">다운로드</a>
</li>
<li>
	<img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre">
	<a href="<c:url value="/gallery/View.do?no=10003"/>">글10003</a>
	<a type="button" onclick="toggleCart(this)" class="btn btn-success cart" id="cart-10003">카트</a>
	<a type="button" onclick="toggleLikeIt(this)" class="btn btn-success cart" id="likeit-10003">좋아요</a>
	<a type="button" href="<c:url value="/gallery/Download.do?filename=10003"/>" class="btn btn-primary download" id="download10003">다운로드</a>
</li>
</ul>


<script>

	function toggleCart(button) {
		const articleNo =  button.id.split("-")[1];
		const doCart = button.innerHTML.indexOf("언") == -1;
		
		$.ajax({
			type: "GET",
			url: "<c:url value="/Cart.do"/>" + "?no=" + articleNo + "&doCart=" + doCart,
			dataType: "json",
			success : (data) => {
				document.querySelector("#cartSpan").innerHTML = data.noList + "가 카트에 " + (doCart ? "등록" : "비등록") + "됐습니다.";
				if (doCart) {
					button.setAttribute("class", "btn btn-danger");
					button.innerHTML = "언카트";
				} else {
					button.setAttribute("class", "btn btn-success");
					button.innerHTML = "카트";
				}
				
			},
			fail : (err) => {
				console.log(err);
			}
		});
	}

	function toggleLikeIt(button) {
		const articleNo =  button.id.split("-")[1];
		const doLike = button.innerHTML.indexOf("취") == -1;
		
		$.ajax({
			type: "GET",
			url: "<c:url value="/mypage/likeit/Like.do"/>" + "?no=" + articleNo + "&doLike=" + doLike,
			dataType: "json",
			success : (data) => {
				document.querySelector("#likeSpan").innerHTML = data.noList + "가 좋아요에 " + (doLike ? "등록" : "비등록") + "됐습니다.";
				if (doLike) {
					button.setAttribute("class", "btn btn-danger");
					button.innerHTML = "좋어요 취소";
				} else {
					button.setAttribute("class", "btn btn-success");
					button.innerHTML = "좋아요";
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