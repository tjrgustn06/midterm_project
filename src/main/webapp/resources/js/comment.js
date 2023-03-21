let boardName = $('#boardName').attr('data-board-name');



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
    let page = $(this).attr('data-board-page');
    getList(page);

    e.preventDefault();

})

//댓글 메뉴
$('#commentList').on('click', '.btnToggle', function(){
    let commentNum = $(this).attr('data-comment-num');
    console.log(commentNum);
    $('#commentMenu'+commentNum).toggle();
})

