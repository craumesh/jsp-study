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
	<h1>member/insertForm.jsp</h1>
	<fieldset>
	<legend>ITWILL 회원가입</legend><br>
		<form action="insertPro.jsp" name="fr" onsubmit="return check();" method="post">
			ID : <input type="text" name="id"><br>
			PW : <input type="password" name="pw" required><br>
			NM : <input type="text" name="name" required><br>
			GD : <input type="radio" name="gender" value="M" required checked>남성  <input type="radio" name="gender" value="F" required>여성<br>
			BD : 
			<select name="bYear">
			<option value="">년</option>
			<%for(int i = 2016; i >= 1900; i--) {%>
				<option value="<%=i%>"><%=i %></option>
			<%} %>
			</select>
			<select name="bMonth">
			<option value="">월</option>
			<%for(int i = 1; i <= 12; i++) {%>
				<option value="<%=i%>"><%=i %></option>
			<%} %>
			</select>
			<select name="bDay">
			<option value="">일</option>
			<%for(int i = 1; i <= 31; i++) {%>
				<option value="<%=i%>"><%=i %></option>
			<%} %>
			</select><br>
			EM : <input type="text" name="email"><br><hr>
			<input type="submit" value="회원가입"><br>
		</form>
	</fieldset>
	
</body>
</html>