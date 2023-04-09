function reportAdd() {

    let reportUrl =  "../report/report?num="+arguments[0]+"&boardId="+arguments[1];
    if(arguments.length > 2) {
        reportUrl += "&commentNum="+arguments[2];
    }
    location.href= reportUrl;

    
}