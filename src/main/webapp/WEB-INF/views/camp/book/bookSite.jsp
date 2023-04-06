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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<div class="container-fluid col-lg-9 my-5">
	<div class="mb-10">0</div>
	<div class="row my-3">
		<!-- 파라미터 확인 -->
		--${campNum}--
		<h1>BookSite Page</h1>
		<p>기간 설정, 예약 가능 사이트 확인, 금액 확인, 예약하기 기능</p>
	</div>

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
		<div class="col-md-3 mx-auto">
			<input type="text" name="startDate" id="startDate" class="datepicker" placeholder="사용시작일" readonly>
		</div>
		<div class="col-md-3 mx-auto">
			<input type="text" name="lastDate" id="lastDate" class="datepicker" placeholder="사용종료일" readonly>
		</div>
	</div>

	<!-- 입력 폼 시작 -->
	<form action="./confirmation" id="bksFrm" method="get">
		<!-- <input type="hidden" id="bksCampNum" name="campNum" value="${dto.campNum}"> -->
		<div class="row d-flex justify-content-center my-2">
			<button id="bksSearch" type="button" class="generic-btn success col-3">Search</button>
			<button id="bksCancle" type="button" class="generic-btn primary col-3">cancle</button>
		</div>
		<div class="row my-2">
			<button id="bksConsoleSign" type="button" class="generic-btn primary col-3 mx-auto">확인용 버튼</button>
		</div>
	</form>
	<!-- 입력 폼 끝 -->

	<hr>

	<!-- 캠핑장이 가지고있는 사이트들 -->
	<!-- CampSite -->
	<div class="row my-2">
		<div class="col-10">
			<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑 사이트 정보</h5>
		</div>
		<!-- <div class="col-2">
			<button class="btn btn-outline-success" id="siteAddBtn" type="button">추가</button>
		</div> -->
	</div>


	<div class="row my-2" id="siteList">
		<!-- siteDTO - 버튼 누르면 생성될 부분 / 최소 한개의 site는 필수 -->
		<!-- index는 0부터 시작, count는 1부터 시작 -->
		<c:forEach items="${siteList}" var="siteDTO" varStatus="i">
			<!-- 파라미터 확인 -->
			--campNum: ${siteDTO.campNum}--<br>
			--areaNum: ${siteDTO.areaNum}--
			<div id="siteOne${i.count}">
				<input type="hidden" name="areaNum" value="${siteDTO.areaNum}">
				<input type="hidden" name="campNum" value="${siteDTO.campNum}">
				<div class="input-group mb-2">
					<span class="input-group-text" id="siteName">사이트이름</span>
					<input type="text" name="siteName" data-site-idx="siteName${i.count}" class="form-control" value="${siteDTO.siteName}" readonly>
					<span class="input-group-text" id="siteSize">크기(m^2)</span>
					<input type="text" name="siteSize" data-site-idx="siteSize${i.count}" class="form-control" value="${siteDTO.siteSize}" readonly>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>
					<input type="text" name="offWeekdaysPrice" data-site-idx="siteOwkPrice${i.count}" class="form-control" value="${siteDTO.offWeekdaysPrice}" readonly>
					<span class="input-group-text" id="offWeekendsPrice">주말</span>
					<input type="text" name="offWeekendsPrice" data-site-idx="siteOwdPrice${i.count}" class="form-control" value="${siteDTO.offWeekendsPrice}" readonly>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>
					<input type="text" name="peakWeekdaysPrice" data-site-idx="sitePwkPrice${i.count}" class="form-control" value="${siteDTO.peakWeekdaysPrice}" readonly>
					<span class="input-group-text" id="peakWeekendsPrice">주말</span>
					<input type="text" name="peakWeekendsPrice" data-site-idx="sitePwdPrice${i.count}" class="form-control" value="${siteDTO.peakWeekendsPrice}" readonly>
				</div>
				<!-- <div class="form-check mb-2">
					<input class="form-check-input" type="radio" name="status" id="bookable" value="예약가능">
					<label class="form-check-label" for="bookable">예약가능</label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="radio" name="status" id="unbookable" value="예약불가">
					<label class="form-check-label" for="unbookable">예약불가</label>
				</div> -->
				<div class="d-flex justify-content-between mb-2">
					<!-- <button data-site-idx="siteIptDel${i.count}" type="button" class="siteDels generic-btn primary">Remove Site</button> -->
					<button id="bksConfirm" type="button" class="generic-btn success">Booking</button>
				</div>
			</div>
		</c:forEach>
		<!-- 생성 끝날 부분 -->
	</div>




</div>


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