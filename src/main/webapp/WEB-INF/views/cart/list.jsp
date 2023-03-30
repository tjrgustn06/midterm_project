<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid">
		<div class="row my-5">
			<h1>Cart List Page</h1>
		</div>
		<div class="row my-6">
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

										<td><input type="text" class="cartNums" name="cartNum" value="${dto.cartNum}" readonly style="width: 100px;"></td>
										<td><input type="text" class="orderers" name="orderer" value="${dto.orderer}" readonly style="width: 100px;"></td>
										<td><input type="text" class="names" name="name" value="${dto.name}" readonly style="width: 100px;"></td>
										<td><input type="text" class="amounts" name="amount" value="${dto.amount}" readonly style="width: 100px;">
											<span>
												<button class="plus_btn">+</button>
												<button class="minus_btn">-</button>
											</span>
										</td>
										<td><input type="text" class="prices" name="price" value="${dto.price}" readonly style="width: 100px;"></td>
										<td><input type="text" class="startDates" name="startDate" value="${dto.startDate}" readonly style="width: 100px;"></td>
										<td><input type="text" class="lastDates" name="lastDate" value="${dto.lastDate}" readonly style="width: 100px;"></td>
										<input type="hidden" class="indexCodes" name="indexCode" value="${dto.indexCode}">
										<input type="hidden" class="gradeNums" name="gradeNum" value="${dto.gradeNum}">
										<td>
											<button type="button" class="cartOrder" data-cart-num="${dto.cartNum}">주문</button>
											<button type="button" class="cartDel" data-cart-num="${dto.cartNum}">삭제</button>
										</td>
									</form>
								</tr>
							</c:forEach>
							<tr>
								<form id="cartAllForm">
									<td></td>
									<td><input type="text" name="orderer" id="orderer"></td>
									<td><input type="text" name="name" id="name"></td>
									<td><input type="text" name="amount" id="amount"></td>
									<td><input type="text" name="price" id="price"></td>
									<td><input type="text" name="startDate" id="startDate"></td>
									<td><input type="text" name="lastDate" id="lastDate"></td>
									<input type="hidden" name="indexCode" id="indexCode">
									<input type="hidden" name="gradeNum" id="gradeNum">
								</form>
							</tr>
						</c:when>
						<c:otherwise>
							<tr height="200px">
								<td class="align-middle text" colspan="20">검색 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<button type="button" class="btn btn-primary" id="allForm">전체 주문</button>
		</div>

	</div>
	<script src="../resources/js/cartList.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>