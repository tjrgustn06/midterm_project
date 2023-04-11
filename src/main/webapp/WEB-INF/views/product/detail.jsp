<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/vendors/nice-select/css/nice-select.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
	textarea{resize:none;}
	.star, .updateStar{cursor: pointer;}
	.quickmenu{
		position:absolute; 
		width: 150px;
        height: auto;
        right: 50px;
        border-radius: 10px;
        border: 1px solid #dddddd;
		}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">RENT</h2>
			<ol class="breadcrumb">
				<li>캠핑장비를 자세히 알려드릴께요</li>
			</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container">
		<div class="quickmenu mx-auto">
			<div id="cartBar" data-member-id="${member.id}" style="margin-left: 50px; margin-top: 10px;">
			</div>
			<div style="margin-left: 50px;">
				<a href="/cart/list">
					장바구니
				</a><br>
				<a href="./list">목록으로</a><br>
				<a href="#">위로가기</a>
			</div>
		</div>
		<div class="row md-7">
			<p class="col-md-7 mx-auto text-center border-bottom border-dark pb-4"></p>
		</div>
		<c:if test="${not empty dto.productNum}">
			<div class="row col-6 mx-auto mb-3">
				<h1>${dto.name}</h1>
				<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
				    	<c:forEach items="${dto.productFileDTOs}" var="fileDTO" varStatus="i">
				    		<c:choose>
				    			<c:when test="${i.first}">
						    		<div class="carousel-item active">
										<img src="../resources/upload/product/${fileDTO.fileName}" class="d-block w-100" alt="Card image cap" style="height: 500px;">
							    	</div>
				    			</c:when>
					    		<c:otherwise>
						    	<div class="carousel-item">
									<img src="../resources/upload/product/${fileDTO.fileName}" class="d-block w-100" alt="Card image cap" style="height: 500px;">
						    	</div>
					    		</c:otherwise>
				    		</c:choose>
						</c:forEach>
			  		</div>
				  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				
	   			<div class="item-line">
	    			<p>${dto.summary}</p>
	   			</div>
				<div class="order-info" id="orderForm">
					<c:if test="${not empty member}">
						<form method="post">
							<div class="input-group mb-3">
								<span class="input-group-text" style="width: 122px;">주문자 이름</span>
			  					<input type="text" name="orderer" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" for="gradeName" style="width: 122px;">옵션</span>
								<select class="nice-select form-control" aria-label="Default select example" id="gradeName">
									<option selected>-옵션을 선택하세요-</option>
									<option value="A급">A급</option>
									<option value="B급">B급</option>
									<option value="C급">C급</option>
								</select>
									
							</div>
							<div class="input-group mb-3">	
								<span class="input-group-text" for="gradeStock" style="width: 122px;">재고</span>
								<div class="row my-auto" id="gradeStock">
								</div>
								<div class="row">
									<p class="my-auto">&nbsp;개</p>
								</div>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" for="amount" style="width: 122px;">대여수량</span>
								<div class="row" id="amountChange">
								</div>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" style="width: 122px;">금액</span>
								<div class="row my-auto" id="totalPrice">
								</div>
								<div class="row">
									<p class="my-auto">&nbsp;원</p>
								</div>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">사용시작날짜</span>
								<input type="date" class="form-control datepicker" id="startDate" name="startDate" readonly style="width: 100px;">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">사용종료날짜</span>
								<input type="date" class="form-control datepicker" id="lastDate" name="lastDate" readonly style="width: 100px;">
							</div>
							<div class="row">
								<input type="hidden" name="indexCode" value="2">
								<input id="gradeNum" type="hidden" name="gradeNum">
								<input id="price" type="hidden" name="price">
								<input id="name" type="hidden" name="name">
							</div>
							<div style="float: right;">
								<button id="orderSubmit" type="submit" class="genric-btn success-border radius" formaction="./order/order">주문하기</button>
								<button id="cartSubmit" type="submit" class="genric-btn success-border radius" formaction="../cart/add">장바구니추가</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
			<div class="row col-6 mx-auto">
				<div class="mb-3">
					<form action="./update" id="frm" method="GET">
						<input type="hidden" name="productNum" value="${dto.productNum}">
						<c:if test="${not empty member.roleName and member.roleName ne 'MEMBER'}">
							<button type="submit" class="genric-btn success radius" id="update">글 수정</button>
							<button type="button" class="genric-btn danger radius" id="delete" data-delete="${dto.productNum}">글 삭제</button>
						</c:if>
					</form>
				</div>
				<div>
					<a href="./list" class="genric-btn success radius">목록으로</a>	
				</div>
			<!-- delete시엔 post방식 update시엔 get -->
			</div>
			<div class="row">
				<div class="row col-6 mx-auto">
					<p>${dto.contents}</p>
				</div>
			</div>
			<div class="row col-5 mx-auto my-3" id="review" style="display: none;">
				<form id="reviewForm" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="productNum" value="${dto.productNum}">
					<div class="input-group mb-3">
						<span class="input-group-text" >작성자</span>
						<input type="text" name="writer" value="${member.id}" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" >평점</span>
						</div>
						<div class="starRate" id="star">
							<span class="star">★</span>
							<span class="star">★</span>
							<span class="star">★</span>
							<span class="star">★</span>
							<span class="star">★</span>
						</div>
						<input id="mark" type="hidden" name="mark">
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
						<div class="mb-2" id="addPicDiv">
							<button type="button" id="addPic" class="genric-btn success-border radius" style="float: right;">사진추가</button>
						</div>
					</div>
					<div>
						<button type="button" id="addReview" class="genric-btn success-border radius" data-review-num="${dto.productNum}" data-review-name="product">리뷰작성</button>
					</div>
				</form>
			</div>
			<div class="col-6 mx-auto">
				<button id="reviewAdd" type="button" class="genric-btn success radius">리뷰쓰기</button>
				<button id="reviewCancle" type="button" class="genric-btn primary radius">취소</button>
			</div>
			<div class="row" id="reviewList">

			</div>
		</c:if>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
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
			if(gradeStock<0) {
				gradeStock=0;
			}
			console.log(gradeStock)
			$('#gradeStock').html("&nbsp;"+gradeStock);
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
            constrainInput: true,
			minDate: 0
		});

		$('.datepicker').datepicker();

		$('#startDate').datepicker('option', 'maxDate', $('#lastDate').val());
		$('#startDate').datepicker('option','onClose', (selectedDate)=>{
			$('#lastDate').datepicker('option', 'minDate', selectedDate);
		});

		$('#startDate').change(()=>{	
			$('#lastDate').datepicker('option', 'minDate', $('#startDate').val());
			$('#lastDate').datepicker('option', 'onClose', (selectedDate)=>{
				$('#startDate').datepicker('option', 'maxDate', selectedDate);
			})
		})

	</script>
	
	<script src="../resources/js/productDetail.js"></script>
	<script src="/resources/vendors/nice-select/js/jquery.nice-select.js"></script>

<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>