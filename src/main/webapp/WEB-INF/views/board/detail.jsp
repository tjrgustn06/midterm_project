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
				<textarea class="form-control" id="replyContents" rows="3" name="contents" ></textarea>
			</div>
			<div class="mb-3">
					<button class="btn btn-primary col-md-2 offset-md-10" data-board-num="${dto.num}" id="replyAdd">댓글 작성</button>
			</div>
			<div class="row col-md-10 offset-md-1" id="commentList">
			</div>
		</div>
	</c:if>
	



	<div class="row">
		 <c:if test="${member.id eq dto.writer}"> 
			<div class="col-md-8">
				<form action="./update" id="frm" method="GET">
					<input type="hidden" name="num" value="${dto.num}">
						
					<!-- delete시엔 post방식 update시엔 get -->
					<button type="submit" class="btn btn-primary col-md-2 mx-2" id="update">글 수정</button>
					
					<button type="button" class="btn btn-primary col-md-2 mx-2" id="delete" data-delete="${dto.num}">글 삭제</button>
				</form>
			</div>
		 </c:if> 
		
		<a href="./list" class="btn btn-primary col-md-2 mx-1">목록으로</a>	
		


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