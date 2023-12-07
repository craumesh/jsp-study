package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestServlet1 extends HttpServlet {
	
	// http://192.168.7.1:8088/JSP7/test1
	


	@Override
	public void init() throws ServletException {
		System.out.println("Servlet 초기화!");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet doGet() 호출!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet doPost() 호출!");
		
		// page 영역 객체로는 전달불가		
		// 데이터 생성 -> JSP 페이지에서 출력
		// request영역에 정보를 저장해서 전달
		request.setAttribute("cnt", 2000);
		
		// 세션은 서블릿에서 기본 제공되지 않기 때문에 직접 선언하여 값을 저장해야함
		HttpSession session = request.getSession();
		session.setAttribute("cnt", 5000);		
		
		// 서블릿 + JSP (포워딩)
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/attribute.jsp");
		dis.forward(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Servlet 제거!");
	}
	
	
}
