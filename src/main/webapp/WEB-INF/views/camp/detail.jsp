<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.name} - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
	<style>
		a{
			color: black;
			text-decoration: none;
		}
		
		.pic{
			width: 80%;
			height: 80%;
		}

		.introImage{
			width: 30%;
			height: 30%;
		}
	
		.campOne{
			border: black, solid, 1px;
			border-radius: 5%;
		}
		
		.lineIntro{
			font-weight: bold;
		}
		
		.introBox{
			/* 말줄임(...) */
			width: auto;

			white-space: normal;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
			overflow: hidden;
		}

		ul, ol, li{
			list-style: none;
			font-size: 0.9rem;
		}

		.infoNotice{
			font-size: 0.8rem;
			font-weight: bold;
		}

		.infoRed{
			color: red;
		}

		.gray{
			background-color: gray;
		}
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid col-lg-9 my-5">
	<div class="row my-3">
		<!-- 파라미터 넘어가는거 확인용 -->
		--${param}--
		<h1>${dto.name}</h1>
	</div>
	
	<hr>
	
	<!-- 대표사진 + 설명 div -->
	<div class="d-flex row my-3">
		<div class="row pic my-3 mx-auto">
			<c:choose>
				<c:when test="${not empty dto.thumbnailDTO}">
					<img alt="" src="../resources/upload/camp/thumbnail/${dto.thumbnailDTO.fileName}">
				</c:when>
				<c:otherwise>
					<c:if test="${not empty dto.thumbnail}">
						<img alt="" src="${dto.thumbnail}">	
					</c:if>
				</c:otherwise>
			</c:choose>
			
			<%-- <c:if test="${not empty dto.thumbnailDTO}">
				<!-- 파일이 보이게 -->
				<c:if test="${pageScope.i.first}">
					<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
				</c:if>
			</c:if>
			<c:catch var="er">
				<c:if test="${not empty dto.thumbnail}">
					<img alt="" src="${dto.thumbnail}">
				</c:if>
			</c:catch> --%>
		</div>
		
		<hr class="my-2">
		
		<div class="row discription my-auto">
		
			<table class="table">
				<%-- <caption>캠핑장 기본정보입니다. 주소, 문의처, 캠핑장 유형, 찾아오시는길로 나뉘어 설명합니다.</caption> --%>
				<colgroup>
					<col style="width: 30%;" />
					<col style="width: 70%;" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="col">주소</th>
						<td>${dto.address}</td>
					</tr>
					<tr class="camp_call_pcVer">
						<th scope="col">문의처</th>
						<td>${dto.phone}</td>
					</tr>
					<tr>
						<th scope="col">캠핑장 유형</th>
						<td>${dto.induty}</td>
					</tr>
					<c:catch var="er">
					<tr>
						<th scope="col">홈페이지</th>
						<td>
							<c:if test="${not empty dto.homePage}">
								<a href="${dto.homePage}" target="_BLANK" title="새창열림"><i class="fa-solid fa-house fa-lg"></i></a>
							</c:if>
						</td>
					</tr>
					</c:catch>
					<tr>
						<th scope="col">주변이용가능시설</th>
						<td>${dto.posblFacility}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 버튼 - update/delete 모두 campNum이 필요 -->
	<div class="d-flex">
		<div class="mx-auto mb-3">
			<form action="./update" id="frm" method="get">
				<!-- name은 파라미터 이름, value는 파라미터의 값 -->
				<input type="hidden" name="campNum" value="${dto.campNum}">
				<button id="detReserve" type="button" class="btn btn-outline-primary">Reservation</button>
				<button id="detList" type="button" class="btn btn-outline-secondary">go to List</button>
				<!-- 차후에 권한이 있으면 update, delete 버튼 나타내기 + 백엔드에서 검증까지 -->
				<button id="detUpdate" type="submit" class="btn btn-outline-success">UPDATE</button>
				<button id="detDelete" type="button" class="btn btn-outline-danger">DELETE</button>
			</form>
		</div>
	</div>
	<hr>
	

	<!-- contents 내용 시작 -->
	<div id="contents">
		<div class="campContent">
			<!-- 탭 선택 버튼 -->
			<div class="layout">
				<!-- 탭영역 - 다단 라인 -->
				<div id="viewType" data-viewType="${viewType}"></div>
				<ul class="nav nav-pills nav-fill">
					<li class="nav-item" id="c_intro">
						<a class="nav-link camp camp_intro active" aria-current="page" href="./detail?campNum=${dto.campNum}&viewType=1#contents">캠핑장소개</a>
						<!-- data-camp-campNum="${dto.campNum}"" -->
					</li>
					<li class="nav-item" id="c_guide">
						<a class="nav-link camp camp_guide" href="./detail?campNum=${dto.campNum}&viewType=2#contents">이용안내</a>
					</li>
					<li class="nav-item" id="c_map">
						<a class="nav-link camp camp_map" href="./detail?campNum=${dto.campNum}&viewType=3#contents">위치정보</a>
					</li>
					<li class="nav-item" id="c_review">
						<a class="nav-link camp camp_review" href="./detail?campNum=${dto.campNum}&viewType=4#contents">후기</a>
					</li>
				</ul>



				<!-- 탭 아래 내용 - 캠핑장소개 / 이용안내 / 위치정보(지도) / 후기 -->

				<c:if test="${viewType eq 1}">
				<!-- 캠핑장소개 영역 -->
				<div class="campIntro my-3" id="campIntro">
					<!-- 인트로 이미지 3장까지만 출력 -->
					<div class="row mb-3">
						<c:if test="${not empty dto.campFileDTOs}">
							<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="i">
								<!-- 1~3번 이미지만 보이게 크기 등 나중에 수정-->
								<c:if test="${i.index lt 3}">
								<div class="introImage">
									<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
								</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					
					<hr>

					<!-- 기존 비교용 -->
					<!-- <ul>
						<li class="col_03 img_box"><img src="/upload/camp/6946/thumb/thumb_384_79574q9oF5qyMDKogFY3fpqS.jpeg" class="imgFit" alt="캠핑장소개 이미지"></li>
						<li class="col_03 img_box"><img src="/upload/camp/6946/thumb/thumb_384_5247YvzPpFQ61vEyftpAXW7L.jpg" class="imgFit" alt="캠핑장소개 이미지"></li>
						<li class="col_03 img_box"><img src="/upload/camp/6946/thumb/thumb_384_2062kfPltpg3GTiPfTbr4Wp4.jpg" class="imgFit" alt="캠핑장소개 이미지"></li>
					</ul> -->

					<!-- 인트로 텍스트, 정보수정일 출력 -->
					<p class="camp_intro_txt">
						<ul>
							<li>${dto.intro}</li>
							<li class="my-2">최종 정보 수정일 : ${dto.modiDate}</li>
						</ul>
					</p>
					
					<hr>
					
					<!-- 서비스 내용 출력 -->
					<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 캠핑장 시설정보</h5>
					<div class="mb-2">
						<c:set var="service" value="${dto.service}"></c:set>
						<ul>
							<c:if test="${fn:contains(service, '전기')}"><i class="fa-solid fa-bolt fa-sm"><span>전기</span></i></c:if>
							<c:if test="${fn:contains(service, '무선인터넷')}"><i class="fa-solid fa-wifi fa-sm"><span>와이파이</span></i></c:if>
							<c:if test="${fn:contains(service, '장작판매')}"><i class="fa-solid fa-campground fa-sm"><span>장작판매</span></i></c:if>
							<c:if test="${fn:contains(service, '온수')}"><i class="fa-solid fa-mug-hot fa-sm"><span>온수</span></i></c:if>
							<c:if test="${fn:contains(service, '트렘폴린')}"><i class="fa-solid fa-hockey-puck fa-sm"><span>트렘폴린</span></i></c:if>
							<c:if test="${fn:contains(service, '물놀이장')}"><i class="fa-solid fa-person-swimming fa-sm"><span>물놀이장</span></i></c:if>
							<c:if test="${fn:contains(service, '놀이터')}"><i class="fa-solid fa-volleyball fa-sm"><span>놀이터</span></i></c:if>
							<c:if test="${fn:contains(service, '산책로')}"><i class="fa-solid fa-person-walking fa-sm"><span>산책로</span></i></c:if>
							<c:if test="${fn:contains(service, '운동장')}"><i class="fa-solid fa-mound fa-sm"><span>운동장</span></i></c:if>
							<c:if test="${fn:contains(service, '운동시설')}"><i class="fa-solid fa-baseball fa-sm"><span>운동시설</span></i></c:if>
							<c:if test="${fn:contains(service, '마트.편의점')}"><i class="fa-solid fa-shop fa-sm"><span>마트.편의점</span></i></c:if>
						</ul>
					</div>

					<hr>


					<!-- 기타 주요시설 출력 -->
					<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 기타 주요시설</h5>
					<section>
						<div>
							<table class="my-3">
								<!-- <caption>사이트 크기(옵션), 글램핑/카라반 내부시설, 동물동반여부, 추가사진등록</caption> -->
								<colgroup>
									<col style="width: 30%;"/>
									<col style="width: 70%;"/>
								</colgroup>
								<tbody>
									<tr>
										<th scope="col my-auto">사이트 크기</th>
										<c:if test="${not empty dto.campSiteDTOs}">
											<td>
												<!-- 일단 사이트 이름, 크기만 출력 -->
												<ul>
													<c:forEach items="${dto.campSiteDTOs}" var="siteDTO" varStatus="i">
														<li>${siteDTO.siteName}: ${siteDTO.siteSize}</li>
													</c:forEach>
												</ul> 
											</td>
										</c:if>
									</tr>
									<tr>
										<th scope="col my-auto">특징</th>
										<c:if test="${not empty dto.feature}">
											<td>
												<ul><li>${dto.feature}</li></ul> 
											</td>
										</c:if>
									</tr>
									<tr>
										<th scope="col my-auto">글램핑 내부시설</th>
										<c:if test="${not empty dto.glampFacility}">
											<td>
												<ul><li>${dto.glampFacility}</li></ul> 
											</td>
										</c:if>
									</tr>
									<tr>
										<th scope="col my-auto">카라반 내부시설</th>
										<c:if test="${not empty dto.caravFacility}">
											<td>
												<ul><li>${dto.caravFacility}</li></ul> 
											</td>
										</c:if>
									</tr>
									<tr>
										<th scope="col my-auto">동물 동반여부</th>
										<c:if test="${not empty dto.petAllow}">
											<td>
												<ul><li>${dto.petAllow}</li></ul>
											</td>
										</c:if>
									</tr>
								</tbody>
							</table>
						</div>

						<hr>

						<!-- 경고 안내사항 -->
						<p class="campIntroTxt">
							<span class="infoNotice">
								&nbsp;* TheCamping에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="infoRed">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
							</span> 
						</p>
					</section>

					<hr>

					<!-- 인트로 이미지 3장을 제외한 나머지 이미지 -->
					<h5><i class="fa-solid fa-camera fa-sm"></i> ${dto.name}</h5>
					<div class="otherImage">
						<c:if test="${not empty dto.campFileDTOs}">
							<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="j">
								<c:if test="${j.index ge 3}">
								<div class="otherImage">
									<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
								</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>

					<!-- 저작권 안내 -->
					<div style="margin-top: -30px; margin-bottom: 30px;">
						※ 모든 컨텐츠의 저작권은 TheCamping에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
					</div>
				</div> <!-- 캠핑장 소개 영역 종료 -->
				</c:if>

				<c:if test="${viewType eq 2}">
				<!-- 이용안내 영역 -->
				<div class="useInfo my-3" id="useInfo">
					<!-- 이용안내 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 이용안내사항</h5>
						<c:choose>
							<c:when test="${not empty dto.useInfo}">
								<div class="useInfomation my-3">
									<ul>
										<li>${dto.useInfo}</li>
									</ul>
								</div>	
							</c:when>
							<c:otherwise><li>*안내사항이 없습니다.</li></c:otherwise>
						</c:choose>
					<hr>
						
					<!-- 요금구분 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑 사이트별 요금 안내</h5>
					<div class="tablePrice">
						<table class="table priceInfo">
							<!-- <caption>캠핑 구분에 따른 요금 테이블. 평상시의 주중, 주말과 성수기의 주중, 주말로 나뉘어 설명합니다.</caption> -->
							<colgroup>
								<col style="width: 20%">
								<col style="width: 20%">
								<col style="width: 20%">
								<col style="width: 20%">
								<col style="width: 20%">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2" scope="col">사이트이름(크기)</th>
									<th colspan="2" scope="colgroup">평상시</th>
									<th colspan="2" scope="colgroup">성수기</th>
								</tr>

								<tr>
									<th scope="col" class="gray">주중</th>
									<th scope="col" class="gray">주말</th>
									<th scope="col" class="gray">주중</th>
									<th scope="col" class="gray">주말</th>
								</tr>
							</thead>
							<tbody class="sitePriceOption">
								<!-- siteDTO가 있으면 있는대로 테이블 만들기 -->
								<c:if test="${not empty dto.campSiteDTOs}">
									<c:forEach items="${dto.campSiteDTOs}" var="siteDTO">
										<tr>
											<th scope="col">${siteDTO.siteName}(${siteDTO.siteSize})</th>
											<td data-cell-header="평상시 주중：">${siteDTO.offWeekdaysPrice}</td>
											<td data-cell-header="평상시 주말：">${siteDTO.offWeekendsPrice}</td>
											<td data-cell-header="성수기 주중：">${siteDTO.peakWeekdaysPrice}</td>
											<td data-cell-header="성수기 주말：">${siteDTO.peakWeekendsPrice}</td>
										</tr>
									</c:forEach>
								</c:if>
								<!-- 테이블 끝 -->
							</tbody>
						</table>
					</div>
					<hr>

					<!-- 시설배치도 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
						<!-- 임시로 막아놓고 나중에 추가해보기 ㅠㅠ -->
						<!-- <div class="row mb-3">
							<c:if test="${not empty dto.campFileDTOs}">
								<div class="facilityImage">
									<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
								</div>
							</c:if>
						</div> -->
					<hr>
				</div> <!-- 이용안내 영역 종료 -->
				</c:if>

				<c:if test="${viewType eq 3}">
				<!-- 위치정보 영역 -->
				<div class="campMap" id="campMap">
					<!-- 찾아오시는 길 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 찾아오시는 길</h5>
						<!--================Contact Area =================-->
							<section class="contact_area section_gap">
								<div class="container">
									<div id="mapBox" class="mapBox" 
										data-lat="40.701083" 
										data-lon="-74.1522848" 
										data-zoom="13" 
										data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia."
										data-mlat="40.701083"
										data-mlon="-74.1522848">
									</div>
									<div class="row">
										<div class="col-md-3">
											<div class="contact_info">
												<div class="info_item">
													<i class="lnr lnr-home"></i>
													<h6>California, United States</h6>
													<p>Santa monica bullevard</p>
												</div>
												<div class="info_item">
													<i class="lnr lnr-phone-handset"></i>
													<h6><a href="#">00 (440) 9865 562</a></h6>
													<p>Mon to Fri 9am to 6 pm</p>
												</div>
												<div class="info_item">
													<i class="lnr lnr-envelope"></i>
													<h6><a href="#">support@colorlib.com</a></h6>
													<p>Send us your query anytime!</p>
												</div>
											</div>
										</div>
										<div class="col-md-9">
											<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
													</div>
													<div class="form-group">
														<input type="email" class="form-control" id="email" name="email" placeholder="Enter email address">
													</div>
													<div class="form-group">
														<input type="text" class="form-control" id="subject" name="subject" placeholder="Enter Subject">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<textarea class="form-control" name="message" id="message" rows="1" placeholder="Enter Message"></textarea>
													</div>
												</div>
												<div class="col-md-12 text-right">
													<button type="submit" value="submit" class="btn theme_btn button_hover">Send Message</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</section>
						<!--================Contact Area =================-->
				</div>
				</c:if>


				<c:if test="${viewType eq 4}">
					<!-- 후기 영역 -->
					<div class="row col-5 mx-auto my-3" id="review" style="display: none;">
						<form id="reviewForm" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="campNum" value="${dto.campNum}">
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
								<div class="row mb-2" id="addPicDiv">
									<button type="button" id="addPic" class="col-2 offset-md-10 btn btn-primary">사진추가</button>
								</div>
							</div>
							<div>
								<button type="button" id="addReview" class="btn btn-outline-info" data-review-num="${dto.campNum}" data-review-name="camp">리뷰작성</button>
							</div>
						</form>
					</div>
					<div class="row col-6 mx-auto my-3">
						<button id="reviewAdd" type="button" class="btn btn-primary col-3">리뷰쓰기</button>
						<button id="reviewCancle" type="button" class="btn btn-primary col-3">취소</button>
					</div>
					<div class="row" id="reviewList">

					</div>
						<!-- 캠핑/여행 후기 -->
						
							<!-- 후기 넣기 -->
				</c:if>
			</div>

		</div>
	</div>






















	<!-- contents 내용 끝 -->
	
	
	
	<!-- 나머지사진 다보이게 -->
	<!-- <div class="row col-7 mb-3">
		<h3>나머지 사진 테스트</h3>
		<c:if test="${not empty dto.campFileDTOs}">
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
				<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
			</c:forEach>
		</c:if>
	</div> -->
	
	
	
	<!-- file -->
	<div>
		<c:if test="${not empty dto.campFileDTOs}">
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
				<!-- 파일이 보이게 -->
				<!-- <a href="../resources/upload/camp/${fileDTO.fileName}">${fileDTO.oriName}</a> -->
				<!-- 파일다운추가되면 주소입력 -->
				<!-- <a href="#${fileDTO.fileNum}">${fileDTO.oriName}</a> -->
			</c:forEach>
		</c:if>
	</div>
	
</div>


<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/review.js"></script>
<script>
	setParam('pics');
	setMax(5);
</script>
<script src="../resources/js/camp/campCRUD.js"></script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="royal-master/js/gmaps.min.js"></script> -->
</body>
</html>
