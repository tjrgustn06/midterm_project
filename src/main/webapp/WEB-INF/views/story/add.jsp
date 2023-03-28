<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid">

    <div class="row my-5">
        <h1>Story Add Page</h1>
    </div>

<div class="search_box">
    <form id="campSearchForm01" action="/bsite/camp/info/list.do" method="get">
        <!--<button type="button" class="btn_mylocation" onclick="geoFindMe(30, ''); return false;">내주변 캠핑장</button>-->
        <button type="button" class="btn_dsearch">상세검색</button>
        <!--검색박스-->
        <div class="search_box_form">
            <div class="form1_1">
                <p class="tt">키워드검색</p>
                <label class="skip" for="searchKrwd_f">검색어를 입력하세요.</label> <input type="text" class="keyword2" id="searchKrwd_f" name="searchKrwd" title="검색어를 입력하세요.">
            </div>
            <div class="form1_2">
                <p class="tt">지역별</p>
                <label class="skip" for="c_do">지역별 검색</label> <select name="c_do" id="c_do" class="select_01" title="검색할 지역을 선택하세요.">
                    <option value="">전체/도</option>
                    <option value="1">서울시</option>
                    <option value="2">부산시</option>
                    <option value="3">대구시</option>
                    <option value="4">인천시</option>
                    <option value="5">광주시</option>
                    <option value="6">대전시</option>
                    <option value="7">울산시</option>
                    <option value="8">세종시</option>
                    <option value="9">경기도</option>
                    <option value="10">강원도</option>
                    <option value="11">충청북도</option>
                    <option value="12">충청남도</option>
                    <option value="13">전라북도</option>
                    <option value="14">전라남도</option>
                    <option value="15">경상북도</option>
                    <option value="16">경상남도</option>
                    <option value="17">제주도</option>
                    </select> <label class="skip" for="c_signgu">시군별 검색</label> <select name="c_signgu" id="c_signgu" class="select_02" title="검색할 지역을 선택하세요.">
                    <option value="">전체/시/군</option>
                </select>
            </div>
            <div class="form1_2">
                <p class="tt">테마별</p>
                <label class="skip" for="searchLctCl">테마별 검색</label> <select name="searchLctCl" id="searchLctCl" class="select_03" title="검색할 테마를 선택하세요.">
                    <option value="">전체테마</option>
                    <option value="47">해변</option>
                    <option value="48">섬</option>
                    <option value="49">산</option>
                    <option value="50">숲</option>
                    <option value="51">계곡</option>
                    <option value="52">강</option>
                    <option value="53">호수</option>
                    <option value="54">도심</option>
                    </select>
                <button type="submit" class="btnSearch_black01">검색</button>
                <!--<button type="button" class="mylocation_tmv btn_none" onclick="geoFindMe(30, ''); return false;">내주변 캠핑장 검색</button>-->
            </div>
        </div>
        <!--//검색박스-->
    </form>
</div>

</div>
<c:import url="../template/common_js.jsp"></c:import>

</body>
</html>