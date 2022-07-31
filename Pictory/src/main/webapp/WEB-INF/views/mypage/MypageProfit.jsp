<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!--정산관련-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mypage/page2.css"/>">
  
  <form>       
       <div id="sell2" role="tabpanel" aria-labelledby="profile-tab" class="tab-pane fade px-4 py-5 show active">
          <div class="box">
            <h1>My Sales Log</h1>
            <p class="text-muted">정산과 관련하여 문의사항이 있다면 <a href="contact.html">관리자 문의 페이지</a>에서 문의하세요 </p>
            <td><span class="badge badge-info">Prepared</span> 정산 미완료</td>
            <td><span class="badge badge-warning">Received</span> 정산 완료</td>
            <hr>
            <div class="table-responsive">
              <table class="table table-hover text-center">
                <thead>
                  <tr>
                    <th>Sold Date</th>
                    <th>Product</th>
                    <th>Profit</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="sale" items="${sales}">
                  <tr>
                    <th>${sale.soldDate}</th>
                    <td>${sale.productName}</td>
                    <td>${sale.profit}</td>
                    <td><span class="badge badge-info">${sale.status eq 0 ? "prepared" : "received" }</span></td>
                  </tr>
                  </c:forEach>
                </tbody>
                  <tr class="text-center">
                    <th>Total</th>
                    <th>${preparedTotal}<span> KRW</span></th>
                  </tr>
              </table>
            </div>
            <div style="text-align: right;">
              <button class="btn btn-dark" style="color:#eeeeee" data-toggle="modal" data-target="#myModal">예치금 정산 신청하기</button>
            </div>
          </div>
        </div>
 	</form>
 	
 	 <!-- End lined tabs -->
        <div class="modal fade" id="myModal">
    	<div class="modal-dialog modal-sm">
      	<div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">예치금 정산 신청</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="account_name">예금주</label>
                <input id="account_name" type="text" class="form-control">
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label for="account_num">계좌번호</label>
                <input id="account_num" type="text" class="form-control">
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label for="account_bank">은행</label>
                <input id="account_bank" type="text" class="form-control">
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label for="account_amt">정산금액</label><span> (예치금: </span>4,000<span> )</span>
                <input id="account_amt" type="text" class="form-control">
              </div>
            </div>
          </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Submit</button>
        </div>
      </div>
    </div>
  </div>
</body>