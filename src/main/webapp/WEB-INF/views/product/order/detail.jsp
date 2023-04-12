<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
<c:import url="../../template/common_css.jsp"></c:import>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area blog_banner_two">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle f_48">PRODUCTORDER</h2>
			<ol class="breadcrumb">
				<li>주문한 상품의 상세 정보를 확인해주세요</li>
			</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
	<div class="container">
		<div class="row md-7">
			<p class="col-md-7 mx-auto text-center border-bottom border-dark pb-4"></p>
		</div>
		<div class="row justify-content-center">
			<form id="paymentForm" class="col-md-7" action="./payment" method="post">
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="orderNum" class="form-label">주문번호</label>
					<input type="text" class="form-control" id="orderNum" value="${dto.orderNum}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="name" class="form-label">대여품 정보</label>
					<input type="text" class="form-control" id="name" value="${dto.name}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="orderer" class="form-label">주문자</label>
					<input type="text" class="form-control" id="orderer" value="${dto.orderer}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="amount" class="form-label">수량</label>
					<input type="text" class="form-control" id="amount" value="${dto.amount}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="price" class="form-label">금액</label>
					<input type="text" class="form-control" id="price" value="${dto.price}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="startDate" class="form-label">사용시작일</label>
					<input type="text" class="form-control" id="startDate" value="${dto.startDate}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="lastDate" class="form-label">사용종료일</label>
					<input type="text" class="form-control" id="lastDate" value="${dto.lastDate}" readonly>
				</div>
				</div>
				<div class="row input-group mb-3">
				<div class="input-group-prepend">
					<label for="address" class="form-label">배송지 주소</label>
					<c:if test="${dto.status eq '입금대기'}">
						<c:if test="${not empty member.addressDTOs}">
							<select class="nice-select form-select" id="addressSelect">
								<option selected>주소를 선택해 주세요</option>
								<option>주소 직접 입력</option>
								<c:forEach items="${member.addressDTOs}" var="addressDTO">
									<option value="${addressDTO.address} ${addressDTO.addressDetail}">${addressDTO.addressName}</option>
								</c:forEach>
							</select>
						</c:if>
						<input type="text" class="form-control" id="address" name="address" placeholder="배송될 주소를 입력해주세요.">
					</c:if>
					<c:if test="${dto.status eq '결제완료'}">
						<input type="text" class="form-control" id="address" name="address" value="${dto.address}" readonly>
					</c:if>
				</div>
				</div>
				<div>
					<input type="hidden" name="status" value="결제완료">
					<input type="hidden" name="num" value="${dto.num}">
				</div>
				<div>
					<c:if test="${dto.status eq '입금대기'}">
						<button id="payment" type="button" class="genric-btn success radius">결제하기</button>
					</c:if>
				</div>
			</form>
			<form id="deleteForm" class="col-md-7" action="./delete" method="post">
				<input type="hidden" name="gradeNum" value="${dto.gradeNum}">
				<input type="hidden" name="amount" value="${dto.amount}">
				<input type="hidden" name="name" value="${dto.name}">
				<input type="hidden" name="num" value="${dto.num}">
				<c:if test="${dto.status ne '결제완료'}">
					<button id="delete" type="submit" class="genric-btn danger radius">주문취소</button>
				</c:if>
			</form>
		</div>
	</div>
	<c:import url="../../template/footer.jsp"></c:import>
	<script>
		$('#payment').click(()=>{
			let payment = iamport()
			
		})
		function iamport(){
			//가맹점 식별코드
			IMP.init('imp15251423');
			IMP.request_pay({
				pg : 'nice.nictest00m',
				pay_method : 'card',
				merchant_uid : 'merchant_' + $('#orderNum').val(),
				name : $('#name').val() , //결제창에서 보여질 이름
				amount : $('#price').val(), //실제 결제되는 가격
			}, function(rsp) {
				console.log(rsp);
				if ( rsp.success ) {
					let msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					console.log('성공')
					alert(msg);
					$('#paymentForm').submit()
				} else {
					let msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					console.log('실패')
					alert(msg);
				}
			});
		};

		$('#addressSelect').on('change','#address',function(){
			$(this).val($('#addressSelect').prop())
		})
	</script>
	<script>
		$('#addressSelect').change(function(){
			$('#address').val($(this).val())
		})
	</script>
	<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>