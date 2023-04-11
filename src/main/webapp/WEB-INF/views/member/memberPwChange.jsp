<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
</head>
<body>
	<div class="container-fluid">
	<div class="row justify-content-center">
	<form id="pwForm" action="memberPwChange" method="post">	
					<input type="hidden" name="id" value="${ member.id }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="oldPw" name="oldPw" type="password" required>
					</p>
					<p>
						<label>새 비밀번호</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p>
						<label>새 비밀번호 확인</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
	</p>
	</form>
	</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 4) {
				alert("비밀번호는 5자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
			alert("비밀번호가 변경되었습니다");
		}));
	})
</script>
</body>
</html>