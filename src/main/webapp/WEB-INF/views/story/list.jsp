<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	
	<div class="container-fluid my-3">
	
		<div class="row mb-4 border-bottom border-info">
			<h1 class="col-md-7 mx-auto text-center pb-3 fs-2">Story 페이지</h1><br>
		</div>
		
		<div id="storyList">
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
					  <!-- <img src="..." class="card-img-bottom" alt="..."> -->
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
		</div>

		<div class="row">
			<div class="col-md-8" style="width: 75%; height : 50px; bottom: 0px; position: fixed; left: 50%; transform: translateX(-50%)">
				<a href="./add" class="btn btn-primary btn-lg col-md-12" style="height: 100%" >스토리 쓰기</a>
			</div>
		</div>
	
	</div>
	

	<script src="../resources/js/story.js"></script>
	<script src="../resources/js/scroll.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>