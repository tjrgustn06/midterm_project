num = 0;


$('#storyList').on('click', '.btnToggle', function(){

    num = $(this).attr('data-board-num');
    $('#boardMenu'+num).slideToggle();
    console.log("Num : " + num);
   $(this).parent().next().slideToggle();
})