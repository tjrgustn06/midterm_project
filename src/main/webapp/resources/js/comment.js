let boardName = $('#boardName').attr('data-board-name');
let commentNum;


getList(1);

//댓글 등록
$('#replyAdd').click(function(){


    $.ajax({
        type : 'POST',
        url : '../'+ boardName + 'Comment/add',
        data : {
            num : $('#replyAdd').attr('data-board-num'),
            contents : $('#commentsContents').val(),
        },
        success : function(response) {
            if(response.trim() == 1) {
                alert('댓글이 등록되었습니다');
                $('#commentsContents').val('');
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
    let page = $(this).attr('data-board-page');
    getList(page);

    e.preventDefault();

})



//댓글 메뉴 토글
$('#commentList').on('click', '.btnToggle', function(){

    commentNum = $(this).attr('data-comment-num');
    $('#commentMenu'+commentNum).slideToggle();
})

//댓글 삭제
$('#commentList').on('click', '.delete', function(){
    
    let delConfirm = confirm('댓글을 삭제하시겠습니까?');

    if(delConfirm) {
        $.ajax({
            type : 'POST',
            url : '../' + boardName + 'Comment/delete',
            data : {
                commentNum : $(this).attr('data-comment-num')
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert("댓글이 삭제되었습니다.");
                    getList(1);
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

//댓글 수정 
$('#commentList').on('click', '.update', function(){
    let commentNum = $(this).attr('data-comment-num');
    $('#commentMenu'+commentNum).hide();
    let text = $('#contents'+commentNum).text();

    let htmls =  '<td class="col-md-5">';
    htmls += '<textarea class="form-control" name="contents" id="updateContents" cols="20" rows="1">'+text+'</textarea></td>';
    $('#contents'+commentNum).replaceWith(htmls);
})

