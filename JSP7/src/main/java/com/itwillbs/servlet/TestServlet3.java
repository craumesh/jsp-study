package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test3") // => web.xml 매핑과 동일(단, 서블릿3.1 버전 이후에만 사용가능)
public class TestServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet doGet() 호출!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet doPost() 호출!");
		
		// 학생 한 명의 정보를 생성해서 전달
		Person student1 = new Person();
		Phone phone = new Phone();
		student1.setName("아이티윌");
		student1.setAge(20);
		student1.setPhone(phone);
		phone.setModel("아이폰15");
		phone.setTel("010-1234-1234");		
		request.setAttribute("student1", student1);	
		
		Person student2 = new Person();
		Phone phone2 = new Phone();
		student2.setName("아이티윌2");
		student2.setAge(30);
		student2.setPhone(phone2);
		phone2.setModel("갠역시노트30");
		phone2.setTel("010-1111-9999");		
		
		// 두개 이상의 정보를 ArrayList에 담아서 전달
		ArrayList personList = new ArrayList();
		personList.add(student1);
		personList.add(student2);
		request.setAttribute("personList", personList);
		
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/object.jsp");
		dis.forward(request, response);
	}

}
