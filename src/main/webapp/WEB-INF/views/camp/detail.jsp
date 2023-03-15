<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.name} - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row my-5">
		<h1>${dto.name}</h1>
	</div>
	
	<div class="row mb-5">
		<table>
			<tr>
				<div class="col-3"><th>캠핑장 전화번호</th></div>
				<div class="col-3"><th>캠핑장 주소</th></div>
				<div class="col-6"><th>상세내용</th></div>
			</tr>
			<tr>
				<div class="col-3"><td>${dto.phone}</td></div>
				<div class="col-3"><td>${dto.address}</td></div>
				<div class="col-6"><td>${dto.contents}</td></div>
			</tr>
		</table>
	</div>
	
	<!-- 버튼 -->
	<div>
		<!-- update도 delete도 모두 DTO의 num이 필요하다 -->
		<form action="./update" id="frm" method="get">
			<!-- name은 파라미터 이름, value는 파라미터의 값 -->
			<input type="hidden" name="campNum" value="${dto.campNum}">
			<button id="update" type="submit" class="btn btn-info">UPDATE</button>
			<button id="delete" type="button" class="btn btn-danger">DELETE</button>
		</form>
	</div>

</div>


<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/camp/form.js"></script>
</body>
</html>