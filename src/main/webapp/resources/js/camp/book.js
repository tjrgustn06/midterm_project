





//콘솔버튼 확인 - bookSite.jsp
$('#bksConsoleSign').click(function(){
    //console.log('bookSite Page');


})


//예약버튼 작동 - bookSite.jsp
$('#bksConfirm').click(function(){
    $('#bksFrm').submit();
})

$('#bksCancle').click(function(){
    let check = confirm("정말 취소하시겠습니까? 입력된 정보가 사라집니다");
    if(check){
        location.href="./detail?campNum="+$('#bksCampNum').val();
    }
})