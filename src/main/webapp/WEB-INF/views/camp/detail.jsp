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
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid col-lg-9 my-5">
	<div class="row my-3">
		<h1>${dto.name}</h1>
	</div>
	
	<hr>
	
	<!-- 버튼 -->
	<div>
		<!-- update도 delete도 모두 DTO의 num이 필요하다 -->
		<form action="./update" id="frm" method="get">
			<!-- name은 파라미터 이름, value는 파라미터의 값 -->
			<input type="hidden" name="campNum" value="${dto.campNum}">
			<button id="reserve" type="button" class="btn btn-outline-primary">Reservation</button>
			<button id="list" type="button" class="btn btn-outline-secondary">go to List</button>
			<!-- 차후에 권한이 있으면 update, delete 버튼 나타내기 + 백엔드에서 검증까지 -->
			<button id="update" type="submit" class="btn btn-outline-success">UPDATE</button>
			<button id="delete" type="button" class="btn btn-outline-danger">DELETE</button>
		</form>
	</div>
	
	
	<!-- 대표사진 + 설명 div -->
	<div class="d-flex row my-3">
		<div class="row pic my-3 mx-auto">
<%-- 			<c:if test="${not empty dto.campFileDTOs}">
				<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="i">
					<!-- 파일이 보이게 -->
					<c:if test="${pageScope.i.first}">
						<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
					</c:if>
				</c:forEach>
			</c:if> --%>
			<c:catch var="er">
				<c:if test="${not empty dto.thumbnail}">
					<img alt="" src="${dto.thumbnail}">
				</c:if>
			</c:catch>
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
	
	
	<!-- contents 내용 시작 -->
	<hr>
	<div id="contents">
		<div class="camp_cont_w">
			<!-- 캠핑장 이용안내 -->
			<div class="layout">
				<!-- 탭영역 - 다단 라인 -->
				<ul class="nav nav-pills nav-fill">
					<li class="nav-item" id="c_intro">
						<a class="nav-link camp_intro active" aria-current="page" href="#">캠핑장소개</a>
					</li>
					<li class="nav-item" id="c_guide">
						<a class="nav-link camp_guide" href="#">이용안내</a>
					</li>
					<li class="nav-item" id="c_map">
						<a class="nav-link camp_map" href="#">위치정보</a>
					</li>
					<li class="nav-item" id="c_review">
						<a class="nav-link camp_review" href="#">후기</a>
					</li>
				</ul>

				<!-- js로 내용마다 바뀌게 해야할거같음. 캠핑장소개 / 이용안내 / 위치정보(지도) / 후기 -->

				<!-- 캠핑장소개 -->
				<div class="camp_intro my-3">
					<!-- 인트로 이미지 3장까지만 출력 -->
					<div class="row mb-3">
						<h3>인트로 이미지 3장</h3>
						<c:if test="${not empty dto.campFileDTOs}">
							<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="i">
								<!-- 1~3번 이미지만 보이게 -->
								<c:if test="${i.index lt 3}">
								<div class="introImage">
									<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
								</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					<ul>
						<li class="col_03 img_box"><img src="/upload/camp/6946/thumb/thumb_384_79574q9oF5qyMDKogFY3fpqS.jpeg" class="imgFit" alt="캠핑장소개 이미지"></li>
						<li class="col_03 img_box"><img src="/upload/camp/6946/thumb/thumb_384_5247YvzPpFQ61vEyftpAXW7L.jpg" class="imgFit" alt="캠핑장소개 이미지"></li>
						<li class="col_03 img_box"><img src="/upload/camp/6946/thumb/thumb_384_2062kfPltpg3GTiPfTbr4Wp4.jpg" class="imgFit" alt="캠핑장소개 이미지"></li>
					</ul>

					<!-- 인트로 텍스트, 정보수정일 출력 -->
					<p class="camp_intro_txt">
						<ul>
							<li>${dto.intro}</li>
							<li class="my-2">최종 정보 수정일 : ${dto.modiDate}</li>
						</ul>
					</p>

					<!-- 서비스 내용 출력 -->
					<h3><i class="fa-solid fa-gears fa-lg"></i>캠핑장 시설정보</h3>
						<div class="my-3">
							<c:set var="service" value="${dto.service}"></c:set>
							<ul>
								<c:if test="${fn:contains(service, '전기')}"><i class="fa-solid fa-bolt fa-sm"><span>전기</span></i></c:if>
								<c:if test="${fn:contains(service, '무선인터넷')}"><i class="fa-solid fa-wifi fa-sm"><span>와이파이</span></i></c:if>
								<c:if test="${fn:contains(service, '장작판매')}"><i class="fa-solid fa-campfire fa-sm"><span>장작판매</span></i></c:if>
								<c:if test="${fn:contains(service, '온수')}"><i class="fa-solid fa-heat fa-sm"><span>온수</span></i></c:if>
								<c:if test="${fn:contains(service, '트렘폴린')}"><i class="fa-solid fa-hockey-puck fa-sm"><span>트렘폴린</span></i></c:if>
								<c:if test="${fn:contains(service, '물놀이장')}"><i class="fa-solid fa-person-swimming fa-sm"><span>물놀이장</span></i></c:if>
								<c:if test="${fn:contains(service, '놀이터')}"><i class="fa-solid fa-volleyball fa-sm"><span>놀이터</span></i></c:if>
								<c:if test="${fn:contains(service, '산책로')}"><i class="fa-solid fa-person-walking fa-sm"><span>산책로</span></i></c:if>
								<c:if test="${fn:contains(service, '운동장')}"><i class="fa-solid fa-mound"><span>운동장</span></i></c:if>
								<c:if test="${fn:contains(service, '운동시설')}"><i class="fa-solid fa-goal-net fa-sm"><span>운동시설</span></i></c:if>
								<c:if test="${fn:contains(service, '마트.편의점')}"><i class="fa-solid fa-shop fa-sm"><span>마트.편의점</span></i></c:if>
							</ul>
						</div>

			<h3 class="icon_h3">기타 주요시설</h3>
			<section id="table_type03">
				<h2 class="skip">기타 주요시설 안내 테이블입니다.</h2>
				<div class="table_w">
					<table class="table_t4 camp_etc_tb">
						<caption>
							<strong>기타 주요시설 안내 테이블</strong>
							<p>주요시설, 사이트간격, 바닥형태, 편의시설, 캠핑장비대여, 반려동물출입, 화로대로 나뉘어 설명합니다.</p>
						</caption>

						<tbody class="t_c">
							<tr>
								<th scope="col">주요시설</th>
								<td>
									<ul class="table_ul05">
										<li>자동차야영장사이트(28면)</li>
										</ul>
								</td>
							</tr>
							<tr>
								<th scope="col">기타 정보</th>
								<td>
									<ul class="table_ul05">
										<li>개인 트레일러 입장가능</li>
										<li>
											반려동물 동반 불가능</li>
									</ul>
									<br/>
									<br/>
									(※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후 이용바랍니다.)
								</td>
							</tr>
							<tr>
									<th scope="col">기타 부대시설</th>
									<td>
										<ul class="table_ul05">
											<li>카페에는 간단한 캠핑에 필요한 물품과소모품, 그리고  커피,음료. 팥빙수, 장작등 판매
		해상 바지선에서 낚시를 할수 있음.</li>
										</ul>
									</td>
								</tr>
							<tr>
									<th scope="col">사이트 간격</th>
									<td>
										<ul class="table_ul05">
											<li>3M</li>
										</ul>
									</td>
								</tr>
							<tr>
									<th scope="col">바닥형태 (단위:면)</th>
									<td>
										<ul class="table_ul05">
											<li>파쇄석 (24)</li>
											<li>테크 (4)</li>
											</ul>
									</td>
								</tr>
							<tr>
									<th scope="col">사이트 크기</th>
									<td>
										<ul class="table_ul05">
											<li>4 X 6 : 28개</li>
											</ul>
									</td>
								</tr>
							<tr>
									<th scope="col">캠핑장비대여</th>
									<td>
										<ul class="table_ul05">
											<li>릴선</li>
												<li>화로대</li>
												</ul>
									</td>
								</tr>
							<!--
							<tr>
								<th scope="col">반려동물 출입</th>
								<td class="etc_type">불가능</td>
							</tr>
							-->
							<tr>
								<th scope="col">화로대</th>
								<td class="etc_type">개별</td>
							</tr>
							<tr>
								<th scope="col">안전시설현황</th>
								<td>
									<ul class="table_ul05">
									<li>소화기 (20)</li>
									<li>방화수 (10)</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="camp_intro_txt">
					<span class="info_notice">
						&nbsp;* 고캠핑에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="info_f_red">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
					</span> 
				</p>
			</section>
			<h3 class="icon_h3 mt_50">
					청보리오토캠핑장</h3>
				<div class="box_photo">
					<div id="gallery" style="display: none;">
						<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_5948GD4bLCqilo82inB3cl5N.jpg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_5948GD4bLCqilo82inB3cl5N.jpg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_7360DRh9s5A7BL1SXTl6RdAX.jpeg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_7360DRh9s5A7BL1SXTl6RdAX.jpeg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_6172H8nbsf5d4vqTLuimq7n7.jpg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_6172H8nbsf5d4vqTLuimq7n7.jpg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_7212ZENkZ3EEfP02nAh1wzxY.jpeg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_7212ZENkZ3EEfP02nAh1wzxY.jpeg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_13610lFBg5XtGzRyA5tviSR7.jpg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_13610lFBg5XtGzRyA5tviSR7.jpg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_3509tb1FtyGeV4zYYhH1YnRX.jpeg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_3509tb1FtyGeV4zYYhH1YnRX.jpeg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_00238PKQAvAzIIUPZu2acXEU.jpeg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_00238PKQAvAzIIUPZu2acXEU.jpeg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_98014tHnQc9ZXAseNgkHfkLq.jpg"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_98014tHnQc9ZXAseNgkHfkLq.jpg" data-description="청보리오토캠핑장" style="display: none">
								</a>
							<a href="https://gocamping.or.kr"> <img alt="청보리오토캠핑장"
									src="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_0723jZ0bSJePt5QOI87jQlF3.png"
									data-image="https://gocamping.or.kr/upload/camp/6946/thumb/thumb_1000_0723jZ0bSJePt5QOI87jQlF3.png" data-description="청보리오토캠핑장" style="display: none">
								</a>
							</div>
				</div>
				<div style="margin-top: -30px; margin-bottom: 30px;">
					※ 모든 컨텐츠의 저작권은 고캠핑에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
				</div>
				<!-- 		<button type="button" class="btn_grey_M">더보기</button> -->
				<script>
					$(document).ready(function() {
						$("#gallery").unitegallery();
					});
				</script>
			</div>
		</div>
							</div>
						</div>
						<!--//내용종료-->
					</div>
					<!--//콘텐츠박스-->
				</section>
			</div>
	
	
	
	
	
	<!-- contents 내용 끝 -->
	
	
	
	<!-- 나머지사진 다보이게 -->
	<div class="row col-7 mb-3">
		<h3>나머지 사진 테스트</h3>
		<c:if test="${not empty dto.campFileDTOs}">
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
				<!-- 파일이 보이게 -->
				<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
			</c:forEach>
		</c:if>
	</div>
	
	
	
	<!-- file -->
	<div>
		<c:if test="${not empty dto.campFileDTOs}">
			<c:forEach items="${dto.campFileDTOs}" var="fileDTO">
				<!-- 파일이 보이게 -->
				<%-- <a href="../resources/upload/camp/${fileDTO.fileName}">${fileDTO.oriName}</a> --%>
				<!-- 파일다운추가되면 주소입력 -->
				<%-- <a href="#${fileDTO.fileNum}">${fileDTO.oriName}</a> --%>
			</c:forEach>
		</c:if>
	</div>
	
</div>


<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/camp/crud.js"></script>
</body>
</html>