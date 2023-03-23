let boardName = $('#boardName').attr('data-board-name');
let commentNum = 0;
let page = 1;
let writer = '';
let num = 0;

function setNum(n) {
    num = n;
}

getList(1);

//댓글 등록
$('#replyAdd').click(function(){


    $.ajax({
        type : 'POST',
        url : '../'+ boardName + 'Comment/add',
        data : {
            num : $('#replyAdd').attr('data-board-num'),
            contents : $('#replyContents').val(),
        },
        success : function(response) {
            if(response.trim() == 1) {
                alert('댓글이 등록되었습니다');
                $('#replyContents').val('');
                getList(1);
            }
            else {
                alert('댓글 등록 실패');
            }
        },

        error : ()=> {
            alert("댓글 등록 실패. 관리자에게 문의하세요");
        }  
    })
})




//리스트 가져오기
function getList(page) {

    $.ajax({
        type : 'GET',
        url : '../'+boardName + 'Comment/list?num=' + $('#replyAdd').attr('data-board-num') + '&page=' + page,
        success : function(response) {
            $('#commentList').html(response);                                                                         
        }

    })
}

//페이징
$('#commentList').on('click','.page-link', function(e){
    page = $(this).attr('data-board-page');
    getList(page);

    e.preventDefault();

})



//댓글 메뉴 토글
//commentNum에 값이 새로 대입되는것을 방지하기위해 
//탐색 선택자를 이용해서 요소를 선택해서 토글
$('#commentList').on('click', '.btnToggle', function(){

    // commentNum = $(this).attr('data-comment-num');
    // $('#commentMenu'+commentNum).slideToggle();
   $(this).parent().next().slideToggle();
})

//댓글 삭제
$('#commentList').on('click', '.deleteMenu', function(){
    commentNum = $(this).attr('data-comment-num');

    $('#commentMenu'+commentNum).hide();

    let delConfirm = confirm('댓글을 삭제하시겠습니까?');

    if(delConfirm) {
        $.ajax({
            type : 'POST',
            url : '../' + boardName + 'Comment/delete',
            data : {
                commentNum : commentNum
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert("댓글이 삭제되었습니다.");
                    getList(page);
                }
                else {
                    alert("삭제 실패");
                }
            }
        })
    }
    else {
        return;
    }

})

//댓글 업데이트
$('#commentList').on('click', '.updateMenu', function(){
    // getList(1);
    setResetForm(commentNum);
    setSubCommentResetForm(commentNum);
    commentNum = $(this).attr('data-comment-num');
    $('#commentMenu'+commentNum).hide();
    getUpdateForm(commentNum);

})

////댓글 업데이트폼 취소버튼
$('#commentList').on('click', '.commentCancle', function(){
    commentNum = $(this).attr('data-comment-num');
    setResetForm(commentNum);
})

////댓글 업데이트폼 확인버튼
$('#commentList').on('click', '.commentUpdate', function(){
    commentNum = $(this).attr('data-comment-num');
    
    $.ajax({
        type : 'POST',
        url : '../'+boardName+'Comment/update',
        data : {
            commentNum : commentNum,
            contents : $('#commentContents'+commentNum).val()
        },
        success : function(response){
            if(response.trim() > 0) {
                alert('댓글이 수정되었습니다');
                getList(page);

            }
            else {
                alert('댓글 수정 실패. 관리자에게 문의하세요');
            }
        }
    })
})



////댓글 업데이트폼 불러오기
function getUpdateForm(commentNum) {
    
    let text = $('#contents'+commentNum).text();

    console.log('UpdateFormNum : ' + commentNum);


    
    let htmls = '<section class="mb-5 mx-2" id="updateForm'+commentNum+'">';
    htmls += '<div class="card bg-light">';
    htmls += '<div class="d-flex">';
    htmls += '<span class="me-auto p-2 fw-bold">qwdfd';
    htmls += '</span>';
    htmls += '<span class="p-2">';
    htmls += '<button class="btn btn-outline-danger commentCancle" data-comment-num="'+commentNum+'">취소</button>';
    htmls += '</span>';
    htmls += '</div>';
        
    

    htmls += '<div class="card-body">'
    htmls += '<textarea class="form-control mb-3" rows="3" id="commentContents'+commentNum+'" name="contents" placeholder="댓글 입력">'+text+'</textarea>' ;
    htmls += '</div>';
    htmls += '<div class="mb-3">';
    htmls += '<button class="btn btn-outline-primary col-auto offset-md-11 commentUpdate" data-comment-num="'+commentNum+'">수정</button>';
    htmls += '</div></section>';
            

    $('#contents'+commentNum).replaceWith(htmls);
    // $('#comments'+commentNum).replaceWith(htmls);
}

////업데이트폼 원래대로 돌려놓기
function setResetForm(commentNum) {
    console.log('ResetFormNum' + commentNum);
    let htmls = '<div id="contents'+commentNum+'">'+$('#commentContents'+commentNum).text()+'';
    htmls += '</div>'

    $('#updateForm'+commentNum).replaceWith(htmls);
}



//대댓글
//대댓글 폼 가져오기
$('#commentList').on('click','.subCommentMenu', function(){
    
    setSubCommentResetForm(commentNum);
    setResetForm(commentNum);

    commentNum = $(this).attr('data-comment-num');

    $('#commentMenu'+commentNum).hide();
    getSubCommentForm(commentNum);

  


})

//대댓글 폼 취소버튼
$('#commentList').on('click','.subCommentCancle', function(){
    commentNum = $(this).attr('data-comment-num');
    setSubCommentResetForm(commentNum);
})

//대댓글 등록버튼
$('#commentList').on('click','.subCommentAdd', function(){
    commentNum = $(this).attr('data-comment-num');
    contents = $('#subCommentContents'+commentNum).val();
    writer = "qwdfd1";

    console.log('Num : ' + num);

    $.ajax({
        type : 'POST',
        url : '../'+boardName+'Comment/subCommentAdd',
        data : {
            commentNum : commentNum,
            contents : contents,
            writer : writer
        },
        success : function(repsonse) {
            if(repsonse.trim()>0) {
                alert('댓글이 등록되었습니다.');
                getList(page);
            }
            else {
                alert('댓글 등록 실패. 관리자에게 문의하세요');
            }
        }
    })
})


function getSubCommentForm(commentNum) {
    let htmls = '<section class="mb-5 mx-2" id="subCommentForm'+commentNum+'">';
    htmls += '<div class="card bg-light">';
    htmls += '<div class="d-flex">';
    htmls += '<span class="me-auto p-2 fw-bold">qwdfd';
    htmls += '</span>';
    htmls += '<span class="p-2">';
    htmls += '<button class="btn btn-outline-danger subCommentCancle" data-comment-num="'+commentNum+'">취소</button>';
    htmls += '</span>';
    htmls += '</div>';
        
    

    htmls += '<div class="card-body">'
    htmls += '<textarea class="form-control mb-3" rows="3" id="subCommentContents'+commentNum+'" name="contents" placeholder="댓글 입력"></textarea>' ;
    htmls += '</div>';
    htmls += '<div class="mb-3">';
    htmls += '<button class="btn btn-outline-primary col-auto offset-md-11 subCommentAdd" data-comment-num="'+commentNum+'">작성</button>';
    htmls += '</div></section>';

    $('#contents'+commentNum).after(htmls);
}

function setSubCommentResetForm(commentNum) {
    $('#subCommentForm'+commentNum).remove();
}

