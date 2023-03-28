$('#doName').change(function(){
    if($('#doName').val() != '') {
        $.ajax({
            type : 'GET',
            url : '/camp/doNameList',
            data : {
                doName : $('#doName').val()
            },
            success : function(data){
                
            }
        })
    }
})