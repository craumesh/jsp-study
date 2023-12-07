<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function check(){
			var id = document.fr.id.value;
			if(id == ""){
				alert('아이디를 입력하세요!');
				document.fr.id.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<h1>member/insertForm.jsp(MVC)</h1>
	<fieldset>
	<legend>ITWILL 회원가입</legend><br>
		<form action="./MemberJoinAction.me" name="fr" onsubmit="return check();" method="post">
			ID : <input type="text" name="id"><br>
			PW : <input type="password" name="pw" required><br>
			NM : <input type="text" name="name" required><br>
			GD : <input type="radio" name="gender" value="M" required checked>남성  <input type="radio" name="gender" value="F" required>여성<br>
			AG : <input type="number" name="age"><br>
			EM : <input type="email" name="email"><br><hr>
			<input type="submit" value="회원가입"><br>
		</form>
	</fieldset>
	
</body>
</html>