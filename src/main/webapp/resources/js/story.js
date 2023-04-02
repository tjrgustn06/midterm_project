let num = 0;


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