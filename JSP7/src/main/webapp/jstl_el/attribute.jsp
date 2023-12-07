<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attribute.jsp</h1>
	<%
		int cnt = 1000;
		
		// page 영역에 cnt 값을 3000 저장
		
		pageContext.setAttribute("cnt", 3000);
	%>
	
	JSP 표현식 - cnt : <%=cnt %><br>	
	EL 표현식 - cnt : ${cnt }<br>
	EL 표현식(request) - cnt : ${requestScope.cnt }<br>
	EL 표현식(session) - cnt : ${sessionScope.cnt }<br>
	
	<h2>
		EL표현식에서 영역객체정보를 생략가능 <br>
		=> 데이터를 찾을때 모든 영역의 데이터를 검색(영역의 크기 범위 순서)<br>
		pageScope < requestScope < SessionScope < applicationScope<br>
					cnt = 2000
		cnt = 3000<br>
		=> 만약 모든 영역에 값이 없을때는 그대로 종료<br>
		=> 동일한 이름의 속성(Attribute)이 있을 경우 영역객체 정보가 없으면<br>
			영역의 범위가 적은 객체 정보를 사용<br>
	</h2>
</body>
</html>