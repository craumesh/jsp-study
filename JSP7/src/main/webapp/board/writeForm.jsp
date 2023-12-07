<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writeForm.jsp</h1>
	
	<fieldset>
		<legend>ITWILL 게시판 글쓰기</legend>
		<form action="writePro.jsp" method="post">
			글쓴이 : <input type="text" name="name" size="15"> 비밀번호 : <input type="password" name="pass" size="20"><br>
			제목 : <input type="text" name="subject" size="80"><br>
			내용 : <textarea rows="20" cols="100" name="content"></textarea><hr>
			
			<input type="submit" value="작성">
			<input type="button" value="취소" onclick="location.href='boardList.jsp'">
		
		</form>
	
	</fieldset>
	
	
</body>
</html>