<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->
<title>Insert title here</title>
</head>
<body>

	
	<div class="container-fluid my-3">
		
		<div class="row mb-4 border-bottom border-info">
			<h1 class="col-md-7 mx-auto text-center pb-3 fs-2">${boardName} 페이지</h1><br>
		</div>
		
		<div class="row col-md-8 mx-auto border-bottom ">
			<form action="./add" method="post" enctype="multipart/form-data">
			
				<div class="row mb-3">
				  <label for="writer" class="col-sm-2 col-form-label">작성자</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" name="writer" id="writer" value="user01" readonly >
				  </div>
				</div>
				
				<div class="row mb-3">
				  <label for="title" class="col-sm-2 col-form-label">제목</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" name="title" id="title" placeholder="제목 입력">
				  </div>
				</div>
				
				<div id="fileList" class="my-5">
<!-- 					<div class="row mb-3">
							<label for="files" class="col-sm-1 col-form-label">Image </label>
							<div class="col-sm-10">
								<input type="file" class="form-control" name="pic" id="files">
								<button type="button">X</button>
						</div>
					</div>   -->
					<button class="btn btn-primary" type="button" id="button" >Add</button>
				</div> 
				
				
				<div class="mb-5">
				  <label for="contents" class="form-label">내용</label>
				  <textarea class="form-control" name="contents" id="contents" rows="8"></textarea>
				</div>
				
				
				<div class="row mt-5 mb-3 col-md-2 offset-md-10">
					<button class="btn btn-primary " type="submit">글 쓰기</button>
				</div>
			
			</form>
		</div>
	</div>




	<c:import url="../template/common_js.jsp"></c:import>	
	
	
</body>
</html>