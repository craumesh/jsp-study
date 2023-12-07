<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> deleteForm.jsp </h1>
	<!-- 인덱스 번호, 주민번호 입력하여 해당 사용자 정보 삭제 -->
	
	<fieldset>
		<form action="deletePro.jsp" method="post">
			인덱스번호 : <input type="number" name="idx"><br>
			주민번호 : <input type="text" name="jumin" placeholder="EX) 000000-1111111"><br>
			<input type="submit" value="삭제">
		</form>
	</fieldset>
</body>
</html>