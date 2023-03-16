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
	
	<!-- 사진+설명 div -->
	<div class="row my-3">
		<div class="row col-7">
			<c:if test="${not empty dto.campFileDTOs}">
				<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
					<!-- 파일이 보이게 -->
					<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
				</c:forEach>
			</c:if>
			
		</div>
		
		<div class="row col-5 my-auto">
			<h5>캠핑장 전화번호 : ${dto.phone}</h5>
			<h5>캠핑장 주소 : ${dto.address}</h5>
			<h5>상세내용 : ${dto.contents}</h5>	
		</div>
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
	
	<!-- 버튼 -->
	<div>
		<!-- update도 delete도 모두 DTO의 num이 필요하다 -->
		<form action="./update" id="frm" method="get">
			<!-- name은 파라미터 이름, value는 파라미터의 값 -->
			<input type="hidden" name="campNum" value="${dto.campNum}">
			<button id="update" type="submit" class="btn btn-outline-success">UPDATE</button>
			<button id="delete" type="button" class="btn btn-outline-danger">DELETE</button>
		</form>
	</div>
	

</div>


<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/camp/form.js"></script>
</body>
</html>