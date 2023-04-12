
function getDateDiff(d2) {
    let now = new Date();									
    let date = new Date(d2);

    let diffTime = Math.floor((now.getTime() - date.getTime()) / 1000 / 60);
    if(diffTime < 1) {
        return '방금 전'
    }
    if(diffTime < 60) {
        return diffTime + '분 전';
    }

    let diffHour = Math.floor(diffTime / 60)
    if(diffHour < 24 ) {
        return diffHour + "시간 전";
    }

    let diffDate = Math.floor(diffTime / 60 / 24)
    if(diffDate < 365) {
        return diffDate + "일 전"
    }
    
    return Math.floor(diffDate/365 + "년 전");
}