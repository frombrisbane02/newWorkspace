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
                   <td><a href="#">${myCart.photoName}</a></td>
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
                   <input type="hidden" name="total" value="${total}" />
                 </tr>
               </tfoot>
             </table>
             <div style="text-align: right;">
               <button class="btn btn-dark" style="color:#eeeeee">선택상품 삭제</button>
              
               	<button class="btn btn-dark" style="color:#eeeeee" > 
               		<a href="<c:url value='/mypage/CartDelete.do'/>" >장바구니 비우기</a>
               	</button>
               
                <input type="submit" class="btn btn-primary" style="color:#eeeeee" value="구매"/>
             </div>
             </form>
           </div>
       </div>
     </div>

 
