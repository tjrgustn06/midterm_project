
$('#delete').click(function(){
    console.log('check')
    let check = window.confirm("삭제하시겠습니까?");

    if(check) {
    $.ajax({
        type: 'POST',
        url: './delete',
        data :{
            pw : pw
        },
        success : function(response){
            if(response.trim()>0){
                alert('탈퇴가 완료 되었습니다')
                location.href = "home"
            }
            else{
                alert('탈퇴 실패');
            }
        }
    })
    }
})