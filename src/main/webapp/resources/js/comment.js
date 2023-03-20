let boardName;

function setBoardName(b) {
    boardName = b;
}


getList();

$('#replyAdd').click(function(){

    console.log('boardNum : ' + $('#replyAdd').attr('data-board-num'))
    console.log('Contents : ' + $('#replyContents').val())

    // $.ajax({
    //     type : 'POST',
    //     url : boardName + 'Comment/add',
    //     data : {
    //         num : $('#replyAdd').attr('data-board-num'),
    //         contents : $('#replyContents').val(),
    //     }

        
        
        
    // })
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

