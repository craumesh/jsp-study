<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testForm2.jsp</h1>
	<fieldset>
		<form action="testPro2.jsp" method="get" name="fr" onsubmit="return fn();">
			이름 : <input type="text" name="name">
			나이 : <input type="number" name="age">
			<hr>
			성별 : <input type="radio" name="sex" value="남성">남
			<input type="radio" name="sex" value="여성">여 <br>
			취미 : <input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="낚시">낚시 <br>
			과목 : <select name="subject" size="1">
			<option value=""> 과목을 선택하세요 </option>
			<option value="JAVA"> JAVA </option>
			<option value="JS"> JS </option>
			<option value="JSP"> JSP </option>
			<option value="WEB"> WEB </option>
			<option value="DB"> DB </option>
			</select> <br>
			<input type="submit" value="전송">
		</form>
	</fieldset>
	<script>
		function fn(){
			if(document.fr.name.value == ""){
				alert("이름을 입력하세요! ");
				return false;
			}
		}
	</script>
</body>
</html>