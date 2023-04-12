<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="container-fluid">
		<div class="d-flex justify-content-around mb-3">
		<c:forEach items="${list}" var="dto">

				<div class="card col-md-4 mx-5" style="width: 17rem; display: inline-block;">
				  <div class="card-body">
					<div class="" style="height: 30px;">
						<span class="card-title" style="float: left;">${dto.writer}</span>
						<span class="card-title calcDate"  style="float: right;" id="reg${dto.num}" data-board-num="${dto.num}">
							<script>
								$(document).ready(function(){
									let regDate = '${dto.regDate}';
									$('#reg'+'${dto.num}').text(getDateDiff(regDate));
								})
							</script>
						</span>
					</div>
					<div class="border border-bottom"></div>
					<div class="col-md-12 my-1">
						<h5 class="card-title" style="display: inline; font-weight: bold; font-size: 16px;">${dto.title}</h5>		
					</div>
					<c:if test="${!empty dto.boardFileDTOs}">
						<div id="carouselExampleInterval${dto.num}" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
									<c:if test="${i.first}">
										  <div class="carousel-item active" data-bs-interval="100000">
											<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
										  </div>
									</c:if>
									<c:if test="${!i.first}">
										  <div class="carousel-item" data-bs-interval="100000">
											<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
										  </div>
									</c:if>

								</c:forEach>
							</div>
					  </div>
					
						<button class="carousel-control-prev" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						  </button>
					  
				
						</c:if>

					<p class="card-text" id="contents${dto.num}">${dto.contents}</p>
				  </div>
				</div>
			</c:forEach>
		</div>
	</div>