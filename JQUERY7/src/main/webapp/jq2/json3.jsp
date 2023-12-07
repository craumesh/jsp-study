<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con =
	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","1234");
	String sql = "SELECT bno, subject, name, date, readcount FROM itwill_board";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
//	ArrayList boardList = new ArrayList();
	JSONArray boardList = new JSONArray();
	
	while(rs.next()){
//		BoardDTO dto = new BoardDTO();
/* 		dto.setBno(rs.getInt("bno"));
		dto.setName(rs.getString("name"));
		dto.setSubject(rs.getString("subject"));
		dto.setDate(rs.getDate("date"));
		dto.setReadcount(rs.getInt("readcount")); */
		JSONObject dto = new JSONObject();
		dto.put("bno", rs.getInt("bno"));
		dto.put("name", rs.getString("name"));
		dto.put("subject", rs.getString("subject"));
		dto.put("date", String.valueOf(rs.getDate("date")));
//		dto.put("date", rs.getDate("date").toString());
		dto.put("readcount", rs.getInt("readcount"));
		boardList.add(dto);
	}
%>
<%=boardList %>