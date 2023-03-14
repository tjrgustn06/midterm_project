<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<style>
	.card{display: inline-block;}
</style>
</head>
<body>
	<h3>List Page</h3>
	<div class="container-fluid col-6">
		<c:forEach items="${list}" var="dto">
			<div class="card" style="width: 18rem">
				<img src="/resources/images/iuPhoto.jpg" class="card-img-top" alt="...">
				
				<div class="card-body">
				  <h5 class="card-title">${dto.name}</h5>
				  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  <a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>