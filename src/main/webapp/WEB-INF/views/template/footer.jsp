<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--================ start footer Area  =================-->	
<footer class="footer-area section_gap">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-footer-widget">
					<h6 class="footer_title">소개글</h6>
					<p>좋은말을 적어주세요</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-footer-widget">
					<h6 class="footer_title">Navigation Links</h6>
					<div class="row">
						<div class="col-4">
							<ul class="list_style">
								<li><a href="/">Home</a></li>
								<li><a href="/camp/list">CampBook</a></li>
								<li><a href="/story/list">CampingStory</a></li>
							</ul>
						</div>
						<div class="col-4">
							<ul class="list_style">
								<li><a href="/notice/list">Notice</a></li>
								<li><a href="/product/list">Rent</a></li>
								<li><a href="/qna/list">Qna</a></li>
							</ul>
						</div>										
					</div>							
				</div>
			</div>							
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-footer-widget storyfeed">
					<h6 class="footer_title">STORYFEED</h6>
					<div id="storyfeed">
					</div>
				</div>
			</div>
							
		</div>
		<div class="border_line"></div>
		<div class="row footer-bottom d-flex justify-content-between align-items-center">
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<p class="col-lg-8 col-sm-12 footer-text m-0">
			Copyright &copy;<script>document.write(new Date().getFullYear());</script> The Camp. All rights reserved 
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			<div class="col-lg-4 col-sm-12 footer-social">
				<a href="#"><i class="fa-brands fa-instagram"></i></a>
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
			</div>
		</div>
	</div>
	<script>
		function getStoryfeed(page){
			$.ajax({
				type : 'GET',
				url : '../../../../story/storyfeed?page='+page,
				success : (response)=>{
					$('storyfeed').html(response)
				}
				
			})
		}
		getStoryfeed(1)
		
	</script>
</footer>
<!--================ End footer Area  =================-->