<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
		<!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area blog_banner_two">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle f_48">상품주문정보</h2>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
		<div class="container col-6">
		<div class="row">
			<table class="table table-hover">
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach items="${list}" var="dto">
							<tr onclick="location.href='./detail?num=${dto.num}'" style="cursor: pointer;">
								<td>${dto.orderNum}</td><td>${dto.orderer}</td><td>${dto.name}</td><td>${dto.startDate}</td><td>${dto.lastDate}</td><td>${dto.status}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr height="200px">
							<td class="align-middle text" colspan="20">검색결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<!-- paging -->
		<div class="row col-6 mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<li class="page-item">
			      <a class="page-link" href="./list?page=1" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item ${pager.before? 'disabled':''}">
			      <a class="page-link" href="./list?page=${pager.startNum-1}" aria-label="Previous">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="./list?page=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item ${pager.after? 'disabled' : ''}">
			      <a class="page-link" href="./list?page=${pager.lastNum+1}"  aria-label="Next">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="./list?page=${pager.totalPage}"  aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
	</div>
	<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>