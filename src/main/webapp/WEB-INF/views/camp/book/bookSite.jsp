<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>BOOKING - The Camp</title>
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
					<li>마음에 드는 사이트를 골라주세요</li>
				</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container col-lg-9 my-5">
	<p>기간 설정, 예약 가능 사이트 확인, 금액 확인, 예약하기 기능</p>
	<div class="row my-3">
		<h1>${campDTO.campName}</h1>
	</div>

	<!-- 파라미터 확인 -->
	--CN: ${campDTO.campNum}--

	<!-- 시설배치도 -->
	<h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
		<!-- 임시로 막아놓고 나중에 추가해보기 ㅠㅠ -->
		<!-- <div class="row mb-3">
			<c:if test="${not empty dto.campFileDTOs}">
				<div class="layout">
					<img alt="" src="">
				</div>
			</c:if>
		</div> -->
	<hr>

	<!-- datePicker -->
	<div class="row my-2 date">
		<div class="col-10">
			<h5><i class="fa-solid fa-circle-info fa-sm"></i> 예약 기간 설정</h5>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text" for="startDate">입실 날짜</span>
			<input type="text" name="searchStartDate" id="startDate" class="form-control datepicker" placeholder="날짜를 선택하세요" readonly>
			<span class="input-group-text" for="lastDate">퇴실 날짜</span>
			<input type="text" name="searchLastDate" id="lastDate" class="form-control datepicker" placeholder="날짜를 선택하세요" readonly>
		</div>
	</div>

	<!-- 검색 시작 ajax로 해야할거같음 -->
	<form action="./siteSearch" id="searchFrm" method="post">
		<input type="hidden" name="campNum" value="${campDTO.campNum}">
		<div class="d-flex justify-content-center my-2">
			<button id="siteCancel" type="button" class="genric-btn primary">돌아가기</button>
		</div>
	</form>
	<!-- 검색 끝 -->

	<hr>

	<!-- 캠핑장이 가지고있는 사이트들 -->
	<!-- CampSite -->
	<div class="row my-2">
		<div class="col-10">
			<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑 사이트 정보</h5>
		</div>
	</div>


	<div class="row my-2" id="siteList">
		<!-- 조건에 맞는 내용 출력되게끔 원함 -->
		<p>*기간을 먼저 조회해주세요</p>
		<!-- siteDTO -->
	</div>


</div>

<c:import url="../../template/footer.jsp"></c:import>
<script src="../../resources/js/camp/book.js"></script>
<script>
	// datePicker
	$.datepicker.setDefaults({
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            yearSuffix: '년',
            dateFormat: 'yy-mm-dd',
            showMonthAfterYear:true,
            constrainInput: true,
			minDate: 0
		});

		$('.datepicker').datepicker();

		$('#startDate').datepicker('option', 'maxDate', $('#lastDate').val());
		$('#startDate').datepicker('option','onClose', (selectedDate)=>{
			$('#lastDate').datepicker('option', 'minDate', selectedDate);
		});

		$('#startDate').change(()=>{	
			$('#lastDate').datepicker('option', 'minDate', $('#startDate').val());
			$('#lastDate').datepicker('option', 'onClose', (selectedDate)=>{
				$('#startDate').datepicker('option', 'maxDate', selectedDate);
			})
		})
</script>
<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>