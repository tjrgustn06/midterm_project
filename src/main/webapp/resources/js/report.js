
let viewType = $('#viewType').attr('data-vieType');

$('.viewType'+viewType).addClass("active");

$('#reportList').on('click','.accept', function(){
    let reportNum = $(this).attr('data-report-num');
    let num = $(this).attr('data-board-num');
    let commentNum = $(this).attr('data-comment-num');
    let result =  $(this).val();
    reportResult(reportNum, num, commentNum, result);
})

$('#reportList').on('click','.denied', function(){
    let reportNum = $(this).attr('data-report-num');
    let num = $(this).attr('data-board-num');
    let commentNum = $(this).attr('data-comment-num');
    let result =  $(this).val();
    reportResult(reportNum, num, commentNum, result);
})

function reportAdd() {

    let reportUrl =  "../report/report?num="+arguments[0]
    +"&boardId="+arguments[1]+"&reportedUser="+arguments[2]+"&reportedContents="+arguments[3];
    if(arguments.length > 4) {
        reportUrl += "&commentNum="+arguments[4];
    }
    location.href= reportUrl;

    
}

function reportResult(reportNum, num, commentNum, result) {

    $.ajax({
        type : 'POST',
        url : '/report/result',
        data : {
            reportNum : reportNum,
            num : num,
            commentNum : commentNum,
            reportResult : result        
        },
        success : (data)=>{
            if(data.trim() > 0) {
                alert('처리가 완료되었습니다');
                location.href = location.href;
            }
            else {
                alert('처리 실패')
            }

            
            
        }
    })
}