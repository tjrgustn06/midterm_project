<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update ${dto.name} - The Camping</title>
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
	<form action="./update" id="frm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="updCampNum" name="campNum" value="${dto.campNum}">

	<div class="row my-3">
		<h3>캠핑장 이름 등록</h3>
		<input type="text" id="ChkName" name="name" class="form-control my-1" value="${dto.name}">
	</div>
	
	<hr>
	
	<!-- 대표사진 + 설명 div -->
		<!-- 버튼 영역 -->
		<div class="d-flex row justify-content-center col-4 mx-auto">
			<div class="mx-auto mb-3">
				<button id="consoleSign" class="btn btn-outline-success" type="button">console</button>
			</div>
			<div class="mx-auto">
				<button id="updReg" class="btn btn-outline-success" type="button">등록</button>
				<button id="updCancel" class="btn btn-outline-danger" type="button">취소</button>
			</div>
		</div>

		<!-- 썸네일 사진 추가 -->
		<div class="d-flex row my-3">
			<div class="row pic my-3 mx-auto">
				<!-- 원래 사진 표시 -->
				<c:choose>
					<c:when test="${not empty dto.thumbnailDTO}">
						<img alt="" src="../resources/upload/camp/thumbnail/${dto.thumbnailDTO.thumbName}">
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

				<!-- 새로 사진 넣을 곳 표시.  -->
				<h5><i class="fa-solid fa-camera fa-sm"></i> 대표 사진 등록</h5>
				<div id="thumbnailImage" class="row">
					<!-- 파일 입력폼 -->
					<div class="row mb-3">
						<input type="file" id="thumbnail" name="thumbFile" class="form-control">
					</div>
				</div>

				
			</div>
			
			<hr class="my-2">
			
			<div class="row discription my-auto">
				<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 주요정보 등록</h5>
				<table class="table">
					<%-- <caption>캠핑장 기본정보입니다. 주소, 문의처, 캠핑장 유형, 찾아오시는길로 나뉘어 설명합니다.</caption> --%>
					<colgroup>
						<col style="width: 30%;"/>
						<col style="width: 70%;"/>
					</colgroup>
					<tbody>
						<!-- 셀렉트박스로 권역 / 도 / 시군구 구분 -->
						<tr>
							<th scope="col my-auto">시/도, 시/군/구</th>
							<td>
								<!-- <select name="regionName" id="addressRegion"></select> -->
								<select name="doName" id="addressDo">
									<option value="${dto.doName}" selected>${dto.doName}</option>
								</select>
								<select name="sigunguName" id="addressSigungu">
									<option value="${dto.sigunguName}" selected>${dto.sigunguName}</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col my-auto">주소</th>
							<td><input type="text" name="address" id="addressInput" class="form-control" value="${dto.address}"></td>
						</tr>
						<tr>
							<th scope="col my-auto">문의처</th>
							<td><input type="text" name="phone" class="form-control" value="${dto.phone}"></td>
						</tr>
						<tr>
							<th scope="col my-auto">캠핑장 유형</th>
							<td><input type="text" name="induty" class="form-control" value="${dto.induty}"></td>
						</tr>
						<tr>
							<th scope="col my-auto">홈페이지</th>
							<td><input type="text" name="homePage" class="form-control" value="${dto.homePage}"></td>
						</tr>
						<tr>
							<th scope="col my-auto">주변이용가능시설</th>
							<td><input type="text" name="posblFacility" class="form-control" value="${dto.posblFacility}"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<hr>
		

		<!-- contents 내용 시작 -->
		<div id="contents">
			<div class="campContent">
				<!-- 탭 선택 버튼 -->
				<div class="layout">
					<!-- 탭 아래 내용 - 캠핑장소개 / 이용안내 / 위치정보(지도) / 후기 -->

					<!-- 캠핑장소개 영역 -->
					<div class="campIntro my-3" id="campIntro">
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 소개 등록</h5>
						<!-- 이미지 3장 표시부분, 이미지는 아래쪽에서 추가 -->

						<!-- 인트로 텍스트, 정보수정일 출력 -->
						<i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 한 줄 소개
						<input type="text" name="lineIntro" class="form-control mb-2" value="${dto.lineIntro}">

						<i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 소개
						<div class="form-floating">
							<textarea id="introText" name="intro" class="form-control" style="height:100px; resize:none;">${dto.intro}</textarea>
							<label for="introText">캠핑장 소개 내용을 입력하세요</label>
						</div>
						
						<hr>
						
						<!-- 서비스 내용 입력 -->
						<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 캠핑장 시설정보 등록</h5>
						<div class="row mb-2">
							<!-- checkbox value : 전기, 무선인터넷, 장작판매, 온수, 트렘폴린, 물놀이장, 놀이터, 산책로, 운동장, 운동시설, 마트.편의점 -->
							<div class="col-4">
								<div class="form-check">
									<input class="form-check-input" id="chkBolt" name="serv" value="전기" type="checkbox">
									<label class="form-check-label" for="chkBolt">전기</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkWifi" name="serv" value="무선인터넷" type="checkbox">
									<label class="form-check-label" for="chkWifi">와이파이</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkCampWood" name="serv" value="장작판매" type="checkbox">
									<label class="form-check-label" for="chkCampWood">장작판매</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkHotWater" name="serv" value="온수" type="checkbox">
									<label class="form-check-label" for="chkHotWater">온수</label>
								</div>
							</div>

							<div class="col-4">
								<div class="form-check">
									<input class="form-check-input" id="chkTrampol" name="serv" value="트렘폴린" type="checkbox">
									<label class="form-check-label" for="chkTrampol">트램펄린</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkPool" name="serv" value="물놀이장" type="checkbox">
									<label class="form-check-label" for="chkPool">물놀이장</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkPlaygrd" name="serv" value="놀이터" type="checkbox">
									<label class="form-check-label" for="chkPlaygrd">놀이터</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkTrail" name="serv" value="산책로" type="checkbox">
									<label class="form-check-label" for="chkTrail">산책로</label>
								</div>
							</div>

							<div class="col-4">
								<div class="form-check">
									<input class="form-check-input" id="chkField" name="serv" value="운동장" type="checkbox">
									<label class="form-check-label" for="chkField">운동장</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkSpoFacty" name="serv" value="운동시설" type="checkbox">
									<label class="form-check-label" for="chkSpoFacty">운동시설</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkMart" name="serv" value="마트.편의점" type="checkbox">
									<label class="form-check-label" for="chkMart">마트/편의점</label>
								</div>
								<input type="hidden" name="service" id="serviceVal" value="${dto.service}">
							</div>
						</div>

						<hr>


						<!-- 기타 주요시설 출력 -->
						<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 기타 주요시설 등록</h5>
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
											<th scope="col">사이트 크기</th>
											<td>요금안내에 입력시 자동으로 표기됩니다.</td>
										</tr>
										<tr>
											<th scope="col">특징</th>
											<td><input type="text" name="feature" class="form-control" value="${dto.feature}"></td>
										</tr>
										<tr>
											<th scope="col">글램핑 내부시설</th>
											<td><input type="text" name="glampFacility" class="form-control" value="${dto.glampFacility}"></td>
										</tr>
										<tr>
											<th scope="col">카라반 내부시설</th>
											<td><input type="text" name="caravFacility" class="form-control" value="${dto.caravFacility}"></td>
										</tr>
										<tr>
											<th scope="col">동물 동반여부</th>
											<td><input type="text" name="petAllow" class="form-control" value="${dto.petAllow}"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- 경고 안내사항 -->
							<!-- <hr>
							<p class="campIntroTxt">
								<span class="infoNotice">
									&nbsp;* TheCamping에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="infoRed">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
								</span> 
							</p> -->
						</section>

						<hr>

						<!-- 이미지 추가 부분 / 인트로 이미지 3장을 제외한 나머지 이미지 표시 -->
						<h5><i class="fa-solid fa-camera fa-sm"></i> ${dto.name} 사진 등록</h5>
						<div class="otherImage">
							<!-- id=fileList인 부분에 js 작동 -->
							<div id="fileList" class="row">					
								<div class="row col-4 mb-3">
									<button id="fileAdd" class="btn btn-outline-info" type="button">추가 사진 등록</button>
								</div>

								<!-- 이미 가지고있는 파일을 표시 -->
								<c:forEach items="${dto.campFileDTOs}" var="fileDTO">		
									<div class="input-group my-1">
										<div class="input-group-text">
											<input class="form-check-input deleteCheck" type="checkbox" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
										</div>
									<input type="text" class="form-control" disabled value="${fileDTO.oriName}" aria-label="Text input with checkbox">			
									</div>
								</c:forEach>
							</div>
						</div>

						<!-- 저작권 안내 -->
						<!-- <div style="margin-top: 30px; margin-bottom: 30px;">
							※ 모든 컨텐츠의 저작권은 TheCamping에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
						</div> -->
					</div> <!-- 캠핑장 소개 영역 종료 -->

					<hr>

					<!-- 이용안내 영역 -->
					<div class="useInfo my-3" id="useInfo">
						<!-- 이용안내 -->
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 이용 안내사항 등록</h5>
							<!-- 입력 안하는경우 안내사항이 없다는 메시지가 표시됩니다 -->
							<div class="form-floating my-3">
								<textarea id="useInfoText" name="useInfo" class="form-control" style="height:100px; resize:none;">${dto.useInfo}</textarea>
								<label for="useInfoText">입력하지 않는 경우 안내사항이 없다는 메시지가 표시됩니다.</label>
							</div>
						<hr>
							
						<!-- 캠핑사이트 추가부분 -->
						<div class="row addSite">
							<div class="col-10">
								<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑 사이트 등록</h5>
							</div>
							<div class="col-2">
								<button class="btn btn-outline-success" id="siteAddBtn" type="button">추가</button>
							</div>
						</div>
						
						<!-- siteDTO 입력부 추가될 부분 -->
						<div class="row my-2" id="siteList">
							<!-- siteDTO - 버튼 누르면 생성될 부분 / 최소 한개의 site는 필수 -->
							<!-- index는 0부터 시작, count는 1부터 시작 -->
							<c:forEach items="${list}" var="siteDTO" varStatus="i">
								<div id="siteOne${i.count}">
									<div class="input-group mb-2">
										<span class="input-group-text" id="siteName">사이트이름</span>
										<input type="text" name="siteName" data-site-idx="siteName${i.count}" class="form-control" value="${siteDTO.siteName}">
										<span class="input-group-text" id="siteSize">크기(m^2)</span>
										<input type="text" name="siteSize" data-site-idx="siteSize${i.count}" class="form-control" value="${siteDTO.siteSize}">
									</div>
									<div class="input-group mb-2">
										<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>
										<input type="text" name="offWeekdaysPrice" data-site-idx="siteOwkPrice${i.count}" class="form-control" value="${siteDTO.offWeekdaysPrice}">
										<span class="input-group-text" id="offWeekendsPrice">주말</span>
										<input type="text" name="offWeekendsPrice" data-site-idx="siteOwdPrice${i.count}" class="form-control" value="${siteDTO.offWeekendsPrice}">
									</div>
									<div class="input-group mb-2">
										<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>
										<input type="text" name="peakWeekdaysPrice" data-site-idx="sitePwkPrice${i.count}" class="form-control" value="${siteDTO.peakWeekdaysPrice}">
										<span class="input-group-text" id="peakWeekendsPrice">주말</span>
										<input type="text" name="peakWeekendsPrice" data-site-idx="sitePwdPrice${i.count}" class="form-control" value="${siteDTO.peakWeekendsPrice}">
									</div>
									<!-- <div class="form-check mb-2">
										<input class="form-check-input" type="radio" name="status" id="bookable" value="예약가능">
										<label class="form-check-label" for="bookable">예약가능</label>
									</div>
									<div class="form-check mb-2">
										<input class="form-check-input" type="radio" name="status" id="unbookable" value="예약불가">
										<label class="form-check-label" for="unbookable">예약불가</label>
									</div> -->
									<div class="mb-2">
										<button type="button" data-site-idx="siteIptDel${i.count}" class="siteDels btn btn-outline-danger">사이트 삭제</button>
									</div>
								</div>
							</c:forEach>
							<!-- 생성 끝날 부분 -->
						</div>
						
						<hr>

						<!-- 시설배치도 / 일단 주석처리하고, 나중에 추가해보기 -->
						<!-- <h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
							<div class="row mb-3">
								<c:if test="${not empty dto.campFileDTOs}">
									<div class="facilityImage">
										<img alt="" src="../resources/upload/camp/-">
									</div>
								</c:if>
							</div>
						<hr> -->
					</div> <!-- 이용안내 영역 종료 -->


					
					<!-- 위치정보 영역 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 위치정보 등록</h5>
					<div class="campMap" id="campMap">
						<p>*나중에 지도 정보 받아오는거 공부해서 추가하기</p>
						<!-- <h5><i class="fa-solid fa-circle-info fa-sm"></i> 찾아오시는 길</h5> -->
							<!-- 해당 캠핑장의 위치값 필요(경도, 위도 소수점 4~5자리까지 알아내야하는데 어떻게 하지?) -->
							<!-- 나머지 정보는 CampDTO에 들어있어서 쓸 수 있음 -->
					</div>


					
					<!-- 후기 영역: detail 페이지에서 바로 등록/수정/삭제가 가능하도록 -->
					<!-- <h5><i class="fa-solid fa-circle-info fa-sm"></i> 후기 입력</h5>
					<div class="campReview" id="campReview">
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑&여행 후기</h5>
					</div> -->


				</div>
			</div>
		</div>
	</form>
	<!-- contents 내용 끝 -->
	
</div>


<script src="../resources/js/camp/selectBox.js"></script>
<script src="../resources/js/camp/campCRUD.js"></script>
<script src="../resources/js/camp/fileManager.js"></script>
<script>
	setMax(10);
	setParam('files');
	setCount('${dto.campFileDTOs.size()}');
</script>
<script>
	setSiteIdx(2+'${dto.campSiteDTOs.size()-1}'*1);
	setSiteMax(10);
	setSiteCount('${dto.campSiteDTOs.size()}');;
	console.log("siteIdx: "+siteIdx);
</script>
<script>
	$(function(){
		updAdrs();
		updServiceCheck();
		// updStatus();
		console.log('nice-select tt');
	$('.nice-select').prop("style", "display:on;");
	})
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>