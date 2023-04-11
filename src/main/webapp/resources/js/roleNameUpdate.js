
$('#roleNamechange').click(function(){
    console.log('check')
    let check = window.confirm("변경 하시겠습니까?");


    $.ajax({
        type: 'POST',
        url: './roleNameUpdate',
        data :{
            roleName : $("#roleName").val()
        },
        success : function(response){
            if(response.trim()>0){
                alert('변경되었습니다')
                location.href = "./memberList"
            }
            else{
                alert('변경 실패');
            }
        }
    })
})