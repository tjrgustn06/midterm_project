<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:forEach items="${list}" var="dto">
		<c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
			<c:if test="${i.first}">
				<div style="width: 300px;">
					<img src="/resources/upload/story/${fileDTO.fileName}" alt="" style="width: 30%;">
				</div>
				</c:if>
		</c:forEach>
	</c:forEach>

		
	
	
