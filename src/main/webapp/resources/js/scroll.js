let currentPage = 1;
let prePage = 0;
let flag = true;

let lastScroll = 0;


$(document).scroll(function(){

    //현재 높이 저장
    let currentScorll = $(window).scrollTop();

    //전체 문서의 높이
    let maxHeight = $(document).height();
    

        if(currentScorll > maxHeight * 0.001 && flag) {
            
                currentPage++;
                getList(currentPage);
            
    }
})


    
function getList(page) {

    flag = false;

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


