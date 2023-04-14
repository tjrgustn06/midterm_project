<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="list_style instafeed d-flex flex-wrap">
	<c:forEach items="${list}" var="dto">
		<c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
			<c:if test="${i.first}">
				<li>
					<img src="/resources/upload/story/${fileDTO.fileName}" alt="" style="width: 30%;">
				</li>
				</c:if>
		</c:forEach>
	</c:forEach>
</ul>
		
	
	
