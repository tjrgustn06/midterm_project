let currentPage = 2;
let prePage = 0;
let flag = true;
let boardName = $('#boardName').attr('data-board-name');
let totalPage = 0;

let lastScroll = 0;

function setTotalPage(tp) {
    totalPage = tp;
}


$(document).scroll(function(){

    //현재 높이 저장
    let currentScorll = $(window).scrollTop();

    //전체 문서의 높이
    let maxHeight = $(document).height();
    

        if(currentScorll > maxHeight * 0.5 && flag && currentPage <= totalPage) {
                getList(currentPage);
                currentPage++;
            
    }
})


    
function getList(page) {



    flag = false;

    console.log(currentPage);

    $.ajax({
        type : 'GET',
        url : './listPage',
        data : {
            page : page
        },
        success : function(response){
            $('#storyList').append(response);
            setTimeout(function(){
                flag = true;
            },1000)
        }
        
})

}


