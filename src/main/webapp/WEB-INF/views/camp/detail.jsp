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
<div class="container-fluid">
	<div class="row my-3">
		<h1>${dto.name}</h1>
	</div>
	
	<hr>
	
	<!-- 버튼 -->
	<div>
		<!-- update도 delete도 모두 DTO의 num이 필요하다 -->
		<form action="./update" id="frm" method="get">
			<!-- name은 파라미터 이름, value는 파라미터의 값 -->
			<input type="hidden" name="campNum" value="${dto.campNum}">
			<button id="reserve" type="button" class="btn btn-outline-primary">Reservation</button>
			<button id="list" type="button" class="btn btn-outline-secondary">go to List</button>
			<!-- 차후에 권한이 있으면 update, delete 버튼 나타내기 + 백엔드에서 검증까지 -->
			<button id="update" type="submit" class="btn btn-outline-success">UPDATE</button>
			<button id="delete" type="button" class="btn btn-outline-danger">DELETE</button>
		</form>
	</div>
	
	
	<!-- 대표사진 + 설명 div -->
	<div class="row my-3">
		<div class="row col-7 mb-3">
			<c:if test="${not empty dto.campFileDTOs}">
				<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="i">
					<!-- 파일이 보이게 -->
					<c:if test="${pageScope.i.first}">
						<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		
		<div class="row col-5 my-auto">
			<h5>캠핑장 전화번호 : ${dto.phone}</h5>
			<h5>캠핑장 주소 : ${dto.address}</h5>
			<h5>상세내용 : ${dto.contents}</h5>	
		</div>
	</div>
	
	
	<!-- 나머지사진 다보이게 -->
	<div class="row col-7 mb-3">
		<h3>나머지 사진이에요</h3>
		<c:if test="${not empty dto.campFileDTOs}">
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
				<!-- 파일이 보이게 -->
				<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
			</c:forEach>
		</c:if>
	</div>
	
	
	
	<!-- file -->
	<div>
		<c:if test="${not empty dto.campFileDTOs}">
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
				<!-- 파일이 보이게 -->
				<%-- <a href="../resources/upload/camp/${fileDTO.fileName}">${fileDTO.oriName}</a> --%>
				<!-- 파일다운추가되면 주소입력 -->
				<%-- <a href="#${fileDTO.fileNum}">${fileDTO.oriName}</a> --%>
			</c:forEach>
		</c:if>
	</div>
	
</div>


<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/camp/crud.js"></script>
</body>
</html>