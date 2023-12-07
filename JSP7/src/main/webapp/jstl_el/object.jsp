<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> object.jsp </h1>
	${student1.toString() }<hr>
	
	이름 : ${student1.name }<br>
	나이 : ${student1.age }<br>
	휴대폰 모델 : ${student1.phone.model }<br>
	전화 번호 : ${student1.phone.tel }<hr>
	
	1.
	이름 : ${personList[0].name }<br>
	나이 : ${personList[0].age }<br>
	휴대폰 모델 : ${personList[0].phone.model }<br>
	전화 번호 : ${personList[0].phone.tel }<hr>
	
	2.
	이름 : ${personList[1].name }<br>
	나이 : ${personList[1].age }<br>
	휴대폰 모델 : ${personList[1].phone.model }<br>
	전화 번호 : ${personList[1].phone.tel }<hr>
	
</body>
</html>