<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">CAMPBOOK</h2>
				<ol class="breadcrumb">
					<li>캠핑장을 자세히 알려드릴게요</li>
				</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container-fluid">
	
	<div class="row">
			<div class="row" id="boardName" data-board-name="${boardName}" data-board-id="${boardId}">
				<h1> ${boardName} Detail Page</h1>
			</div>
			
			<h3>제목 : ${dto.title}</h3>
			<c:choose>
				<c:when test="${boardName eq 'notice'}">
					<h3>작성자 : 관리자</h3>	
				</c:when>
				<c:otherwise>
					<h3>작성자 : ${dto.writer}</h3>
				</c:otherwise>
			</c:choose>
			
			<h3>글 내용 : ${dto.contents}</h3>
			
			<c:if test="${!empty dto.boardFileDTOs}">
				<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
					<img src="../resources/upload/${boardName}/${fileDTO.fileName}">
					<a href="./fileDown?fileNum=${fileDTO.fileNum}">${fileDTO.oriName}</a>
				</c:forEach>
			</c:if>
			
			
			<div class="row">
				<div class="col-md-8">
					<c:if test="${boardName ne 'notice'}">		
						<a href="./report?num=${dto.num}" class="btn btn-primary col-md-2 mx-2 my-2">답글</a>

					</c:if>
					
				</div>		 
			</div>
	</div>

	<c:if test="${boardName ne 'notice'}">
		<div class="my-5 comment">
	  
			
			<div class="mb-3">
				<textarea class="form-control" id="replyContents" rows="3" name="contents" ></textarea>
			</div>
			<div class="mb-3">
					<button class="btn btn-primary col-md-2 offset-md-10" data-board-num="${dto.num}" id="replyAdd">댓글 작성</button>
			</div>
			<div class="row col-md-10 offset-md-1" id="commentList">
			</div>
		</div>
	</c:if>
	



	<div class="row">
		 <c:if test="${member.id eq dto.writer}"> 
			<div class="col-md-8">
				<form action="./update" id="frm" method="GET">
					<input type="hidden" name="num" value="${dto.num}">
						
					<!-- delete시엔 post방식 update시엔 get -->
					<button type="submit" class="btn btn-primary col-md-2 mx-2" id="update">글 수정</button>
					
					<button type="button" class="btn btn-primary col-md-2 mx-2" id="delete" data-delete="${dto.num}">글 삭제</button>
				</form>
			</div>
		 </c:if> 
		
		<a href="./list" class="btn btn-primary col-md-2 mx-1">목록으로</a>	
		


	</div>
</div>
<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/boardForm.js"></script>
	<script src="../resources/js/comment.js"></script>
	<script src="../resources/js/calcDate.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<script>
			setWriter('${member.id}');
			setNum('${dto.num}')
		
	</script>

</body>
</html>


</script>