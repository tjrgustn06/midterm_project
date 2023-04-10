<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header_area">
	<div class="container">
    	<nav class="navbar navbar-expand-lg navbar-light">
			<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="/"><img src="/resources/images/TheCamp-Logo-Desktop-Color.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggle-icon"></span>
					<span class="navbar-toggle-icon"></span>
					<span class="navbar-toggle-icon"></span>
				</button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                	<ul class="nav navbar-nav menu_nav">
						<li class="nav-item"><a class="nav-link" href="/notice/list">NOTICE</a></li>
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">COMMUNITY</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="/story/list">CAMPINGSTORY</a></li>
								<li class="nav-item"><a class="nav-link" href="/qna/list">QNA</a></li>	
							</ul>
						</li>
                        <li class="nav-item"><a class="nav-link" href="/camp/list">CAMPBOOK</a></li>
                        <li class="nav-item"><a class="nav-link" href="/product/list">RENT</a></li>
                    </ul>
                    <ul class="nav navbar-nav menu_nav" style="margin: auto 0 auto auto">
                        <c:if test="${empty member}">
							<li class="nav-item"><a class="nav-link" href="/member/memberLogin">LOGIN</a></li>
							<li class="nav-item"><a class="nav-link" href="/member/memberAgree">JOIN</a></li>
						</c:if>
						<c:if test="${not empty member}">
							<li class="nav-item submenu dropdown">
                            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MYPAGE</a>
                            	<ul class="dropdown-menu">
                                	<li class="nav-item"><a class="nav-link" href="/member/memberPage">MYPAGE</a></li>
                                	<li class="nav-item"><a class="nav-link" href="/product/order/list">PRODUCTORDER</a></li>
                                	<li class="nav-item"><a class="nav-link" href="/cart/list">CART</a></li>
                            	</ul>
                        	</li>
							<li class="nav-item"><a class="nav-link" href="/member/memberLogout">LOGOUT</a></li>
						</c:if>
					</ul>
                </div> 
          </nav>
    </div>
</header>