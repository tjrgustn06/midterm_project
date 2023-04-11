$('#reportList').on('click','.accept', function(){
    let reportNum = $(this).attr('data-report-num');
    let result =  $(this).val();
    reportResult(reportNum, result);
})

$('#reportList').on('click','.denied', function(){
    let reportNum = $(this).attr('data-report-num');
    let result =  $(this).val();
    reportResult(reportNum, result);
})

function reportAdd() {

    let reportUrl =  "../report/report?num="+arguments[0]
    +"&boardId="+arguments[1]+"&reportedUser="+arguments[2]+"&reportedContents="+arguments[3];
    if(arguments.length > 4) {
        reportUrl += "&commentNum="+arguments[4];
    }
    location.href= reportUrl;

    
}

function reportResult(reportNum, result) {


    $.ajax({
        type : 'POST',
        url : '/report/result',
        data : {
            reportNum : reportNum,
            reportedResult : result        
        },
        success : ()=>{
            alert('신고처리가 완료되었습니다');
            location.href="/manage/list";
        }
    })
}