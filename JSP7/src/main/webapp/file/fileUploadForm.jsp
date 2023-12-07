<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./file/fileUploadForm.jsp</h1>
	
	<%
		// 파일 업로드(p305)
		// => 자바의 입출력 스트림사용(직접 X, 컴포넌트 사용-이미 만들어진것)
		// => cos.jar 라이브러리 사용
	%>
	
	<fieldset>
		<legend> 파일 업로드 </legend>
		<!-- 반드시 post 방식으로 enctype="multipart/form-data" 속성을 사용  -->
		<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
			이름 : <input type="text" name="name"> <br>
			메세지 : <input type="text" name="msg"> <br>
			첨부파일 : <input type="file" name="file"> <br>
			<input type="submit" value="전송">
		</form>
	</fieldset>
</body>
</html>