





//콘솔버튼 확인 - bookSite.jsp
$('#bksConsoleSign').click(function(){
    //console.log('bookSite Page');
    //고른 날짜가 실제 value로 들어가게끔(이건 미리 세팅하지 않고 예약 버튼 눌렀을 때 보내야함)
    // console.log("start: "+$('input[name=searchStartDate]').val());
    // console.log("last: "+$('input[name=searchLastDate').val());
    // $('input[name=startDate]').val($('input[name=searchStartDate]').val());
    // $('input[name=lastDate]').val($('input[name=searchLastDate').val());
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


//예약 취소 버튼 눌렀을 때 - bookConfirm.jsp
$('#bksCancel').click(function(){
    let check = confirm("정말 취소하시겠습니까? 입력된 정보가 사라집니다");
    if(check){
        location.href="./site?campNum="+$('input[name=campNum]').val();
    }
})


//예약 버튼을 눌렀을 때 - bookConfirm.jsp
$('#bksConfirm').click(function(){
    $('#confirmFrm').submit();
})