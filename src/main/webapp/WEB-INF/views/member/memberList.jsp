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
<h2 style="text-align: center">회원목록</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>회원가입일</td>
		<td>최근회원정보수정일</td>
	</tr>
	<c:forEach items="${memberList}" var="mb">	
		<tr>
			<td><c:out value="${dto.id}"></c:out></td>
			<td><c:out value="${dto.pw}"></c:out></td>
			<td><c:out value="${dto.name}"></c:out></td>
			<td><c:out value="${dto.phone}"></c:out></td>
			<td><c:out value="${dto.email}"></c:out></td>
			<td><c:out value="${dto.roleName}"></c:out></td>
		</tr>
	</c:forEach>
</table>

<input type="button" value="메인으로" class="btn" onclick="location.href='/'">

<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>