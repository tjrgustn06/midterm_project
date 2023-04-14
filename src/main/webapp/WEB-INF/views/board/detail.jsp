<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>The Camp</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">${boardName}</h2>
			<c:if test="${boardName eq 'qna'}">
				<ol class="breadcrumb">
					<li>자유로운 정보 나눔 마당</li>
				</ol>
			</c:if>
			<c:if test="${boardName eq 'notice'}">
					<ol class="breadcrumb">
						<li>공지사항</li>
					</ol>
				</c:if>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container col-lg-9 my-5">
	<!-- ============================================================== -->
	<!-- RECENT SALES -->
	<!-- ============================================================== -->



		
		<div class="row col-md-12 mx-auto">
				<div id="boardName" data-board-name="${boardName}"></div>
				<div class="row mb-3">
					<div class="col-sm-10">
						<h2>${dto.title}</h2>
					</div>
				</div>
				
				<div class="row mb-3">
				  <label for="writer" class="col-sm-2 col-form-label">작성자</label>
				  <div class="col-sm-10">
					<c:choose>
						<c:when test="${boardName eq 'notice'}">
							<h3>관리자</h3>	
						</c:when>
						<c:otherwise>
							<p>${dto.writer}</p>
						</c:otherwise>
					</c:choose>
				  </div>
				</div>
				

				
				<div class="mb-5">
				  <label for="reportedContents" class="form-label">글 내용</label>
				  <p name="contents" id="contents">${dto.contents}</p>
				</div>
				<hr>
				
				
			

		</div>
	<!-- ============================================================== -->
	<!-- Recent Comments -->
	<!-- ============================================================== -->


	<c:if test="${boardName ne 'notice'}">
		<div class="my-3 comment">
	  
			
		<div class="mb-3">
				<textarea class="form-control" id="replyContents" rows="3" name="contents" style="resize: none;"></textarea>
			</div>
			<div class="d-flex justify-content-end my-2">
					<button class="genric-btn success-border small" data-board-num="${dto.num}" id="replyAdd">댓글 작성</button>
			</div>
			<div class="row col-md-10 offset-md-1" id="commentList">
			</div>
		</div>
	</c:if>
	



	<div class="">
		<div class="d-flex justify-content-center my-2">
			<a href="./list" class="genric-btn primary-border">목록으로</a>	
		</div>
		 <c:if test="${member.id eq dto.writer || member.roleName eq 'MANAGER' || member.roleName eq 'ADMIN'}"> 
			<div class="my-2">
				<form action="./update" id="frm" method="GET">
					<input type="hidden" name="num" value="${dto.num}">
						
					<div class="d-flex justify-content-between">
						<!-- delete시엔 post방식 update시엔 get -->
						<button type="button" class="genric-btn danger-border" id="delete" data-delete="${dto.num}">삭제하기</button>
						<button type="submit" class="genric-btn primary-border" id="update">수정하기</button>
					</div>
					
				</form>
			</div>
		 </c:if> 
		
		


	</div>
</div>

<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/boardForm.js"></script>
	<script src="../resources/js/comment.js"></script>
	<script src="../resources/js/calcDate.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<script>
		$(()=>{

		})
			setWriter('${member.id}');
			setNum('${dto.num}')
		
	</script>

</body>
</html>


</script>