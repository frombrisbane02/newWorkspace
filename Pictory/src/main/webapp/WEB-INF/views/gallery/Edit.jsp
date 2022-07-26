<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	<div class="jumbotron">
		<h1>
			한줄 댓글 게시판 <small>작성 페이지</small>
		</h1>
	</div>


	<form method="post" action="<c:url value="/gallery/article/Edit.do"/>" accept-charset="UTF-8">
	  <input type="hidden" name="no" value="${article.no}"/>
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      
      <div class="form-group">
        <label><kbd class="lead">제목</kbd></label>
        <input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" value="${article.title}" />
      </div>
      
      <div class="form-group">
		<label><kbd class="lead">내용</kbd></label>
		<textarea class="form-control" rows="5" name="content">${article.content}</textarea>
	  </div>
	  
      <div class="form-group">
        <label><kbd class="lead">태그</kbd> (작품 내용과 무관한 일부 태그는 삭제, 수정될 수 있습니다.)</label>
        <input type="text" class="form-control" placeholder="#태그1#태그2#태그3" name="tag">
      </div>
      
      <div class="form-group">
        <label><kbd class="lead">지도</kbd></label>
        <input type="text" class="form-control" placeholder="지도" name="map">
      </div>
      
      <div class="form-group">
        <label><kbd class="lead">사진</kbd></label>
        <input type="text" class="form-control" placeholder="사진" name="사진">
      </div>
      
      <button type="submit" class="btn btn-primary">등록</button>
    </form>	

</div>
