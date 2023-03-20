<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.name} Order - The Camping</title>
<c:import url="../../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<div class="container-fluid">
	<div class="row my-3">
		<h1>${dto.name} Order</h1>
	</div>
	
	
	<!-- 캠핑장 예약 날짜 선택 -->
	<div class="row">
		<form action="#" method="get">
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


<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>