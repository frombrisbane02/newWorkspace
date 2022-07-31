<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- 쳇봇 버튼 -->
	<div style="position:fixed; bottom:35px; right:30px; z-index:99;"> 
		<a href="#doz_header">
		  <img src="<c:url value="/resources/img/chatbot/chatbot.png"/>" style="width:100px"> 
		</a>
	</div>
</body>

<script>
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
</script>
</html>

