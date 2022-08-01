<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" href="<c:url value="/resources/css/faq/common.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/page2.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/faq/notice.css"/>"/>

    <script src="${pageContext.request.contextPath}/resources/js/faq/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/faq/html5shiv.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/faq/tab.js"></script>
    
<body>	
	<form method="post" action="<c:url value="/faq/Index.do"/>" accept-charset="UTF-8">
	<div class="top_bg" style="background-image: url(<c:url value="/resources/img/faq/qnabg.jpg"/>"></div>
	<div class="main_area">
		
		<div class="column1">
			<div class="text-left">
			<br><br><b>Frequently And Questions</b>
			</div>
			<br><br>
			
			<b>Shippping</b>	
			<br><br>
			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">명탐정 코난!</div>
				<h3><div class="col-sm-1"  onclick="myFunction()" id="button1">-</div></h3>
				<br><br></div>
				<div id="first">
					Hello My mr.yesterday. 전해주지 않을래? <br>
					꿈이 이루어지는 그때 꼭 다시 만나자고.<br>
					미치도록 내달려도 앞이 보이지 않아 덩그러니 홀로 남겨져 길 위에 털썩 주저앉아<br>
					애써 눈물을 참으려 했어
					초라한 내가 싫어서..
				</div>
			</div>
			
			<hr>

			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">원피스!</div>
				<h3><div class="col-sm-1" onclick="myFunction1()" id="button2">-</div></h3>
				<br><br></div>
				<div id="second">
					내 어린 시절 우연히 들었던 믿지 못할 한마디<br> 
					이세상을 다준다는 매혹적인 얘기 내게 꿈을 심어주었어<br>
					말도 안돼 고개 저어도 내안의 나 나를 보고 속삭여<br> 
					세상은 꿈꾸는 자의 것이라고 용기를 내 넌 할 수 있어
				</div>
			</div>
		
			<hr>
			<br>
			<br>

			<b>Order Process</b>	
			<br><br>
			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">꾸러기 수비대!</div>
				<h3><div class="col-sm-1"  onclick="myFunction2()" id="button3">-</div></h3>
				<br><br></div>
				<div id="third">
					똘기 떵이 호치 새초미 자축인묘<br>
					드라고 요롱이 마초 미미 진사오미<br>
					뭉치 키키 강다리 찡찡이 신유술해<br>
					우리끼리 꾸러기 꾸러기 우리들은 열두 동물<br>
					열두간지 꾸러기 수비대
				</div>
			</div>
			<hr>
			<br><br>
			<div class="text-left">
			<div class="row">
				<div class="col-sm-11">나루토!</div>
				<h3><div class="col-sm-1"  onclick="myFunction3()" id="button4">-</div></h3>
				<br><br></div>
				<div id="four">
					내게 허락된 건 힘겹기만한 거친 미래라 해도<br>
					나를 깨운 꿈엔 모든 걸 걸고 달려갈꺼야<br>
					나뭇잎 끝에 흩어지는 바람에 나의 꿈이 흔들려<br>
					하지만 아직 내게 깃든 운명을 탓할 필요는 없지<br>
					모두가 날 알아줄 그날이 언젠가 찾아올테니
				</div>
			</div>
			
			<hr>
				
			</div>
			<div class="column">
				<br><br><h4>질문을 찾지 못하였습니까</h4>
				<br><p>Q&A로 넘어가시죠</p>
				<a href="" class="filter_btn">Filter</a>
			</div>
	</div>
	<div class="filter_modal">
			<div class="modal_white">
				<a href="" class="close_modal"><img src="<c:url value="/resources/img/faq/test_icon13.png"/>" alt=""></a>
				<h3 style="text-align: center;">Q & A (1:1 질문)</h3>
				<form action="">
					<div class="fil_wrap">
						<label for="qnacategory"><h5><b>질문 카테고리를 골라주세요</b></h5></label>
						<br>
							<select name="qna" id="qna" style="border: #222222;" >
							<!--	<optgroup label="카테고리를 골라주세요">
							  	<option value="qna1">구매/판매 질문</option>
								<option value="qna2">갤러리/스토리 질문</option>
								<option value="qna3">운영자지원 질문</option>
								<option value="qna4">기타</option>	-->
								
								<option value="1">구매/판매 질문</option>
								<option value="2">갤러리/스토리 질문</option>
								<option value="3">운영자지원 질문</option>
								<option value="4">기타</option>
								
							</optgroup>
							</select>
					</div>
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
						<input type="button" value="RESET" class="reset_btn buttonClick">
						<input type="button" value="APPLY" style="cursor:pointer;" class="apply_btn buttonClick">
					</div>
				</form>
			</div>
		</div>
	</form>
</body>
<script>

const localhost = 'http://localhost:4040/springapp/faq';

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
		
		if(clickValue == "APPLY"){
			qnaInsertFn();
		}else{
			$('#qna option:eq(0)').prop('selected', true);
			$('#qnaTitle').val('');
			$('#qnaContent').val('');
		}
	});
	
	// QNA INSERT
		function qnaInsertFn(){
		
			var qnaCatgory = $('#qna').val();
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
			
			
			var obj = { "userNo" : 1, "qnaCode" : 1 ,"qnaCatgory" : qnaCatgory, "qnaTitle" : qnaTitle, "qnaContent" : qnaContent };
			var qnaArr = [obj];
			
			 $.ajax({
				    url: localhost + '/qnaSave.do',
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