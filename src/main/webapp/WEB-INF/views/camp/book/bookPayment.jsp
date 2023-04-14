<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>PAYMENT - The Camp</title>
<c:import url="../../template/common_css.jsp"></c:import>
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
	<!-- <p>BankBookDTO 만들어서 db에 저장, orders에 ordernum 저장</p>
	<p>예약 정보 표시, 최종 결제, 예약취소 기능</p> -->
	<div class="row my-3">
		<h1>${campDTO.campName}</h1>
	</div>

	<!-- 시설배치도 -->
	<!-- <h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
	<div class="row layout my-3 mx-auto">		
		<c:choose>
			<c:when test="${not empty campDTO.layoutDTO}">
				<img alt="" src="../../resources/upload/camp/layout/${campDTO.layoutDTO.layoutName}">
			</c:when>
			<c:otherwise>
				<img alt="" src="../../resources/images/empty.jpg">
			</c:otherwise>
		</c:choose>
	</div>
	<hr> -->

	<!-- form 시작 -->
	<form action="./payment" id="paymentFrm" method="post">
		<div class="row my-2">
			<div class="col-10">
				<h5><i class="fa-solid fa-circle-info fa-sm"></i> 예약 정보</h5>
			</div>
		</div>
		
		<!-- CampBook 하나 완성 - 정보는 bookDTO에서 꺼내야 할거같음... -->
		<!-- num, areaNum, id, indexCode, price, regDate, startDate, lastDate, account, status -->
		<div id="bookSiteOne">
			<h6><i class="fa-solid fa-circle-info fa-sm"></i> 예약번호 ${bookDTO.orderNum}</h6>
			<div class="value">
				<input type="hidden" name="num" value="${bookDTO.num}">
				<input type="hidden" name="areaNum" value="${bookDTO.areaNum}">
				<input type="hidden" name="orderNum" value="${bookDTO.orderNum}">
				<input type="hidden" name="status" value="결제완료">
				<!-- <input type="hidden" name="campNum" value="${siteDTO.campNum}"> -->
			</div>
			<div class="siteSize input-group mb-2">
				<span class="input-group-text" id="siteName">사이트이름</span>
				<input type="text" name="siteName" class="form-control" value="${bookDTO.siteName}" readonly>
			</div>
			<div class="member input-group mb-2">
				<span class="input-group-text" id="siteName">예약자</span>
				<input type="text" name="name" class="form-control" value="${bookDTO.name}" readonly>
			</div>
			<div class="useDate input-group mb-2">
				<span class="input-group-text" for="startDate">입실 날짜</span>
				<input type="text" name="startDate" id="startDate" class="form-control" value="${bookDTO.startDate}" style="background-color: #ffffcc;" readonly>
				<span class="input-group-text" for="lastDate">퇴실 날짜</span>
				<input type="text" name="lastDate" id="lastDate" class="form-control" value="${bookDTO.lastDate}" style="background-color: #ffffcc;" readonly>
			</div>
			<div class="totalPrice input-group mb-2">
				<span class="input-group-text" id="price">이용 요금</span>
				<input type="text" name="price" id="totalPrice" class="form-control" value="${bookDTO.price}" readonly>
			</div>

			<c:if test="${bookDTO.status eq '입금대기'}">
				<div class="d-flex justify-content-between my-2">
					<button type="button" class="payReturn genric-btn primary-border">돌아가기</button>
					<button id="payCancel" type="button" class="genric-btn primary-border">예약취소</button>
					<button id="payConfirm" type="button" class="genric-btn success-border">결제하기</button>
				</div>
			</c:if>
			<c:if test="${bookDTO.status eq '결제완료'}">
				<div class="d-flex justify-content-between my-2">
					<button type="button" class="payReturn genric-btn primary-border">돌아가기</button>
					<button id="payRollback" type="button" class="genric-btn danger-border">결제취소</button>
				</div>
			</c:if>
			
		</div>
	</form>
	<!-- form 끝 -->

</div>


<c:import url="../../template/footer.jsp"></c:import>
<script src="../../resources/js/camp/book.js"></script>
<!-- IMP.init('imp77504767'); -->
<script>
	$('#payConfirm').click(()=>{
		let payment = iamport()		
	})

	function iamport(){
		//가맹점 식별코드
		IMP.init('imp15251423');
		IMP.request_pay({
			pg : 'nice.nictest00m',
			pay_method : 'card',
			merchant_uid : 'merchant_' + $('input[name=orderNum]').val(),
			name : $('input[name=siteName]').val(), //결제창에서 보여질 이름
			amount : $('input[name=price]').val(), //실제 결제되는 가격
		}, function(rsp) {
			console.log(rsp);
			if ( rsp.success ) {
				let msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				console.log('성공');
				alert(msg);
				$('#paymentFrm').submit();
			} else {
				let msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				console.log('실패');
				alert(msg);
			}
		});
	};
</script>
<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>