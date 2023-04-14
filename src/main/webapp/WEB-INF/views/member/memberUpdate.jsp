<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Banner Area =================-->
<section class="breadcrumb_area blog_banner_two">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">MYPAGE</h2>
				<ol class="breadcrumb">
					<li>${dto.name}님 환영해요!</li>
				</ol>
		</div>
	</div>
</section>
<!--================Banner Area =================-->
<div class="container-fluid col-lg-9 my-5">
		<div class="row">
			<h3><i class="fa-solid fa-circle-info fa-sm"></i> ${dto.name} 님의 정보</h3>
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
				
				<div class="mb-3" id="addressList" class="d-flex justify-content-between">
					<label for="address" class="form-label fw-bold">주소</label>
					<button type="button" id="addressAdd" class="genric-btn success-border small">주소추가</button>
				<!-- </div>
				<div> -->
					<c:forEach items="${dto.addressDTOs}" var="addressDTO">
						<div id="oldAddress${addressDTO.addressNum}">	
							<p>${addressDTO.addressName}</p>
							<input type="text" class="form-control" value="${addressDTO.address}" readonly>
							<input type="text" class="form-control" value="${addressDTO.addressDetail}" readonly>
						</div>
						<div class="d-flex justify-content-between my-2">
							<button type="button" id="addressDelete${addressDTO.addressNum}" class="addressDelete genric-btn danger-border small" data-address-num="${addressDTO.addressNum}" data-address-name="${addressDTO.addressName}">${addressDTO.addressName}주소 삭제</button>
							<button type="button" id="addressUpdate${addressDTO.addressNum}" class="addressUpdate genric-btn primary-border small" data-address-num="${addressDTO.addressNum}" data-address-name="${addressDTO.addressName}" data-address-address="${addressDTO.address}" data-address-detail="${addressDTO.addressDetail}">${addressDTO.addressName}주소 수정</button>

						</div>
						<!--<input type="text" name="postCode" id="postcode" placeholder="우편번호">
							<input type="button" name="addr" id="addr" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="address" id="address" placeholder="주소" readonly><br>
							<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소">
							<button type="button" id="addressUpdateCancle">취소</button>-->
					</c:forEach>
				</div>
				
			<div class="mb-3">
			</div>
				
				<div class="d-flex justify-content-between my-3">
					<button type="button" onclick="history.go(-1);" class="genric-btn danger-border">돌아가기</button>
					<a href="./memberPwChange" class="genric-btn primary-border">비밀번호 변경</a>
					<button class="genric-btn success-border fw-bold" type="submit">확인</button>
			</div>
				
			</form>		
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/address.js"></script>
</body>
</html>