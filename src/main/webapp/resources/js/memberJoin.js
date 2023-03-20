const id = document.getElementById("id");
const idResult = document.getElementById("idResult");

const pw = document.getElementById("pw");
const pwResult = document.getElementById("pwResult");

const pwCheck = document.getElementById("pwCheck");
const pwCheckResult = document.getElementById("pwCheckResult");

const na = document.getElementById("na");
const nameCResult = document.getElementById("nameResult");

const address = document.getElementById("address");
const addressResult =document.getElementById("addressResult");

const phone = document.getElementById("phone");
const phoneResult = document.getElementById("phoneResult");

const email = document.getElementById("email");
const emailResult = document.getElementById("emailResult");

const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let idCheck = false;
let pwLengthCheck = false;
let pwNullCheck = false;
let pwEquqlCheck = false;
let nameCheck = false;
let addressCheck = false;
let phoneCheck = false;
let emailCheck = false;

let checks = [false, false, false, false, false, false, false, false]

//ID검증
id.addEventListener("blur", function(){
    //중복 검사
    let xhttp = new XMLHttpRequest();

    //url, method
    xhttp.open("POST", "./memberIdCheck");

    //header
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //요청 발생 POST일 경우 parmater 전송
    xhttp.send("id= " + id.value);

    //응답 처리
    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState==4 && this.status==200){
            if(this.responseText.trim==true){
                idResult.innerHTML="사용 가능한 ID";
            }else {
                idResult.innerHTML="중복된 ID";
              
            }
        if(this.readyState==4 && this.status!=200){
        }
    }
});

    if(id.value.length != 0){
        idResult.innerHTML='정상적인 아이디 입니다'; 
       // idCheck=true; 
        checks[0] = true;
        idResult.classList.add("blueResult");
        idResult.classList.remove("redResult");
    }else {
        console.log("비어 있음")
        idResult.innerHTML="ID는 필수 사항 입니다";
        //idCheck=false;
        checks[0] = false; 
        idResult.classList.add("redResult");
        idResult.classList.remove("blueResult");
    }
})

pw.addEventListener("keyup",function(){
    if(pw.value.length>=6 && pw.value.length<=12){
        pwResult.innerHTML='정상적인 비번';
        //pwLengthCheck = true;
        checks[1] = true;
        pwResult.classList.add("blueResult");
        pwResult.classList.remove("redResult");
    }else{
        pwResult.innerHTML='비번은 6자 이상 12자 이하여야 합니다';
        checks[1] = false;
        pwResult.classList.add("redResult");
        pwResult.classList.remove("blueResult");
    }
})

pw.addEventListener("blur",function(){
    if(pw.value.length !=0){
        //pwNullCheck = true;
        checks[2] = true;
        pwNullCheck.classList.add("blueResult");
        pwNullCheck.classList.remove("redResult");
    }else{
        pwResult.innerHTML="비밀 번호는 필수 입니다";   
        checks[2] = false; 
        pwNullCheck.classList.add("redResult");
        pwNullCheck.classList.remove("blueResult");
    }
})

pw.addEventListener("change", function(){
    checks[3] = false;
    pwCheck.value='';
    pwCheckResult.innerHTML='pw가 틀립니다';
})

//pw Equal검증
pwCheck.addEventListener("blur",function(){
    if(pwCheck.value == pw.value){
        pwCheckResult.innerHTML="동일한 pw"
        //pwEquqlCheck = true;
        checks[3] = true;
        pwCheckResult.classList.add("blueResult");
        pwCheckResult.classList.remove("redResult");
    }else{
        pwCheckResult.innerHTML="pw가 틀립니다"
        checks[3] = false; 
        pwCheckResult.classList.add("redResult");
        pwCheckResult.classList.remove("blueResult");
    }
})

na.addEventListener("blur",function(){
    if(na.value.length !=0){
        nameResult.innerHTML='';
        //nameCheck=true;
        checks[4] = true;
        nameResult.classList.add("blueResult");
        nameResult.classList.remove("redResult");
    }else{
        console.log("비어 있음")
        nameResult.innerHTML='이름은 필수 입니다';
        checks[4] = false;
        nameResult.classList.add("redResult");
        nameResult.classList.remove("blueResult");
    }
})

address.addEventListener("blur",function(){
    if(address.value.length ==0){
        addressResult.innerHTML='';
        //addressCheck=true;
        checks[5] = true;
    }else{
        console.log("비어 있음")
        addressResult.innerHTML='주소는 필수 입니다';
        checks[5] = false;
    }
})

phone.addEventListener("blur",function(){
    if(phone.value.length !=0){
        phoneResult.innerHTML='';
        //phoneCheck=true;
        checks[6] = true;
    }else{
        console.log("비어 있음")
        phoneResult.innerHTML='전화번호는 필수 입니다';
        checks[6] = false;
    }
});

email.addEventListener("blur",function(){
    if(phone.value.length !=0){
        emailResult.innerHTML='';
       //emailCheck=true;
        checks[7] = true;
    }else{
        console.log("비어 있음")
        emailResult.innerHTML='이메일은 필수 입니다';
        checks[7] = false;
    }
});

//form 전송

btn.addEventListener("click", function(){
        // if(idCheck && pwLengthCheck && pwNullCheck && pwEquqlCheck && nameCheck && addressCheck && phoneCheck && emailCheck == true){
        // frm.submit();
        // }else{
        //     alert("필수 사항을 입력하세요")
        // }
        if (!checks.includes(false)) {
            alert('회원가입 성공');
        } else {
            alert("필수 사항을 입력하세요");
        }
    });