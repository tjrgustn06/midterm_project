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
			<h2 class="page-cover-tittle">My Page</h2>
		</div>
	</div>
</section>
<!--================Banner Area =================-->

<!--================Member 정보 =================-->
	<div class="container-fluid">
		<div class="row text-center">
			<h3 id="id" class="id">ID : ${dto.id}</h3>
			<h3>Name : ${dto.name}</h3>
			<h3>Phone : ${dto.phone}</h3>
			<h3>Email : ${dto.email}</h3>
			<h3>RoleName  : ${dto.roleName}</h3>
			<c:forEach items="${dto.addressDTOs}" var="addressDTO">
				<h3>AddressName : ${addressDTO.addressName}</h3>
				<h3>Address : ${addressDTO.address} ${addressDTO.addressDetail}</h3>
			</c:forEach>
			</div>
			
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
			<div class="mb-3">
			<a href="./memberUpdate" class="btn btn-info">정보수정</a>
			<button id="delete" class="btn btn-danger" type="submit">회원 탈퇴</button>
			</div>
	</div>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/memberPage.js"></script>
</body>
</html>