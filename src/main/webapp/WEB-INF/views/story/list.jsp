<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
<c:import url="../template/common_css.jsp"></c:import>
<style>
	.imageBoxOther{
    width: 25rem;
    height: 25rem;
    overflow: hidden;
    margin: 0 auto;
	}
	
	.innerImage{
	    width: 100%;
	    /* height: 80%; */
	    object-fit: cover;
	}
</style>
<script>
	
	$(document).ready(function(){
		getList(1);
	})
</script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

	 <!--================Banner Area =================-->
	 <section class="banner_area blog_banner d_flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
				<h4>Dude You’re Getting <br />a Telescope</h4>
				<p>There is a moment in the life of any aspiring astronomer that it is time to buy that first</p>
				<a href="#" class="btn white_btn button_hover">View More</a>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->

	<div class="containermy-3">
	
		<div class="row mb-4 border-bottom border-info">
			<h1 class="col-md-7 mx-auto text-center pb-3 fs-2" id="boardName" data-board-id="${boardId}" data-board-name="${boardName}">${boardName} 페이지</h1><br>
		</div>
		
		<div id="storyList">

		</div>

		<div class="row">
			<div class="col-md-8" style="width: 75%; height : 50px; bottom: 0px; position: fixed; left: 50%; transform: translateX(-50%)">
				<a href="./add" class="btn btn-primary btn-lg col-md-12" style="height: 100%" >스토리 쓰기</a>
			</div>
		</div>
	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/scroll.js"></script>
	<script src="../resources/js/calcDate.js"></script>
	<script src="../resources/js/story.js"></script>
	<script src="../resources/js/storyComment.js"></script>
	<script src="../resources/js/report.js"></script>

	
	


<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>