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
	<h1>Detail Page</h1>
	<div class="container-fluid">
		<c:if test="${not empty detail.productNum}">
			<div class="row col-6 mx-auto">
				<img class="card-img-top" src="../resources/images/iuPhoto.jpg" alt="Card image cap">
	   			<div class="item-line">
	    			<h1>${detail.name}</h1>
	    			<p>${detail.summary}</p>
	   			</div>
				<div class="order-info">
					<form action="./productOrder">
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
			    			<option value="1">${detail.dto.gradeName}</option>
			    			<option value="2">B급</option>
			    			<option value="3">C급</option>
			  			</select>
					</div>
			    	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">수량</label>
						</div>
						<select class="custom-select" id="inputGroupSelect01">
				    		<option selected>--수량을 선택하세요--</option>
				    		<option value="1">1개</option>
				    		<option value="2">2개</option>
				  			<option value="3">3개</option>
				  		</select>
					</div>
			    	<div class="input-group mb-3">
				  		<div class="input-group-prepend">
				    		<span class="input-group-text" >전화번호</span>
				  		</div>
			  			<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
			   		</div>
					<div>
						<button type="button" onclick="ok()" class="btn btn-outline-info">주문하기</button>
					</div>
					</form>
				</div>
			</div>
		</c:if>
	</div>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>