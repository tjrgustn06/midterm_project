//캠핑장 글삭제 - detail.jsp
$('#delete').click(function(){
    let check = confirm("정말 삭제하시겠습니까?");
    if(check){
        $('#frm').attr('action', './delete');
        $('#frm').attr('method', 'POST');
        $('#frm').attr('button', 'submit');
        $('#frm').submit();
    }
})

//캠핑장 글업데이트 취소 - update.jsp
$('#cancel').click(function(){
    let check = confirm("정말 취소하시겠습니까? 저장하지 않은 내용은 변경되지 않습니다");
    if(check){
        location.href="./detail?campNum="+$('#detailCampNum').val();
    }
})

//리스트로 - detail.jsp
$('#list').click(function(){
    location.href="./list";
})

//캠핑장 예약버튼 작동 - detail.jsp
$('#reserve').click(function(){
    //db가서 캠핑장 정보 조회해오고 이거 기반으로 데이터 뿌리고 페이지 넘어가야할거같음
    //location.href='';
})
