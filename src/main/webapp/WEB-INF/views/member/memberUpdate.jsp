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
					<label for="roleName" class="form-label fw-bold ">roleName</label> 
					<input type="text" readonly name="roleName" class="form-control" id="roleName" value="${dto.roleName}">
				</div>
				
				<div class="mb-3">
					<label for="address" class="form-label fw-bold">주소</label> 
					<input type="text" name="address" class="form-control" id="address" value="${addressDTOs.address}">
					<input type="text" name="addressDetail" class="form-control" id="addressDetail" value="${addressDTOs.addressDetail}">
				</div>
				
			<div class="mb-3">
				<input type="text" name="addressName" id="addressName" placeholder="집,회사..."><br>
				<input type="text" name="postcode" id="postcode" placeholder="우편번호">
				<input type="button" name="addr" id="addr" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="address" id="address" placeholder="주소"><br>
				<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소">
			</div>
				
				<div class="mb-3">
				<button class="btn btn-outline-success fw-bold" type="submit">확인</button>
				<a href="./memberPwChange" class="btn btn-warning">비밀번호 변경</a>
			</div>
				
			</form>		
		</div>
	</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/address.js"></script>
</body>
</html>