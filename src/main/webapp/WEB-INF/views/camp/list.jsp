<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampList - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
<style>
	a{
		color: black;
		text-decoration: none;
	}
</style>
</head>
<body>
	<div class="container-fluid my-5">
		<div class="row my-5">
			<h1>CampList Page</h1>
		</div>
		
		<div class="row mb-5">
			<table>
				<tr>
					<th>캠핑장 이름</th>
					<th>캠핑장 전화번호</th>
					<th>캠핑장 주소</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td class="btn btn-primary"><a class="a" href="./detail?campNum=${dto.campNum}">${dto.name}</a></td>
						<td>${dto.phone}</td>
						<td>${dto.address}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	
	
	
	
	
	
	</div>
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>