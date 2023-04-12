
getStoryList(1)

function getStoryList(page){
    $.ajax({
        type : 'GET',
        url : '/story/storyListTop?page='+page,
        success : function(response){
            $('#storyList').html(response); 
        }
    })
}

