let viewType = $('#viewType').attr('data-viewType');
let chkArray;
let chkSiteOne;

let siteIdx=2;
let siteCount=0;
let siteMax=0;

function setSiteIdx(i){
    siteIdx=i;
}

function setSiteCount(c){
    siteCount=c;
}

function setSiteMax(m){
    siteMax=m;
}

//페이지 로딩 후 DOM 객체가 준비되었을 때 실행
//바로 실행해야할 내용은 페이지마다 script로 적기.
$(function(){
    // updAdrs(); //주소로 셀렉트박스 선택되게 하는 함수
    // updServiceCheck(); //서비스로 체크박스 선택되게 하는 함수
})


// 리뷰작성창 출력
$('#reviewAdd').click(function(){
    $('#review').slideDown("slow");
})

// 리뷰작성창 해제
$('#reviewCancle').click(function(){
    $('#review').slideUp("slow");
})

//add.jsp
//캠핑장 글 등록 취소 버튼 - add.jsp
$('#addCancel').click(function(){
    let check = confirm("등록을 취소하시겠습니까?");
    if(check){
        location.href="./list";
    }
})

//시군구 정보 선택되었을 때 주소 입력가능하게 - add.jsp
$('#addressSigungu').change(function(){
    // console.log($('#addressRegion').val())
    // console.log($('#addressDo').val())
    // console.log($('#addressSigungu').val());
    // console.log('-------')

    //값 체크
    if($('#addressSigungu').val()!=0){ //값이 공백(선택하지 않음)인 경우
        //나머지 주소 입력창 열림
        $('#addressInput').prop('style', 'background-color:white;');
        $('#addressInput').prop('readonly', false);
        $('#addressInput').prop('placeholder', '나머지 주소를 입력하세요');
    }else if($('#addressSigungu').val()==0){ //값이 공백이 아닌경우
        //나머지 주소 입력창 닫힘
        $('#addressInput').val('');
        $('#addressInput').prop('style', 'background-color:bisque;');
        $('#addressInput').prop('readonly', true);
        $('#addressInput').prop('placeholder', '시/도, 시/군/구를 먼저 선택하세요');
    }
})

//체크박스 선택된 값 여러개 받아오는 함수 - add.jsp
//다음에는 컨트롤러에서 배열로 받아서 처리해보기
function setService(){
    chkArray = new Array();
    let chkService = $('input[name="serv"]:checked');
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
    let site = '<div id="siteOne'+siteIdx+'">';
    site = site + '<div class="input-group mb-2">';
    site = site + '<span class="input-group-text" id="siteName">사이트이름</span>';
    site = site + '<input type="text" name="siteName" data-site-idx="siteName'+siteIdx+'" class="form-control" placeholder="ex)일반A1, 카라반A1">';
    site = site + '<span class="input-group-text" id="siteSize">크기(m^2)</span>';
    site = site + '<input type="text" name="siteSize" data-site-idx="siteSize'+siteIdx+'"class="form-control" placeholder="ex)6*11, 10*10">';
    site = site + '</div>';
    site = site + '<div class="input-group mb-2">';
    site = site + '<span class="input-group-text" id="offWeekdaysPrice">평상시 주중</span>';
    site = site + '<input type="text" name="offWeekdaysPrice" data-site-idx="siteOwkPrice'+siteIdx+'" class="form-control" placeholder="요금 입력">';
    site = site + '<span class="input-group-text" id="offWeekendsPrice">주말</span>';
    site = site + '<input type="text" name="offWeekendsPrice" data-site-idx="siteOwdPrice'+siteIdx+'" class="form-control" placeholder="요금 입력">';
    site = site + '</div>';
    site = site + '<div class="input-group mb-2">';
    site = site + '<span class="input-group-text" id="peakWeekdaysPrice">성수기 주중</span>';
    site = site + '<input type="text" name="peakWeekdaysPrice" data-site-idx="sitePwkPrice'+siteIdx+'" class="form-control" placeholder="요금 입력">';
    site = site + '<span class="input-group-text" id="peakWeekendsPrice">주말</span>';
    site = site + '<input type="text" name="peakWeekendsPrice" data-site-idx="sitePwdPrice'+siteIdx+'" class="form-control" placeholder="요금 입력">';
    site = site + '</div>';
    // site = site + '<div class="form-check mb-2">';
    // site = site + '<input class="form-check-input" type="radio" name="status" id="bookable" value="예약가능">';
    // site = site + '<label class="form-check-label" for="bookable">예약가능</label>';
    // site = site + '</div>';
    // site = site + '<div class="form-check mb-2">';
    // site = site + '<input class="form-check-input" type="radio" name="status" id="unbookable" value="예약불가">';
    // site = site + '<label class="form-check-label" for="unbookable">예약불가</label>';
    // site = site + '</div>';
    site = site + '<div class="mb-2">';
    site = site + '<button type="button" data-site-idx="siteIptDel'+siteIdx+'" class="siteDels btn btn-outline-danger">입력창 삭제</button>';
    site = site + '</div>';
    site = site + '</div>';
    
    //input tag 가 저장되어있는 변수를 siteList에 추가
    $('#siteList').append(site);
    siteIdx++;
})

//site 삭제 버튼 - add.jsp
$('#siteList').on('click', '.siteDels', function(){
    //캠핑 사이트가 최소 하나이상은 있게끔 유지하기
    if(siteCount>1){
        $(this).parent().parent().remove();
        siteCount--;
    }else {
        alert('최소 하나 이상의 캠핑 사이트 정보가 있어야 합니다');
    }
})



//detail.jsp
//홈페이지 주소 앞에 https://가 안붙어있으면 붙여서 실행하기
$('#detHomePage').click(function(){
    console.log('homepage click');
    console.log($(this).attr('href'));

    let chkDomain = $(this).attr('href'); //www.naver.com임
    if(chkDomain.startsWith('https://')){ //setDomain이 https://로 시작하는지 체크. 맞으면 true 아니면 false
        //맞으면 아무런 작업도 안해도 됨
    }else{
        let setDomain = 'https://'+chkDomain;
        $('#detHomePage').attr('href', setDomain);
    }
})



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



//캠핑장 예약버튼 작동 - detail.jsp
$('#detReserve').click(function(){
    //db가서 캠핑장 정보 조회해오고 이거 기반으로 데이터 뿌리고 페이지 넘어가야할거같음
    if(confirm('예약 페이지로 넘어가시겠습니까? (test시 list로 넘어갑니다)')){
        location.href='./list';
    }
})

//리스트로 - detail.jsp
$('#detList').click(function(){
    location.href="./list";
})

//캠핑장 업데이트 - detail.jsp
$('#detUpdate').click(function(){
    console.log('update button click');
    location.href="./update";
})

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





//update.jsp
//캠핑장 글업데이트 취소 - update.jsp
$('#updCancel').click(function(){
    let check = confirm("정말 취소하시겠습니까? 저장하지 않은 내용은 변경되지 않습니다");
    if(check){
        location.href="./detail?campNum="+$('#updCampNum').val();
    }
})

//캠핑장 글업데이트 등록 - update.jsp
$('#updReg').click(function(){
    setService();
    chkValidation();
})


//주소값을 통해 셀렉트박스 선택이 되어있게끔 하는 함수 - update.jsp
function updAdrs(){
    let adrs = $('#addressInput').val();

    //주소값이 있는 경우(update페이지)에만 실행. 없는 경우(add페이지)에서는 실행x
    if(adrs!='' || adrs!=null){
        //시/도, 시/군/구, 나머지주소로 자르기
        let doName = adrs.substring(0, adrs.indexOf(' '));
        let sigunguName = adrs.substring(adrs.indexOf(' ')+1, adrs.indexOf(' ', adrs.indexOf(' ')+1));
        let otherAdrs = adrs.substring(adrs.indexOf(' ', adrs.indexOf(' ')+1)+1);
    
        // console.log(doName); //시/도
        // console.log(sigunguName); //시/군/구
        // console.log(otherAdrs); //나머지주소
    
        //selected 옵션을 주면 될거같은데 흠....
        $('#addressDo').val(doName).prop("selected", true);
        $('#addressSigungu').val(sigunguName).prop("selected", true);
        $('#addressInput').val(otherAdrs);
    }else if(adrs=='' || adrs==null){
        //입력된 주소값이 없는경우 최초 선택하세요가 나타나게
        $('#addressDo').val("0").prop("selected", true);
        $('#addressSigungu').val("0").prop("selected", true);
    }
}


//service로 받은 값이 checked로 되게끔 하기 - update.jsp
function updServiceCheck(){
    //service는 DB에 저장된 서비스들을 string으로 받아온 것
    let service = $('input[name=service]').val();

    //저장된 service를 배열로 만듬
    chkArray = new Array();
    chkArray = service.split(',');

    //작업 전 우선 모두 체크 해제
    $('input[name=serv]').prop("checked", false);

    //이런식으로 반복문 돌리면 체크가 됨. value값이 바뀌도록
    //$('input[name=serv][value="전기"]').prop("checked", true);

    //반복문으로 체크된 값에만 체크옵션을 줌
    for(let service of chkArray){
        $('input[name=serv][value="'+service+'"]').prop("checked", true);
    }

}

// //status로 받은 값이 checked로 되게끔 하기 - update.jsp
// function updStatus(){
//     //저장되어있는 status값 받아오기
//     let status = $('input[name=status]').val();
//     //status값에 맞는 라디오버튼 누르기
//     $('input[name=status][value="'+status+'"]').prop("checked", true);
// }

// //status가 선택된 값이 checked로 되게끔 하기 - update.jsp
// function setService(){
//     chkArray = new Array();
//     let chkService = $('input[name="serv"]:checked');
//     let serv ='';

//     chkService.each(function(){
//         let tmpVal = $(this).val();
//         chkArray.push(tmpVal);
//     })

//     for(let i of chkArray){
//         serv = serv + i +",";
//     }

//     service = serv.substring(0, serv.length-1);
//     $('#serviceVal').val(service);
// }


//콘솔에 값 확인하고 싶을때 사용 - add.jsp/update.jsp(console 버튼)
$('#consoleSign').click(function(){
    //updAdrs();
    //updServiceCheck();

    setService(); //얘는 시작할때 바로하면 의미없다. 글등록 하기전에 받아야함
    //chkValidation();

    console.log(service);

})



//등록버튼을 눌렀을 때 이벤트 - add.jsp
$('#addReg').click(function(){
    //체크박스에 값 스트링으로 변환
    setService();

    //값 유효성 체크 - 완료되면 submit
    chkValidation();
})

//사이트 추가부분 삭제->

//유효성 체크 함수 - add나 update에서 입력값 빈칸일 때 alert
function chkValidation(){
    //유효성 체크가 필요한 element가져오기
    let ChkName = $('#ChkName').val(); //캠핑장이름(name)
    
    //SiteOne 최초 확인값 true. siteOne에서 빈칸있을 시 false로
    chkSiteOne=true; 

    //사이트 추가 입력부분 빈칸인지 체크(siteOne)
    for(let i=1; i<siteIdx; i++){
        //사이트 추가 element
        let chkSiteName = $('input[data-site-idx="siteName'+i+'"]'); //사이트이름
        let chkSiteSize = $('input[data-site-idx="siteSize'+i+'"]'); //사이트크기
        let chkSiteOwkPrice = $('input[data-site-idx="siteOwkPrice'+i+'"]'); //평상시 주중요금
        let chkSiteOwdPrice = $('input[data-site-idx="siteOwdPrice'+i+'"]'); //평상시 주말요금
        let chkSitePwkPrice = $('input[data-site-idx="sitePwkPrice'+i+'"]'); //성수기 주중요금
        let chkSitePwdPrice = $('input[data-site-idx="sitePwdPrice'+i+'"]'); //성수기 주말요금
        //예약가능/불가는 라디오버튼

        //변수내부 값 반복확인
        chkSiteName.each(function(){ //사이트이름
            let val = $(this).val();
            if(val==''){ //val이 공백일 때
                //alert('사이트 이름을 입력하세요');
                //console.log('사이트 이름체크');
                i=siteIdx; //해당되면 for문의 i값을 최대치로 올림
                chkSiteOne=false;
                return false; //조건에 들어왔을 때 each 반복문 멈추고 계속진행
            }
        })
        chkSiteSize.each(function(){ //사이트크기
            let val = $(this).val();
            if(val==''){
                i=siteIdx; 
                chkSiteOne=false;
                return false;
            }
        })
        chkSiteOwkPrice.each(function(){
            let val = $(this).val();
            if(val==''){
                i=siteIdx; 
                chkSiteOne=false;
                return false;
            }
        })
        chkSiteOwdPrice.each(function(){
            let val = $(this).val();
            if(val==''){
                i=siteIdx; 
                chkSiteOne=false;
                return false;
            }
        })
        chkSitePwkPrice.each(function(){
            let val = $(this).val();
            if(val==''){
                i=siteIdx; 
                chkSiteOne=false;
                return false;
            }
        })
        chkSitePwdPrice.each(function(){
            let val = $(this).val();
            if(val==''){
                i=siteIdx; 
                chkSiteOne=false;
                return false;
            }
        })
    }
    
    //최종 chkSiteOne값 확인
    console.log(chkSiteOne);
    console.log("campSite "+siteCount);
    //두 값 확인결과, 사이트가 없는경우 chkSiteOne이 true가 됨. -> 삭제버튼에서 제약걸기

    

    //if문으로 빈값인지 체크
    //나중에 주석 해제(alert창, submit)
    if(ChkName=null || ChkName==''){
        //alert('캠핑장 이름을 입력하세요');
        return;
    }else if(chkArray.length<1){
        //alert('시설정보를 체크해주세요');
        return;
    }else if(chkSiteOne==false){
        //alert('캠핑사이트 추가항목을 모두 입력해주세요\n(필요없는 경우 "입력창 삭제" 버튼을 눌러주세요)');
        return;
    }else{
        console.log('Submit Success!');
        $('#frm').submit();
    }
}




//확인 끝난 코드들
//$('#addConsoleSign').click(function(){
    // console.log('check button'); //확인ok
    //서비스로 받는 값 확인
    // let array = new Array;
    // let check = $('input[name="serv"]:checked');

    // check.each(function(){
    //     let value = $(this).val();
    //     array.push(value);
    // })
    // console.log(array);

    //chkBtn();

    //console.log("chkSiteName: "+$('input[data-site-idx=siteName'+i+']').val());
    //console.log($('input[data-site-idx=siteName'+i+']')); //이까진 잘 받아와진다
    //console.log("name"+i+": "+$(this).val());

    //유효성 체크 테스트
    // for(let i=1; i<siteIdx; i++){
    //     let chkName = $('input[data-site-idx=siteName'+i+']');
    //     chkName.each(function(){
    //         let val = $(this).val();
    //         if(val==''){ //val이 공백일 때
    //             alert('캠핑사이트 이름을 입력하세요');
    //             i=siteIdx; //해당되면 for문의 i값을 최대치로 올림
    //             return false; //조건에 들어왔을 때 each 반복문 멈추고 계속진행
    //         }
    //     })
    // }
//})