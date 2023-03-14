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
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  	<c:forEach items="${list}" var="dto">
				    <tr>
				      <th scope="row">${dto.num}</th>
				      <td><a href="./detail?num=${dto.num}">${dto.title}</a></td>
				      <td>${dto.writer}</td>
				      <td>${dto.regDate}</td>
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</div>
		
				<!-- 페이징 -->
		<div class="row">
		
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link">Previous</a>
			   	</li>
			   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}">
			    <li class="page-item"><a class="page-link" href="">1</a></li>
			    </c:forEach>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
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
		
		<div class="row">
			<div class="col-auto offset-md-10">
				<a href="./add" class="btn btn-primary"> 글 쓰기</a>
			</div>		
		</div>
	</div>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>