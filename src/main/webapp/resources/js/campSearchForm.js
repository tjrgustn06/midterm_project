$('#doName').change(function(){

    $('#name').empty();
    $('#sigunguName').empty();    
    let str = '<option value="">전체</option>';

    $('#sigunguName').append(str);

    

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

$('#searchBtn').click(function(){
    if($('#doName').val() == '') {
        alert("지역을 선택해주세요");
        return;
    }

    getSearchList();


})

$('#sigunguName').change(function(){
    $('#name').val('');
    getSearchList();
})

$('input:checkbox').on('click', function(){
    if($(this).prop('checked')) {
        console.log('sdfdsfdsfdsf');
    }
    else {
        console.log('sdfdsfdsfdsf');
    }
})

function getSearchList() {
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
                str += '<input class="form-check-input me-1" type="checkbox" id="campNum'+data[i].campNum+'" value="'+data[i].name+'" aria-label="...">'
                str += data[i].name;
                str += '</li>';
                $('#searchList'+idx).append(str);
            }
        }
    })
}

