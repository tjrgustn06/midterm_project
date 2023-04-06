<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header_area">
	<div class="container">
    	<nav class="navbar navbar-expand-lg navbar-light">
			<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="/"><img src="/resources/images/TheCamp-Logo-Desktop-Color.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                	<ul class="nav navbar-nav menu_nav ml-auto">
                    	<li class="nav-item"><a class="nav-link" href="/">Home</a></li> 
                        <li class="nav-item"><a class="nav-link" href="/notice/list">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="/qna/list">QnA</a></li>
						<li class="nav-item"><a class="nav-link" href="/story/list">캠핑스토리</a></li>
                        <li class="nav-item"><a class="nav-link" href="/camp/list">캠핑장보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/product/list">물품대여</a></li>
                    </ul>
                    <ul class="nav navbar-nav menu_nav mx-auto">
                        <c:if test="${empty member}">
							<li class="nav-item"><a class="nav-link" href="/member/memberLogin">LOGIN</a></li>
							<li class="nav-item"><a class="nav-link" href="/member/memberAgree">JOIN</a></li>
						</c:if>
						<c:if test="${not empty member}">
							<li class="nav-item submenu dropdown">
                            	<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MYPAGE</a>
                            	<ul class="dropdown-menu">
                                	<li class="nav-item"><a class="nav-link" href="/member/memberPage">마이페이지</a></li>
                                	<li class="nav-item"><a class="nav-link" href="/product/order/list">물품주문정보</a></li>
                                	<li class="nav-item"><a class="nav-link" href="/cart/list">장바구니</a></li>
                            	</ul>
                        	</li>
							<li class="nav-item"><a class="nav-link" href="/member/memberLogout">LOGOUT</a></li>
						</c:if>
					</ul>
                </div> 
          </nav>
    </div>
</header>