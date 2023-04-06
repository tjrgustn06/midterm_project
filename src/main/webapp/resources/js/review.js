let count = 0;
let max = 0;
let idx = 0;
let param = '';
let page = 1;
let reviewName=$('#review').attr('data-review-name');
let reviewNum=0;

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
$('#addReview').click(function(){
    let reviewName=$(this).attr('data-review-name')
    console.log(reviewName)
    let form=$('#reviewForm')[0];
    const form1= new FormData(form);
    $.ajax({
        type : 'POST',
        url : '/'+reviewName+'/review/add',
        processData : false,
        contentType : false,
        data : form1,
        success : function(response){
            if(response.trim()>0) {
                alert('리뷰가 등록되었습니다');
                $('#addPicDiv').prevAll().remove();
                count=0;
                idx=0;
                $('#reviewContents').val('');
                getList(1);
            }
            else {
                alert('리뷰 등록 실패');
            }
        },
        error : ()=>{
            alert('리뷰 등록 실패. 관리자에게 문의하세요');
        }
    })
})

// 리스트 가져오기
function getList(page) {
    if($('#addReview').attr('data-review-num')!=null){
        $.ajax({
            type : 'GET',
            url : './review/list?num='+$('#addReview').attr('data-review-num')+'&page='+page,
            success : (response) =>{
                $('#reviewList').html(response);
            }
        })
    }
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

let rate = 0;
function rating(score){
    $('.star').each((index,item)=>{
        if(index<=score){
            $(item).attr('style','color: red;')
        } else {
            $(item).removeAttr('style');
        }
        rate = score+1;
        $('#mark').val(rate);
    })
}

// 리뷰 메뉴 토글
$('#reviewList').on('click', '.btnToggle', function(){
    $(this).parent().next().slideToggle();
})

// 리뷰 삭제
$('#reviewList').on('click','.deleteMenu', function(){
    reviewNum=$(this).attr('data-review-num');

    $('#reviewMenu'+reviewNum).hide();

    let delConfurm = confirm('리뷰를 삭제하시겠습니까?');

    if(delConfurm) {
        $.ajax({
            type : 'POST',
            url : './review/delete',
            data : {
                num : reviewNum
            },
            success : function(response){
                if(response.trim() > 0){
                    alert('리뷰가 삭제되었습니다.');
                    getList(page);
                } else{
                    alert('삭제 실패');
                }
            }
        })
    } else {
        return;
    }

})

//리뷰 업데이트 
$('#reviewList').on('click', '.updateMenu', function(){
    setResetForm(reviewNum)
    reviewNum=$(this).attr('data-review-num');
    $('#reviewMenu'+reviewNum).hide();
    $('#reviewMark'+reviewNum).hide()
    getUpdateForm(reviewNum);
    
})

//리뷰 업데이트 취소
$('#reviewList').on('click', '.updateCancle', function(){
    reviewNum=$(this).attr('data-review-num')
    $('#reviewMark'+reviewNum).show()
    setResetForm(reviewNum);
})

//리뷰 업데이트 수정 버튼
$('#reviewList').on('click','.reviewUpdate', function (){
    reviewNum=$(this).attr('data-review-num');
    console.log(reviewNum)
    $.ajax({
        type : 'POST',
        url : 'review/update',
        data : {
            num : reviewNum,
            contents : $('#reviewContents'+reviewNum).val(),
            mark : $('#uptStar').attr('data-update-mark')
        },
        success : function(response){
            if(response.trim()>0){
                alert('리뷰가 수정되었습니다');
                getList(page);
            } else {
                alert('리뷰 수정 실패, 관리자에게 문의하세요')
            }
        }
    })
})



function getUpdateForm(reviewNum){
    let text = $('#contents'+reviewNum).text();
    let writer=$('#reviewWriter').text();
    let mark=$('#reviewMark'+reviewNum).attr('data-review-mark');
    console.log(mark)
    console.log('updateFormNum : '+reviewNum);

    let child = '<section class="mb-5 mx-2" id="updateForm'+reviewNum+'">';
    child = child + '<div class="card bg-light">';
    child = child + '<div class="d-flex">';
    child = child + '<span class="me-auto p-2 fw-bold">'+writer;
    child = child + '</span>'
    child = child + '<span class="p-2">';
    child = child + '<button class="btn btn-outline-danger updateCancle" data-review-num="'+reviewNum+'">취소</button>';
    child = child + '</span>';
    child = child + '</div>';

    //평점 넣는 자리
    child = child + '<div class="input-group mb-3">';
    child = child + '<div><span>평점 : </span></div>';
    child = child + '<div class="updateMark" id="uptStar" data-update-mark="'+mark+'">';
    child = child + '<span class="updateStar">★</span><span class="updateStar">★</span>';
    child = child + '<span class="updateStar">★</span><span class="updateStar">★</span>';
    child = child + '<span class="updateStar">★</span></div></div>';

    child = child + '<div class="card-body">';
    child = child + '<textarea class="form-control mb-3" rows="3" id="reviewContents'+reviewNum+'">'+text.trim()+'</textarea>';
    child = child + '</div>'
    child = child + '<div class="mb-3">';
    child = child + '<button class="btn btn-outline-primary col-auto offset-md-11 reviewUpdate" data-review-num="'+reviewNum+'">수정</button>';
    child = child + '</div></section>'
    $('#contents'+reviewNum).replaceWith(child);
    $('.updateStar').each((index, item)=>{
        if(index<=mark-1){
            $(item).attr('style','color: red;')
        } else {
            $(item).removeAttr('style');
        }
    })
    $('.updateStar').each((index, item)=>{
        $(item).click(()=>{
            updateRating(index)
        })
    })
}

function setResetForm(reviewNum) {
    console.log('ResetFormNum'+reviewNum)
    let child='<div id="contents'+reviewNum+'">'+$('#reviewContents'+reviewNum).text()+'';
    chile = child+'</div>'
    $('#updateForm'+reviewNum).replaceWith(child);
}

//update평점수정
let updateRate=0;
function updateRating(score){
    $('.updateStar').each(function(index,item){
        if(index<=score){
            $(item).attr('style','color: red;')
        } else {
            $(item).removeAttr('style');
        }
        updateRate = score+1;
        $(this).parent().attr('data-update-mark',updateRate);
    })
}

