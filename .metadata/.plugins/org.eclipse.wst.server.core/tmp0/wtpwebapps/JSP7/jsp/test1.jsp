<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	<!-- You Suck -->
	<!-- html 주석문 : ctrl + shift + / -->
	<script>
		// JS주석문
		/* JS주석문 */
	</script>
	<%-- JSP주석문 --%>
	<% 
		// 자바 주석문
		/* 자바 주석문 */
	%>
	
	
	<!-- 1. 선언문 -->
	<%!
		// 자바코드 사용 가능
		int i = 0;
	
		// 메서드 선언 가능(메서드 내부 작성 가능)
		public void methodA(){
			System.out.printf("에옹");
		}
		
		// 메서드 호출 불가능
		//System.out.printf("에옹");
	%>
	
	
	<!-- 2. 스크립틀릿 -->
	<%
		int i2 = 1; // 지역변수
		
		// 메서드 호출 가능
		System.out.printf("%d",i);
		System.out.printf("에옹");
	%>
	
	<!-- 3. 표현식 -->
	<%=i %> <br>
	i + i2 = <%= i + i2 %><br>
	
</body>
</html>