$('#delete').click(function(){
    let check = confirm("정말 삭제하시겠습니까?");
    if(check){
        $('#frm').attr('action', './delete');
        $('#frm').attr('method', 'POST');
        $('#frm').attr('button', 'submit');
        $('#frm').submit();
    }
})