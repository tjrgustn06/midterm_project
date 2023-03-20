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
		
		.pic{
			width: 40%;
			height: 200px;
		}
	
		.campOne{
			border: black, solid, 1px;
			border-radius: 5%;
		}
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid my-5">
	<div class="row my-3">
		<h1>CampList Page</h1>
	</div>

	<!-- search -->
	<!-- 만들어뒀던거 쓸수는 있는데 select의 option 태그를 좀 바꿔야함 -->
	<div class="row col-7 mx-auto">
		<form class="row g-3" action="./list" method="get" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
			<div class="col-3">
				<label for="kind" class="visually-hidden">Kind</label>
				<select class="form-select" name="kind" id="kind" aria-label="Default select example">
					<option value="name" ${pager.kind eq 'name'? 'selected':''}>캠핑장명</option>
					<option value="phone" ${pager.kind eq 'phone'? 'selected':''}>전화번호</option>
					<option value="address" ${pager.kind eq 'address'? 'selected':''}>주소</option>
					<option value="contents" ${pager.kind eq 'contents'? 'selected':''}>상세내용</option>
				</select>
			</div>
			<div class="col-6">
				<label for="search" class="visually-hidden">Search</label>
				<input type="text" class="form-control" name="search" value="${pager.search}" id="search" placeholder="검색어를 입력하세요">
			</div>
			<div class="col-3">
				<button type="submit" class="btn btn-outline-primary mb-3">검색</button>
			</div>
		</form>	
	</div>
	
	
	<!-- 캠프장 등록 버튼 --> <!-- 차후 멤버등급 관련해서 조건문 추가 필요 -->
	<div class="row col-1">
		<a class="btn btn-outline-success" href="./add">등록</a>
	</div>
	
	
	<!-- 카드형식 div -->
	<c:forEach items="${list}" var="dto"> <!-- dto는 캠프정보 한개 -->
		<div class="row campOne my-3">
			<div class="row pic col-5">
<%-- 			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
					<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
				</c:forEach> --%>
				
				<c:if test="${not empty dto.campFileDTOs}">
					<img alt="" src="../resources/upload/camp/${dto.campFileDTOs.get(0).fileName}">
				</c:if>
			</div>

			<div class="row discription col-7">
				<h5 class="campName"><a href="./detail?campNum=${dto.campNum}">${dto.name}</a></h5>
				캠핑장 주소 : ${dto.address}<br>
				전화번호 : ${dto.phone}<br>
				서비스 목록 입력하기
			</div>
		</div>
	</c:forEach>
	
	
	
	
	<!-- table div -->
	<!-- <div class="row my-3">
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
	</div> -->

	<!-- Pager -->
	<div class="row col-3 mx-auto">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  
		  	<li class="page-item">
		      <a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="1">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  
		    <li class="page-item ${pager.before ? 'disabled' :''}" data-board-page="${pager.startNum-1}">
		      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
		        <span aria-hidden="true">&lsaquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
		    	<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}" data-board-page="${i}">${i}</a></li>			    
		    </c:forEach>
	
			<!-- 검색을 해서 나온 결과가 더 없으면 못누르게 해야함 -->
		    <li class="page-item ${pager.after ? 'disabled' :''}">
		      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.lastNum+1}">
		        <span aria-hidden="true">&rsaquo;</span>
		      </a>
		    </li>
		    
		    <li class="page-item">
		      <a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.totalPage}">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>


	






</div>
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>