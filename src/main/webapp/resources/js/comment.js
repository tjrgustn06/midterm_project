let boardName;

function setBoardName(b) {
    boardName = b;
}


getList();

$('#replyAdd').click(function(){

  

    $.ajax({
        type : 'POST',
        url : boardName + 'Comment/add',
        data : {
            num : $('#replyAdd').attr('data-board-num'),
            contents : $('#replyContents').val(),
        },
        success : function(response) {
            if(response.trim() == 1) {
                alert('댓글이 등록되었습니다');
                $('#replyContents').val('');
                getList();
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





function getList() {

    $.ajax({
        type : 'GET',
        url : boardName + 'Comment/list?num=' + $('#replyAdd').attr('data-board-num'),
        success : function(response) {
            $('#commentList').html(response);                                                                         
        }

    })
}

