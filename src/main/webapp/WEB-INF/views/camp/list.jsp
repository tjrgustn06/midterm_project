<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>CampList - The Camp</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/campCRUD.css">
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
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
					<li>마음에 드는 캠핑장을 골라보세요</li>
				</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container-fluid col-lg-9 my-5">
	<!-- search -->
	<!-- 만들어뒀던거 쓸수는 있는데 select의 option 태그를 좀 바꿔야함 -->
	<div class="d-flex justify-content-center">
		<form class="row g-3" action="./list" method="get" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
			<div class="col-3">
				<label for="kind" class="visually-hidden">Kind</label>
				<select class="form-select" name="kind" id="kind" aria-label="Default select example">
					<option value="campName" ${pager.kind eq 'campName'? 'selected':''}>캠핑장명</option>
					<option value="phone" ${pager.kind eq 'phone'? 'selected':''}>전화번호</option>
					<option value="address" ${pager.kind eq 'address'? 'selected':''}>주소</option>
					<!-- <option value="doName" ${pager.kind eq 'doName'? 'selected':''}>시/도</option>
					<option value="sigunguName" ${pager.kind eq 'sigunguName'? 'selected':''}>시/군/구</option> -->
				</select>
			</div>
			<div class="col-5">
				<label for="search" class="visually-hidden">Search</label>
				<input type="text" class="form-control" name="search" value="${pager.search}" id="search" placeholder="검색어를 입력하세요">
			</div>
			<div class="col-4">
				<button type="submit" class="genric-btn primary mb-3">검색</button>
			</div>
		</form>	
	</div>
	
	
	<!-- 캠프장 등록 버튼 --> <!-- 차후 멤버등급 관련해서 조건문 추가 필요 -->
	<div class="d-flex justify-content-end">
		<c:if test="${not empty member.roleName and member.roleName eq 'ADMIN' or member.roleName eq 'CAMPMANAGER'}">
			<a class="genric-btn success" href="./add">등록</a>
		</c:if>
	</div>
	
	
	<!-- 카드형식 div / dto는 캠프정보 한개 -->
	<c:forEach items="${list}" var="dto">
		<div class="d-flex row campOne my-3">
			<div class="row imageBoxList col-6">
				<!-- thumbnailDTO에서 꺼내기 -->
				<c:catch var="er">
					<c:choose>
						<c:when test="${not empty dto.thumbnailDTO}">
							<img class="innerImage" alt="" src="../resources/upload/camp/thumbnail/${dto.thumbnailDTO.thumbName}">
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${not empty dto.thumbnail}">
									<img class="innerImage" alt="" src="${dto.thumbnail}">
								</c:when>
								<c:otherwise>
									<img class="innerImage" alt="" src="../resources/images/empty.jpg">
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:catch>
			</div>

			<div class="row discription col-6">
				<ul>
					<li class="row-2 campName"><h5><a href="./detail?campNum=${dto.campNum}&viewType=1">[${dto.doName} ${dto.sigunguName}] ${dto.campName}</a></h5></li>
					<hr class="my-1">
					<li class="mb-1 lineIntro">${dto.lineIntro}</li>
					<li class="mb-1 introBox">${dto.intro}</li>
					<li class="my-1 loca">
						<i class="fa-solid fa-location-dot fa-sm"></i>
						${dto.address}
					</li>
					<li class="my-1 tel">
						<i class="fa-solid fa-phone fa-sm"></i>
						${dto.phone}
					</li>
				</ul>
			</div>

			<!-- Service 아이콘 나오는 부분 -->
			<div class="mb-2">
				<!-- ${dto.service} -->
				<c:set var="service" value="${dto.service}"></c:set>
					<c:if test="${fn:contains(service, '전기')}"><i class="fa-solid fa-bolt fa-sm"><span>전기</span></i></c:if>
					<c:if test="${fn:contains(service, '무선인터넷')}"><i class="fa-solid fa-wifi fa-sm"><span>와이파이</span></i></c:if>
					<c:if test="${fn:contains(service, '장작판매')}"><i class="fa-solid fa-campground fa-sm"><span>장작판매</span></i></c:if>
					<c:if test="${fn:contains(service, '온수')}"><i class="fa-solid fa-mug-hot fa-sm"><span>온수</span></i></c:if>
					<c:if test="${fn:contains(service, '트렘폴린')}"><i class="fa-solid fa-hockey-puck fa-sm"><span>트렘폴린</span></i></c:if>
					<c:if test="${fn:contains(service, '물놀이장')}"><i class="fa-solid fa-person-swimming fa-sm"><span>물놀이장</span></i></c:if>
					<c:if test="${fn:contains(service, '놀이터')}"><i class="fa-solid fa-volleyball fa-sm"><span>놀이터</span></i></c:if>
					<c:if test="${fn:contains(service, '산책로')}"><i class="fa-solid fa-person-walking fa-sm"><span>산책로</span></i></c:if>
					<c:if test="${fn:contains(service, '운동장')}"><i class="fa-solid fa-mound fa-sm"><span>운동장</span></i></c:if>
					<c:if test="${fn:contains(service, '운동시설')}"><i class="fa-solid fa-baseball fa-sm"><span>운동시설</span></i></c:if>
					<c:if test="${fn:contains(service, '마트.편의점')}"><i class="fa-solid fa-shop fa-sm"><span>마트.편의점</span></i></c:if>
			</div>
		</div>
	</c:forEach>
	

	<!-- Pager -->
	<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  
		  	<li class="page-item">
		      <a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="1">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  
		    <li class="page-item ${pager.before ? 'disabled' :''}" data-board-page="${pager.startNum-1}">
		      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
		        <span aria-hidden="true">&lsaquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
		    	<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}" data-board-page="${i}">${i}</a></li>			    
		    </c:forEach>
	
			<!-- 검색을 해서 나온 결과가 더 없으면 못누르게 해야함 -->
		    <li class="page-item ${pager.after ? 'disabled' :''}">
		      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.lastNum+1}">
		        <span aria-hidden="true">&rsaquo;</span>
		      </a>
		    </li>
		    
		    <li class="page-item">
		      <a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}" aria-label="Next" data-board-page="${pager.totalPage}">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>


	






</div>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>