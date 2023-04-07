let addressNum=0;
let addressName='';
let addressAds='';
let addressDetail='';

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
               
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open();
}

// 주소추가를 눌렀을때
$('#addressAdd').click(function(){
    $('#addressAdd').hide()
    setResetAddress(addressNum, addressName, addressAds, addressDetail)
    let child = '<div id="addressAddForm">'
    child = child+'<input type="text" name="addressName" id="addressName" placeholder="집, 회사..."><br>'
    child = child+'<input type="text" name="postCode" id="postcode" placeholder="우편번호" readonly>'
    child = child+'<input type="button" name="addr" id="addr" onclick="execDaumPostcode()" value="우편번호 찾기"><br>'
    child = child+'<input type="text" name="address" id="address" placeholder="주소" readonly><br>'
    child = child+'<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소"><br>'
    child = child+'<button type="button" id="addressAddCancle">취소</button></div>'
    $(this).before(child)
})
// 주소추가취소 눌렀을때
$('#addressList').on('click','#addressAddCancle',()=>{
    $('#addressAddForm').remove()
    $('#addressAdd').show()
})

// 주소수정을 눌렀을때
$('#addressList').on('click','.addressUpdate',function(){
    
    setResetAddress(addressNum, addressName, addressAds, addressDetail)
    addressNum=$(this).attr('data-address-num')
    $('#addressUpdate'+addressNum).hide()
    addressName=$(this).attr('data-address-name')
    addressAds=$(this).attr('data-address-address')
    addressDetail=$(this).attr('data-address-detail')
    getUpdateAddress(addressNum, addressName)


    // $('#oldAddress'+addressNum).hide()
    // let child = child+'<input type="text" name="postCode" id="postcode" placeholder="우편번호">'
    // child = child+'<input type="button" name="addr" id="addr" onclick="execDaumPostcode()" value="우편번호 찾기">'
    // child = child+'<input type="text" name="address" id="address" placeholder="주소" readonly>'
    // child = child+'<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소">'
    // child = child+'<button type="button" id="addressUpdateCancle">취소</button>'
    // $('#newAddress'+addressNum).html(child)
})

//삭제 버튼을 눌렀을때
$('#addressList').on('click', '.addressDelete', function(){
    addressNum=$(this).attr('data-address-num');
    addressName=$(this).attr('data-address-name');
    let delConfirm = confirm(addressName+'주소를 삭제하시겠습니까?');

    if(delConfirm) {
        $.ajax({
            type : 'POST',
            url : './addressDelete',
            data : {
                addressNum : addressNum
            },
            success : function(response){
                if(response.trim()>0) {
                    alert(addressName+'주소가 삭제되었습니다');
                    location.href='./memberUpdate'
                } else {
                    alert('삭제 실패')
                }
            }
        })
    }
})

// 취소 버튼을 눌렀을때
$('#addressList').on('click','.addressUpdateCancle', function(){
    addressNum=$(this).attr('data-address-num')
    setResetAddress(addressNum, addressName, addressAds, addressDetail)
})

// 주소 업데이트폼 불러오기
function getUpdateAddress(addressNum, addressName){
    let child = '<div id="newAddress'+addressNum+'">'
    child = child+'<input type="hidden" name="addressNum" value="'+addressNum+'">'
    child = child+'<input type="text" name="addressName" id="addressName" value="'+addressName+'" readonly><br>'
    child = child+'<input type="text" name="postCode" id="postcode" placeholder="우편번호" readonly>'
    child = child+'<input type="button" name="addr" id="addr" onclick="execDaumPostcode()" value="우편번호 찾기"><br>'
    child = child+'<input type="text" name="address" id="address" placeholder="주소" readonly><br>'
    child = child+'<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소"><br>'
    child = child+'<button type="button" class="addressUpdateCancle" data-address-num="'+addressNum+'">취소</button></div>'
    $('#oldAddress'+addressNum).replaceWith(child)
}

// 업데이트폼 원래대로 돌려놓기
function setResetAddress(addressNum, addressName, addressAds, addressDetail){
    $('#addressAddForm').remove()
    let child='<div id="oldAddress'+addressNum+'">'
    child = child + '<p>'+addressName+'</p>'
    child = child + '<input type="text" class="form-control" value="'+addressAds+'" readonly>'
    child = child + '<input type="text" class="form-control" value="'+addressDetail+'" readonly></div>'
    $('#newAddress'+addressNum).replaceWith(child);
    $('#addressUpdate'+addressNum).show()
}


