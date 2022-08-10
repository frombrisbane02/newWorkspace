<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>mycart</title>
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
		<!-- 결제 관련 라이브러리 -->
	    <!-- jQuery -->
	 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	    <!-- iamport.payment.js -->
	    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
		
		a:hover { text-decoration:none !important }
	  </style>

<body>
	<div class="content">
	
	</div>

	</br>
	</br>
	</br>
	</br>
	</br>

<div class="gall_list">
	<div class="top_filter">
		<div class="filter_left">
			<h4 style="font-weight: bold;"><i class="fa-solid fa-cart-shopping" style="color:rgba(223, 189, 0, 0.824)"></i> 나의 장바구니</h4>
			<a href="<c:url value="/mypage/Index.do"/>" class="filter_btn"><i class="fa-solid fa-circle-left"> 마이페이지로 돌아가기</i></a>
		</div>				
	</div>

	<div class="container-fluid rounded mt-2 bg-white p-md-5">
		<form action="<c:url value='/mypage/CartPayment.do'/>" method="post" id="paymentForm">
		<div>
			<h5>최종결제 금액: <strong>${total}</strong> 원</h5>
            <input type="hidden" name="total" value="${total}" id="total"/>
			<button class="btn btn-sm bg-dark text-white px-lg-5 mt-2"> 
               		<a href="<c:url value='/mypage/CartDelete.do'/>" style="color:white;">장바구니 비우기</a>
            </button>		
			<input type="button" class="btn btn-sm bg-dark text-white px-lg-5 mt-2" value="결제" onclick="purchase()"/>
		</div>
		<hr>
		<div class="responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">상품명</th> 
						<th scope="col" class="text-center">상품 상세정보</th>                    
						<th scope="col">상품 가격</th>                    
						<th scope="col">수수료</th>       
						<th scope="col">결제 금액</th>                               
					</tr>
				</thead>
				<tbody>
				<c:forEach var="myCart" items="${myCartList}">
					<tr class="bg-light border-bottom"> 
						<input type="hidden" name="pdNo" value="${myCart.pdNo}"/>
						<td class="pt-3"><h6>${myCart.postTitle}</h6></td>              
						<td class="pt-3 ml-5" style="text-align:center">
							<img src="${myCart.photoUrl}" style="width:250px;height:250px;padding-left:20px">		
						</td>                
						<td class="pt-3"><h6>${myCart.pdPrice}</h6></td>
						<td class="pt-3"><h6>${myCart.commision}</h6></td>
						<td class="pt-3"><h6>${myCart.totalPrice}</h6></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		</form>
	</div>
</body>
</html>

<script>
	IMP.init("imp58485321"); // 예: imp00000000
 	function purchase(){
 		// console.log('클릭이벤트 발생');
		let totalPrice= $('#total').val();
 		
 		 IMP.request_pay({ // param
 	          pg: "html5_inicis",
 	          pay_method: "card",
 	          merchant_uid: "ORD20qwe31-334324seeee",
 	          name: "픽토리", // 홈페이지 이름
 	          amount: totalPrice, // 결제 금액
 	          buyer_email: "gildong@gmail.com", // 사용자 정보
 	          buyer_name: "홍길동",
 	          buyer_tel: "010-4242-4242",
 	          buyer_addr: "서울특별시 강남구 신사동",
 	          buyer_postcode: "01181"
 	      }, function (rsp) { // callback
 	         if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
 	        	 console.log(rsp)
 	            // jQuery로 HTTP 요청
 	            jQuery.ajax({
 	                url: "http://localhost:4040/mypage/Payment.do", // 예: https://www.myservice.com/payments/complete
 	                method: "POST",
 	                headers: { "Content-Type": "application/json"},
 	                data: {
 	                    imp_uid: rsp.imp_uid,
 	                    merchant_uid: rsp.merchant_uid
 	                    // post -> pdNo 리스트를 서버로 넘겨서 결제 uid 와 매칭해야 됨
 	                    //
 	                   
 	                }
 	            }).done(function (data) {
 	              // 가맹점 서버 결제 API 성공시 로직
 	                	 console.log(data)
 	                	   	 
 	            })
 	          } else {
 	            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
 	          }
 	      });
 	    } 	
 </script>

