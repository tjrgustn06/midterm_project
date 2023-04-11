<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>bookList - The Camp</title>
<c:import url="../../template/common_css.jsp"></c:import>
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">BOOKING</h2>
				<ol class="breadcrumb">
					<li>캠핑장의 모든 예약 정보입니다</li>
				</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container col-lg-9 my-5">
	<p>해당 캠핑장에서 예약된 사이트 전체를 보여줌, 사이트이름, 사용기간, 결제여부 확인(입금대기/결제완료)</p>
	<div class="row my-3">
		<h1>${campDTO.campName}</h1>
	</div>

	<hr>

	<div class="row my-2">
		<div class="col-10">
			<h5><i class="fa-solid fa-circle-info fa-sm"></i> 사이트 예약 리스트</h5>
		</div>
		<!-- <div class="col-2">
			<button class="genric-btn success" id="siteAddBtn" type="button">추가</button>
		</div> -->
	</div>

	<!-- 해당 캠핑장의 모든 예약 리스트를 볼 수 있음 -->
	<div class="row my-2" id="bookList">
		<!-- index는 0부터 시작, count는 1부터 시작 -->
		<c:choose>
			<c:when test="${not empty bookList}">
				<c:forEach items="${bookList}" var="bookDTO" varStatus="i">
					<!-- <form action="./confirmation" id="bookFrm${i.count}" method="get"> -->
					<div id="bookOne${i.count}" class="my-2">
						<!-- <div class="d-flex justify-content-end mb-2">
							<button data-site-idx="siteIptDel${i.count}" type="button" class="siteDels genric-btn primary">Remove Site</button>
							<button id="bookBtn${i.count}" type="button" class="bookBtn genric-btn success medium" data-site-idx="${i.count}">Booking</button>
						</div> -->
						<div class="orderInfo input-group mb-2">
							<span class="input-group-text" id="orderNum">주문번호</span>
							<input type="text" name="orderNum" data-site-idx="orderNum${i.count}" class="form-control" value="${bookDTO.orderNum}" readonly>
							<span class="input-group-text" id="price">금액</span>
							<input type="text" name="price" data-site-idx="price${i.count}" class="form-control" value="${bookDTO.price}" readonly>
						</div>
						<div class="siteInfo input-group mb-2">
							<span class="input-group-text" id="areaNum">사이트번호</span>
							<input type="text" name="areaNum" data-site-idx="areaNum${i.count}" class="form-control" value="${bookDTO.areaNum}" readonly>
							<span class="input-group-text" id="id">예약자ID</span>
							<input type="text" name="id" data-site-idx="id${i.count}" class="form-control" value="${bookDTO.id}" readonly>
						</div>
						<div class="useDate input-group mb-2">
							<span class="input-group-text" id="startDate">입실일</span>
							<input type="text" name="startDate" data-site-idx="startDate${i.count}" class="form-control" value="${bookDTO.startDate}" readonly>
							<span class="input-group-text" id="lastDate">퇴실일</span>
							<input type="text" name="lastDate" data-site-idx="lastDate${i.count}" class="form-control" value="${bookDTO.lastDate}" readonly>
						</div>
						<div class="useDate input-group mb-2">
							<span class="input-group-text" id="status">상태</span>
							<input type="text" name="status" data-site-idx="status${i.count}" class="form-control" value="${bookDTO.status}" readonly>
						</div>
					</div>
					<!-- </form> -->
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>*해당 캠핑장의 예약 리스트가 없습니다.</p>
			</c:otherwise>
		</c:choose>
		<!-- 생성 끝날 부분 -->
	</div>




</div>
<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>