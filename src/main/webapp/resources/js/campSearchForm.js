$('#doName').change(function(){


    if($('#doName').val() != '') {
        $.ajax({
            type : 'GET',
            url : '/camp/doNameList',
            data : {
                doName : $('#doName').val()
            },
            dataType : 'JSON',
            success : function(data){
                $('#sigunguName').empty();
                let str = '<option value="">전체</option>';
                $(data).each(function() {
                    console.log(this.doName + this.sigunguName);
                    str += '<option value="'+this.sigunguName+'">'+this.sigunguName+'</option>';
                });
                $('#sigunguName').append(str);
            },
            error : function(){
                alert('Request Error!');
            }
        })
    }
})