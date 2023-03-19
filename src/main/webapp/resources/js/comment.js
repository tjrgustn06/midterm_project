let boardName;

function setBoardName(b) {
    boardName = b;
}







function getList() {

    $.ajax({
        type : 'GET',
        url : boardName + 'Comment/list?num' + $('#replyAdd').attr('data-board-num'),
        success : function(response) {
            $('#commentList').html(response);                                                                         
        }

    })
}