
getProductList(1)

function getProductList(page){
    $.ajax({
        type : 'GET',
        url : '/product/productListTop?page='+page,
        success : function(response){
            $('#productList').html(response); 
        }
    })
}

