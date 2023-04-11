
$('#delete').click(function(){
    console.log('check')
    let check = window.confirm("탈퇴 하시겠습니까?");

    $.ajax({
        type: 'POST',
        url: './memberDelete',
        data :{
            id : $("#id").val()
        },
        success : function(response){
            if(response.trim()>0){
                alert('탈퇴가 완료 되었습니다')
                location.href = "/"
            }
            else{
                alert('탈퇴 실패');
            }
        }
    })
})