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
{/* <select class="form-select" aria-label="Default select example" name="amount" id="amount">
	<option value="1" selected>1개</option>
	<option value="2">2개</option>
	<option value="3">3개</option>
	<option value="4">4개</option>
	<option value="5">5개</option>
</select> */}
function getAmount(){
    child='<select class="form-select" aria-label="Default select example" name="amount" id="amount"'
    child=child+'<option value="1" selected>1개</option>'
    child=child+'<option value="2">2개</option>'
    child=child+'<option value="3">3개</option>'
    child=child+'<option value="4">4개</option>'
    child=child+'<option value="5">5개</option>'
    child=child+'</select>'
}