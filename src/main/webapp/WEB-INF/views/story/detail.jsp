<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

						
						
<a type="button" class="getDetail" data-board-num="${dto.num}" data-bs-toggle="modal" data-bs-target="#exampleModal${dto.num}">
    댓글 더 보기 
</a >

<div class="card-body my-1">							
    <form action="../${boardName}Comment/add" method="Post">
        <input type="hidden" name="writer" value="${member.id}">
        <input class="border border-0" type="text" style="font-size: 13px;" name="contents" value="" placeholder="댓글 달기...">
    </form>
</div>





<!-- Modal -->

    <div class="modal fade" id="exampleModal${dto.num}" tabindex="-1" aria-labelledby="exampleModalLabel${dto.num}" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel${dto.num}">${dto.writer}님의 게시물</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex flex-column mb-3">
                    <div class="card col-md-5 mx-5">
                      <div class="card-body">
                        <div class="" style="height: 30px;">
                            <span class="card-title" style="float: left;">${dto.writer}</span>
                            <span class="card-title calcDate"  style="float: right;"id="reg${dto.num}" data-board-num="${dto.num}">
                                ${dto.regDate}
                                <script>
                                    function getDateDiff(d2) {
                                        let now = new Date();									
                                        let date2 = new Date(d2);
        
                                        let diffDate = now.getTime() - date2.getTime();
                                        let currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
                                        
                                        return parseInt(diffDate/currDay);
                                        }
    
                                    $(document).ready(function(){
                                        let regDate = '${dto.regDate}';
                                        let date = getDateDiff(regDate);
                                        $('#reg'+'${dto.num}').text(date + "일전");
                                    })
    
                                
                                
                                </script>
                            </span>
                        </div>
                        <c:if test="${!empty dto.boardFileDTOs}">
                            <div id="carouselExampleInterval${dto.num}" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
                                        <c:if test="${i.first}">
                                              <div class="carousel-item active" data-bs-interval="100000">
                                                <img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
                                              </div>
                                        </c:if>
                                        <c:if test="${!i.first}">
                                              <div class="carousel-item" data-bs-interval="100000">
                                                <img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
                                              </div>
                                        </c:if>
    
                                    </c:forEach>
                                </div>
                          </div>
                        
                            <button class="carousel-control-prev" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                              </button>
                              <button class="carousel-control-next" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                              </button>
                          
                    
                    </c:if>
                    </div>
                    <p class="card-text">${dto.contents}</p>
            
                </div>
                
            </div>
            <div class="modal-footer">
                <div class="card-body my-1">							
                    <form action="../${boardName}Comment/add" method="Post">
                        <input type="hidden" name="writer" value="${member.id}">
                        <input class="border border-0" type="text" style="font-size: 13px;" name="contents" value="" placeholder="댓글 달기...">
                    </form>
                </div>
            </div>
            </div>
            </div>
        </div>
    
    
    
        </div>
  

                    <script src="../resources/js/storyComment.js"></script> -->