<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<script>
	
	$(document).ready(function(){
		getList(1);
	})
</script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	
	<div class="container-fluid my-3">
	
		<div class="row mb-4 border-bottom border-info">
			<h1 class="col-md-7 mx-auto text-center pb-3 fs-2" id="boardName" data-board-name="${boardName}">${boardName} 페이지</h1><br>
			${member.id}
		</div>
		
		<div id="storyList">

		</div>

		<div class="row">
			<div class="col-md-8" style="width: 75%; height : 50px; bottom: 0px; position: fixed; left: 50%; transform: translateX(-50%)">
				<a href="./add" class="btn btn-primary btn-lg col-md-12" style="height: 100%" >스토리 쓰기</a>
			</div>
		</div>
	
	</div>
	

	<script src="../resources/js/scroll.js"></script>
	<script src="../resources/js/story.js"></script>
	<script src="../resources/js/storyComment.js"></script>

	
	


<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>