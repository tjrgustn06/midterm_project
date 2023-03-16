<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateCamp - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
	<div class="row mb-5">
		<h1>Camp Update Page</h1>
	</div>
	
	<div class="row justify-content-center">
	<!-- insert form이 필요할듯 -->
	<form action="./update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="campNum" value="${dto.campNum}">
	
		<!-- 수정 필요 -->
		<div class="mb-3">
		  <label for="campName" class="form-label">캠핑장 이름</label>
		  <input type="text" id="campName" name="name" value="${dto.name}" class="form-control">
<%-- <input type="text" name="campName" readonly value="${member.id}" class="form-control" id="campName"> --%>
		</div>
		
		<div class="mb-3">
		  <label for="campPhone" class="form-label">캠핑장 연락처</label>
		  <input type="text" id="campPhone" name="phone" value="${dto.phone}" class="form-control">
		</div>
		
		<div class="mb-3">
		  <label for="campAddress" class="form-label">캠핑장 주소</label>
		  <input type="text" id="campAddress" name="address" value="${dto.address}" class="form-control"">
		</div>
	
		<div class="mb-3">
		  <label for="campContents" class="form-label">캠핑장 소개내용</label>
		  <textarea id="campContents" name="contents" class="form-control" rows="5">${dto.contents}</textarea>
		</div>
		
		<div id="fileList" class="my-5">
			<div class="mb-3">
				<label for="campFiles" class="form-label">대표 사진 등록</label>
				<input type="file" id="campFiles" name="files" class="form-control">
			</div>
			
			<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">		
				<div class="input-group my-3">
					<div class="input-group-text">
						<input class="form-check-input deleteCheck" type="checkbox" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
					</div>
				<input type="text" class="form-control" disabled value="${fileDTO.oriName}" aria-label="Text input with checkbox">			
				</div>
			</c:forEach>
			
			
<!-- 			<div class="mb-3">
				<label for="files" class="form-label">이미지</label>
				<input type="file" class="form-control" id="files" name="files">
				<button type="button" id="del01~">X</button>
			</div> -->
			
			<!-- <button type="button" id="fileAdd">추가 사진 등록</button> -->
		</div>
		
		<div class="row col-3 mx-auto">
			<button class="btn btn-outline-success" type="submit">수정하기</button>
			<button class="btn btn-outline-danger" type="submit">취소하기</button>
		</div>
	</form>
	
	</div>
	
	
</div>

<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>