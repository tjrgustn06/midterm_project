<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.name} Order - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
	<div class="row my-3">
		<h1>${dto.name} Order</h1>
	</div>

	<!-- 캠핑장 이용 안내사항 -->
	<div class="row my-3">
		<h3>이용안내</h3>
		<p>explain</p>
	</div>
	
	<!-- 캠핑장 예약 옵션선택 -->
	<form action="./excute" method="post">
		<div class="row my-3">
			<h3>예약선택</h3>
			<table>
				<thead>
					<tr>
						<th>예약장소</th>
						<th>이용금액</th>
						<th>연박계산</th>
						<th>추가인원</th>
						<th>금액합계</th>
						<th>선택/예약자</th>
					</tr>
				</thead>
				<tbody>
					<!-- 반복문 돌려서 row 뽑아와야할 것 같음 -->
					<tr>
						<td>
						</td>
					</tr>
				</tbody>
			</table>

			<h6>추가차량여부</h6>
			<table>
				<tbody>
					<tr>
						<td>주차비</td>
						<td>기간</td>
						<td>차량수</td>
						<td>금액합계</td>
						<td>선택</td>
					</tr>
					<tr>

					</tr>
				</tbody>
			</table>

			<h6>캠핑카/카라반 - 필수선택(전기사용)</h6>
			<table>
				<tbody>
					<tr>
						<td>전기이용료</td>
						<td>기간</td>
						<td>차량수</td>
						<td>금액합계</td>
						<td>선택</td>
					</tr>
					<tr>

					</tr>
				</tbody>
			</table>

			<h6>부가옵션</h6>
			<table>
				<tbody>
					<tr>
						<td>옵션이름</td>
						<td>가격</td>
						<td>설명</td>
						<td>수량</td>
						<td>금액합계</td>
						<td>선택</td>
					</tr>
					<tr>

					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 예약자 정보 기입/확인창 -->
		<div class="row my-3">
			<h3>예약자 정보</h3> <!-- 이름, 비밀번호, 전화번호는 로그인한 사람의 정보를 그대로 넣거나, 새로 넣는것 입력 -->
			<h6>이	름 : <input type="text"></h6>
			<h6>비밀번호 : <input type="text"></h6>
			<h6>전화번호 : <input type="text"></h6>
			<h6>차량번호 : <input type="text"></h6>
			<h6>메모사항 : <input type="text"></h6>
		</div>
		
		<!-- 보험가입시 필요한 이름 기입 -->
		<div class="row my-3">
			<h3>보험관련 입실자 이름 기입</h3>
			<input type="text">
			<input type="text">
			<input type="text">
			<input type="text">
		</div>

		<!-- 준수사항 -->
		<div class="row my-3">
			<h3>준수사항</h3>
			<p>explain</p>

			<h3>환불정책</h3>
			<p>explain</p>

			<h3>개인정보 수집 및 제공 동의 여부</h3> <!-- 미체크시 예약불가 -->
		</div>
		
		
		<!-- 예약하기/뒤로가기 -->
		<div class="row my-3">
			<button class="btn btn-outline-success" type="submit" id="">예약하기</button>
			<button class="btn btn-outline-success" type="button" id="">뒤로가기</button>
		</div>
		<!-- 취소하면 alert창 뜨고 뒤로가기, 무통장/카드결제하면 다른 API에 물리게 -->
	</form>


</div>


<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>