iconList = [
    {serviceName : '전기', icon : '<i class="fa-solid fa-phone fa-sm"></i>'},
    {serviceName : '온수', icon : '<i class="fa-solid fa-location-dot fa-sm"></i>'}
];

let getIconList = iconList.map(function(element){
    if(element.serviceName == '전기') {
        console.log(element.icon);
    }
})

getIconList();