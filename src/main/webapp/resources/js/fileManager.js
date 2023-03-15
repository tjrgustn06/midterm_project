
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

$('#addBtn').click(function(){

    if(count >= max) {
        alert('파일은 ' + max + '개만 첨부할 수 있습니다');
        return;
    }
    child = '<div class="row mb-2" id="d'+idx+'">';
    child = child + '<label for="" class="col-sm-1 col-form-label">Image</label>';
    child = child + '<div class="input-group mb-2 col-sm-10">';
    child = child + '<input type="file" class="form-control" name="'+param+'">'
    child = child + '<button class="dels btn btn-outline-danger" type="button" data-delete-id="'+idx+'">X</button>';
    child = child + '</div></div>'

    $('#fileList').append(child);

    idx++;
    count++;
})

$('#fileList').on('click', '.dels', function(){
    let fileId = $(this).attr('data-delete-id');
    $('#d'+fileId).remove();
    count--;
})