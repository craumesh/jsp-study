<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginForm.jsp</h1>
	<h2>로그인</h2>
	
	<fieldset>
		<legend>ITWILL 로그인 페이지</legend>
			<form action="sessionLoginPro.jsp" method="post">
				<input type="text" name="id"><br>
				<input type="text" name="pw"><br>
				<input type="submit" value="로그인">	
			</form>
	</fieldset>
</body>
</html>