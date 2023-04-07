





//콘솔버튼 확인 - bookSite.jsp
$('#bksConsoleSign').click(function(){
    //console.log('bookSite Page');
    console.log("start: "+$('input[name=searchStartDate]').val());
    console.log("last: "+$('input[name=searchLastDate').val());
    $('input[name=startDate]').val($('input[name=searchStartDate]').val());
    $('input[name=lastDate]').val($('input[name=searchLastDate').val());
})


//예약버튼 작동 - bookSite.jsp
$('#siteList').on('click', '.bookBtn', function(e){
    //console.log('booking click');
    
    //기간 설정 창에 입력한 기간 form에 넣어주기
    let sDate = $('input[name=searchStartDate]').val();
    let lDate = $('input[name=searchLastDate]').val();

    if(sDate!='' || sDate!=null){
        $('input[name=startDate]').val(sDate);
    }
    if(lDate!='' || lDate!=null){
        $('input[name=lastDate]').val(lDate);
    }



    //let siteBtn = e.target.id; //버튼의 id 속성 사용
    //let siteIdx = document.getElementById(siteBtn).getAttribute('data-site-idx');
    //jQuery로 안되나????
    
    //특정 버튼 눌렀을 때, data-site-idx 속성 가져오기
    //let siteBtn = $(e.target); //jQuery로 이벤트 타겟을 가져오기
    let siteIdx = $(e.target).attr('data-site-idx');
    //console.log($('#bookFrm'+siteIdx).attr('id')); 잘들고온다
    //속성 가져오고 해당 속성과 일치하는 form submit 시키기
    $('#bookFrm'+siteIdx).submit();
})

$('#bksCancle').click(function(){
    let check = confirm("정말 취소하시겠습니까? 입력된 정보가 사라집니다");
    if(check){
        location.href="./detail?campNum="+$('#bksCampNum').val();
    }
})