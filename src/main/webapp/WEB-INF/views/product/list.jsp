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
<link rel="stylesheet" href="/resources/vendors/nice-select/css/nice-select.css">
<style>
	.card{display: inline-block;}
	.quickmenu{
		position:absolute; 
		width: 150px;
        height: auto;
        right: 50px;
        border-radius: 10px;
        border: 1px solid #dddddd;
		
		}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">RENT</h2>
			<ol class="breadcrumb">
				<li>캠핑에 유용한 장비를 사용해보세요</li>
			</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->

<!--================물품대여 Area ====================-->
<section class="accomodation_area section_gap">
	<div class="container col-6">
		<div class="quickmenu mx-auto">
			<div id="cartBar" data-member-id="${member.id}" style="margin-left: 50px; margin-top: 10px;">
			</div>
			<div style="margin-left: 50px;">
				<a href="/cart/list">
					장바구니
				</a><br>
				<a href="#">위로가기</a>
			</div>
		</div>
		<c:forEach items="${list}" var="dto">
			<div class="card" style="width: 16rem">
				<c:forEach items="${dto.productFileDTOs}" var="fileDTO" varStatus="i">
					<c:if test="${i.first}">
						<img class="card-img-top" src="../resources/upload/product/${fileDTO.fileName}" alt="Card image cap" style="height: 254px;">
					</c:if>
				</c:forEach>
				
				
				<div class="card-body">
					<h5 class="card-title">${dto.name}</h5>
					<p class="card-text">${dto.summary}</p>
					<a href="./detail?productNum=${dto.productNum}" class="genric-btn success radius">상세보기</a>
				</div>
			</div>
		</c:forEach>
		<!-- paging -->
		<div class="col-2 mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<li class="page-item">
			      <a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item ${pager.before? 'disabled':''}">
			      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item ${pager.after? 'disabled' : ''}">
			      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
		<div class="col-md-7 mx-auto">
			<form class="row g-3" action="./list" method="get">
				<div class="col-auto">
					<label for="kind" class="visually-hidden">Kind</label>
					<select class="nice-select" name="kind" id="kind" aria-label="Default select example">
						<option value="name">물품이름</option>
						<option value="contents">물품내용</option>
					</select>
				</div>
				<div class="col-auto">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력하세요" style="width: 100%;">
				</div>
				<div class="col-auto">
					<input type="image" src="../resources/images/search.jpg" style="width: 35px; height: 35px; border-radius: 10%;">
				</div>
			</form>
		</div>
		<div style="float: right;">
			<c:if test="${not empty member.roleName and member.roleName ne 'MEMBER'}">
				<a href="./add" class="theme_btn button_hover success radius mb-3" role="button">상품추가</a>
			</c:if>
		</div>
	</div>
</section>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/vendors/nice-select/js/jquery.nice-select.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<script>
		function cartBar(){
			let currentPosition = parseInt($(".quickmenu").css("top"));
			$(window).scroll(function() {
			let position = $(window).scrollTop(); 
			$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},800);
			});
		}
		cartBar()

		function getCartBar() {
			if($('#cartBar').attr('data-member-id')!=null){
				$.ajax({
					type : 'GET',
					url : './cartBar',
					success : (response) =>{
						$('#cartBar').html(response);
					}
				})
			}
		}

		getCartBar()
	</script>
</body>
</html>