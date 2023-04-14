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
					<li>회원님의 소중한 정보에요</li>
				</ol>
		</div>
	</div>
</section>
<!--================Banner Area =================-->

<!--================Member 정보 =================-->
<div class="container-fluid col-lg-9 my-5">
	<!-- <div class="row text-center"> -->
		<div class="mb-3">
			<label for="name" class="form-label fw-bold">아이디</label> 
			<input type="text" name="id" class="form-control" id="name" value="${dto.id}">
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
		
		<div class="mb-3" id="addressList">
			<label for="address" class="form-label fw-bold">주소</label>
			<button type="button" id="addressAdd">주소추가</button>
			<c:forEach items="${dto.addressDTOs}" var="addressDTO">
				<div id="oldAddress${addressDTO.addressNum}">	
					<p>${addressDTO.addressName}</p>
					<input type="text" class="form-control" value="${addressDTO.address}" readonly>
					<input type="text" class="form-control" value="${addressDTO.addressDetail}" readonly>
				</div>
				<button type="button" id="addressUpdate${addressDTO.addressNum}" class="addressUpdate" data-address-num="${addressDTO.addressNum}" data-address-name="${addressDTO.addressName}" data-address-address="${addressDTO.address}" data-address-detail="${addressDTO.addressDetail}">${addressDTO.addressName}주소 수정</button>
				<button type="button" id="addressDelete${addressDTO.addressNum}" class="addressDelete" data-address-num="${addressDTO.addressNum}" data-address-name="${addressDTO.addressName}">${addressDTO.addressName}주소 삭제</button>
			</c:forEach>
		</div>


		<h3 id="id" class="id">ID : ${dto.id}</h3>
		<h3>Name : ${dto.name}</h3>
		<h3>Phone : ${dto.phone}</h3>
		<h3>Email : ${dto.email}</h3>
		<h3>RoleName  : ${dto.roleName}</h3>
		<c:forEach items="${dto.addressDTOs}" var="addressDTO">
			<h3>AddressName : ${addressDTO.addressName}</h3>
			<h3>Address : ${addressDTO.address} ${addressDTO.addressDetail}</h3>
		</c:forEach>
		<!-- </div> -->
		
		<!-- <script>
			let addressName = '';
			let address ='';
			let addressDetail='';
			let postCode = 0;
			$('#address').load(function(){
				<c:forEach items='${dto.addressDTOs}' var = 'addressDTO'>
				if($('id').val() == ${addressDTO.id}){
					addressName=${addressDTO.addressName}
					address=${addressDTO.address}
					addressDetail=${addressDTO.addressDetail}
					postCode=${addressDTO.postCode}
				}
			});
			</c:forEach>
		</script> -->
		<div class="d-flex justify-content-between my-3">
			<button id="delete" class="genric-btn danger-border" type="submit">회원탈퇴</button>
			<a href="./memberUpdate" class="genric-btn primary-border">정보수정</a>
		</div>
</div>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/memberPage.js"></script>
</body>
</html>