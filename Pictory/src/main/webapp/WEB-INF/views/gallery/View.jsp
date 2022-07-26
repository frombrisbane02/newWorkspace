<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="newline" value="<%= \"\n\" %>" />

<div class="container">
	<div class="jumbotron">
		<h1>
			한줄 댓글 게시판 <small>상세보기 페이지</small>
		</h1>
	</div>
	
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td>${param.no}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성자</th>
				<td>${article.name}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성일</th>
				<td>${article.postDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">조회수</th>
				<td>${article.count}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2">${fn:replace(article.content, newline, "<br/>")}</td>
				<!-- 
				.replace("\r\n", "<br/>")%></td>
				 -->
			</tr>
		</tbody>
	</table>

	<!-- 수정/삭제/목록 컨트롤 버튼 -->
	<div class="text-center">

		<!-- 
		<c:set var="session_id"><sec:authentication property="principal.username"/></c:set>		
		<c:if test="${session_id ==record.id }">
		-->

		<!--
		</c:if>
		-->
		<a href="<c:url value="/gallery/article/EditPage.do?no=${param.no}"/>" class="btn btn-success">수정</a> 
		<a href="javascript:deleteArtice(${param.no})" class="btn btn-danger">삭제</a> 		
		<a href="<c:url value="/gallery/Index.do"/>" class="btn btn-success">목록</a>
	</div>

	<!-- 댓글 목록 -->
    <div class="row">
        <div class="col-md-12" id="commentsList">
			
			<div id="comment-10001">
				<div class="media mt-3">
					<img class="rounded-circle" src="https://i.imgur.com/xELPaag.jpg" width="50">
					<div class="media-body">
						<div class="row">
							<div class="col-8 d-flex">
								<h5><a class="ml-0" href="/mypage/Index.do">이재현</a></h5><span>- 2022-06-08</span>
							</div>
							<div class="col-4">
								<div class="pull-right reply">
									<a href="javascript:ajaxCocomment(10001, 2)" class="replydelete"><span><i class="fa fa-reply"></i>답글</span></a>
									<a onclick="deleteComment(this, 10001)" class="replydelete"><span><i class="fa fa-reply"></i>삭제</span></a>
								</div>
							</div>
						</div>
						<span class="text-left">댓글10001</span>
					</div>
				</div>
				<div id="cocomments-10001">
				</div>
			</div>
			
			<div id="comment-10002">
				<div class="media mt-3" id="comment-10002">
					<img class="rounded-circle" src="https://i.imgur.com/xELPaag.jpg" width="50">
					<div class="media-body">
						<div class="row">
							<div class="col-8 d-flex">
								<h5><a class="ml-0" href="/mypage/Index.do">이재현</a></h5><span>- 2022-06-08</span>
							</div>
							<div class="col-4">
								<div class="pull-right reply">
									<a href="javascript:ajaxCocomment(10002, 2)" class="replydelete"><span><i class="fa fa-reply"></i>답글</span></a>
									<a onclick="deleteComment(this, 10002)" class="replydelete"><span><i class="fa fa-reply"></i>삭제</span></a>
								</div>
							</div>
						</div>
						<span class="text-left">댓글10002</span>
					</div>
				</div>
				<div id="cocomments-10002">
				</div>
			</div>


			<div id="comment-10003">
				<div class="media mt-3">
					<img class="rounded-circle" src="https://i.imgur.com/xELPaag.jpg" width="50">
					<div class="media-body">
						<div class="row">
							<div class="col-8 d-flex">
								<h5><a class="ml-0" href="/mypage/Index.do">이재현</a></h5><span>- 2022-06-08</span>
							</div>
							<div class="col-4">
								<div class="pull-right reply">
									<a href="javascript:ajaxCocomment(10003, 2)" class="replydelete"><span><i class="fa fa-reply"></i>답글</span></a>
									<a onclick="deleteComment(this, 10003)" class="replydelete"><span><i class="fa fa-reply"></i>삭제</span></a>
								</div>
							</div>
						</div>
						<span class="text-left">댓글10003</span>
					</div>
				</div>
				<div id="cocomments-10003">
				</div>
			</div>




		</div>
    </div>

	<!-- 한줄 코멘트 입력 폼 -->
	<form id="commentForm" class="form-inline col-sm-12 d-flex justify-content-center mt-3">
		<input type="hidden" name="no" value="${param.no}"/>
		<input type="text" id="linecomment" name="cValue" class="form-control mx-2 w-50"
			placeholder="한줄 댓글을 입력하세요" /> 
		<input type="button" class="btn btn-danger mx-2" value="등록" id="submit"/>
	</form>

<script>
	function deleteArtice(no){
		if(confirm("삭제 할래요?")){
		    $.ajax({
		        type:"POST",
		        url: "<c:url value='/gallery/article/Delete.do'/>",
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType: "json",
		        data:{
		            "no" : no,
		        	"${_csrf.parameterName}" : "${_csrf.token}",
		        },
		        success : (resp) => {
		        	console.log('삭제성공 ', resp);
		        	location.href = "<c:url value='/gallery/Index.do'/>";
		        },
		        error : (error) => {
		        	console.log('삭제실패 ', error);
		        }
		    });

		}
	}
	
	function deleteComment(aTag, commentId) {
		const comment = document.querySelector("#comment-" + commentId);
		
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
				    $.ajax({
				        type:"POST",
				        url: "<c:url value='/gallery/comment/Delete.do'/>",
				        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				        dataType: "json",
				        data:{
				            "cno[]" : commentId,
				        	"${_csrf.parameterName}" : "${_csrf.token}",
				        },
				        success : (resp) => {
				        	console.log('삭제성공 ', resp);
				        	comment.remove();
						    Swal.fire(
						      'Deleted!',
						      'Your file has been deleted.',
						      'success'
						    )
				        },
				        error : (error) => {
				        	console.log('삭제실패 ', error);
				        }
				    });
			  }
			})
		
	}
	
	function showComment(respJSON) {
		const commentsList = document.querySelector("#commentsList")
		const div = document.createElement('div');
		
		let commentTemplate = `
			<div id="comment-{__lno__}">
				<div class="media mt-3">
					<img class="rounded-circle" src="https://i.imgur.com/xELPaag.jpg" width="50">
					<div class="media-body">
						<div class="row">
							<div class="col-8 d-flex">
								<h5><a class="ml-0" href="/mypage/Index.do">{__id__}</a></h5><span>- {__date__}</span>
							</div>
							<div class="col-4">
								<div class="pull-right reply">
									<a href="javascript:ajaxCocomment({__lno__}, {__childLevel__})" class="replydelete"><span><i class="fa fa-reply"></i>답글</span></a>
									<a onclick="deleteComment(this, {__lno__})" class="replydelete"><span><i class="fa fa-reply"></i>삭제</span></a>
								</div>
							</div>
						</div>
						<span class="text-left">{__content__}</span>
					</div>
					
				</div>
				<div id="cocomments-{__lno__}">
				</div>
			</div>
		`;
		
		commentTemplate = commentTemplate.replace("{__id__}", respJSON.id);
		commentTemplate = commentTemplate.replace("{__date__}", respJSON.date);
		commentTemplate = commentTemplate.replaceAll("{__lno__}", respJSON.lno);
		commentTemplate = commentTemplate.replace("{__content__}", respJSON.content);
		commentTemplate = commentTemplate.replace("{__childLevel__}", respJSON.childLevel);
		
		div.innerHTML = commentTemplate;
		commentsList.appendChild(div);	
	}
	
	
	function showCocomment(respJSON, parentCocomments) {
		const div = document.createElement('div');
		let commentTemplate = `
			<div id="comment-{__lno__}">
				<div style="padding-left: {__childPixel__}px;" class="media mt-3">
					<img class="rounded-circle" src="https://i.imgur.com/xELPaag.jpg" width="50">
					<div class="media-body">
						<div class="row">
							<div class="col-8 d-flex">
								<h5><a class="ml-0" href="/mypage/Index.do">{__id__}</a></h5><span>- {__date__}</span>
							</div>
							<div class="col-4">
								<div class="pull-right reply">
									<a href="javascript:ajaxCocomment({__lno__}, {__childLevel__})" class="replydelete"><span><i class="fa fa-reply"></i>답글</span></a>
									<a onclick="deleteComment(this, {__lno__})" class="replydelete"><span><i class="fa fa-reply"></i>삭제</span></a>
								</div>
							</div>
						</div>
						<span class="text-left">{__content__}</span>
					</div>					
				</div>
				<div id="cocomments-{__lno__}">
				</div>
			</div>

		`;
		
		commentTemplate = commentTemplate.replace("{__id__}", respJSON.id);
		commentTemplate = commentTemplate.replace("{__date__}", respJSON.date);
		commentTemplate = commentTemplate.replaceAll("{__lno__}", respJSON.lno);
		commentTemplate = commentTemplate.replace("{__content__}", respJSON.content);
		commentTemplate = commentTemplate.replace("{__childLevel__}", respJSON.childLevel);
		commentTemplate = commentTemplate.replace("{__childPixel__}", respJSON.childLevel * 10);
		div.innerHTML = commentTemplate;

		parentCocomments.appendChild(div);
	}
	
	
	//코멘트 등록처리
	function ajaxComment() {
	    $.ajax({
	        type:"POST",
	        url: "<c:url value='/gallery/comment/Write.do'/>",
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType: "json",
	        data:{
	        	${_csrf.parameterName}: "${_csrf.token}",
	            no: $('#commentForm input[name=no]').val(),
	            content: $('#linecomment').val(),
	            level: 1
	        },
	        success : (resp) => {
	        	showComment(resp);
	        },
	        error : function(request, status, error) {
	            alert('code:' + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}

	function insertAfter(newNode, referenceNode) {
	    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
	}
	
	//코코멘트 등록처리
	function ajaxCocomment(parentLno, level=2) {
		console.log("#comment-" +  parentLno);
		const parentCocomments = document.querySelector("#cocomments-" +  parentLno);
		Swal.fire({
			  input: 'text',
			  inputAttributes: {
			    autocapitalize: 'off'
			  },
			  showCancelButton: true,
			  confirmButtonText: 'Reply',
			  showLoaderOnConfirm: true,
			  preConfirm: (ccValue) => {					
				    $.ajax({
				        type:"POST",
				        url: "<c:url value='/gallery/comment/Write.do'/>",
				        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				        dataType: "json",
				        data:{
				        	${_csrf.parameterName}: "${_csrf.token}",
				            no: $('#commentForm input[name=no]').val(),
				            parentLno: parentLno,
				            content: ccValue,
				            level: level
				        },
				        success : (resp) => {
				        	console.log(resp);
				        	showCocomment(resp, parentCocomments);
				        },
				        error : function(request, status, error) {
							alert('code:' + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						}
				    });
			 },
		})
	}
	
	window.addEventListener('DOMContentLoaded', () => {
		document.querySelector("#submit").onclick = ajaxComment;
	});
	
</script>
