
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

$('#addBtn').click(function(){

    if(count >= max) {
        alert('파일은 ' + max + '개만 첨부할 수 있습니다');
        return;
    }
    child = '<div class="row mb-2" id="d'+idx+'">';
    child = child + '<div class="input-group mb-2 col-sm-">';
    child = child + '<input type="file" class="form-control" name="'+param+'">'
    child = child + '<button class="dels btn btn-outline-danger" type="button" data-delete-id="'+idx+'">X</button>';
    child = child + '</div></div>'

    $('#fileList').prepend(child);

    idx++;
    count++;
})

$('#fileList').on('click', '.dels', function(){
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