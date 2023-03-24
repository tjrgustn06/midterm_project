let count = 0;
let max = 0;
let idx = 0;
let param = '';
let page = 1;
let reviewName=$('#review').attr('data-review-name');
function setParam (p) {
    param = p;
}

function setMax(m) {
    max = m;
}

function setCount(c) {
    count = c;
}

// 리뷰파일 추가
$('#addPic').click(function(){

    if(count >= max) {
        alert('파일은 ' + max + '개만 첨부할 수 있습니다');
        return;
    }
    child = '<div class="row mb-2" id="d'+idx+'">';
    child = child + '<div class="input-group mb-2 col-sm-2">';
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

getList(1);

// 리뷰 등록
$('#addReview').click(()=>{
    let form=$('#reviewForm')[0];
    const form1= new FormData(form);
    $.ajax({
        type : 'POST',
        url : '/product/review/add',
        processData : false,
        contentType : false,
        data : form1,
        success : function(response){
            if(response.trim()>0) {
                alert('리뷰가 등록되었습니다')
                $('#addPicDiv').prevAll().remove()
                count=0;
                idx=0;
                $('#reviewContents').val('');
                getList(1);
            }
            else {
                alert('리뷰 등록 실패')
            }
        },
        error : ()=>{
            alert('댓글 등록 실패. 관리자에게 문의하세요');
        }
    })
})

// 리스트 가져오기
function getList(page) {
    $.ajax({
        type : 'GET',
        url : './review/list?num='+$('#addReview').attr('data-review-num')+'&page='+page,
        success : (response) =>{
            $('#reviewList').html(response);
        }
    })
}

// 페이징
$('#reviewList').on('click','.page-link', function(e){
    page=$(this).attr('data-review-page');
    getList(page);

    e.preventDefault();
    
})

// 별점 입력
$('.star').each((index, item)=>{
    $(item).on('click',()=>{
        rating(index);
    })
})

function rating(score){
    console.log('click')
    $('.star').each((index,item)=>{
        if(index<=score){
            $(item).attr('style','color: red;')
        } else {
            $(item).removeAttr('style');
        }
    })
}

function setStar(point){
    $('#point').val(point)
}