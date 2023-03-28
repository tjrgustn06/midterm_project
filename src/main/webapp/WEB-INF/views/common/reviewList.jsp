<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-6 offset-md-3">
		
		
			<c:choose>
			  		<c:when test="${not empty reviewList}">
					<div>
						<p>평점 평균</p>
						<div class="starRate" id="starAvg">
							<span class="starMark">★</span>
							<span class="starMark">★</span>
							<span class="starMark">★</span>
							<span class="starMark">★</span>
							<span class="starMark">★</span>
						</div>
						<p id="reviewAvg"></p>
					</div>
					  	<c:forEach items="${reviewList}" var="dto">
							<div>
								<div class="d-flex">
									<span class="flex-shrink-0" id="comments${dto.num}"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></span>
									<span class="me-auto p-2 fw-bold" id="reviewWriter">${dto.writer}</span>
									<span class="p-2">${dto.regDate}</span>
									<span class="p-2" id="reviewMark${dto.num}" data-review-mark="${dto.mark}">평점 : ${dto.mark}</span>
									<span class="p-2">
										<button class="btnToggle" style="border : 0px; background-color: transparent;" data-comment-num="${dto.num}">
											<img alt="토글 버튼" src="/resources/images/menu/kebobMenu.png" style="width:12px; height:12px;">
										</button>
									</span>
												
									<span class="p-2 reviewMenu" id="reviewMenu${dto.num}" style="display: none;">
										<div class="list-group">
											<button type="button" class="list-group-item list-group-item-action updateMenu" data-review-num='${dto.num}'aria-current="true">수정</button>
											<button type="button" class="list-group-item list-group-item-action deleteMenu" data-review-num='${dto.num}'>삭제</button>
											<button type="button" class="list-group-item list-group-item-action accuseMenu" data-review-num='${dto.num}'>신고하기</button>
										</div>
									</span>
								</div>
								<div>
									<div id="contents${dto.num}">
										${dto.contents}
									</div>
									<div id="">
										<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
											<img style="width: 30%; height: 30%;" alt="" src="../resources/upload/product/review/${fileDTO.fileName}">
										</c:forEach>
									</div>
								
								</div>
								
							</div>	
					  	</c:forEach>
				  	</c:when>
				 	<c:otherwise>
				 		<tr height="200px">
				 			<td class="align-middle text-center" colspan="20">검색 결과가 없습니다.</td>
				 		</tr>
				 	</c:otherwise>
			  	</c:choose>
		
</div>

	<!-- 페이징 -->
	<div class="reviewList">
		<div class="row">
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item ${pager.before ?'disabled':''}">
							<a class="page-link" href="#" aria-label="Previous" data-review-page="1">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="page-item ${pager.before ?'disabled':''}">
							<a class="page-link" href="#" aria-label="Previous" data-review-page="${pager.startNum-1}">
								<span aria-hidden="true">&lsaquo;</span>
							</a>
						</li>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li class="page-item"><a class="page-link" href="#" data-review-page="${i}">${i}</a></li>	
						</c:forEach>
						<li class="page-item ${pager.after eq false ? 'disabled':''}">
							<a class="page-link" href="#"  aria-label="Next" data-review-page="${pager.lastNum+1}">
								<span aria-hidden="true">&rsaquo;</span>
							</a>
						</li>
						<li class="page-item ${pager.after eq false ? 'disabled':''}">
							<a class="page-link" href="#"  aria-label="Next" data-review-page="${pager.totalPage}">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script>
		makeMarkAvg()
		function makeMarkAvg(){
			let mark=0;
			let markAvg=0;
			let i=0;
			<c:forEach items="${reviewList}" var="mark">
				mark=mark+${mark.mark};
				i++
			</c:forEach>
			markAvg=mark/i
			$('#reviewAvg').html(markAvg)
			$('#starAvg').attr('data-review-avg',markAvg)
		}
		
		
		starRating($('#starAvg').attr('data-review-avg'))
		function starRating(score){
    
			$('.starMark').each((index,item)=>{
				if(index<=score){
					$(item).attr('style','color: red;')
				} else {
					$(item).removeAttr('style');
				}
			})
		}
	
		
		
	
			
		
	</script>
	