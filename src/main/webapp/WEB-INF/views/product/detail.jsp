<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<c:import url="../template/common_css.jsp"></c:import>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
	textarea{resize:none;}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<h1>Detail Page</h1>
	<div class="container-fluid">
		<c:if test="${not empty dto.productNum}">
			<div class="row col-6 mx-auto">
				<c:forEach items="${dto.productFileDTOs}" var="fileDTO">
					<img src="../resources/upload/product/${fileDTO.fileName}" alt="Card image cap">
				</c:forEach>
	   			<div class="item-line">
	    			<h1>${dto.name}</h1>
	    			<p>${dto.summary}</p>
	   			</div>
				<div class="order-info">
					<c:if test="${not empty member}">
						<form action="./order/order" method="post">
							<div class="input-group mb-3">
			  					<div class="input-group-prepend">
			    					<span class="input-group-text" >주문자 이름</span>
			 					</div>
			  					<input type="text" name="orderer" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
							</div>
			    			<div class="input-group mb-3">
			  					<div class="input-group-prepend">
			    					<label class="input-group-text" for="gradeName">옵션</label>
			  					</div>
			  					<div class="row">
									<select class="form-select" aria-label="Default select example" id="gradeName">
						    			<option selected>--옵션을 선택하세요--</option>
										<option value="A급">A급</option>
										<option value="B급">B급</option>
										<option value="C급">C급</option>
						  			</select>
								</div>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="gradeStock">재고</label>
								</div>
								<div class="row my-auto" id="gradeStock">
								</div>
								<div class="row">
									<p class="my-auto">개</p>
								</div>
							</div>
					    	<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="amount">대여수량</label>
								</div>
								<div class="row" id="amountChange">
								</div>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text">금액</label>
									
								</div>
								<div class="row my-auto" id="totalPrice">
								</div>
								<div class="row">
									<p class="my-auto">원</p>
								</div>
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
								<input id="gradeNum" type="hidden" name="gradeNum">
								<input id="price" type="hidden" name="price">
								<input id="name" type="hidden" name="name">
							</div>
							<div>
								<button type="submit" class="btn btn-outline-info">주문하기</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
			<div class="row">
			<%-- <c:if test="${member.id eq dto.writer}"> --%>
				<div class="col-md-3">
					<form action="./update" id="frm" method="GET">
						<input type="hidden" name="productNum" value="${dto.productNum}">
						<c:if test="${not empty member.roleName and member.roleName ne 'MEMBER'}">
							<button type="submit" class="btn btn-primary mx-2" id="update">글 수정</button>
							<button type="button" class="btn btn-primary mx-2" id="delete" data-delete="${dto.productNum}">글 삭제</button>
						</c:if>
					</form>
				</div>
				<div class="col-md-3">
					<a href="./list" class="btn btn-primary mx-2">목록으로</a>	
				</div>
			<%-- </c:if> --%>
			
			<!-- delete시엔 post방식 update시엔 get -->
			</div>
			<div class="row">
				<div class="row col-6 mx-auto">
					<p>${dto.contents}</p>
				</div>
			</div>
			<div class="row col-5 mx-auto my-3" id="review" style="display: none;" data-review-name="${reviewName}">
				<form id="reviewForm" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="productNum" value="${dto.productNum}">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" >작성자</span>
						</div>
						<input type="text" name="writer" value="${member.id}" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
						<span class="input-group-text" >평점</span>
						</div>
						<div>
							<div class="starRate" id="star">
								<span class="star">★</span>
								<span class="star">★</span>
								<span class="star">★</span>
								<span class="star">★</span>
								<span class="star">★</span>
							</div>
							<input id="mark" type="hidden" name="mark">
						</div>
				</div>			
					<div class="input-group">
						<div class="input-group-prepend">
							<label class="input-group-text" for="gradeStock">내용</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<textarea id="reviewContents" class="form-control" name="contents" style="height: 200px" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<div id="picList">
						<!-- <div class="row mb-2" id="d-idx">';
							<div class="input-group mb-2 col-sm-2">
								<input type="file" class="form-control" name="param">
								<button class="dels btn btn-outline-danger" type="button" data-delete-id="idx">X</button>
							</div>
						</div> -->
						<div class="row mb-2" id="addPicDiv">
							<button type="button" id="addPic" class="col-2 offset-md-10 btn btn-primary">사진추가</button>
						</div>
					</div>
					<div>
						<button type="button" id="addReview" class="btn btn-outline-info" data-review-num="${dto.productNum}">리뷰작성</button>
					</div>
				</form>
			</div>
			<div class="row col-6 mx-auto my-3">
				<button id="reviewAdd" type="button" class="btn btn-primary col-3">리뷰쓰기</button>
				<button id="reviewCancle" type="button" class="btn btn-primary col-3">취소</button>
			</div>
			<div class="row" id="reviewList">

			</div>
		</c:if>
	</div>
	<script src="../resources/js/review.js"></script>
	<script>
		let price = 0;
		let totalPrice = 0;
		let gradeNum='';
		let gradeStock=0;
		$('#gradeName').change(function(){
			
			<c:forEach items="${dto.productGradeDTOs}" var="gradeDTO">
				if($('#gradeName').val()=="${gradeDTO.gradeName}") {
					price = ${gradeDTO.price}
					gradeNum=${gradeDTO.gradeNum}
					gradeStock=${gradeDTO.gradeStock}
				}
			</c:forEach>

			$('#amountChange').empty();
			
			getAmount(gradeStock)

			price = price*$('#amount').val();
			$('#totalPrice').html(price)
			$('#price').val($('#totalPrice').html())
			$('#gradeNum').val(gradeNum)
			$('#name').val('${dto.name}'+" "+$('#gradeName').val())
			$('#gradeStock').html(gradeStock);
		})
		
		$('#amountChange').change(function(){
			console.log('check')
			console.log('amount change : '+price)
			totalPrice =price*$('#amount').val();
			$('#totalPrice').html(totalPrice)
			$('#price').val($('#totalPrice').html())
		})
		setParam('pics')
		setMax(5);
	</script>
	<script>
		$.datepicker.setDefaults({
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            yearSuffix: '년',
            dateFormat: 'yy-mm-dd',
            showMonthAfterYear:true,
            constrainInput: true
		})

		$('.datepicker').datepicker();
	</script>
	
	<script src="../resources/js/productDetail.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>