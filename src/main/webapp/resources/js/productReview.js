let count = 0;
let max = 0;
let idx = 0;
let param = '';

function setParam (p) {
    param = p;
}

function setMax(m) {
    max = m;
}

function setCount(c) {
    count = c;
}

$('#addPic').click(function(){

    if(count >= max) {
        alert('파일은 ' + max + '개만 첨부할 수 있습니다');
        return;
    }
    child = '<div class="row mb-2" id="d'+idx+'">';
    child = child + '<div class="input-group mb-2 col-sm-">';
    child = child + '<input type="file" class="form-control" name="'+param+'">'
    child = child + '<button class="dels btn btn-outline-danger" type="button" data-delete-id="'+idx+'">X</button>';
    child = child + '</div></div>'

    $('#picList').prepend(child);

    idx++;
    count++;
})

$('#picList').on('click', '.dels', function(){
    let fileId = $(this).attr('data-delete-id');
    $('#d'+fileId).remove();
    count--;
})

$('.deleteCheck').click(function(){
    let result = confirm("파일이 영구삭제 됩니다\n삭제하시겠습니까?");
    let ch = $(this);

    if(result) {
        let fileNum = ch.val();

        $.ajax({
            type : 'POST',
            url : './boardFileDelete',
            data : {
                fileNum : fileNum
            },
            success : function(response){
                if(response.trim()>0) {
                    ch.parent().parent().remove();
                    count--;
                    alert('삭제되었습니다');
                }
                else {
                    alert('삭제 실패');
                }
            }

            

        })
    }
})

// 댓글 등록
$('#addReview').click(()=>{
    let form=$('#reviewForm').serialize();
    console.log(form)
    $.ajax({
        type : 'POST',
        url : '../product/review/add',
        data : form,
        success : function(){
            if(response.trim() == 1) {
                alert('리뷰가 등록되었습니다');
            } else {
                alert('리뷰 등록 실패');
            }
        },
        error : ()=>{
            alert('댓글 등록 실패, 관리자에게 문의하세요')
        }
    })
})