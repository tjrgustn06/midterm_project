let viewType = $('#viewType').attr('data-viewType');
let chkButton = true;



//콘솔에 값 확인하고 싶을때 사용
$('#addConsoleSign').click(function(){
    // console.log('check button'); //확인ok
    //서비스로 받는 값 확인
    let check = $('input[name="service[]"]:checked').val();
    console.log(check);

    chkBtn();
})



//add.jsp
//캠핑장 글 등록 취소 버튼 - add.jsp
$('#addCancel').click(function(){
    let check = confirm("등록을 취소하시겠습니까?");
    if(check){
        location.href="./list";
    }
})

//체크박스 선택된 값 여러개 받아오는 함수 - add.jsp
//다음에는 컨트롤러에서 배열로 받아서 처리해보기
function chkBtn(){
    let chkArray = new Array();
    let chkService = $('input[name="serv"]:checked')
    let serv ='';

    chkService.each(function(){
        let tmpVal = $(this).val();
        chkArray.push(tmpVal);
    })

    if(chkArray.length < 1){
        alert('시설정보를 체크해주세요');
        //시설체크 안되있으면 폼 안넘어가게
        chkButton = false;
        return;
    }else{
        chkButton = true;
    }

    for(let i of chkArray){
        serv = serv + i +",";
    }

    service = serv.substring(0, serv.length-1);
    $('#serviceVal').val(service);
}

//체크박스 값 넣는거 이벤트 걸기 - add.jsp
$('#addReg').click(function(){
    chkBtn();
    if(chkButton){
        $('#frm').submit();
    }
})




//detail.jsp
//메뉴바 하이라이트 설정 - detail.jsp
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


//캠핑장 글삭제 - detail.jsp
$('#detDelete').click(function(){
    let check = confirm("정말 삭제하시겠습니까?");
    if(check){
        $('#frm').attr('action', './delete');
        $('#frm').attr('method', 'POST');
        $('#frm').attr('button', 'submit');
        $('#frm').submit();
    }
})

//리스트로 - detail.jsp
$('#detList').click(function(){
    location.href="./list";
})

//캠핑장 예약버튼 작동 - detail.jsp
$('#detReserve').click(function(){
    //db가서 캠핑장 정보 조회해오고 이거 기반으로 데이터 뿌리고 페이지 넘어가야할거같음
    if(confirm('예약 페이지로 넘어가시겠습니까? (test시 list로 넘어갑니다)')){
        location.href='./list';
    }
})





//update.jsp - 나중에 수정해야한다
//캠핑장 글업데이트 취소 - update_old.jsp
$('#updCancel').click(function(){
    let check = confirm("정말 취소하시겠습니까? 저장하지 않은 내용은 변경되지 않습니다");
    if(check){
        location.href="./detail?campNum="+$('#detailCampNum').val();
    }
})