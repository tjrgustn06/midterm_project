<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<style>
	.form-data{
		width: 100%;
	}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<!--================Breadcrumb Area =================-->
	<section class="breadcrumb_area blog_banner_two">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle f_48">장바구니</h2>
			</div>
		</div>
	</section>
	<!--================Breadcrumb Area =================-->
	<div class="container">
		
		<div class="my-6">
			<table class="table table-striped col-6">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">주문자</th>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">비용</th>
						<th scope="col">시작날짜</th>
						<th scope="col">종료날짜</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach items="${list}" var="dto">	
								<tr>
									<form id="cartForm${dto.cartNum}" class="cartFormData">

										<td><input type="text" class="cartNums form-data" name="cartNum" value="${dto.cartNum}" readonly></td>
										<td><input type="text" class="orderers form-data" name="orderer" value="${dto.orderer}" readonly></td>
										<td><input type="text" class="names form-data" name="name" value="${dto.name}" readonly></td>
										<td><input type="text" class="amounts form-data" name="amount" value="${dto.amount}" readonly>
											<span>
												<button type="button" class="plus_btn">+</button>
												<button type="button" class="minus_btn">-</button>
											</span>
										</td>
										<td><input type="text" class="prices form-data" name="price" value="${dto.price}" readonly></td>
										<td><input type="text" class="startDates form-data" name="startDate" value="${dto.startDate}" readonly></td>
										<td><input type="text" class="lastDates form-data" name="lastDate" value="${dto.lastDate}" readonly></td>
										<input type="hidden" class="indexCodes form-data" name="indexCode" value="${dto.indexCode}">
										<input type="hidden" class="gradeNums form-data" name="gradeNum" value="${dto.gradeNum}">
										<td>
											<button type="button" class="cartOrder" data-cart-num="${dto.cartNum}">주문</button>
											<button type="button" class="cartDel" data-cart-num="${dto.cartNum}">삭제</button>
										</td>
									</form>
								</tr>
							</c:forEach>
							<tr>
								<form id="cartAllForm">
									<td>총합</td>
									<td><input type="text" class="form-data" name="orderer" id="orderer" readonly></td>
									<td><input type="text" class="form-data" name="name" id="name" readonly></td>
									<td><input type="text" class="form-data" name="amount" id="amount" readonly></td>
									<td><input type="text" class="form-data" name="price" id="price" readonly></td>
									<td><input type="text" class="form-data" name="startDate" id="startDate" readonly></td>
									<td><input type="text" class="form-data" name="lastDate" id="lastDate" readonly></td>
									<input type="hidden" name="indexCode" id="indexCode">
									<input type="hidden" name="gradeNum" id="gradeNum">
								</form>
							</tr>
						</c:when>
						<c:otherwise>
							<tr height="200px">
								<td class="align-middle text" colspan="20">장바구니가 비었습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<button type="button" class="genric-btn success" id="allForm" style="float: right;">전체 주문</button>
		</div>

	</div>
	<script src="../resources/js/cartList.js"></script>
	<script>
		getAllCart()
	</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>