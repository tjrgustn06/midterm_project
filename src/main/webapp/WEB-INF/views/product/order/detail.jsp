<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/common_css.jsp"></c:import>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	
	IMP.init("imp15251423");

	function requestPay(){

		IMP.request_pay({
			pg : 'kcp.{T0000}',
			pay_method : 'card',
			merchant_uid : "${dto.orderNum}",
			name : '${dto.name}',
			amount : ${dto.price},
			buyer_name : '${dto.orderer}',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동'
		}, rsp => {
			if(rsp.success) {
				axios({
					url: "/pay/complete",
					method: "post",
					headers: { "Content-Type": "application/json" },
					data: {
					imp_uid: rsp.imp_uid,
					merchant_uid: rsp.merchant_uid
					}
				}).then((data) => {
				alert('결제성공')
				})
				} else {
				alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
				}
		});
	}
</script>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
	<div class="container-fluid">
		<div class="row md-7">
			<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Order Detail</h1>
		</div>
		<div class="row justify-content-center">
			<form class="col-md-7" action="./payment" method="post">
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
						<button type="button" class="btn btn-primary" onclick="requestPay()">결제하기</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	
	<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>