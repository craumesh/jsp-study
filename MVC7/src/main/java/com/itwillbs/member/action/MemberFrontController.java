package com.itwillbs.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

/**
 * 
 * Member에 대한 정보 처리를 모두 수행하는 컨트롤러
 *
 */
// http://localhost:8088/MVC7/MemberJoin.me

public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController_doProcess() 호출 ");
		System.out.println(" C : GET/POST방식 모두 처리 ");
		System.out.println("\n----------------------- 1. 가상주소 계산 시작 ------------------------");
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getRequestURL()); // URI = URL - (프로토콜 - IP - 포트번호)
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : " + requestURI);
		String CTXPath = request.getContextPath();
		System.out.println(" C : CTXPath : " + CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println(" C : command : " + command);
		System.out.println("----------------------- 1. 가상주소 계산 끝 ------------------------");
		
		
		System.out.println("\n----------------------- 2. 가상주소 매핑 시작 ------------------------");
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/MemberJoin.me")) {
			System.out.println(" C : /MemberJoin.me 매핑 ");
			System.out.println(" C : 패턴1 - DB처리X, 뷰페이지 이동 ");
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);
			System.out.println(" C : " + forward);
		} else if(command.equals("/MemberJoinAction.me")) {
			System.out.println(" C : /MemberJoinAction.me 매핑 ");
			System.out.println(" C : 패턴2 - DB처리O, 뷰페이지 이동 ");
			
			// MemberJoinAction 객체생성
			//MemberJoinAction mja = new MemberJoinAction();
			action = new MemberJoinAction();
			try {
				//mja.execute(request, response);
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberLogin.me")) {
			System.out.println(" C : /MemberLogin.me 호출 ");
			System.out.println(" C : 패턴 1 - DB처리X, 뷰페이지 이동");
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
			System.out.println(" C : " + forward);
		} else if(command.equals("/MemberLoginAction.me")) {
			System.out.println(" C : /MemberLoginAction.me 매핑 ");
			System.out.println(" C : 패턴2 - DB처리O, 뷰페이지 이동 ");
			
			// MemberLoginAction() 객체생성
			// 처리결과를 가지고 이동
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} else if(command.equals("/Main.me")) {
			System.out.println(" C : /Main.me 매핑 ");
			System.out.println(" C : 패턴 1 - DB처리X, 뷰페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./member/main.jsp");
			forward.setRedirect(false);			
			System.out.println(" C : " + forward);			
		} else if(command.equals("/MemberLogout.me")){
			System.out.println(" C : /MemberLogout.me 매핑 ");
			System.out.println(" C : 패턴 2 - 데이터처리O, 뷰페이지 이동");
			
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberInfo.me")){
			System.out.println(" C : /MemberInfo.me 매핑 ");
			System.out.println(" C : 패턴 3 - 데이터처리O, 뷰페이지 출력");
			
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberUpdate.me")){
			System.out.println(" C : /MemberUpdate.me 매핑 ");
			System.out.println(" C : 패턴 3 - 데이터처리O, 뷰페이지 출력");
			
			action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberUpdateProAction.me")){
			System.out.println(" C : /MemberUpdate.me 매핑 ");
			System.out.println(" C : 패턴 2 - 데이터처리O, 뷰페이지 이동");
			
			action = new MemberUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberDelete.me")){
			System.out.println(" C : /MemberDelete.me 매핑 ");
			System.out.println(" C : 패턴 1 - DB처리X, 뷰페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./member/deleteForm.jsp");
			forward.setRedirect(false);			
			System.out.println(" C : " + forward);	
		} else if(command.equals("/MemberDeleteAction.me")){
			System.out.println(" C : /MemberDeleteAction.me 매핑 ");
			System.out.println(" C : 패턴 2 - 데이터처리O, 뷰페이지 이동");
			
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberList.me")){
			System.out.println(" C : /MemberList.me 매핑 ");
			System.out.println(" C : 패턴 2 - 데이터처리O, 뷰페이지 이동");
			
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		System.out.println("----------------------- 2. 가상주소 매핑 끝 ------------------------");
		
		
		System.out.println("\n----------------------- 3. 가상주소 이동 시작 ------------------------");
		if(forward != null) { // 이동 정보가 존재할때
			if(forward.isRedirect()) {
				System.out.println(" C : " + forward.getPath() + "로, 이동방식 : sendRedirect()");
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println(" C : " + forward.getPath() + "로, 이동방식 : forward()");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		System.out.println("----------------------- 3. 가상주소 이동 끝 ------------------------");
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n C : MemberFrontController_doGet() 호출 ");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController_doPost() 호출 ");
		doProcess(request, response);
	}
	
}
