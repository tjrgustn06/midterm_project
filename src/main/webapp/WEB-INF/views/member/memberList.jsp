<%@page import="com.camp.s1.member.MemberDTO"%>
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
		<h2 class="page-cover-tittle">회원 목록</h2>
		</div>
	</div>
</section>
<!--================Banner Area =================-->

<table class="table table-striped">
  <thead class="table-info">
	<tr>
		<th scope="col">아이디</th>
		<th scope="col">비밀번호</th>
		<th scope="col">회원 이름</th>
		<th scope="col">전화번호</th>
		<th scope="col">이메일</th>
		<th scope="col">현재 등급</th>
		<th scope="col">변경할 등급</th>
		<th scope="col">등급 변경</th>
	</tr>
	</thead>
	 <tbody class="table-group-divider">
	<c:forEach items="${list}" var="dto" varStatus="i">
		<tr>
			<td>${dto.id}</td>
			<td>${dto.pw}</td>
			<td>${dto.name}</td>
			<td>${dto.phone}</td>
			<td>${dto.email}</td>
			<td>${dto.roleName}</td>
			<td>
			<input type="hidden" name="id" value="${dto.id}">
			<select id="roleName" name="roleName">
			<option value="MEMBER" ${dto.roleName eq 'MEMBER' ? 'selected' : ''}> MEMBER</option>
			<option value="MANAGER" ${dto.roleName eq 'MANAGER' ? 'selected' : ''}>MANAGER</option>
			<option value="CAMPMANAGER" ${dto.roleName eq 'CAMPMANAGER' ? 'selected' : ''}>CAMPMANAGER</option>
			</select>
  			</td>
  			<td>
  			<input id="roleNamechange" type="button" class="btn btn-success" value="변경" onclick="${i.count}"/>
  			</td>
		</tr>
		
	</c:forEach>
	</tbody>
</table>

										<!-- 페이징 -->
				<div class="row">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			   <li class="page-item ${pager.before ? 'disabled':''}">
			      <a class="page-link" aria-label="Previous" href="./memberList?page=1">
			      	<span aria-hidden="true">&laquo;</span>
			      </a>
			   	</li>
			    <li class="page-item ${pager.before ? 'disabled':''}">
   			      <a class="page-link" aria-label="Previous" href="./memberList?page=${pager.startNum-1}">
			      	<span aria-hidden="true">&lsaquo;</span>
			      </a>
			   	</li>
			   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./memberList?page=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item ${pager.after ? 'disabled':''}">
   			      <a class="page-link" aria-label="Previous" href="./memberList?page=${pager.lastNum+1}">
			      	<span aria-hidden="true">&rsaquo;</span>
			      </a>
			   	</li>
 			    <li class="page-item ${pager.after ? 'disabled':''}">
   			      <a class="page-link" aria-label="Previous" href="./memberList?page=${pager.totalPage}">
			      	<span aria-hidden="true">&raquo;</span>
			      </a>
			   	</li>
			  </ul>
			</nav>
		</div>
			
		<!-- 검색창 -->
		<div class="row">
			<form class="row col-md-7 mx-auto" action="./memberList" method="get">
				<div class="col-auto">
					<label for="kind" class="visually-hidden">Kind</label> 
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
						<option value="name" ${pager.kind eq 'name' ? 'selected' : ''}>회원 이름</option>
						<option value="id" ${pager.kind eq 'id' ? 'selected' : ''}>회원 아이디</option> </select>						
				</div>
				<div class="col-auto">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" id="search" name="search" placeholder="검색어를 입력하세요">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-success mb-3">검색</button>
				</div>
			</form>
		</div>
<div class="row col-auto">
<input type="button" value="HOME" class="btn" onclick="location.href='/'">
</div>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/roleNameUpdate.js"></script>
</body>
</html>