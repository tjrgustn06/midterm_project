<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/common_css.jsp"></c:import>
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<h1>Order Detail</h1>
		</div>
		<div class="row">
			<form action="./payment" method="post">
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
					<input type="text" class="form-control" id="address" name="address" value="${dto.address}" placeholder="배송될 주소를 입력해주세요.">
				</div>
				</div>
				<div>
					<input type="hidden" name="status" value="결제완료">
					<input type="hidden" name="num" value="${dto.num}">
				</div>
				<div>
				<button type="button" id="payment" class="btn btn-primary">결제하기</button>
				
				</div>
			</form>
		</div>
	</div>
	<script>
		IMP.init("imp15251423");
	
		$('#payment').click(() => {
			IMP.request_pay({
			pg: "kcp.{T0000}",
			pay_method: "card",
			merchant_uid: "${dto.orderNum}",   // 주문번호
			name: "${dto.name}",
			amount: ${dto.price},                         // 숫자 타입
			buyer_name: "${dto.orderer}",
			buyer_addr: "${dto.address}",
			}, function (rsp) { // callback
			if (rsp.success) {
				alert('물품대여가 완료되었습니다')
				submit()
			} else {
				alert('결제에 실패하였습니다')

			}
			});
		})
	</script>
	<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>