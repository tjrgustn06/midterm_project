<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:forEach items="${list}" var="dto">
			<div class="col-md-8 mx-auto" style="height: 100%;">
				<div class="d-flex flex-column mb-3">
					<div class="card col-md-5 mx-5">
					  <div class="card-body">
						<div class="col-md-12">
					    	<h5 class="card-title" style="display: inline;">${dto.title}</h5>
							<span class="p-2 mb-3 float-right">
								<button class="btnToggle" style="border : 0px; background-color: transparent;" data-board-num="${dto.num}">
									<img alt="토글 버튼" src="/resources/images/menu/kebobMenu.png" style="width:12px; height:12px;">
								</button>
							</span>				
						</div>

					    <p class="card-text">${dto.contents}</p>
					    <p class="card-text"><small class="text-muted">${dto.regDate}</small></p>
					  </div>
					  
		  			<c:if test="${!empty dto.boardFileDTOs}">
								<div id="carouselExampleInterval${dto.num}" class="carousel slide" data-bs-ride="carousel">
									<div class="carousel-inner">
										<c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
											<c:if test="${i.first}">
												  <div class="carousel-item active" data-bs-interval="10000">
													<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
												  </div>
											</c:if>
											<c:if test="${!i.first}">
												  <div class="carousel-item" data-bs-interval="10000">
													<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
												  </div>
											</c:if>

										</c:forEach>
									</div>
							  </div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						  </button>
					</c:if>
					
					</div>
					<span class="p-2 boardMenu" id="boardMenu${dto.num}" style="display: none;">
						<div class="list-group">
							<button type="button" class="list-group-item list-group-item-action updateMenu" data-board-num="${dto.num}" aria-current="true">
								수정
							</button>
							<button type="button" class="list-group-item list-group-item-action deleteMenu" data-board-num="${dto.num}">삭제</button>
							<button type="button" class="list-group-item list-group-item-action accuseMenu" data-board-num="${dto.num}">신고하기</button>
							<button type="button" class="list-group-item list-group-item-action subCommentMenu" data-board-num="${dto.num}">답글달기</button>
						</div>
					</span>
				</div>
			</div>
		</c:forEach> 		
		
	
	
