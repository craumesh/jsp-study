<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updateForm.jsp</h1>
	
	<fieldset>
		<form action="updatePro.jsp" method="post">
			번호 : <input type="number" name="idx"><br>
			수정할 이름 : <input type="text" name="name"><br>
			<input type="submit" value="수정">
		</form>
	</fieldset>
</body>
</html>