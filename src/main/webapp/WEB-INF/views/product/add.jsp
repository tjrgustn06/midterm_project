<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row md-7">
			<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Product Add Page</h1>
		</div>
		<div class="row justify-content-center">
			<form class="col-md-7" action="./add" method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="name" class="form-label">상품명</label>
					<input name="name" type="text" class="form-control" id="name" placeholder="물품명을 입력해주세요.">
				</div>
				<div class="mb-3">
					<label for="summary" class="form-label">한줄설명</label>
					<input name="summary" type="text" class="form-control" id=""summary"" placeholder="한줄설명을 입력해주세요.">
				</div>
				<div class="mb-3">
		  			<label for="contents" class="form-label">상세정보</label>
		 			<textarea name="contents" class="form-control" id="contents" rows="7"></textarea>
				</div>
				
				<div id="fileList">
					<!-- <div class="mb-3">
						<label for="files" class="form-label">Image</label>
						<input type="file" class="form-control" id="files" name="pic">
					</div> -->
					<button type="button" id="addBtn" class="col-md-1 offset-md-11 btn btn-primary">ADD</button>
				</div>
				<div class="mt-5">
					<button class="btn btn-secondary" type="submit">상품등록</button>
				</div>
			</form>
		</div>
	</div>
	<script src="../resources/js/fileManager.js"></script>
	<script>
		setParam('files')
		setMax(1);
		$('#contents').summernote()
	</script>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>