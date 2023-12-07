package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {

	// http://192.168.7.1:8088/JSP7/test2
	

	@Override
	public void init() throws ServletException {
		System.out.println("TestServlet2 초기화!");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2 doGet() 호출!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2 doPost() 호출!");
		
		String[] foods = {"푸아그라","샥스핀","동파육","하와이안피자","민트초코아이스크림"};
		request.setAttribute("foods", foods);
		
		ArrayList fruits = new ArrayList();
		fruits.add("버네너");
		fruits.add("에푸루");
		fruits.add("어륀지");
		fruits.add("워러멜런");
		fruits.add("그뤠잇후");
		request.setAttribute("fruits", fruits);
		
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/arrays.jsp");
		dis.forward(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("TestServlet2 제거!");
	}
	
	
}
