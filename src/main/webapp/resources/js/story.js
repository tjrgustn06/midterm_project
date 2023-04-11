let num = 0;
// let boardName = $('#boardName').attr('data-board-name');
let boardId = 0;

function setBoardId(bi) {
    boardId = Number(bi);
}



$('#storyList').on('click', '.btnToggle', function(){

   $(this).parents('#storyList').find('#boardMenu'+$(this).attr('data-board-num')).slideToggle();
})

$('#storyList').on('click', '.delete', function(){
    let check = window.confirm("삭제하시겠습니까?");

    if(check) {
        num = $(this).attr("data-board-num");

        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                num : num
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert('글이 삭제되었습니다')
                    location.href = "./list"
                }
                else {
                    alert("삭제 실패");
                }
                    
            }
        })
    }
})

$('#storyList').on('click','.update', function(){
    
    num = $(this).attr('data-board-num');

    location.href="./update?num="+num;
})

$('#storyList').on('click', '.report', function(){
    num = $(this).attr('data-board-num');
    let reportedUser = $(this).attr('data-board-writer');
    reportAdd(num, boardId, reportedUser);
    
})


function getCommentCount(num) {
    $.ajax({
        url : '../'+boardName+'Comment/listCount',
        type : 'GET',
        data : {
            num : num,
        },
        success : function(data){
            $('a[id="getDetail"'+num+']').text('댓글' + data.trim() + '개 모두 보기');
        }
    })
}







