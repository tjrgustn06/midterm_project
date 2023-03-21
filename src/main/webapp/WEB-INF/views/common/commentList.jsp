<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<table class="table table-striped">
		<tbody >
			<c:forEach var="dto" items="${commentList}">
				<tr>
					 <td class="col-md-2">${dto.writer}</td>
					<td class="col-md-5" id="contents${dto.commentNum}">${dto.contents}</td>
					<!-- <td><textarea class="form-control" name="contents" id="updateContents" cols="30" rows="1">${dto.contents}</textarea></td> -->
					<td class="col-md-2">${dto.regDate}</td>
					<td class="col-md-1">
						<%-- <c:if test="${member.id eq dto.writer}"> --%>
							<button class="btn btn-outline-danger del" data-comment-num='${dto.commentNum}'>X</button>
						<%-- </c:if> --%>
					</td>
					<td class="col-md-1">
						<%-- <c:if test="${member.id eq dto.writer}"> --%>
							<button class="btn btn-outline-primary update" data-comment-num='${dto.commentNum}' data-bs-toggle="modal" data-bs-target="#contentsModal">Update</button>
						<%-- </c:if> --%>
					</td> 
					 <td style="float : right;">
						<button class="btnToggle" style="border : 0px;" data-comment-num="${dto.commentNum}">
							<img alt="토글 버튼" src="/resources/images/menu/kebobMenu.png" style="width:12px; height:12px;">
						</button>
						<span class="commentMenu" id="commentMenu${dto.commentNum}" style="display: none;">
							<div class="list-group" >
								<button type="button" class="list-group-item list-group-item-action update" data-comment-num='${dto.commentNum}'aria-current="true">
									수정
								</button>
								<button type="button" class="list-group-item list-group-item-action delete" data-comment-num='${dto.commentNum}'>삭제</button>
								<button type="button" class="list-group-item list-group-item-action accuse" data-comment-num='${dto.commentNum}'>신고하기</button>
							</div>
					</td>
				</tr> 


			</div>

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

