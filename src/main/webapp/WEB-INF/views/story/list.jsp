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
	
	<div class="container-fluid my-3">
	
		<div class="row mb-4 border-bottom border-info">
			<h1 class="col-md-7 mx-auto text-center pb-3 fs-2">Story 페이지</h1><br>
		</div>
		
		<c:forEach items="${list}" var="dto">
			<div class="col-md-8 mx-auto" style="height: 100%;">
				<div class="d-flex flex-column mb-3">
					<div class="card col-md-5 mx-5">
					  <div class="card-body">
					    <h5 class="card-title">${dto.title}</h5>
					    <p class="card-text">${dto.contents}</p>
					    <p class="card-text"><small class="text-muted">${dto.regDate}</small></p>
					  </div>
					  <img src="..." class="card-img-bottom" alt="...">
					</div>
				</div>
			</div>
		</c:forEach>

		<div class="row">
			<div class="col-md-8" style="width: 75%; height : 70px; bottom: 0px; position: fixed; left: 50%; transform: translateX(-50%)">
				<a href="./add" class="btn btn-primary btn-lg col-md-12" style="height: 100%">스토리 쓰기</a>
			</div>
		</div>
	
	</div>
	

<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>