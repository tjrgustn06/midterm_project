





//콘솔버튼 확인 - bookSite.jsp
$('#bksConsoleSign').click(function(){
    //console.log('bookSite Page');
})


//선택하기버튼 작동 - bookSite.jsp
$('#siteList').on('click', '.bookBtn', function(e){
    //기간 설정 창에 입력한 기간 form에 넣어주기
    let sDate = $('input[name=searchStartDate]').val();
    let lDate = $('input[name=searchLastDate]').val();

    if(sDate!='' || sDate!=null){
        $('input[name=startDate]').val(sDate);
    }
    if(lDate!='' || lDate!=null){
        $('input[name=lastDate]').val(lDate);
    }

    let siteIdx = $(e.target).attr('data-site-idx');

    //날짜 입력값 있는지 체크, 없으면 폼 넘기지말고 alert
    if(sDate==null || sDate=='' || lDate==null || lDate==''){
      alert('입실 날짜 / 퇴실 날짜를 선택해주세요');
    }else{
      $('#bookFrm'+siteIdx).submit();
    }
})

//돌아가기 버튼을 눌렀을 때 - bookList.jsp
$('#listCancel').click(function(){
    location.href="../detail?campNum="+$('input[name=campNum]').val()+"&viewType=1";
})

//돌아가기 버튼을 눌렀을 때 - bookSite.jsp
$('#siteCancel').click(function(){
    location.href="../detail?campNum="+$('input[name=campNum]').val()+"&viewType=1";
})

//돌아가기 버튼을 눌렀을 때 - bookConfirm.jsp
$('#bksCancel').click(function(){
    let check = confirm("사이트 목록으로 돌아가시겠습니까?\n입력된 정보가 사라집니다.");
    if(check){
        location.href="./site?campNum="+$('input[name=campNum]').val();
    }
})

//예약하기 버튼을 눌렀을 때 - bookConfirm.jsp
$('#bksConfirm').click(function(){
    $('#confirmFrm').submit();
})

//예약취소 버튼을 눌렀을 때 - bookPayment.jsp
$('#payCancel').click(function(){
    let check = confirm("예약을 취소하시겠습니까?\n예약 내용이 사라집니다.");
    if(check){
      $('#paymentFrm').attr('action', './delete');
      $('#paymentFrm').submit();
    }
})

//결제하기 버튼을 눌렀을 때 - bookPayment.jsp


//요금 계산 함수 - bookConfirmation.jsp
function calculationPrice(){
    //계산에 필요한 element의 값 선택자로 가져오기
    const startDate = new Date($('#startDate').val());
    const lastDate = new Date($('#lastDate').val());
    //Number는 숫자로된 문자열을 숫자로 바꿈.
    const offWeekdaysPrice = Number($('input[name=offWeekdaysPrice]').val());
    const offWeekendsPrice = Number($('input[name=offWeekendsPrice]').val());
    const peakWeekdaysPrice = Number($('input[name=peakWeekdaysPrice]').val());
    const peakWeekendsPrice = Number($('input[name=peakWeekendsPrice]').val());
  
    // 총 기간 계산하기
    const oneDay = 24 * 60 * 60 * 1000; //밀리초 기준이라 1000(초)*60(분)*60(시)*24(일)을 하면 1일이 됨
    //round는 반올림한 수와 가장 가까운 정수값을 리턴
    const diffDays = Math.round(Math.abs((lastDate - startDate) / oneDay));

    //console.log(diffDays);
  
    // 총 합계 요금 계산하기
    let totalPrice = 0;
    let currentDate = startDate;
    //시작날짜~끝날짜 사이 요금 합계를 구하는 반복문
    for (let i = 0; i < diffDays; i++) {
      const currentMonth = currentDate.getMonth();
      //성수기(getMonth: 월을 0~11으로 리턴 / 5~9월은 4~8) 계산
      //주말(getDay(): 요일을 0~6으로 리턴(일~토) / 금~토는 5, 토~일은 6) 계산
      const isPeakSeason = currentMonth >= 4 && currentMonth <= 8;
      const isWeekend = currentDate.getDay() === 5 || currentDate.getDay() === 6;
  
      if (isPeakSeason && isWeekend) { //성수기 주말
        totalPrice += peakWeekendsPrice;
      } else if (isPeakSeason && !isWeekend) { //성수기 평일
        totalPrice += peakWeekdaysPrice;
      } else if (!isPeakSeason && isWeekend) { //비수기 주말
        totalPrice += offWeekendsPrice;
      } else { //비수기 평일
        totalPrice += offWeekdaysPrice;
      }
  
      currentDate.setDate(currentDate.getDate() + 1);
    }

    // 총 합계 요금 출력
    $('#totalPrice').val(totalPrice);
}








//유효성 체크
function chkValidation(){
  //사이트 선택에서 입력 날짜가 비어있는지 확인
  
}