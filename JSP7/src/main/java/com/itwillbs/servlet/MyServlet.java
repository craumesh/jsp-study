package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	
	// Ctrl + 클릭
	// http://localhost:8088/JSP7/myServlet.com
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() 실행 - 서블릿 클래스(객체) 초기화!");
	}	

	// Shift + Alt + S -> V
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyServlet-doGet() 실행!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyServlet-doPost() 실행!");
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().append("<h1>집에 가고 싶어요</h1>");
		// => 직접적으로 태그를 작성해서 사용 (불편함)
		// => JSP 페이지를 사용
		
		// 서블릿(매핑) + JSP(화면) 같이 사용
		// => JSP 페이지로 이동(포워딩)
		// 하지만 액션태그 포워딩은 JSP페이지에서만 사용가능하기 때문에 RequestDispatcher 사용
		RequestDispatcher dis = request.getRequestDispatcher("./board/myServlet.jsp");
		dis.forward(request, response);	
		
	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출 - 서블릿 클래스(객체) 제거!");
	}	
	
}
