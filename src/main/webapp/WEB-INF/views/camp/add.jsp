<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddCamp - The Camping</title>
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
	<form action="./add" id="frm" method="post" enctype="multipart/form-data">
	<div class="row my-3">
		<!-- 파라미터 넘어가는거 확인용 -->
		--${param}--
		<h1>Camp Add Page</h1>
		<input type="text" id="ChkName" name="name" class="form-control my-1" placeholder="캠핑장 이름을 입력하세요">
	</div>
	
	<hr>
	
	<!-- 대표사진 + 설명 div -->
		<!-- 버튼 영역 -->
		<div class="d-flex row justify-content-center col-4 mx-auto">
			<div class="mx-auto mb-3">
				<button id="addConsoleSign" class="btn btn-outline-success" type="button">console</button>
			</div>
			<div class="mx-auto">
				<button id="addReg" class="btn btn-outline-success" type="button">등록</button>
				<button id="addCancel" class="btn btn-outline-danger" type="button">취소</button>
			</div>
		</div>

		<!-- 썸네일 사진 추가 -->
		<div class="d-flex row my-3">
			<div class="row pic my-3 mx-auto">
				<!-- 사진이 없는경우 empty.jpg 넣어주기 -->
				<h5><i class="fa-solid fa-camera fa-sm"></i> 대표 사진 등록</h5>
				<div id="fileList" class="row">
					<div class="row mb-3">
						<!-- <label for="campFiles" class="form-label">대표 사진 등록</label> -->
						<input type="file" id="campFiles" name="files" class="form-control">
					</div>
					
					<div class="row col-4 mb-3">
						<button id="fileAdd" class="btn btn-outline-info" type="button">추가 사진 등록</button>
					</div>
				</div>
			</div>
			
			<hr class="my-2">
			
			<div class="row discription my-auto">
			
				<table class="table">
					<%-- <caption>캠핑장 기본정보입니다. 주소, 문의처, 캠핑장 유형, 찾아오시는길로 나뉘어 설명합니다.</caption> --%>
					<colgroup>
						<col style="width: 30%;"/>
						<col style="width: 70%;"/>
					</colgroup>
					<tbody>
						<!-- 셀렉트박스로 권역 / 도 / 시군구 구분 -->
						<tr>
							<th scope="col my-auto">권역 / 도 / 시군구 선택</th>
							<td>
								<select name="regionName" id="addressRegion"></select>
								<select name="doName" id="addressDo"></select>
								<select name="sigunguName" id="addressSigungu"></select>
							</td>
						</tr>
						<!-- <tr>
							<th scope="col my-auto">도 / 시군구 선택</th>
							<td>
								<select name="doName" id="do"></select>
								<select name="sigunguName" id="sigungu"></select>
							</td>
						</tr> -->
						<tr>
							<th scope="col my-auto">주소</th>
							<td><input type="text" name="address" class="form-control" placeholder="나머지 주소를 입력하세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">문의처</th>
							<td><input type="text" name="phone" class="form-control" placeholder="문의 가능한 연락처를 입력하세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">캠핑장 유형</th>
							<td><input type="text" name="induty" class="form-control" placeholder="유형구분은 쉼표(,)로 해주세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">홈페이지</th>
							<td><input type="text" name="homePage" class="form-control" placeholder="홈페이지 URL을 입력하세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">주변이용가능시설</th>
							<td><input type="text" name="posblFacility" class="form-control" placeholder="시설구분은 쉼표(,)로 해주세요"></td>
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
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 소개 내용</h5>
						<!-- 이미지(파일) 추가 부분 -->
						<div class="row">
							<!-- <c:if test="${not empty dto.campFileDTOs}">
								<c:forEach items="${dto.campFileDTOs}" var="fileDTO" varStatus="i">
									<c:if test="${i.index lt 3}">
									<div class="introImage">
										<img alt="" src="../resources/upload/camp/${fileDTO.fileName}">
									</div>
									</c:if>
								</c:forEach>
							</c:if> -->
						</div>
						
						<!-- <hr> -->

						<!-- 인트로 텍스트, 정보수정일 출력 -->
						<input type="text" name="lineIntro" class="form-control mb-2" placeholder="캠핑장 한줄소개를 입력하세요">
						<div class="form-floating">
							<textarea id="introText" name="intro" class="form-control" style="height:100px; resize:none;"></textarea>
							<label for="introText">캠핑장 소개 내용을 입력하세요</label>
						</div>
						
						<hr>
						
						<!-- 서비스 내용 입력 -->
						<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 캠핑장 시설정보</h5>
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
								<input type="hidden" name="service" id="serviceVal" value="">
							</div>
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
											<th scope="col">사이트 크기</th>
											<td>요금안내에 입력시 자동으로 표기됩니다.</td>
										</tr>
										<tr>
											<th scope="col">특징</th>
											<td><input type="text" name="feature" class="form-control" placeholder="특징을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col">글램핑 내부시설</th>
											<td><input type="text" name="glampFacility" class="form-control" placeholder="시설구분은 쉼표(,)로 해주세요"></td>
										</tr>
										<tr>
											<th scope="col">카라반 내부시설</th>
											<td><input type="text" name="caravFacility" class="form-control" placeholder="시설구분은 쉼표(,)로 해주세요"></td>
										</tr>
										<tr>
											<th scope="col">동물 동반여부</th>
											<td><input type="text" name="petAllow" class="form-control" placeholder="가능/불가능 여부를 입력하세요"></td>
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
						<h5><i class="fa-solid fa-camera fa-sm"></i> ${dto.name} 사진 추가</h5>
						<div class="otherImage">
							<p>사진 추가 기능 필요</p>
						</div>

						<!-- 저작권 안내 -->
						<div style="margin-top: 30px; margin-bottom: 30px;">
							※ 모든 컨텐츠의 저작권은 TheCamping에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
						</div>
					</div> <!-- 캠핑장 소개 영역 종료 -->


					<!-- 이용안내 영역 -->
					<div class="useInfo my-3" id="useInfo">
						<!-- 이용안내 -->
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 이용안내사항</h5>
							<!-- 입력 안하는경우 안내사항이 없다는 메시지 자동저장? -->
							<div class="form-floating my-3">
								<textarea id="useInfoText" name="useInfo" class="form-control" style="height:100px; resize:none;"></textarea>
								<label for="useInfoText">캠핑장 이용 안내사항을 입력하세요</label>
							</div>
						<hr>
							
						<!-- 요금구분 -->
						<div class="row addSite">
							<div class="col-10">
								<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑 사이트별 요금 안내</h5>
							</div>
							<div class="col-2">
								<button class="btn btn-outline-success" id="siteAddBtn" type="button">추가</button>
							</div>
						</div>
						
						<!-- siteDTO 입력부 추가될 부분 -->
						<div class="row my-2" id="siteList">
							<!-- siteDTO - 버튼 누르면 생성될 부분 -->
							<div id="siteOne">
								<div class="input-group mb-2">
									<span class="input-group-text" id="siteName">사이트이름</span>
									<input type="text" name="siteName" class="form-control" placeholder="ex)일반A1, 카라반A1">
									<span class="input-group-text" id="siteSize">크기(m^2)</span>
									<input type="text" name="siteSize" class="form-control" placeholder="ex)6*11, 10*10">
								</div>
								<div class="input-group mb-2">
									<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>
									<input type="text" name="offWeekdaysPrice" class="form-control" placeholder="요금 입력">
									<span class="input-group-text" id="offWeekendsPrice">주말</span>
									<input type="text" name="offWeekendsPrice" class="form-control" placeholder="요금 입력">
								</div>
								<div class="input-group mb-2">
									<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>
									<input type="text" name="peakWeekdaysPrice" class="form-control" placeholder="요금 입력">
									<span class="input-group-text" id="peakWeekendsPrice">주말</span>
									<input type="text" name="peakWeekendsPrice" class="form-control" placeholder="요금 입력">
								</div>
								<div class="mb-2">
									<button type="button" class="siteDels btn btn-outline-danger">입력창 삭제</button>
								</div>
							</div>
							<!-- 생성 끝날 부분 -->
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


					
					<!-- 위치정보 영역 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 위치정보 입력</h5>
					<div class="campMap" id="campMap">
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 찾아오시는 길</h5>
							<!-- 지도에서 검색해서 넣어주게끔 해야하나; -->
					</div>


					
					<!-- 후기 영역 - productReview처럼 캠핑장 아래에 따로 나오게-->
					<!-- <h5><i class="fa-solid fa-circle-info fa-sm"></i> 후기 입력</h5>
					<div class="campReview" id="campReview">
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑&여행 후기</h5>
					</div> -->


				</div>
			</div>
		</div>
	</form>



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

<script src="../resources/js/camp/selectBox.js"></script>
<script src="../resources/js/camp/campCRUD.js"></script>
<script src="../resources/js/camp/fileManager.js"></script>
<script>
	setMax(10);
	setParam('files');
	setCount(1);

	setSiteCount(1);
	setSiteMax(5);
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>