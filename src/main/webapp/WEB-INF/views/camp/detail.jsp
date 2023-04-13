<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>${dto.campName} - The Camp</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/campCRUD.css">
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">CAMPBOOK</h2>
				<ol class="breadcrumb">
					<li>캠핑장을 자세히 알려드릴게요</li>
				</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container col-lg-9 my-5">
	<div class="row my-3">
		<h1>${dto.campName}</h1>
	</div>

	<!-- 예약목록 확인 버튼 --> <!-- 차후 멤버등급 관련해서 조건문 추가 필요 -->
	<div class="d-flex justify-content-end">
		<c:if test="${not empty member.roleName and member.roleName eq 'ADMIN' or member.roleName eq 'CAMPMANAGER'}">
			<a class="genric-btn success" href="./book/list?campNum=${dto.campNum}">예약목록 확인</a>
		</c:if>
	</div>
	
	<hr>
	
	<!-- 대표사진 + 설명 div -->
	<div class="d-flex row my-3">
		<div class="row imageMain my-3 mx-auto">
			<c:choose>
				<c:when test="${not empty dto.thumbnailDTO}">
					<img class="innerImage" alt="" src="../resources/upload/camp/thumbnail/${dto.thumbnailDTO.thumbName}">
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${not empty dto.thumbnail}">
							<img alt="" src="${dto.thumbnail}">
						</c:when>
						<c:otherwise>
							<img alt="" src="../resources/images/empty.jpg">
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
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
								<a href="${dto.homePage}" id="detHomePage" target="_BLANK" title="새창열림"><i class="fa-solid fa-house fa-lg"></i></a>
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
	<div>
		<div class="mx-auto">
			<form action="./book/site" id="bookFrm" method="get">
				<!-- name은 파라미터 이름, value는 파라미터의 값 -->
				<input type="hidden" name="campNum" value="${dto.campNum}">
				<div class="d-flex justify-content-between my-2" id="userBtn">
					<button id="detList" type="button" class="genric-btn primary">목록으로</button>
					<button id="detBook" type="button" class="genric-btn success">사이트선택</button>
				</div>
			</form>
		</div>
	</div>
	<hr>
	

	<!-- contents 내용 시작 -->
	<div id="contents">
		<div class="campContent">
			<!-- 탭 선택 버튼 -->
			<div class="layout">
				<!-- 탭영역 - 다단 라인 / 탭영역으로 화면이동을 하고싶다면 주소 끝에 #contents 붙여주면 됨 -->
				<div id="viewType" data-viewType="${viewType}"></div>
				<ul class="navbar navbar-pills nav-fill">
					<li class="nav-item" id="c_intro">
						<a class="nav-link camp camp_intro active" aria-current="page" href="./detail?campNum=${dto.campNum}&viewType=1">캠핑장 소개</a>
					</li>
					<li class="nav-item" id="c_guide">
						<a class="nav-link camp camp_guide" href="./detail?campNum=${dto.campNum}&viewType=2">이용안내</a>
					</li>
					<li class="nav-item" id="c_map">
						<a class="nav-link camp camp_map" href="./detail?campNum=${dto.campNum}&viewType=3">위치정보</a>
					</li>
					<li class="nav-item" id="c_review">
						<a class="nav-link camp camp_review" href="./detail?campNum=${dto.campNum}&viewType=4">후기</a>
					</li>
				</ul>



				<!-- 탭 아래 내용 - 캠핑장소개 / 이용안내 / 위치정보(지도) / 후기 -->

				<c:if test="${viewType eq 1}">
				<!-- 캠핑장소개 영역 -->
				<div class="campIntro my-3" id="campIntro">
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 소개</h5>
					<!-- 인트로 이미지 3장까지만 출력 -->
					<div class="row mb-3">
						<c:if test="${not empty dto.campFileDTOs}">
							<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="i">
								<!-- 1~3번 이미지만 보이게 크기 등 나중에 수정-->
								<c:if test="${i.index lt 3}">
								<div class="imageBoxIntro col-lg-4">
									<img class="innerImage" alt="" src="../resources/upload/camp/${fileDTO.fileName}">
								</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					
					<hr>

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
								&nbsp;* TheCamp에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="infoRed">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
							</span> 
						</p>
					</section>

					<hr>

					<!-- 인트로 이미지 3장을 제외한 나머지 이미지 -->
					<h5><i class="fa-solid fa-camera fa-sm"></i> ${dto.campName}</h5>
					<div class="row otherImage mb-3">
						<c:if test="${not empty dto.campFileDTOs}">
							<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="j">
								<c:if test="${j.index ge 3}">
								<div class="imageBoxOther col-lg-4">
									<img class="innerImage" alt="" src="../resources/upload/camp/${fileDTO.fileName}">
								</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>

					<!-- 저작권 안내 -->
					<div style="margin-top: 0px; margin-bottom: 30px;">
						※ 모든 컨텐츠의 저작권은 TheCamp에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
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

					<!-- 시설배치도 / 일단 주석처리하고, 나중에 추가해보기 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
					<div class="row layout my-3 mx-auto">		
						<c:choose>
							<c:when test="${not empty dto.layoutDTO}">
								<img alt="" src="../resources/upload/camp/layout/${dto.layoutDTO.layoutName}">
							</c:when>
							<c:otherwise>
								<img alt="" src="../resources/images/empty.jpg">
							</c:otherwise>
						</c:choose>
					</div>
						
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
									<th colspan="2" scope="colgroup">비수기</th>
									<th colspan="2" scope="colgroup">성수기</th>
								</tr>

								<tr>
									<th scope="col" class="gray">평일</th>
									<th scope="col" class="gray">주말</th>
									<th scope="col" class="gray">평일</th>
									<th scope="col" class="gray">주말</th>
								</tr>
							</thead>
							<tbody class="sitePriceOption">
								<!-- siteDTO가 있으면 있는대로 테이블 만들기 -->
								<c:if test="${not empty dto.campSiteDTOs}">
									<c:forEach items="${dto.campSiteDTOs}" var="siteDTO">
										<tr>
											<th scope="col">${siteDTO.siteName}(${siteDTO.siteSize})</th>
											<td data-cell-header="비수기 평일：">${siteDTO.offWeekdaysPrice}</td>
											<td data-cell-header="비수기 주말：">${siteDTO.offWeekendsPrice}</td>
											<td data-cell-header="성수기 평일：">${siteDTO.peakWeekdaysPrice}</td>
											<td data-cell-header="성수기 주말：">${siteDTO.peakWeekendsPrice}</td>
										</tr>
									</c:forEach>
								</c:if>
								<!-- 테이블 끝 -->
							</tbody>
						</table>
					</div>
					<hr>

				</div> <!-- 이용안내 영역 종료 -->
				</c:if>

				<c:if test="${viewType eq 3}">
				<!-- 위치정보 영역 -->
				<div class="campMap my-3" id="campMap">
					<!-- 찾아오시는 길 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 찾아오시는 길</h5>
					<!--================Contact Area =================-->
					<p style="margin-top:-4px">
						<em class="link">
							<a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
								혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
							</a>
						</em>
					</p>
					<div id="map" style="width:100%;height:350px;"></div>
					<!--================Contact Area =================-->
				</div>
				</c:if>

				<!-- 후기 영역 -->
				<c:if test="${viewType eq 4}">
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑&여행 후기</h5>
					<div class="row col-8 mx-auto my-3" id="review" style="display: none;">
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
								<textarea id="reviewContents" class="form-control" name="contents" style="height: 200px; resize:none;" placeholder="내용을 입력해주세요"></textarea>
							</div>
							<div id="picList">
								<div class="d-flex justify-content-center my-2" id="addPicDiv">
									<button type="button" id="addPic" class="genric-btn primary small">사진추가</button>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button type="button" id="addReview" class="genric-btn success small" data-review-num="${dto.campNum}" data-review-name="camp">리뷰작성</button>
							</div>
						</form>
					</div>
					<div class="d-flex justify-content-center my-3">
						<button id="reviewCancle" type="button" class="genric-btn danger medium" style="display: none;">취소</button>
						<button id="reviewAdd" type="button" class="genric-btn success medium">작성</button>
					</div>

					<div class="row" id="reviewList">

					</div>
				</c:if>
				<!-- 후기 영역 끝 -->

			</div>
		</div>
	</div>
	<!-- contents 내용 끝 -->

	<!-- 버튼: update/delete 모두 campNum이 필요 -->
	<div>
		<div class="mx-auto">
			<form action="./update" id="frm" method="get">
				<!-- name은 파라미터 이름, value는 파라미터의 값 -->
				<input type="hidden" name="campNum" value="${dto.campNum}">
				<div class="d-flex justify-content-between my-2" id="adminBtn">
					<!-- 차후에 권한이 있으면 update, delete 버튼 나타내기 + 백엔드에서 검증까지 -->
					<c:if test="${not empty member.roleName and member.roleName eq 'ADMIN' or member.roleName eq 'CAMPMANAGER'}">
						<button id="detDelete" type="button" class="genric-btn danger">삭제</button>
						<button id="detUpdate" type="button" class="genric-btn primary">수정</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>

</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c293ea779f66b9a038f4869ccb12bdc&libraries=services"></script>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/review.js"></script>
<script>
	setParam('pics');
	setMax(5);
</script>
<script src="../resources/js/camp/campCRUD.js"></script>
<script>
// DTO 이름, 주소 변수 선언
let resName = '${dto.campName}';
let resAdr = '${dto.address}';

try {

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.47882621053635, 126.88111136615962), // 지도의 중심좌표 goodee academy
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(resAdr, function(result, status) { //기본주소 '금천구 가산디지털1로 151 306호 Goodee 아카데미아카데미'

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+resName+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
		}
});    
}catch(e){
}
</script>
</body>
</html>
