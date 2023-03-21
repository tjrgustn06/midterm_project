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
<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid">
		<div class="row md-7">
			<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Product Update Page</h1>
		</div>
		<div class="row justify-content-center">
			<form class="col-md-7" action="./update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="productNum" value="${dto.productNum}">
				<div class="mb-3">
					<label for="name" class="form-label">상품명</label>
					<input name="name" type="text" class="form-control" id="name" placeholder="물품명을 입력해주세요." value="${dto.name}">
				</div>
				<div class="mb-3">
					<label for="summary" class="form-label">한줄설명</label>
					<input name="summary" type="text" class="form-control" id="summary" placeholder="한줄설명을 입력해주세요." value="${dto.summary}">
				</div>
				<c:forEach items="${dto.productGradeDTOs}" var="gradeDTO">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="gradeName">${gradeDTO.gradeName} 수량</label>
							<input type="hidden" name="gradeName" value="${gradeDTO.gradeName}">
						</div>
						<div class="input-group-prepend">
							<input class="form-control" name="gradeStock" value="${gradeDTO.gradeStock}">
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="price">${gradeDTO.gradeName} 금액</label>
						</div>
						<div class="input-group-prepend">
							<input name="price" type="text" class="form-control" id="price" value="${gradeDTO.price}">
						</div>
					</div>
				</c:forEach>
				<div class="mb-3">
		  			<label for="contents" class="form-label">상세정보</label>
		 			<textarea name="contents" class="form-control" id="contents" rows="7">${dto.contents}</textarea>
				</div>
				
				<div id="fileList">
					<c:forEach items="${dto.productFileDTOs}" var="fileDTO">
						<div class="input-group mb-3">
							<div class="input-group-text">
								<input class="form-check-input mt-0 deleteCheck" type="checkbox" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
							</div>
							<input type="text" disabled value="${fileDTO.oriName}" class="form-control" aria-label="Text input with checkbox">
						</div>
					</c:forEach>
					<button type="button" id="addBtn" class="col-md-1 offset-md-11 btn btn-primary">ADD</button>
				</div>
				<div class="mt-5">
					<button class="btn btn-secondary" type="submit">상품수정</button>
				</div>
			</form>
		</div>
	</div>
	<script src="../resources/js/fileManager.js"></script>
	<script>
		setParam('addFiles')
		setMax(1);
		setCount('${dto.productFileDTOs.size()}');
		$('#contents').summernote()
	</script>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>