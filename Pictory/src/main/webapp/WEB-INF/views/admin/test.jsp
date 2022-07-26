<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="게시글" onclick="postInsertFn();"><br><br>
</body>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
	const localhost = 'http://localhost:4040/springapp/admin';
	
	$(document).ready(function(){
		console.log("데이터 넣기");
	});
	
	
	
	// 게시글 저장
	function postInsertFn(){
		
		
	 	$.ajax({
		 	url: localhost + "/post.do",
		    type: "POST",
		    cache: false,
	        dataType: "json",
		    data: { },
		    success: function(data){
				
		    
				
		    }, error: function (request, status, error){
		    	alert("Error");
		    }
		  });
	}

</script>


</html>