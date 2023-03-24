<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-6 offset-md-3">
		
		
			<c:choose>
			  		<c:when test="${not empty reviewList}">
					  	<c:forEach items="${reviewList}" var="dto">
						    
						    <div class="row">
						    	<p>${dto.writer}</p>
						    	<p>${dto.regDate}</p>
						    </div>
							<div class="row">
								<td>${dto.contents}</td>
							</div>
							<div class="row">
						    <c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
						    	<img style="width: 30%; height: 30%;" alt="" src="../resources/upload/product/review/${fileDTO.fileName}">
						    </c:forEach>
							</div>
					  	</c:forEach>
				  	</c:when>
				 	<c:otherwise>
				 		<tr height="200px">
				 			<td class="align-middle text-center" colspan="20">검색 결과가 없습니다.</td>
				 		</tr>
				 	</c:otherwise>
			  	</c:choose>
		
</div>

	<!-- 페이징 -->
	<div class="reviewList">
		<div class="row">
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item ${pager.before ?'disabled':''}">
							<a class="page-link" href="#" aria-label="Previous" data-review-page="1">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="page-item ${pager.before ?'disabled':''}">
							<a class="page-link" href="#" aria-label="Previous" data-review-page="${pager.startNum-1}">
								<span aria-hidden="true">&lsaquo;</span>
							</a>
						</li>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li class="page-item"><a class="page-link" href="#" data-review-page="${i}">${i}</a></li>	
						</c:forEach>
						<li class="page-item ${pager.after eq false ? 'disabled':''}">
							<a class="page-link" href="#"  aria-label="Next" data-review-page="${pager.lastNum+1}">
								<span aria-hidden="true">&rsaquo;</span>
							</a>
						</li>
						<li class="page-item ${pager.after eq false ? 'disabled':''}">
							<a class="page-link" href="#"  aria-label="Next" data-review-page="${pager.totalPage}">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	