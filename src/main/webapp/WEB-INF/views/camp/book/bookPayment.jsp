<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookConfimation - The Camping</title>
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
	<p>BankBookDTO 만들어서 db에 저장, orders에 ordernum 저장</p>
	<p>예약 정보 표시, 최종 결제, 예약취소 기능</p>
	<div class="row my-3">
		<h1>${campDTO.name}</h1>
	</div>

	<!-- 파라미터 확인용 -->
	--CN: ${siteDTO.campNum}--
	--AN: ${siteDTO.areaNum}--

	<!-- 시설배치도 / 임시로 막고 나중에 추가 -->
	<!-- <h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
	<div class="row mb-3">
		<c:if test="${not empty fileDTO.campFileDTOs}">
			<div class="layout">
				<img alt="" src="">
			</div>
		</c:if>
	</div>
	<hr> -->

	<!-- <div class="row my-2">
		<div>
			<h5><i class="fa-solid fa-circle-info fa-sm"></i> 요금표</h5>
			<p>*성수기 요금은 5~9월에 적용됩니다.</p>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>
			<input type="text" name="offWeekdaysPrice" class="form-control" value="${siteDTO.offWeekdaysPrice}" readonly>
			<span class="input-group-text" id="offWeekendsPrice">주말</span>
			<input type="text" name="offWeekendsPrice" class="form-control" value="${siteDTO.offWeekendsPrice}" readonly>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>
			<input type="text" name="peakWeekdaysPrice" class="form-control" value="${siteDTO.peakWeekdaysPrice}" readonly>
			<span class="input-group-text" id="peakWeekendsPrice">주말</span>
			<input type="text" name="peakWeekendsPrice" class="form-control" value="${siteDTO.peakWeekendsPrice}" readonly>
		</div>
	</div> -->

	<hr>

	<!-- form 시작 -->
	<form action="./payment" id="paymentFrm" method="post">

		<div class="row my-2">
			<div class="col-10">
				<h5><i class="fa-solid fa-circle-info fa-sm"></i> 예약 정보</h5>
			</div>
		</div>
		
		<!-- CampBook 하나 완성 -->
		<!-- num, areaNum, id, indexCode, price, regDate, startDate, lastDate, account, status -->
		<div id="bookSiteOne">
			<input type="hidden" name="areaNum" value="${siteDTO.areaNum}">
			<input type="hidden" name="campNum" value="${siteDTO.campNum}"> <!-- 돌아가기용 -->
			<div class="siteSize input-group mb-2">
				<span class="input-group-text" id="siteName">사이트이름</span>
				<input type="text" name="siteName" class="form-control" value="${siteDTO.siteName}" readonly>
			</div>
			<div class="siteSize input-group mb-2">
				<span class="input-group-text" id="siteSize">크기(m^2)</span>
				<input type="text" name="siteSize" class="form-control" value="${siteDTO.siteSize}" readonly>
			</div>
			<div class="member input-group mb-2">
				<span class="input-group-text" id="siteName">예약자</span>
				<input type="text" name="name" class="form-control" value="${dto.name}" readonly>
			</div>
			<div class="useDate input-group mb-2">
				<span class="input-group-text" for="startDate">사용 시작일</span>
				<input type="text" name="startDate" id="startDate" class="form-control" value="${siteDTO.startDate}" style="background-color: #ffffcc;" readonly>
				<span class="input-group-text" for="lastDate">사용 종료일</span>
				<input type="text" name="lastDate" id="lastDate" class="form-control" value="${siteDTO.lastDate}" style="background-color: #ffffcc;" readonly>
			</div>
			<div class="totalPrice input-group mb-2">
				<span class="input-group-text" id="price">이용 요금</span>
				<input type="text" name="price" id="totalPrice" class="form-control" readonly>
			</div>
			<div>
				<input type="hidden" name="status" value="결제완료">
			</div>

			<div class="d-flex justify-content-between mb-2">
				<button id="bksConfirm" type="button" class="genric-btn success">결제하기</button>
				<button id="bksCancel" type="button" class="genric-btn primary">예약취소</button>
			</div>
		</div>
	</form>
	<!-- form 끝 -->

	
	<!-- <form action="./cancel" id="cancelFrm" method="post"></form> -->


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
<script>
	//요금 계산 함수 호출
	//calculationPrice();
</script>
<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>