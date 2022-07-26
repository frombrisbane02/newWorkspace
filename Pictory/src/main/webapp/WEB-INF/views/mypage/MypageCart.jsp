<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">

  <form>
     <!--장바구니-->
     <div id="cart2" role="tabpanel" aria-labelledby="contact-tab" class="tab-pane fade px-4 py-5 show active">
      <div class="box">
           <h1>Shopping cart</h1>
           <p class="text-muted">The pictures you currently put in your shopping cart.</p>
           <div class="table-responsive">
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
                 <tr>
                   <td><input type="checkbox"/><a href="#"><img src="<c:url value="/resources/img/mypage/test_img01.jpg"/>" alt="White Blouse Armani" style="width:250px;height:250px;padding-left:20px"></a></td>
                   <td><a href="#">하얗고 이쁜 인테리어</a></td>
                   <td><a href="#">윤진이</a></td>
                   <td>2,500</td>
                   <td>250</td>
                   <td>2,750</td>
                   <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                 </tr>
                 <tr>
                   <td><input type="checkbox"/><a href="#"><img src="<c:url value="/resources/img/mypage/test_img02.jpg"/>" alt="Black Blouse Armani" style="width:250px;height:250px;padding-left:20px"></a></td>
                   <td><a href="#">고급진 분위기의 인테리어 사진</a></td>
                   <td><a href="#">안똥균</a></td>
                   <td>2,000</td>
                   <td>200</td>
                   <td>2,200</td>
                   <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                 </tr>
               </tbody>
               <tfoot>
                 <tr>
                   <th colspan="5">Total</th>
                   <th colspan="2">4,950<span> KRW</span></th>
                 </tr>
               </tfoot>
             </table>
             <div style="text-align: right;">
               <button class="btn btn-dark" style="color:#eeeeee">선택상품 삭제</button>
               <button class="btn btn-dark" style="color:#eeeeee">장바구니 비우기</button>
               <button class="btn btn-primary" style="color:#eeeeee">구매</button>
             </div>
           </div>
       </div>
     </div>
 </form>
