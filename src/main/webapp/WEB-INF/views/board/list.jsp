<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/common_css.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
	
		<div class="row my-6">
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">글번호</th>
			      <th scope="col">글제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">작성일</th>
			      <th scope="col">조회수</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  	<c:choose>
			  		<c:when test="${not empty list}">
					  	<c:forEach items="${list}" var="dto">
						    <tr>
						      <th scope="row">${dto.num}</th>
						      <td><a href="./detail?num=${dto.num}">${dto.title}</a></td>
						      <td>${dto.writer}</td>
						      <td>${dto.regDate}</td>
						      <td>${dto.hit}</td>
						    </tr>
					  	</c:forEach>
				  	</c:when>
				 	<c:otherwise>
				 		<tr height="200px">
				 			<td class="align-middle text-center" colspan="20">검색 결과가 없습니다.</td>
				 		</tr>
				 	</c:otherwise>
			  	</c:choose>
			  </tbody>
			</table>
		</div>
		
				<!-- 페이징 -->
		<div class="row">
		
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			   <li class="page-item ${pager.before ? 'disabled':''}">
			      <a class="page-link" aria-label="Previous" href="./list?page=1">
			      	<span aria-hidden="true">&laquo;</span>
			      </a>
			   	</li>
			    <li class="page-item ${pager.before ? 'disabled':''}">
   			      <a class="page-link" aria-label="Previous" href="./list?page=${pager.startNum-1}">
			      	<span aria-hidden="true">&lsaquo;</span>
			      </a>
			   	</li>
			   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./list?page=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item ${pager.after ? 'disabled':''}">
   			      <a class="page-link" aria-label="Previous" href="./list?page=${pager.lastNum+1}">
			      	<span aria-hidden="true">&rsaquo;</span>
			      </a>
			   	</li>
 			    <li class="page-item ${pager.after ? 'disabled':''}">
   			      <a class="page-link" aria-label="Previous" href="./list?page=${pager.totalPage}">
			      	<span aria-hidden="true">&raquo;</span>
			      </a>
			   	</li>
			  </ul>
			</nav>
	<%-- 		<nav aria-label="Page navigation example">
			  <ul class="pagination">
  			    <li class="page-item ${pager.before ?'disabled':''}">
			      <a class="page-link" href="#" aria-label="Previous" data-board-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  
			    <li class="page-item ${pager.before ?'disabled':''}">
			      <a class="page-link" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="#" data-board-page="${i}">${i}</a></li>	
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}">
			      <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    
			      <li class="page-item ${pager.after eq false ? 'disabled':''}">
			      <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav> --%>
		</div>
		
				<!-- 검색창  -->
		<div class="row">
			
			<form class="row g-3" action="./list" method="get" id="searchForm">
				<input type="hidden" name="page" id="page" value="1">
				<div class="row justify-content-center my-5">
				 <div class="col-auto">
					 <label for="kind" class="visually-hidden">Kind</label>
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
					   <option value="title" ${pager.kind eq 'title' ? 'selected' : ''}>제목</option>
					  <option value="contents" ${pager.kind eq 'contents' ? 'selected' : ''}>글 내용</option> 
				  <c:if test="${boardName ne 'notice'}">
					  	<option value="writer" ${pager.kind eq 'writer' ? 'selected' : ''}>작성자</option>
					  </c:if> 
					</select>
				</div>
			
			  <div class="col-auto">
			    <label for="search" class="visually-hidden">Search</label>
			    <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
			  </div>
			  <div class="col-auto">
			    <button type="submit" class="btn btn-primary mb-3">검색</button>
			  </div>
			  </div>
			
			</form>
		
			
			<%-- <form class="row g-3" action="./list" method="get" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
			  <div class="col-auto">
			    <label for="kind" class="visually-hidden">Kind</label>
			    <select class="form-select" name="kind" id="kind" aria-label="Default select example">
					  <option value="title" ${pager.kind eq 'title'?'selected':''}>제목</option>
					  <option value="contents" ${pager.kind eq 'contents'?'selected':''}>글 내용</option>
					  <option value="writer" ${pager.kind eq 'writer'?'selected':''}>작성자</option>
				</select>
			  </div>
			  <div class="col-auto">
			    <label for="search" class="visually-hidden">Search</label>
			    <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
			  </div>
			  <div class="col-auto">
			    <button type="submit" class="btn btn-primary mb-3">검색</button>
			  </div>
			</form> --%>
		
		<div class="row">
			<div class="col-auto offset-md-10">
				<a href="./add" class="btn btn-primary"> 글 쓰기</a>
			</div>		
		</div>
		</div>
	</div>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>