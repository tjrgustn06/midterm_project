<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%-- <input type="text" name="campName" readonly value="${member.id}" class="form-control" id="campName"> --%>
		</div>
		
		<div class="mb-3">
		  <label for="phone" class="form-label">연락처</label>
		  <input type="text" id="phone" name="phone" class="form-control" placeholder="insert phoneNumber here">
		</div>
		
		<div class="mb-3">
		  <label for="address" class="form-label">주소</label>
		  <input type="text" id="address" name="address" class="form-control" placeholder="insert address here">
		</div>
	
		<div class="mb-3">
		  <label for="contents" class="form-label">캠핑장 소개내용</label>
		  <textarea id="contents" name="contents" class="form-control" placeholder="insert contents here" rows="5"></textarea>
		</div>
		
		<div id="fileList" class="my-5">
<!-- 			<div class="mb-3">
				<label for="files" class="form-label">이미지</label>
				<input type="file" class="form-control" id="files" name="files">
				<button type="button" id="del01~">X</button>
			</div> -->
			<button type="button" id="fileAdd">File Add</button>
		</div>
		
		<div class="row justify-content-center mx-auto">
			<button class="btn btn-outline-success col-2" type="submit">글쓰기</button>	
		</div>
	</form>
	
	</div>
	
	
	
</div>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>