<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<c:import url="../template/common_css.jsp"></c:import>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( ".datepicker" ).datepicker();
  } );
</script>
</head>
<body>
	<h1>Detail Page</h1>
	<div class="container-fluid">
		<c:if test="${not empty dto.productNum}">
			<div class="row col-6 mx-auto">
				<img class="card-img-top" src="../resources/images/iuPhoto.jpg" alt="Card image cap">
	   			<div class="item-line">
	    			<h1>${dto.name}</h1>
	    			<p>${dto.summary}</p>
	   			</div>
				<div class="order-info">
					<form action="./productOrder" method="post">
					<div class="input-group mb-3">
	  					<div class="input-group-prepend">
	    					<span class="input-group-text" >주문자 이름</span>
	 					</div>
	  					<input type="text" name="orderer" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
					</div>
	    			<div class="input-group mb-3">
	  					<div class="input-group-prepend">
	    					<label class="input-group-text" for="inputGroupSelect01">옵션</label>
	  					</div>
						<select class="custom-select">
			    			<option selected>--옵션을 선택하세요--</option>
	  					<c:forEach items="${dto.productGradeDTOs}" var="gradeDTO">
			    			<option value="${gradeDTO.gradeName}">${gradeDTO.gradeName}---남은수량 : ${gradeDTO.gradeStock}</option>
			    		</c:forEach>
			  			</select>
					</div>
			    	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">재고</label>
						</div>
						<select class="custom-select" id="inputGroupSelect01">
				    		<option selected>--수량을 선택하세요--</option>
				    		<option value="1">1개</option>
				    		<option value="2">2개</option>
				    		<option value="3">3개</option>
				  		</select>
					</div>
					<div class="input-group mb-3">
						<div class="row">
						<p>사용시작날짜: <input type="text" class="datepicker" name="startDate"></p>
						</div>
						<div class="row">
						<p>사용종료날짜: <input type="text" class="datepicker" name="lastDate"></p>
						</div>
					</div>
					<div class="row">
						<input type="hidden" name="indexCode" value="2">
					</div>
					<div>
						<button type="submit" class="btn btn-outline-info">주문하기</button>
					</div>
					</form>
				</div>
			</div>
			<div class="row col-6 mx-auto">
				<h1>${dto.contents}</h1>
			</div>
		</c:if>
	</div>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>