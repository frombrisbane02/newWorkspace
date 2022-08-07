<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#show:hover {
    	content: url('http://localhost:4040/springapp/upload/img/chatbotHi.png');
	}
	.background {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100vh;
	  background-color: rgba(0, 0, 0, 0.3);
	  z-index: 1000;
	  
	  /* 숨기기 */
	  z-index: -1;
	  opacity: 0;
	}
	
	.show {
	  opacity: 1;
	  z-index: 1000;
	  transition: all .5s;
	}
	
	.window {
	  position: relative;
	  width: 100%;
	  height: 100%;
	}
	
	.popup {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: #ffffff;
	  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	  
	  /* 임시 지정 */
	  width: 100px;
	  height: 100px;
	  
	  /* 초기에 약간 아래에 배치 */
	  transform: translate(-50%, -40%);
	}
	
	.show .popup {
	  transform: translate(-50%, -50%);
	  transition: all .5s;
	}
</style>

	<!-- 쳇봇 버튼 -->
	<div style="position:fixed; bottom:8.3rem; right:-0.6rem; z-index:99;"> 
		<a href='#'>
		  <img src="<c:url value="http://localhost:4040/springapp/upload/img/chatbot.png"/>" style="width:100px" id="show"> 
		</a>
	</div>
	
	<div class="background">
	  <div class="window">
	    <div class="popup">
	      <button id="close">닫기</button>
	    </div>
	  <div>
	<div>
</body>

<script>
/*
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$('.btn_gotop').show();
		} else{
			$('.btn_gotop').hide();
		}
	});
	$('.btn_gotop').click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});
	
	function show () {
		  document.querySelector(".background").className = "background show";
		}

		function close () { 
		  document.querySelector(".background").className = "background";
		}

		document.querySelector("#show").addEventListener('click', show);
		document.querySelector("#close").addEventListener('click', close);
	*/
	
	$(document).ready(function(){ 
		   $('#show').on("click", function(){
		      window.open('<c:url value="/Chatbot.do"/>','_blank','toolbar=no, menubar=no, width=500, height=800').focus();
		   });
		});
	
	
</script>
</html>

