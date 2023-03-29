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
			<table class="table table-striped">
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
									<td>${dto.cartNum}</td>
									<td>${dto.orderer}</td>
									<td>${dto.name}</td>
									<td>${dto.amount}</td>
									<td>${dto.price}</td>
									<td>${dto.startDate}</td>
									<td>${dto.lastDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr height="200px">
								<td class="align-middle text" colspan="20">검색 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

	</div>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>