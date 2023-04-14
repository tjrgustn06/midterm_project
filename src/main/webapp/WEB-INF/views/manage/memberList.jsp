<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<c:import url="../template/common_css.jsp"></c:import>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
	<title>The Camp</title>
    <link rel="icon" href="/resources/images/logo.png" type="image/png">
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/plugins/images/favicon.png">
    <!-- Custom CSS -->
    <link href="../resources/plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
    <!-- Custom CSS -->
    <link href="../resources/css/style.min.css" rel="stylesheet">
    <link href="../resources/css/style_manage.min.css" rel="stylesheet">
</head>

<body>
<c:import url="../template/header.jsp"></c:import>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
		<c:import url="../template/sidebar.jsp"></c:import>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <!-- <div class="container-fluid">  -->
                <!-- ============================================================== -->
                <!-- RECENT SALES -->
                <!-- ============================================================== -->
                <!-- <div class="row">
                    <div class="col-lg-12"> -->
                        <div class="container-fluid" style="padding-top: 100px; background-color: white;">
                            <div class="d-md-flex mb-3">
                                <h3 class="box-title mb-0">회원 등급 관리</h3>
                                <div class="col-md-3 col-sm-4 col-xs-6 ms-auto">
                  <!--                   <select class="form-select shadow-none row border-top">
                                        <option>March 2021</option>
                                        <option>April 2021</option>
                                        <option>May 2021</option>
                                        <option>June 2021</option>
                                        <option>July 2021</option>
                                    </select> -->
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table no-wrap">
                                    <thead>
                                       <tr>
											<th scope="col">아이디</th>
											<th scope="col">비밀번호</th>
											<th scope="col">회원 이름</th>
											<th scope="col">전화번호</th>
											<th scope="col">이메일</th>
											<th scope="col">현재 등급</th>
											<th scope="col">변경할 등급</th>
											<th scope="col">등급 변경</th>
										</tr>
                                    </thead>
                                    <tbody class="table-group-divider" id="btn">
                                     	<c:forEach items="${list}" var="dto" varStatus="i">
											<tr>
                                                <td>${dto.id}</td>
                                                <td>${dto.pw}</td>
                                                <td>${dto.name}</td>
                                                <td>${dto.phone}</td>
                                                <td>${dto.email}</td>
                                                <td>${dto.roleName}</td>
                                                <td>
                                                <input type="hidden" name="id" value="${dto.id}">
                                                <input type="hidden" name="pw" value="${dto.pw}">
                                                <input type="hidden" name="name" value="${dto.name}">
                                                <input type="hidden" name="phone" value="${dto.phone}">
                                                <input type="hidden" name="email" value="${dto.email}">
                                                <select id="roleName${i.count}" name="roleName">
                                                <option value="MEMBER" ${dto.roleName eq 'MEMBER' ? 'selected' : ''}> MEMBER</option>
                                                <option value="MANAGER" ${dto.roleName eq 'MANAGER' ? 'selected' : ''}>MANAGER</option>
                                                <option value="CAMPMANAGER" ${dto.roleName eq 'CAMPMANAGER' ? 'selected' : ''}>CAMPMANAGER</option>
                                                </select>
                                                  </td>
                                                  <td>
                                                  <input id="roleNamechange" type="button" class="btn btn-success change" value="변경" data-role-num="${i.count}" data-role-id="${dto.id}"/>
                                                  </td>
                                            </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                                
					                                										<!-- 페이징 -->
								<div class="row">
									<nav aria-label="Page navigation example">
									  <ul class="pagination justify-content-center">
									   <li class="page-item ${pager.before ? 'disabled':''}">
									      <a class="page-link" aria-label="Previous" href="./memberList?page=1">
									      	<span aria-hidden="true">&laquo;</span>
									      </a>
									   	</li>
									    <li class="page-item ${pager.before ? 'disabled':''}">
						   			      <a class="page-link" aria-label="Previous" href="./memberList?page=${pager.startNum-1}">
									      	<span aria-hidden="true">&lsaquo;</span>
									      </a>
									   	</li>
									   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
									    <li class="page-item"><a class="page-link" href="./memberList?page=${i}">${i}</a></li>
									    </c:forEach>
									    <li class="page-item ${pager.after ? 'disabled':''}">
						   			      <a class="page-link" aria-label="Previous" href="./memberList?page=${pager.lastNum+1}">
									      	<span aria-hidden="true">&rsaquo;</span>
									      </a>
									   	</li>
						 			    <li class="page-item ${pager.after ? 'disabled':''}">
						   			      <a class="page-link" aria-label="Previous" href="./memberList?page=${pager.totalPage}">
									      	<span aria-hidden="true">&raquo;</span>
									      </a>
									   	</li>
									  </ul>
									</nav>
								</div>
								
								<!-- 검색창 -->
								<div class="row">
									<form class="row col-md-7 mx-auto" action="./memberList" method="get">
										<div class="col-auto">
											<label for="kind" class="visually-hidden">Kind</label> 
											<select class="form-select" name="kind" id="kind" aria-label="Default select example">
												<option value="name" ${pager.kind eq 'name' ? 'selected' : ''}>회원 이름</option>
												<option value="id" ${pager.kind eq 'id' ? 'selected' : ''}>회원 아이디</option> </select>						
										</div>
										<div class="col-auto">
											<label for="search" class="visually-hidden">Search</label>
											<input type="text" class="form-control" id="search" name="search" placeholder="검색어를 입력하세요">
										</div>
										<div class="col-auto">
											<button type="submit" class="btn btn-success mb-3">검색</button>
										</div>
									</form>
								</div>
                            </div>
                        </div>
                    <!-- </div>
                </div> -->
                <!-- ============================================================== -->
                <!-- Recent Comments -->
                <!-- ============================================================== -->
            <!-- </div> -->
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../resources/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/js/app-style-switcher.js"></script>
    <script src="../resources/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="../resources/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../resources/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../resources/js/custom.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    
    <script src="../resources/plugins/bower_components/chartist/dist/chartist.min.js"></script>
    <script src="../resources/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="../resources/js/pages/dashboards/dashboard1.js"></script>
	<script src="../resources/js/roleNameUpdate.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
    <c:import url="../template/footer.jsp"></c:import>
</body>

</html>