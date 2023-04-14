<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="icon" href="/resources/images/logo.png" type="image/png">
	<title>The Camp</title>
</head>
<c:import url="./template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/vendors/nice-select/css/nice-select.css">
<body>
<c:import url="./template/header.jsp"></c:import>
    <!--================Banner Area =================-->
    <section class="banner_area">
        <div class="booking_table d_flex align-items-center">
            <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="banner_content text-center">
                    <h6>Away from monotonous life</h6>
                    <h2>Relax Your Mind</h2>
                    <p>Take a break from your tiring daily life through camping<br>with THE CAMP</p>
                </div>
            </div>
        </div>
        <!-- <div class="hotel_booking_area position">
            <div class="container">
                <div class="hotel_booking_table">
                    <div class="col-md-3">
                        <h2>캠핑장<br>검색</h2>
                    </div>
                    <div class="col-md-9">
                        <div class="boking_table">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="form-group">
                                            <div class='input-group date' id='selectDo'>
                                                <select name="doName" id="doName" class="form-select">
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
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="form-group">
                                            <div class='input-group date' id='selectSigungu'>
                                                <select name="sigunguName" id="sigunguName" class="form-select">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <a class="book_now_btn button_hover success" href="#">검색하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
    </section>
    <!--================Banner Area =================-->
    
    <!--================ 물품대여 Area  =================-->
    <section class="accomodation_area section_gap">
        <div class="container">
            <div class="section_title text-center">
                <h2 class="title_color">물품 대여</h2>
                <p>등급별로 나뉘어져있는 캠핑물품을 대여해보세요</p>
            </div>
            <div id="productList">

            </div>
        </div>
    </section>
    <!--================ 물품대여 Area  =================-->

        <!--================ 캠핑스토리 Area  =================-->
    <section class="facilities_area section_gap">
        <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="">  
        </div>
        <div class="container">
            <div class="section_title text-center">
                <h2 class="title_w">캠핑스토리</h2>
                <p>캠핑스토리를 올려보세요</p>
            </div>
            <div id="storyList">

            </div>
            
        </div>
    </section>
    <!--================ 캠핑스토리 Area  =================-->
        
<c:import url="./template/footer.jsp"></c:import>        
<script src="/resources/js/productListTop.js"></script>
<script src="/resources/js/calcDate.js"></script>
<script src="/resources/js/storyListTop.js"></script>
<script src="/resources/vendors/nice-select/js/jquery.nice-select.js"></script>
<script src="/resources/js/campSearchForm.js"></script>
<c:import url="./template/common_js.jsp"></c:import>
</body>
</html>
