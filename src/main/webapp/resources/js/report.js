function reportAdd() {

    let reportUrl =  "../report/report?num="+arguments[0]+"&boardId="+arguments[1]+"&reportedUser="+arguments[2];
    if(arguments.length > 3) {
        reportUrl += "&commentNum="+arguments[3];
    }
    location.href= reportUrl;

    
}