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
<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid col-6">
		<c:forEach items="${list}" var="dto">
			<div class="card" style="width: 18rem">
				<c:forEach items="${dto.productFileDTOs}" var="fileDTO">
					<img class="card-img-top" src="../resources/upload/product/${fileDTO.fileName}" alt="Card image cap">
				</c:forEach>
				
				<div class="card-body">
				  <h5 class="card-title">${dto.name}</h5>
				  <p class="card-text">${dto.summary}</p>
				  <a href="./detail?productNum=${dto.productNum}" class="btn btn-primary">상세보기</a>
				</div>
			</div>
		</c:forEach>
		<!-- paging -->
		<div class="row col-6 mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<li class="page-item">
			      <a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item ${pager.before? 'disabled':''}">
			      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item ${pager.after? 'disabled' : ''}">
			      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
		<div class="row col-md-7 mx-auto">
			<form class="row g-3" action="./list" method="get">
				<div class="col-auto">
					<label for="kind" class="visually-hidden">Kind</label>
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
					<option value="name">물품이름</option>
					<option value="contents">물품내용</option>
					</select>
				</div>
				<div class="col-auto">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력하세요">
				</div>
				<div class="col-auto">
					<button type="submit" id="btn" class="btn btn-primary mb-3">검색</button>
				</div>
			</form>
		</div>
		<div class="row">
			<c:if test="${not empty member.roleName and member.roleName ne 'MEMBER'}">
				<a href="./add" class="btn btn-primary mb-3" role="button">상품추가</a>
			</c:if>
		</div>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>