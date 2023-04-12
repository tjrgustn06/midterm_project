
$('#delete').click(function(){
    
    let check = window.confirm("삭제하시겠습니까?");

    if(check) {
        let num = $(this).attr("data-delete");

        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                num : num
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert('글이 삭제되었습니다')
                    location.href = "./list"
                }
                else {
                    alert("삭제 실패");
                }
                    
            }
        })
    }
})

$('#addFrm').submit(function(e){
    e.preventDefault();

    let chk = chkValidation();

    if(chk) {
        $(this).unbind('submit').submit();
    }
})

function chkValidation(){
    //유효성 체크가 필요한 element가져오기
    let title = $('#title').val();
    let contents = $('#contents').val();

    let chk = true;



    if(title == '') {
        alert('제목을 입력해주세요');
        chk = false;
        return chk;
    }

    if(contents == '') {
        alert('글 내용을 입력해주세요')
        chk = false;
        return chk;
    }
    
    return chk;
}