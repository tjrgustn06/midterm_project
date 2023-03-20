
$('#delete').click(function(){
    console.log('check')
    let check = window.confirm("삭제하시겠습니까?");

    if(check) {
        let productNum = $(this).attr("data-delete");

        // $('#frm').attr('action', './delete');
        // $('#frm').attr('method', 'post');
        
        // $('#frm').submit();
        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                productNum : productNum
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert('삭제되었습니다')
                    location.href = "./list"
                }
                else {
                    alert("삭제 실패");
                }
                    
            }
        })
    }
})