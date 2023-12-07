package com.itwillbs.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8088/JSP7/exServlet

@WebServlet("/exServlet")
public class ExServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출!");
		doPost(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 호출!");
		Person p1 = new Person();
		p1.setName("홍길동");
		p1.setAge(99);
		Phone phone1 = new Phone();
		phone1.setModel("갤럭시탭20");
		phone1.setTel("070-928-3333");
		p1.setPhone(phone1);
		
		//request.setAttribute("p1", p1);
		
		Person p2 = new Person();
		p2.setName("김좌진");
		p2.setAge(999);
		Phone phone2 = new Phone();
		phone2.setModel("갤럭시플립10");
		phone2.setTel("011-332-1094");
		p2.setPhone(phone2);
		
		Vector personVector = new Vector();
		personVector.add(p1);
		personVector.add(p2);
		
		request.setAttribute("personVector", personVector);
		
		//RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/core_set2.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/core_foreach.jsp");
		dis.forward(request, response);
	}
	
}
