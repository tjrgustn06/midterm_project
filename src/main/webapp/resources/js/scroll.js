currentPage = 1;
prePage = 0;
oneTIme = false;

$(window).scroll(function(){
        
    if($(window).scrollTop() == $(document).height() - $(window).height() && !oneTIme) {
        prePage = currentPage;
        currentPage++;
        $.ajax({
            type : 'GET',
            url : './listPage',
            data : {
                page : currentPage
            },
            success : function(response){
                $('#storyList').append(response.trim());
                
            }
            
    })
    }
})