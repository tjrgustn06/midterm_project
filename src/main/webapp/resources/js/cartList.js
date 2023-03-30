
$('.cartDel').click(function(){
    let cartNum=$(this).attr('data-cart-num');
    let check = confirm("삭제하시겠습니까?")

    if(check) {

        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                cartNum : cartNum
            },
            success : function(response){
                if(response.trim()>0) {
                    alert('삭제되었습니다')
                    location.href = "./list"
                } else {
                    alert('삭제 실패');
                }
            }
        })
    }
})
$('.cartOrder').click(function(){
    let cartNum=$(this).attr('data-cart-num');
    let check = confirm('주문하시겠습니까?')
    if(check){

        let form=$('#cartForm'+cartNum).serialize();
        
        $.ajax({
            type : 'POST',
            url : '/product/order/order',
            data : form,
            success : function(response){
                if(response.trim()>0){
                    $.ajax({
                        type : 'POST',
                        url : '/cart/delete',
                        data : {
                            cartNum : cartNum
                        },
                        success : function(response){
                            if(response.trim()>0){
                                alert('주문이 완료되었습니다')
                                location.href = "../product/order/list"
                            }
                        }
                    })
                } else {
                    alert('주문 실패')
                }
            }
        })
    }

})
let orderer = $('.orderers').val();
const names=document.getElementsByClassName('names');
let title=''
for(let i=0;i<names.length;i++){
    title=title+names[i].value
}
console.log(title)


$('#allForm').click(()=>{
    console.log('click')
    
})

