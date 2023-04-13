<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<link rel="icon" href="/resources/images/logo.png" type="image/png">   <meta name="viewport" content="width=device-width, initial-scale=1">
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
<link href="../resources/css/style_manage.min.css" rel="stylesheet">
<link href="../resources/css/style.min.css" rel="stylesheet">
<title>The Camp</title>
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
            <!-- <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                </div> -->
                <!-- /.col-lg-12 -->
            <!-- </div> -->
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid" style="margin-top : 90px;"> 
                <!-- ============================================================== -->
                <!-- RECENT SALES -->
                <!-- ============================================================== -->
					
					<div class="row col-md-8 mx-auto">
							<div class="row mb-3">
							  <label for="reporter" class="col-sm-2 col-form-label">신고자</label>
							  <div class="col-sm-10">
							  	<p>${dto.reporter}</p>
							  </div>
							</div>
							
							<div class="row mb-3">
							  <label for="reportType" class="col-sm-2 col-form-label">신고유형</label>
								  <div class="col-sm-10">
								  	<p>${dto.reportType}</p>
								  </div>
							</div>
									
							
							<div class="mb-5">
							  <label for="reportContents" class="form-label">신고사유</label>
							  <textarea class="form-control" name="reportContents" id="reportContents" rows="8" readonly>${dto.reportContents}</textarea>
							</div>
							
							<div class="mb-5">
							  <label for="reportedContents" class="form-label">신고글 내용</label>
							  <textarea class="form-control" name="reportedContents" id="reportedContents" rows="8" readonly>${dto.reportedContents}</textarea>
							</div>
							
							
							<button type="button" class="btn genric-btn success accept" value="3" data-report-num="${dto.reportNum}" data-board-num="${dto.num}" data-comment-num="${dto.commentNum}">승인</button>
							
							<button type="button" class="btn genric-btn primary denied" value="2" data-report-num="${dto.reportNum}" data-board-num="${dto.num}" data-comment-num="${dto.commentNum}">거절</button>
						
			
					</div>
                <!-- ============================================================== -->
                <!-- Recent Comments -->
                <!-- ============================================================== -->
            </div>
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
	<script src="../resources/js/report.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>	
	
	
</body>
</html>