<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.left-sidebar {
		margin-top : 
	}
</style>
</head>
<body>
        <aside class="left-sidebar" data-sidebarbg="skin6" style="padding-top : 90px;">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <c:if test="${member.roleName eq 'ADMIN'}">
	                        <li class="sidebar-item pt-2">
	                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/member/memberList"
	                                aria-expanded="false">
	                                <i class="far fa-clock" aria-hidden="true"></i>
	                                <span class="hide-menu">회원 등급</span>
	                            </a>
	                        </li>
                        </c:if>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/report/list"
                                aria-expanded="false">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span class="hide-menu">신고내역 관리</span>
                            </a>
                        </li>
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
</body>
</html>