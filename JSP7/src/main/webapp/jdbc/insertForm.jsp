<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jdbc/insertForm.jsp</h1>
	<fieldset>
		<form action="insertPro.jsp" method="post">
			Name <input type="text" name="name"> <br>
			Gender <input type="radio" name="gd" value="M">M  <input type="radio" name="gd" value="F">F <br>
			Age <input type="number" name="age"> <br>
			Jumin <input type="text" name ="jm1"> - <input type="text" name ="jm2"> <br>
			<input type="submit" value="전송">
		</form>
	</fieldset>
</body>
</html>