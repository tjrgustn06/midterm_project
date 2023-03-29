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
<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid">
		<div class="row">
			<h1>Member Page</h1>
		</div>
		
		<div class="row">
			<h3>Name : ${dto.name}</h3>
			<h3>Phone : ${dto.phone}</h3>
			<h3>Email : ${dto.email}</h3>
			<h3>RoleName  : ${dto.roleName}</h3>
			<h3 id="address">Address : </h3>
			</div>
			</div>
			<script>
				let addressName = '';
				let address ='';
				let addressDetail='';
				let postCode = 0;
				$('#address').load(function(){
					<c:forEach items='${dto.addressDTOs}' var = 'addressDTO'>
					if($('id').val()=='${addressDTO.id}'){
						addressName=${addressDTO.addressName}
						address=${addressDTO.address}
						addressDetail=${addressDTO.addressDetail}
						postCode=${addressDTO.postCode}
				})
				</c:forEach>
			</script>
			
			<a href="./memberUpdate" class="btn btn-info">정보수정</a>
			<a class="btn btn-danger">회원탈퇴</a>
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>