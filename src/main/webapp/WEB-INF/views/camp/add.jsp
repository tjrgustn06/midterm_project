<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddCamp - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
	<div class="row mb-5">
		<h1>Camp Add Page</h1>
	</div>
	
	<div class="row justify-content-center">
	<!-- insert form이 필요할듯 -->
	<form action="./add" method="post" enctype="multipart/form-data">
	
	<!-- 수정 필요 -->
		<div class="mb-3">
		  <label for="campName" class="form-label">캠핑장 이름</label>
		  <input type="text" id="campName" name="name" class="form-control" placeholder="insert campName here">
		</div>
		
		<div class="mb-3">
		  <label for="campPhone" class="form-label">캠핑장 연락처</label>
		  <input type="text" id="campPhone" name="phone" class="form-control" placeholder="insert phoneNumber here">
		</div>
		
		<div class="mb-3">
		  <label for="campAddress" class="form-label">캠핑장 주소</label>
		  <input type="text" id="campAddress" name="address" class="form-control" placeholder="insert address here">
		</div>
	
		<div class="mb-3">
		  <label for="campContents" class="form-label">캠핑장 소개내용</label>
		  <textarea id="contents" name="contents" class="form-control" placeholder="insert contents here" rows="5"></textarea>
		</div>
		
		<div id="fileList" class="row my-5">
			<div class="row mb-3">
				<label for="campFiles" class="form-label">대표 사진 등록</label>
				<input type="file" id="campFiles" name="files" class="form-control">
			</div>
			
			<div class="row col-2 mb-3">
				<button id="fileAdd" class="btn btn-outline-success" type="button">추가 사진 등록</button>
			</div>
			
<!-- 			<div class="mb-3">
				<label for="files" class="form-label">이미지</label>
				<input type="file" class="form-control" id="files" name="files">
				<button type="button" id="del01~">X</button>
			</div> -->
			
			<!-- <button type="button" id="fileAdd">추가 사진 등록</button> -->
		</div>
		
		<div class="row justify-content-center col-2 mx-auto">
			<button class="btn btn-outline-success" type="submit">등록</button>	
		</div>
	</form>
	
	</div>
	
	
	
</div>
<script src="../resources/js/camp/fileManager.js"></script>
<script>
	setMax(5);
	setParam('files');
	setCount(1);
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>