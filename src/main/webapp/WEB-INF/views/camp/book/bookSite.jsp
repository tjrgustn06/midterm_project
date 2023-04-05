<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book - The Camping</title>
<c:import url="../../template/common_css.jsp"></c:import>
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<div class="container-fluid col-lg-9 my-5">
	<div class="mb-10">0</div>
	<div class="row my-3">
		<h1>BookSite Page</h1>
		<p>기간 설정, 예약 가능 사이트 확인, 금액 확인, 예약하기 기능</p>
	</div>


	<!-- 입력 폼 시작 -->
	<form action="./confirmation" id="bksFrm" method="get">
		<input type="hidden" id="bksCampNum" name="campNum" value="${dto.campNum}">
		<div class="row my-2">
			<button id="bksConsoleSign" type="button" class="generic-btn primary">Console</button>
			<button id="bksConfirm" type="button" class="generic-btn success">confirm</button>
			<button id="bksCancle" type="button" class="generic-btn info">cancle</button>
		</div>
	</form>
	<!-- 입력 폼 끝 -->


	<!-- 캠핑장이 가지고있는 사이트들 -->
	<div class="row my-2" id="siteList">
		<!-- siteDTO - 버튼 누르면 생성될 부분 / 최소 한개의 site는 필수 -->
		<!-- index는 0부터 시작, count는 1부터 시작 -->
		<c:forEach items="${siteList}" var="siteDTO" varStatus="i">
			<div id="siteOne${i.count}">
				<div class="input-group mb-2">
					<span class="input-group-text" id="siteName">사이트이름</span>
					<input type="text" name="siteName" data-site-idx="siteName${i.count}" class="form-control" value="${siteDTO.siteName}">
					<span class="input-group-text" id="siteSize">크기(m^2)</span>
					<input type="text" name="siteSize" data-site-idx="siteSize${i.count}" class="form-control" value="${siteDTO.siteSize}">
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>
					<input type="text" name="offWeekdaysPrice" data-site-idx="siteOwkPrice${i.count}" class="form-control" value="${siteDTO.offWeekdaysPrice}">
					<span class="input-group-text" id="offWeekendsPrice">주말</span>
					<input type="text" name="offWeekendsPrice" data-site-idx="siteOwdPrice${i.count}" class="form-control" value="${siteDTO.offWeekendsPrice}">
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>
					<input type="text" name="peakWeekdaysPrice" data-site-idx="sitePwkPrice${i.count}" class="form-control" value="${siteDTO.peakWeekdaysPrice}">
					<span class="input-group-text" id="peakWeekendsPrice">주말</span>
					<input type="text" name="peakWeekendsPrice" data-site-idx="sitePwdPrice${i.count}" class="form-control" value="${siteDTO.peakWeekendsPrice}">
				</div>
				<!-- <div class="form-check mb-2">
					<input class="form-check-input" type="radio" name="status" id="bookable" value="예약가능">
					<label class="form-check-label" for="bookable">예약가능</label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="radio" name="status" id="unbookable" value="예약불가">
					<label class="form-check-label" for="unbookable">예약불가</label>
				</div> -->
				<div class="mb-2">
					<button type="button" data-site-idx="siteIptDel${i.count}" class="siteDels btn btn-outline-danger">사이트 삭제</button>
				</div>
			</div>
		</c:forEach>
		<!-- 생성 끝날 부분 -->
	</div>




</div>


<script src="../../resources/js/camp/book.js"></script>
<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>