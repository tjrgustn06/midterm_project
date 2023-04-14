<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		
		<div class="row col-md-8 mx-auto border-bottom ">
			<form action="./add" method="post" id="addFrm" enctype="multipart/form-data">
				
				<div class="row mb-3">
				  <label for="writer" class="col-sm-2 col-form-label">작성자</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" name="writer" id="writer" value="${member.id}" readonly >
				  </div>
				</div>
				
				<div class="row mb-3">
				  <label for="title" class="col-sm-2 col-form-label">제목</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" name="title" id="title" placeholder="제목 입력">
				  </div>
				</div>
				
				<div id="fileList" class="row my-3">
						<!-- <div class="row mb-2" id="d+idx">
							<label for="" class="col-sm-1 col-form-label">Image</label>
							<div class="input-group mb-2 col-sm-10">
								<input type="file" class="form-control" name="param">
								<button class="dels btn btn-outline-danger" type="button" data-delete-id="idx">X</button>
							</div>
						</div>	 -->
						<button class="col-md-1 offset-md-11 btn btn-primary" type="button" id="addBtn">Add</button>
				</div> 
				
				
				<div class="mb-5">
				  <label for="contents" class="form-label">내용</label>
				  <textarea class="form-control" name="contents" id="contents" rows="8"></textarea>
				</div>
				
				
				<div class="row mt-5 mb-3 col-md-2 offset-md-10">
					<button class="btn btn-primary " type="submit">글 쓰기</button>
				</div>
				<input type="hidden" name="boardId" value="${boardId}">
			
			</form>
		</div>
	</div>


	
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/fileManager.js"></script>
	<script src="../resources/js/boardForm.js"></script>
	<script>
		setParam('addFiles');
		setMax(5);
		$('#contents').summernote();
	</script>
	<c:import url="../template/common_js.jsp"></c:import>	
	
	
</body>
</html>