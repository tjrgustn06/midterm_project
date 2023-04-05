<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampList - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
	<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
	<style>
		a{
			color: black;
			text-decoration: none;
		}
		
		.pic{
			width: 40%;
			height: 30%;
		}
	
		.campOne{
			border: black, solid, 1px;
			border-radius: 5%;
		}
		
		.lineIntro{
			font-weight: bold;
		}
		
		.introBox{
			/* 말줄임(...) */
			width: auto;

			white-space: normal;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
			overflow: hidden;
		}

		ul, ol, li{
			list-style: none;
			font-size: 0.9rem;
		}
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid col-lg-9 my-5">
	<div class="row my-3">
		<h1>CampList Page</h1>
	</div>

	<!-- search -->
	<!-- 만들어뒀던거 쓸수는 있는데 select의 option 태그를 좀 바꿔야함 -->
	<div class="row col-7 mx-auto">
		<form class="row g-3" action="./list" method="get" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
			<div class="col-3">
				<label for="kind" class="visually-hidden">Kind</label>
				<select class="nice-select" name="kind" id="kind" aria-label="Default select example">
					<option value="name" ${pager.kind eq 'name'? 'selected':''}>캠핑장명</option>
					<option value="phone" ${pager.kind eq 'phone'? 'selected':''}>전화번호</option>
					<option value="address" ${pager.kind eq 'address'? 'selected':''}>주소</option>
					<%-- <option value="contents" ${pager.kind eq 'contents'? 'selected':''}>상세내용</option> --%>
				</select>
			</div>
			<div class="col-6">
				<label for="search" class="visually-hidden">Search</label>
				<input type="text" class="form-control" name="search" value="${pager.search}" id="search" placeholder="검색어를 입력하세요">
			</div>
			<div class="col-3">
				<button type="submit" class="btn btn-outline-primary mb-3">검색</button>
			</div>
		</form>	
	</div>
	
	
	<!-- 캠프장 등록 버튼 --> <!-- 차후 멤버등급 관련해서 조건문 추가 필요 -->
	<div class="row col-1">
		<a class="btn btn-outline-success" href="./add">등록</a>
	</div>
	
	
	<!-- 카드형식 div / dto는 캠프정보 한개 -->
	<c:forEach items="${list}" var="dto">
		<div class="d-flex row campOne my-3">
			<div class="row pic col-5">
				<!-- thumbnailDTO에서 꺼내기 -->
				<c:catch var="er">
					<c:choose>
						<c:when test="${not empty dto.thumbnailDTO}">
							<img alt="" src="../resources/upload/camp/thumbnail/${dto.thumbnailDTO.thumbName}">
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${not empty dto.thumbnail}">
									<img alt="" src="${dto.thumbnail}">
								</c:when>
								<c:otherwise>
									<img alt="" src="../resources/images/empty.jpg">
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:catch>
			</div>

			<div class="row discription col-7">
				<ul>
					<li class="row-2 campName"><h5><a href="./detail?campNum=${dto.campNum}&viewType=1">[${dto.doName} ${dto.sigunguName}] ${dto.name}</a></h5></li>
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
	<div class="row col-3 mx-auto">
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
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>