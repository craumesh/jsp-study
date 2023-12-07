<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		//한글 처리 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");		
		int age = Integer.parseInt(request.getParameter("age"));		
		String sex = request.getParameter("sex");		
		String[] hobby = request.getParameterValues("hobby");		
		String subject = request.getParameter("subject");
		%>
		 
		아이디 : <%=name %><br>
		나이 : <%=age %> <br>
		성별 : <%=sex %> <br>
		취미 : <%if(hobby != null){
		for(int i = 0; i < hobby.length; i++){
			out.print(hobby[i] + " ");}
		}
		%> <br>
		과목 : <%=subject %>
</body>
</html>