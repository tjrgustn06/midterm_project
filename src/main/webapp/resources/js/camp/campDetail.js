let viewType = $('#viewType').attr('data-viewType');

//메뉴바 하이라이트 설정
if(viewType==1){
    $('.camp').removeClass("active");
    $('.camp_intro').addClass("active");
}
if(viewType==2){
    $('.camp').removeClass("active");
    $('.camp_guide').addClass("active");
}
if(viewType==3){
    $('.camp').removeClass("active");
    $('.camp_map').addClass("active");
}
if(viewType==4){
    $('.camp').removeClass("active");
    $('.camp_review').addClass("active");
}


//캠핑장 글삭제
$('#delete').click(function(){
    let check = confirm("정말 삭제하시겠습니까?");
    if(check){
        $('#frm').attr('action', './delete');
        $('#frm').attr('method', 'POST');
        $('#frm').attr('button', 'submit');
        $('#frm').submit();
    }
})

//리스트로
$('#list').click(function(){
    location.href="./list";
})

//캠핑장 예약버튼 작동
$('#reserve').click(function(){
    //db가서 캠핑장 정보 조회해오고 이거 기반으로 데이터 뿌리고 페이지 넘어가야할거같음
    if(confirm('예약 페이지로 넘어가시겠습니까? (test시 list로 넘어갑니다)')){
        location.href='./list';
    }
})