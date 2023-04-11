<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<c:import url="../template/common_css.jsp"></c:import>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Banner Area =================-->
<section class="breadcrumb_area blog_banner_two">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
		<h2 class="page-cover-tittle">아이디 찾기 결과</h2>
		</div>
	</div>
</section>
<!--================Banner Area =================-->
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form action="../member/findId" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>${id}</h3>
				</div>
				<div>
					<p class="w3-center">
						<a type="button" href="./memberLogin" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Login</a>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>