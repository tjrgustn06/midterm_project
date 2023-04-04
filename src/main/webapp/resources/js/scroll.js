let currentPage = 1;
let prePage = 0;
let oneTime = false;

let lastScroll = 0;

// function setCurrentPage(c) {
//     currentPage = c;
// }


$(document).scroll(function(){

    //현재 높이 저장
    let currentScorll = $(window).scrollTop();

    //전체 문서의 높이
    let maxHeight = $(document).height();

    //현재 화면 높이 + 현재 상단 높이
    let nowHeight = currentScorll + $(window).height();

 

        oneTime = true;

        if(maxHeight <= nowHeight + 100) {
            console.log("스크롤 이벤트")
            currentPage++;
            getList(currentPage);

        lastScroll = currentScorll;
    
    }
})






    
        
    // if($(window).scrollTop() == $(document).height() - $(window).height() && !oneTIme) {
    //     prePage = currentPage;
    //     currentPage++;
    //     console.log("스크롤 이벤트")
    //     $.ajax({
    //         type : 'GET',
    //         url : './listPage',
    //         data : {
    //             page : currentPage
    //         },
    //         success : function(response){
    //             $('#storyList').append(response.trim());
                
    //         }
            
    // })
    // }

function getList(page) {
        
        // prePage = currentPage;
        // currentPage++;

        $.ajax({
            type : 'GET',
            url : './listPage',
            data : {
                page : page
            },
            success : function(response){
                $('#storyList').append(response);
                // page++;
            }
            
    })
    
}