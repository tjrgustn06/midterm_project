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
		<div class="row">
			<h1>MemberUpdate Page</h1>
		</div>
		
		<div class="row">
			<form action="./memberUpdate" method="post">
				
				
				<div class="mb-3">
					<label for="name" class="form-label fw-bold">이름</label> 
					<input type="text" name="name" class="form-control" id="name" value="${dto.name}">
				</div>
				<div class="mb-3">
					<label for="phone" class="form-label fw-bold">전화번호</label> 
					<input type="tel" name="phone" class="form-control" id="phone" value="${dto.phone}">
				</div>
				
				<div class="mb-3">
					<label for="email" class="form-label fw-bold ">이메일</label> 
					<input type="email" name="email" class="form-control" id="email" value="${dto.email}">
				</div>
				 
				 <div class="mb-3">
				<label for="files" class="form-label">Image 수정</label>
				<input type="file" class="form-control" id="file" name="pic" value="${dto.MemberImgDTO}">
				</div>
				
				<div class="mb-3">
				<a href="./memberPwUpdate" class="btn btn-warning">비밀번호 수정</a>
				<button class="btn btn-outline-success fw-bold" type="submit">확인</button>
			</div>
				
			</form>		
		</div>
	</div>
<script src="../resources/js/fileManger.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>