<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<table class="table table-striped">
		<tbody >
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="col-md-2">${dto.writer}</td>
					<td class="col-md-5" id="contents${dto.num}">${dto.contents}</td>
					<!-- <td><textarea class="form-control" name="contents" id="updateContents" cols="30" rows="1">${dto.contents}</textarea></td> -->
					<td class="col-md-2">${dto.regDate}</td>
					<td class="col-md-1">
						<%-- <c:if test="${member.id eq dto.writer}"> --%>
							<button class="btn btn-outline-danger del" data-board-num='${dto.num}'>X</button>
						<%-- </c:if> --%>
					</td>
					<td class="col-md-1">
						<%-- <c:if test="${member.id eq dto.writer}"> --%>
							<button class="btn btn-outline-primary update" data-board-num='${dto.num}' data-bs-toggle="modal" data-bs-target="#contentsModal">Update</button>
						<%-- </c:if> --%>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

			<!-- 페이징 -->
			<div class="replyList">
				<div class="row">
					<nav aria-label="Page navigation example">
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
					</nav>
				</div>
			</div>

