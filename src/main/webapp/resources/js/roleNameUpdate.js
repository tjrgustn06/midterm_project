
$('#btn').on('click','.change' ,function(){
    let id = $(this).attr('data-role-id')
    let num = $(this).attr('data-role-num')
    let roleName = $('#roleName'+num).val()

    console.log(id)
    console.log(roleName)
    let check = window.confirm("변경 하시겠습니까?");

    if(check){

    $.ajax({
        type: 'POST',
        url: './roleNameUpdate',
        data :{
            id : id,
            roleName : roleName
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
}

})