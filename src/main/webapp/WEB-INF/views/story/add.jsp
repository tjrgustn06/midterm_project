<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>

<style>
    .tt {
        float: left;
        margin: 0 10px;
    }

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid">

    <div class="row mb-4 border-bottom border-info">
        <h1 class="col-md-7 mx-auto text-center pb-3 fs-2">Story Add 페이지</h1><br>
    </div>
    
    <form id="campSearchForm2" action="/bsite/camp/info/list.do" method="get"><input type="hidden" name="listTy" value="LIST" />
        <div class="row search_box">

        <div class="row col-md-8 mx-auto border-bottom ">
            <form action="./add" method="post" enctype="multipart/form-data">
                <div class="row mb-3">
                    <label for="writer" class="col-sm-2 col-form-label">작성자</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="writer" id="writer" value="user01" readonly >
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="form_w">
                        <strong class="title">지역</strong>
                        <ul style="list-style-type: none;">
                            <li class="tt">
                                <div class="select_box">
                                    <label for="doName">도/특별시</label>
                                    <select id="doName" name="doName" class="detail_select" title="도/특별시">
                                        <option value="">전체</option>
                                        <option value="서울">서울시</option>
                                        <option value="부산">부산시</option>
                                        <option value="대구">대구시</option>
                                        <option value="인천">인천시</option>
                                        <option value="광주">광주시</option>
                                        <option value="대전">대전시</option>
                                        <option value="울산">울산시</option>
                                        <option value="세종">세종시</option>
                                        <option value="경기">경기도</option>
                                        <option value="강원">강원도</option>
                                        <option value="충청북">충청북도</option>
                                        <option value="충청남">충청남도</option>
                                        <option value="전라북">전라북도</option>
                                        <option value="전라남">전라남도</option>
                                        <option value="경상북">경상북도</option>
                                        <option value="경상남">경상남도</option>
                                        <option value="제주">제주도</option>

                                    </select>
                                </div>
                                </li>
                            <li>
                                <div class="select_box">
                                    <label for="sigunguName">시/군/지역</label>
                                    <select id="sigunguName" name="sigunguName" class="detail_select" title="시/군/지역">
                                        <option value="">전체</option>
                                    </select>
                                </div>
                            </li>
                            <!-- <li class="tt"><strong class="title">위치</strong>
                            <div class="select_box">
                                <label for="r_select03">전체</label> <select class="detail_select" id="r_select03">
                                    <option selected="selected">선택1</option>
                                    <option>선택2</option>
                                    <option>선택3</option>
                                    <option>선택4</option>
                                </select>
                            </div></li> -->
                            <!-- <li class="tt"><strong class="title">테마</strong>
                                <div class="select_box them">
                                    <label for="searchLctCl">전체</label> <select class="detail_select" name="searchLctCl" id="searchLctCl" title="테마선택">
                                        <option value="">전체테마</option>
                                        <option value="47" >해변</option>
                                        <option value="48" >섬</option>
                                        <option value="49" >산</option>
                                        <option value="50" >숲</option>
                                        <option value="51" >계곡</option>
                                        <option value="52" >강</option>
                                        <option value="53" >호수</option>
                                        <option value="54" >도심</option>
                                        </select>
                                </div>
                            </li> -->
                        </ul>
                        <ul style="list-style-type: none;">
                            <li class="tt top_kwdSearch">
                                <div class="input_search">
                                    <fieldset class="totalSearch">
                                        <label for="searchKrwd2" class="skip">키워드 검색</label>
                                        <input id="name" name="name" class="m_search_in" style="vertical-align: middle;" title="검색어를 입력하세요." placeholder="검색어를 입력하세요." type="text" value=""/></fieldset>
                                </div>
                            </li>                            
                            <li class="tt top_kwdSearch">
                                <div class="input_search">
                                    <fieldset class="totalSearch">
                                        <button class="btn btn-primary" style="vertical-align: middle;" type="button" id="searchBtn">검색</button>
                                    </fieldset>
                                </div>
                            </li>


                            <!-- <li class="fw_2li">
                                <div class="button_w">
                                    <button type="button" class="de_btn01">상세조건</button>
                                    <button type="submit" class="de_btn02">캠핑장 검색</button>
                                </div>
                            </li>-->
                        </ul>
                    </div>
                    <div class="row my-5">
                        <div class="col-auto mx-2" id="searchCampList">
                        <ul class="list-group list-group-horizontal list1" >
                            <li class="list-group-item">
                              <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                              First checkbox
                            </li>
                            <li class="list-group-item">
                              <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                              First checkbox
                            </li>
                          </ul>
                        </div>
                    </div>
                    
            </div>
                
            <div class="row mb-3">
                <label for="title" class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" id="title" placeholder="ex)...캠핑장 (2021-02-14) 입력">
                    </div>
                </div>



            </div>
        </div>
          
        </form>
    </div>

</div>
<script src="../resources/js/campSearchForm.js"></script>
<c:import url="../template/common_js.jsp"></c:import>

</body>
</html>