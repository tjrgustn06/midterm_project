let viewType = $('#viewType').attr('data-viewType');
let chkArray;

let siteIdx=1;
let siteCount=0;
let siteMax=0;

function setSiteCount(c){
    siteCount=c;
}

function setSiteMax(m){
    siteMax=m;
}


//콘솔에 값 확인하고 싶을때 사용
$('#addConsoleSign').click(function(){
    // console.log('check button'); //확인ok
    //서비스로 받는 값 확인
    let check = $('input[name="service[]"]:checked').val();
    console.log(check);

    //chkBtn();
    chkInputBlank();
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
function setService(){
    chkArray = new Array();
    let chkService = $('input[name="serv"]:checked')
    let serv ='';

    chkService.each(function(){
        let tmpVal = $(this).val();
        chkArray.push(tmpVal);
    })

    for(let i of chkArray){
        serv = serv + i +",";
    }

    service = serv.substring(0, serv.length-1);
    $('#serviceVal').val(service);
}



//site 추가 버튼 - add.jsp
$('#siteAddBtn').click(function(){

    if(siteCount>=siteMax){
        alert('사이트 입력은 '+siteMax+'개 까지 가능합니다');
        return;
    }
    siteCount++;

    //변수에 input tag 저장
    let site = '<div id="siteOne" data-chk-idx=site"'+siteIdx+'">';
    site = site + '<div class="input-group mb-2">';
    site = site + '<span class="input-group-text" id="siteName">사이트이름</span>';
    site = site + '<input type="text" name="siteName" class="form-control" placeholder="ex)일반A1, 카라반A1">';
    site = site + '<span class="input-group-text" id="siteSize">크기(m^2)</span>';
    site = site + '<input type="text" name="siteSize" class="form-control" placeholder="ex)6*11, 10*10">';
    site = site + '</div>';
    site = site + '<div class="input-group mb-2">';
    site = site + '<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>';
    site = site + '<input type="text" name="offWeekdaysPrice" class="form-control" placeholder="요금 입력">';
    site = site + '<span class="input-group-text" id="offWeekendsPrice">주말</span>';
    site = site + '<input type="text" name="offWeekendsPrice" class="form-control" placeholder="요금 입력">';
    site = site + '</div>';
    site = site + '<div class="input-group mb-2">';
    site = site + '<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>';
    site = site + '<input type="text" name="peakWeekdaysPrice" class="form-control" placeholder="요금 입력">';
    site = site + '<span class="input-group-text" id="peakWeekendsPrice">주말</span>';
    site = site + '<input type="text" name="peakWeekendsPrice" class="form-control" placeholder="요금 입력">';
    site = site + '</div>';
    site = site + '<div class="mb-2">';
    site = site + '<button type="button" class="siteDels btn btn-outline-danger">입력창 삭제</button>';
    site = site + '</div>';
    site = site + '</div>';
    
    //input tag 가 저장되어있는 변수를 siteList에 추가
    $('#siteList').append(site);
    siteIdx++;
})

//site 삭제 버튼 - add.jsp
$('#siteList').on('click', '.siteDels', function(){
    //console.log($(this));
    $(this).parent().parent().remove();
    siteCount--;
})

//site에 인풋태그의 value가 비어있는지 확인이 가능할까 - add.jsp
function chkInputBlank(){
    console.log($('#siteName').val());
}




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


//등록버튼을 눌렀을 때 이벤트 - add.jsp
$('#addReg').click(function(){
    //체크박스에 값 스트링으로 변환
    setService();

    //값 유효성 체크
    chkValidation();

    // if(chkButton){
    //     $('#frm').submit();
    // }
})


//유효성 체크 함수
function chkValidation(){
    //이런식으로 유효성 체크해야할 element들을 가져옴
    let ChkName = $('#ChkName').val(); //캠핑장이름(name)

    //if문으로 빈값인지 체크
    if(ChkName==null || ChkName==''){
        alert('캠핑장 이름을 입력하세요');
        return;
    }else if(chkArray.length<1){
        alert('시설정보를 체크해주세요');
        return;
    }else{
        $('#frm').submit();
    }
}
