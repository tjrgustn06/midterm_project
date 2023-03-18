<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update ${dto.name} - The Camping</title>
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
	<input type="hidden" name="campNum" value="${dto.campNum}" id="detailCampNum">
	
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
		
		<div id="fileList" class="row my-5">
			<!-- 새로운 파일을 추가 -->
			<div class="row col-2 mb-3">
				<button class="btn btn-outline-success" type="button" id="fileAdd">추가 사진 등록</button>
<!-- 				<label for="campFiles" class="form-label">대표 사진 등록</label>
				<input type="file" id="campFiles" name="files" class="form-control"> -->
			</div>
			
			<!--  -->
			<!-- add버튼 눌러서 추가되는 div구조 -->
			<!-- <div class="input-group-text my-2" id="del'+idx+'">
				<div class="col-1">
					<input class="form-check-input titleCheck" type="radio" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
				</div>
				<input type="file" class="form-control" name="param">
				<button type="button" class="dels btn btn-outline-secondary" data-del-idx="del"+idx>파일 삭제</button>
			</div>

			<div class="input-group-text my-2" id="del'+idx+'">
				<input class="form-check-input titleCheck" type="radio" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
				<input type="file" class="form-control" name="param">
				<button type="button" class="dels btn btn-outline-secondary" data-del-idx="del"+idx>파일 삭제</button>
			</div>

			<div class="input-group-text my-2" id="del'+idx+'">
				<input class="form-check-input titleCheck" type="radio" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
				<input type="file" class="form-control" name="param">
				<button type="button" class="dels btn btn-outline-secondary" data-del-idx="del"+idx>파일 삭제</button>
			</div> -->


			<!--  -->

			<!-- 이미 가지고있는 파일을 표시 -->
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">		
				<div class="input-group my-3">
					<div class="input-group-text">
						<input class="form-check-input deleteCheck" type="checkbox" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
					</div>
				<input type="text" class="form-control" disabled value="${fileDTO.oriName}" aria-label="Text input with checkbox">			
				</div>
			</c:forEach>
			
		</div>
		
		<div class="row col-4 mx-auto">
			<button class="btn btn-outline-success col-5" type="submit" id="update">수정하기</button>
			<button class="btn btn-outline-danger col-5" type="button" id="cancel">취소하기</button>
		</div>
	</form>
	
	</div>
	
	
</div>

<script src="../resources/js/camp/crud.js"></script>
<script src="../resources/js/camp/fileManager.js"></script>
<script>
	setMax(5);
	setParam('files');
	setCount('${dto.campFileDTOs.size()}');
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>