$('#storyList').on('click', '.getDetail', function(e){
    e.preventDefault();
    boardNum = $(this).attr('data-board-num');
    

    // if(oldNum == boardNum) {
    //     commentPage = oldPage;
    // }

    // $.ajax({
    //     type : 'GET',
    //     url : '/' +boardName + '/detail',
    //     data : {
    //         num : boardNum
    //     },
    //     success : function(response){
    //         $('#storyDetail'+boardNum).append(response);
    //     },
    //     error : function(){
    //         alert("에러에러에러");
    //     }
    // })
    
    $.ajax({
        type : "GET",
        url : '../'+boardName+'Comment/list',
        data : {
            num : boardNum,
            page : 1,
            perPage : 20
        },
        success : function(response){
            
        }
    })
    
  
})