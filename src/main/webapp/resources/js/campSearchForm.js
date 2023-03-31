// 캠핑장 입력창
let name = '';

// 체크된 캠핑장 이름
let selChk;

// 이용 날짜
let date = '';

//첫번째 지역(시/도)가 변경 됐을 때
$('#doName').change(function(){

    //이전값이 있을수도 있으니 초기값 셋팅
    $('#searchCampList').empty();
    $('#name').val('');
    $('#sigunguName').empty();    
    let str = '<option value="">전체</option>';

    $('#sigunguName').append(str);

    
    //시/도가 선택됐을 때
    if($('#doName').val() != '') {
        $.ajax({
            type : 'GET',
            url : '/camp/sigunguNameList',
            data : {
                doName : $('#doName').val()
            },
            dataType : 'JSON',
            success : function(data){
                $('#sigunguName').empty();
                // let str = '<option value="">전체</option>';
                $(data).each(function() {
                    console.log(this.doName + this.sigunguName);
                    str += '<option value="'+this.sigunguName+'">'+this.sigunguName+'</option>';
                });
                $('#sigunguName').append(str);
            },
            error : function(){
                alert('Request Error!');
            }
        })
    }


})

//검색 버튼 눌렀을 때
$('#searchBtn').click(function(){

    getSearchList();


})

//시/군/구가 변경됐을 때
$('#sigunguName').change(function(){
    $('#name').val('');
    getSearchList();
})

//캠핑장이름 입력창 값이 변경됐을 때
$('#name').change(function(){
    getSearchList();
})


//조회한 캠핑장들을 클릭했을 때
$('#searchCampList').on('click','input[name=campChk]:checkbox', function(){ 
    console.log($(this).val());

    //체크됐을 때
    if($(this).prop('checked')) {
        selChk = $(this);
        $('input[name=campChk]:checkbox').prop('checked',false);
        $(this).prop('checked',true);
        $('#title').val(selChk.val());

        //체크가 되어있고 datepicker에 값이 있을 때
        if($('#datepicker').val() != null) {
            $('#title').val($('#title').val() + date);
        }
        
    }

    // 체크가 되어있지 않고 datepicker에 값이 있을 때
    else if($('#datepicker').val() != null){
        $('#title').val(date);
    }

    // 체크가 되어있지 않고 datepicker에도 값이 없을 때
    else  {
        $('#title').val('');
    }

    
})



//datepicker의 값이 변경 됐을 때
$('#datepicker').change(function(){
    date = ' (캠핑 일자 : '+$(this).val() + ')';
    if(selChk == null) {
        $('#title').val(date);
    }
    else {
        $('#title').val(selChk.val() + date);
    }
    
    
})


//제목입력 후 enter 누르면 form submit 되어버리는 경우 방지
$('#name').keydown(function(event){
    if(event.keyCode == 13) {
        event.preventDefault();
        return;
    }
})

//제목입력 후 enter 누르면 form submit 되어버리는 경우 방지
$('#title').keydown(function(event){
    if(event.keyCode == 13) {
        event.preventDefault();
        return;
    }
})

//캠핑장 조회 함수
function getSearchList() {

    if($('#doName').val() == '') {
        alert("지역을 선택해주세요");
        return;
    }

    $.ajax({
        type : 'GET',
        url : '/camp/searchCampList',
        data : {
            doName : $('#doName').val(),
            sigunguName : $('#sigunguName').val(),
            name : $('#name').val()
        },
        dataType : 'JSON',
        success : function(data){
            $('#searchCampList').empty();
            let idx = 0;
            let ulCount = parseInt(data.length/6);
            
            if(parseInt(data.length % 6) != 0) {
                ulCount++;
            }
            console.log('UlCount : ' + ulCount);


            for(let i=1; i<=ulCount; i++) {
                let ul =  '<ul class="list-group list-group-horizontal" id="searchList'+i+'"></ul>';
                $('#searchCampList').append(ul);
            }

            for(let i=0; i<data.length; i++) {
                if(i % 6 == 0) {
                    idx++;
                }
                str = '<li class="list-group-item">';
                str += '<input class="form-check-input me-1" type="checkbox" name="campChk" id="campNum'+data[i].campNum+'" value="'+data[i].name+'" data-camp-num="'+data[i].campNum+'" aria-label="...">';
                str += data[i].name;
                str += '</li>';
                $('#searchList'+idx).append(str);
            }
        }
    })
}

