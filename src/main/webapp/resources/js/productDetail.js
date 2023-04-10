
$('#delete').click(function(){
    console.log('check')
    let check = window.confirm("삭제하시겠습니까?");

    if(check) {
        let productNum = $(this).attr("data-delete");

        // $('#frm').attr('action', './delete');
        // $('#frm').attr('method', 'post');
        
        // $('#frm').submit();
        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                productNum : productNum
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert('삭제되었습니다')
                    location.href = "./list"
                }
                else {
                    alert("삭제 실패");
                }
                    
            }
        })
    }
})

getAmount();

function getAmount(amount){
    child='<select class="nice-select" aria-label="Default select example" name="amount" id="amount">'
    for(let i=1;i<=amount;i++){
    child=child+'<option value="'+i+'">'+i+'개</option>'
    }
    child=child+'</select>'

    $('#amountChange').append(child);
}

$('#reviewAdd').click(function(){
    $('#review').slideDown("slow")
})
$('#reviewCancle').click(function(){
    $('#review').slideUp("slow")
})

function cartBar(){
    let currentPosition = parseInt($(".quickmenu").css("top"));
    $(window).scroll(function() {
      let position = $(window).scrollTop(); 
      $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},800);
    });
}
cartBar()

function getCartBar() {
    if($('#cartBar').attr('data-member-id')!=null){
        $.ajax({
            type : 'GET',
            url : './cartBar',
            success : (response) =>{
                $('#cartBar').html(response);
            }
        })
    }
}

getCartBar()