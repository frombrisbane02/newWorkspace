<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">


     <!--장바구니-->
     <div id="cart2" role="tabpanel" aria-labelledby="contact-tab" class="tab-pane fade px-4 py-5 show active">
      <div class="box">
           <h1>Shopping cart</h1>
           <p class="text-muted">The pictures you currently put in your shopping cart.</p>
           <div class="table-responsive">
           <form action="<c:url value='/mypage/CartPayment.do'/>" method="post" id="paymentForm">
             <table class="table" style="text-align: center;">
               <thead>
                 <tr>
                   <th></th>
                   <th colspan="1">Product</th>
                   <th>Photographed By</th>
                   <th>Price</th>
                   <th>Commision</th>
                   <th colspan="2">Total</th>
                 </tr>
               </thead>
               <tbody>

               	<c:forEach var="myCart" items="${myCartList}">

                 <tr>
                   <td>
                   <input type="hidden" name="pdNo" value="${myCart.pdNo}">
                   <input type="checkbox"/>
                   	<img src="${myCart.photoUrl}" style="width:250px;height:250px;padding-left:20px">
                  </td>
                   <td><a href="#" id="productName">${myCart.photoName}</a></td>
                   <td>${myCart.userNickName}</td>
                   <td>${myCart.pdPrice}</td>
                   <td>${myCart.commision}</td>
                   <td>${myCart.totalPrice}</td>
                   <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                 </tr>
                 
                 </c:forEach>
 
               </tbody>
               <tfoot>
                 <tr>
                   <th colspan="5">Total</th>
                   <th colspan="2">${total}<span> KRW</span></th>
                   <input type="hidden" name="total" value="${total}" id="total"/>
                 </tr>
               </tfoot>
             </table>
             <div style="text-align: right;">
               <button class="btn btn-dark" style="color:#eeeeee">선택상품 삭제</button>
              
               	<button class="btn btn-dark" style="color:#eeeeee" > 
               		<a href="<c:url value='/mypage/CartDelete.do'/>" >장바구니 비우기</a>
               	</button>
               
                <input type="button" class="btn btn-primary" style="color:#eeeeee" value="구매" onclick="purchase()"/>
             </div>
             </form>
           </div>
       </div>
     </div>

 <script>

	
 	function purchase(){
 		// console.log('클릭이벤트 발생');
		let totalPrice= $('#total').val();
		
 		console.log('productName: '+productName);
 		
 		 IMP.request_pay({ // param
 	          pg: "html5_inicis",
 	          pay_method: "card",
 	          merchant_uid: "ORD20qwe31-33424seeee",
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
