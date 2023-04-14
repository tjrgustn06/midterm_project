<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${not empty siteList}">
        <c:forEach items="${siteList}" var="siteDTO" varStatus="i">
            <form action="./confirmation" id="bookFrm${i.count}" method="get">
            <div id="siteOne${i.count}" class="my-2">
                <input type="hidden" name="areaNum" value="${siteDTO.areaNum}" data-site-idx="area${i.count}">
                <input type="hidden" name="startDate" value="" data-site-idx="start${i.count}">
                <input type="hidden" name="lastDate" value="" data-site-idx="last${i.count}">
                <div class="d-flex justify-content-end mb-2">
                    <button id="bookBtn${i.count}" type="button" class="bookBtn genric-btn success-border medium" data-site-idx="${i.count}">선택하기</button>
                </div>
                <div class="input-group mb-2">
                    <span class="input-group-text" id="siteName">사이트이름</span>
                    <input type="text" name="siteName" data-site-idx="siteName${i.count}" class="form-control" value="${siteDTO.siteName}" readonly>
                    <span class="input-group-text" id="siteSize">크기(m^2)</span>
                    <input type="text" name="siteSize" data-site-idx="siteSize${i.count}" class="form-control" value="${siteDTO.siteSize}" readonly>
                </div>
                <div class="input-group mb-2">
                    <span class="input-group-text" id="offWeekdaysPrice">비수기 평일</span>
                    <input type="text" name="offWeekdaysPrice" data-site-idx="siteOwkPrice${i.count}" class="form-control" value="${siteDTO.offWeekdaysPrice}" readonly>
                    <span class="input-group-text" id="offWeekendsPrice">주말</span>
                    <input type="text" name="offWeekendsPrice" data-site-idx="siteOwdPrice${i.count}" class="form-control" value="${siteDTO.offWeekendsPrice}" readonly>
                </div>
                <div class="input-group mb-2">
                    <span class="input-group-text" id="peakWeekdaysPrice">성수기 평일</span>
                    <input type="text" name="peakWeekdaysPrice" data-site-idx="sitePwkPrice${i.count}" class="form-control" value="${siteDTO.peakWeekdaysPrice}" readonly>
                    <span class="input-group-text" id="peakWeekendsPrice">주말</span>
                    <input type="text" name="peakWeekendsPrice" data-site-idx="sitePwdPrice${i.count}" class="form-control" value="${siteDTO.peakWeekendsPrice}" readonly>
                </div>
            </div>
            </form>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p>*선택 기간 내 예약 가능한 사이트가 없습니다.</p>
    </c:otherwise>
</c:choose>