<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/page2.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/notice.css"/>"/>

    <script src="${pageContext.request.contextPath}/resources/js/faq/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/faq/html5shiv.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/faq/tab.js"></script>
    <!--font library-->
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
*{font-family: 'Noto Sans KR', sans-serif;}
</style>
</head>
<body>	
	<form method="post" action="<c:url value="/faq/Index.do"/>" accept-charset="UTF-8">
	<div class="top_bg" style="background-image: url(<c:url value="/resources/img/faq/qnabg.jpg"/>"></div>
	<div class="main_area">
		
		<div class="column1">
			<div class="text-left">
			<br><br><b>Frequently And Questions</b>
			</div>
			<br><br>
			
			<b>BUY / SELL</b>	
			<br><br>
			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">Story에 있는 사진 작품을 사고 싶은데 구입할수 없는건가요?</div>
				<h3><div class="col-sm-1"  onclick="myFunction()" id="button1">-</div></h3>
				<br><br></div>
				<div id="first">
					답변 : Story에 있는 작품은 사실상 구매를 할 수는 없습니다 <br>
						  그러나 정말로 마음에 드는 작품을 구매하고 싶다면 작가님에게 DM으로 요청하여<br>
						  해당 작품을 구매 가능하도록 업로드 부탁드린다고 요청하시면 가능합니다<br>
				</div>
			</div>
			
			<hr>

			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">전문작가가 아닌데 사진을 업로드해서 판매가 가능할까요?</div>
				<h3><div class="col-sm-1" onclick="myFunction1()" id="button2">-</div></h3>
				<br><br></div>
				<div id="second">
					답변 : 네 가능합니다<br> 
						  저희 PICTORY에서는 전문 작가 뿐만 아니라 아마추어 작가 및 초보 작가들 까지 상관없이<br>
						  누구든지 제한 없이 업로드 및 구매/판매 까지 가능합니다<br> 
				</div>
			</div>
		
			<hr>
			<br>
			<br>

			<b>ETC</b>	
			<br><br>
			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">관리자가 되고 싶은데 어떻게 해야하나요?</div>
				<h3><div class="col-sm-1"  onclick="myFunction2()" id="button3">-</div></h3>
				<br><br></div>
				<div id="third">
					답변 : 현재로서는 관리자를 채용하지 않습니다<br>
						  그러나 추후에 모집을 할 계획이오니 공지사항을 확인해주시면 감사하겠습니다<br>
				</div>
			</div>
			<hr>
			
			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">프로필 사진을 변경하고 싶은데 어디에서 올려야하나요?</div>
				<h3><div class="col-sm-1"  onclick="myFunction3()" id="button4">-</div></h3>
				<br><br></div>
				<div id="four">
					답변 : 현재 회원가입을 하실 때에는 기본 프로필 사진만 제공합니다<br>
						  그러나 기본 프로필 사진을 변경하고 싶으실 때나 자기소개를 작성하고 싶을 때는<br>
						  마이페이지에서 수정 및 작성이 가능합니다<br>
				</div>
			</div>
			
			<hr>
				
			</div>
			<div class="column">
				<br><br><h4>원하는 질문이 없으신가요?</h4>
				<br><p></p>
				<a href="" class="filter_btn">1:1 문의 남기기</a>
				<input type="text" id="faqUserId" style="display:none" value="${sessionScope.userId}" />
			</div>
	</div>
	<div class="filter_modal">
			<div class="modal_white">
				<a href="" class="close_modal"><img src="<c:url value="/resources/img/faq/test_icon13.png"/>" alt=""></a>
				<h3 style="text-align: center;">Q & A (1:1 질문)</h3>
				<form action="">
				<!--	<div class="fil_wrap">
						<label for="qnacategory"><h5><b>질문 카테고리를 골라주세요</b></h5></label>
						<br>
							<select name="qna" id="qna" style="border: #222222;" >
								<optgroup label="카테고리를 골라주세요">
							  	<option value="qna1">구매/판매 질문</option>
								<option value="qna2">갤러리/스토리 질문</option>
								<option value="qna3">운영자지원 질문</option>
								<option value="qna4">기타</option>	
								
								<option value="1">구매/판매 질문</option>
								<option value="2">갤러리/스토리 질문</option>
								<option value="3">운영자지원 질문</option>
								<option value="4">기타</option>
								
							</optgroup>
							</select>
					</div>	-->
					<div class="container">
						<br>
							<form method="post" action="">   
									
								<div class="form-group">
								<h4 style="color:#484554;">제목</h4>
								<input  type="text" class="form-control" id="qnaTitle"  name="title" placeholder="제목을 입력해주세요" >
								</div>
		
								
								<div class="form-group">
								<h4 style="color:#484554;">내용</h4>
								<textarea class="form-control" rows="5" id="qnaContent" name="content" placeholder="내용을 입력해주세요"></textarea>
								</div>
							</form>	
						</div>					
	
					<div class="btn_area">
						<input type="button" value="취소" style="cursor:pointer;" class="reset_btn buttonClick">
						<input type="button" value="작성" style="cursor:pointer;" class="apply_btn buttonClick">
					</div>
				</form>
			</div>
		</div>
	</form>
</body>
<script>

const localurl = 'http://192.168.0.27:4040/springapp/faq';

    $(window).load(function(){
        $('.filter_btn').click(function(){
        	
        	$('#qna option:eq(0)').prop('selected', true);
        	$('#qnaTitle').val('');
        	$('#qnaContent').val('');
        	
            $('.filter_modal').addClass('mo_ac');
            return false;
        });

        $('.close_modal').click(function(){
            $('.filter_modal').removeClass('mo_ac');
            return false;
        });
    });

    $(document).ready(function(){
      $("#myBtn").click(function(){
        $("#myModal").modal();
      });
    });
    
	$(function() {
	  $('#button1').click( function() {
		if( $(this).html() == '+' ) {
		  $(this).html('-');
		}
		else {
		  $(this).html('+');
		}
	  });
	});
	
	function myFunction() {
  var x = document.getElementById("first");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

	$(function() {
	  $('#button2').click( function() {
		if( $(this).html() == '+' ) {
		  $(this).html('-');
		}
		else {
		  $(this).html('+');
		}
	  });
	});
	
	
		function myFunction1() {
	  var a = document.getElementById("second");
	  if (a.style.display === "none") {
		a.style.display = "block";
	  } else {
		a.style.display = "none";
	  }
	}
	
	$(function() {
	  $('#button3').click( function() {
		if( $(this).html() == '+' ) {
		  $(this).html('-');
		}
		else {
		  $(this).html('+');
		}
	  });
	});
	
		function myFunction2() {
	  var a = document.getElementById("third");
	  if (a.style.display === "none") {
		a.style.display = "block";
	  } else {
		a.style.display = "none";
	  }
	}
	
	$(function() {
	  $('#button4').click( function() {
		if( $(this).html() == '+' ) {
		  $(this).html('-');
		}
		else {
		  $(this).html('+');
		}
	  });
	});

	function myFunction3() {
	  var a = document.getElementById("four");
	  if (a.style.display === "none") {
		a.style.display = "block";
	  } else {
		a.style.display = "none";
	  }
	}
	
	// 클릭 버튼
	$('.buttonClick').on('click', function(){
		var clickValue = $(this).val();
		
		if(clickValue == "작성"){
			qnaInsertFn();
		}else{
			$('#qna option:eq(0)').prop('selected', true);
			$('#qnaTitle').val('');
			$('#qnaContent').val('');
		}
	});
	
	// QNA INSERT
		function qnaInsertFn(){
	
			var userId = $('#faqUserId').val();
	
			if(!userId){
				alert("로그인을 해주세요\n로그인 페이지로 이동합니다");
				window.location.href = "http://192.168.0.27:4040/springapp/auth/Logout.do";
				return false;
			}
			
			var qnaTitle = $('#qnaTitle').val();
			var qnaContent = $('#qnaContent').val();
			
			if(qnaTitle == ""){
				alert("제목을 입력해주세요");
				return false;
			}
			
			if(qnaContent == ""){
				alert("내용을 입력해주세요");
				return false;
			}
			
			var obj = {"userId" : userId, "qnaTitle" : qnaTitle, "qnaContent" : qnaContent};
			var qnaArr = [obj];
			
			 $.ajax({
				    url: localurl + '/qnaSave.do',
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    contentType: "application/json",
				    data: JSON.stringify(qnaArr),
				    success: function(data){
				    	    
				    	if(data == true){
				    		alert("문의 되었습니다.");
				    		$('.filter_modal').removeClass('mo_ac');
				    		return false;
				    	}else{
				    		alert("문의에 실패했습니다.");
				    		return false;
				    	}

				    }, error: function (request, status, error){
				    	alert("Error");
				    }
			  });
		}
		
		
	</script>
</html>