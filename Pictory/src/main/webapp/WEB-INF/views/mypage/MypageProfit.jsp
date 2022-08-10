<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>mylike</title>
	<meta charset="utf-8">
	<!--gallery css-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/gallerylist.css"/>">
	<!--font library-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<!--icon css-->
	<script src="https://kit.fontawesome.com/4e5169080d.js" crossorigin="anonymous"></script>
	<!--bootstrap-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<!--jquery-->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  </head>

  <style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	img{
		width: 40px;
		height: 40px;
	}
	.name{
		display: inline-block;
	}
	.bg-blue{
		background-color: #EBF5FB;
		border-radius: 8px;
	}
	.fa-check,.fa-minus{
		color: blue;
	}
	.table thead th,.table td{
		border: none;
	}

	.table tbody td:first-child{
		border-bottom-left-radius: 10px;
		border-top-left-radius: 10px;
	}
	.table tbody td:last-child{
		border-bottom-right-radius: 10px;
		border-top-right-radius: 10px;
	}
	#spacing-row{
		height: 10px;
	}
	@media(max-width:575px){
		.container{
			width: 125%;
			padding: 20px 10px;
		}
	}
	h6{
		font-size: 14px;
	}
  </style>
	  
	  
<body>
	<div class="content">
	
	</div>
	
</br>
</br>
</br>

<div class="gall_list">
	<div class="top_filter">
		<div class="filter_left">
			<h4 style="font-weight: bold;"><i class="fa-solid fa-hand-holding-dollar" style="color:rgb(0, 151, 65)"></i> 나의 정산</h4>
			<a href="<c:url value="/mypage/Index.do"/>" class="filter_btn text-center"><i class="fa-solid fa-circle-left"> 마이페이지로 돌아가기</i></a>
		</div>				
	</div>

	<div class="container rounded mt-2 bg-white p-md-5">
		<div class="h2 font-weight-bold">판매 내역
		</div>
		<h5>정산 가능 금액: <strong>${preparedTotal}</strong> 원</h5>
	         <c:if test = "${preparedTotal > 10000}">
	            <button class="btn btn-sm bg-dark text-white px-lg-5 mt-2" data-toggle="modal" data-target="#my80sizeCenterModal" href="#">예치금 정산</button>
	         </c:if>
	
	         <c:if test = "${preparedTotal < 10000}">
	            <h6 style="color:tomato">예치금은 10,000원 이상시 정산 가능합니다.</h6>
	         </c:if>
		<hr>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">판매된 상품</th>                    
						<th scope="col">판매 날짜</th>                    
						<th scope="col">판매 금액</th>                                     
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sale" items="${sales}">
						<tr class="bg-blue border-bottom">          
							<td class="pt-2"><h6>${sale.productName}</h6></td>                
							<td class="pt-2"><h6>${sale.soldDate}</h6></td>
							<td class="pt-2"><h6>${sale.profit}</h6></td>
						</tr>
					</c:forEach>
					
					<tr id="spacing-row">
						<td></td>
					</tr>
				</tbody>
			</table>
			<hr>
			<table class="table">
				<thead>
					<tr>
		
						<th scope="col">정산 은행명</th>                    
						<th scope="col">정산 날짜</th>                    
						<th scope="col">정산 금액</th>                                     
					</tr>
				</thead>
				<tbody>
					<c:forEach var="adj" items="${adjustmentList}">
						<tr class="bg-blue border-bottom">           
							<td class="pt-2"><h6>${adj.bank}</h6></td>                
							<td class="pt-2"><h6>${adj.adjDate}</h6></td>
							<td class="pt-2"><h6>${adj.adjAmount}</h6></td>
						</tr>
					</c:forEach>

					
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 80%size Modal at Center -->
	<div class="modal modal-center mt-5" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" data-backdrop="false">
	  <div class="modal-dialog modal-80size modal-center" role="document">
	    <div class="modal-content modal-80size">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalLabel">프로필 변경</h5>
	      </div>
	      <div class="modal-body">
	        <form action="<c:url value="/mypage/InsertProfit.do"/>" method="post" class="needs-validation" novalidate>	 
	          <div class="form-group col-xs-2">
			    <label for="adjAmout">정산금액 </label><small>(정산 가능금액: <strong> ${preparedTotal}</strong> 원)</small>
			    <input type="text" class="form-control check" name="adjAmount" id="adjAmout" aria-describedby="emailHelp" style="border-width:2px" required>
			  	<p class="invalid-feedback">정산금액을 입력하세요</p>
			  </div>
			  <div class="form-group col-xs-2">
			  	  <label for="bank">은행명</label>
				  <select class="browser-default custom-select check" name="bank" required>
					  <option selected style="border-width:2px" selected disabled value="">입금 계좌의 은행 명을 선택하세요</option>
					  <option value="하나은행">하나은행</option>
					  <option value="우리은행">우리은행</option>
					  <option value="신한은행">신한은행</option>
				  </select>
				  <p class="invalid-feedback">은행명을 선택하세요</p>
			  </div>
			  <div class="form-group col-xs-2">
			    <label for="bankNo">계좌번호</label>
			    <input type="text" class="form-control check" id="bankNo" aria-describedby="bankNoHelp" style="border-width:2px" required>
			  	<p class="invalid-feedback">계좌번호를 입력하세요</p>
			  </div>
			  <div class="modal-footer">
			        <button class="btn btn-sm bg-dark text-white px-lg-5 mt-2" type="submit" >예치금정산</button>
	        		<button class="btn btn-sm bg-dark text-white px-lg-5 mt-2" data-dismiss="modal">닫기</button>
	     	   </div>
			</form>
	      </div>
	
	    </div>
	  </div>
	</div>

</body>

<script>
$("#my80sizeCenterModal").css("z-index", "1600");

(function () {
	  'use strict'
	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')
	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
</script>

</html>


