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
<style>
	.redResult{
		color: red
	}
	.blueResult{
		color: blue;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Banner Area =================-->
<section class="breadcrumb_area blog_banner_two">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">JOIN US</h2>
				<ol class="breadcrumb">
					<li>함께 캠핑갈래요?</li>
				</ol>
		</div>
	</div>
</section>
<!--================Banner Area =================-->
<div class="container my-5">
	<div class = "row justify-content-center">
		<form class="col-md-6" id="frm" action="./memberJoin" method="post">
		<div class="mb-3">
			<label for="id" class="form-label fw-bold">아이디</label> 
			<input type="text" name="id" class="form-control" id="id" placeholder="아이디 입력">
			<div id="idResult" class=""></div>
		</div>
		
		<div class="mb-3">
			<label for="pw" class="form-label fw-bold">비밀번호</label> 
			<input type="password" name="pw" class="form-control" id="pw" placeholder="비밀번호 입력">
			<div id="pwResult"></div>
		</div>

		<div class="mb-3">
			<label for="pw" class="form-label fw-bold">비밀번호 확인</label>
			<input type="password" name="pwCheck" class="form-control" id="pwCheck" placeholder="비밀번호 입력">
			<div id="pwCheckResult"></div>
		</div>
		
		<div class="mb-3">
			<label for="name" class="form-label fw-bold">이름</label> 
			<input type="text" name="name" class="form-control" id="name" placeholder="이름 입력">
			<div id="nameResult"></div>
		</div>
		
		<div class="mb-3">
			<label for="phone" class="form-label fw-bold">전화번호</label> 
			<input type="tel" name="phone" class="form-control" id="phone" placeholder="010-0000-0000">
			<div id="phoneResult"></div>
		</div>
		
		<div class="mb-3">
			<label for="phone" class="form-label fw-bold">주소</label> 
			<input type="text" name="addressName" id="addressName" class="form-control" placeholder="구분 입력(ex.집,회사)">
			<div class="input-group">
				<input type="button" name="addr" id="addr" class="input-group-text" onclick="execDaumPostcode()" value="우편번호 찾기">
				<input type="text" name="postCode" id="postcode" class="form-control" placeholder="우편번호 찾기를 눌러주세요" readonly>
			</div>
			<input type="text" name="address" id="address" class="form-control" placeholder="주소">
			<input type="text" name="addressDetail" id="addressDetail" class="form-control" placeholder="상세주소">
			<div id="addrResult"></div>
		</div>

		<div class="mb-3">
			<label for="email" class="form-label fw-bold ">이메일</label> 
			<input type="email" name="email" class="form-control" id="email" placeholder="example@gmail.com">
			<div id="emailResult"></div>
		</div>
		
		<div class="mb-3 d-flex justify-content-center">
				<button class="genric-btn success-border" id="btn" type="button">등록</button> 
		</div>
		</form>
	</div>
</div>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="../resources/js/memberJoin.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/address.js"></script>
</body>
</html>