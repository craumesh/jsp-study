package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberLoginAction_execute() 호출 ");
		
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		// DAO객체 생성 -> 로그인 체크
		MemberDAO dao = new MemberDAO();
		
		int result = dao.loginMember(dto);
		System.out.println(" M : result : " + result);
		
		ActionForward forward = null;
		
		if(result == 1) {
			// 페이지 이동(JSP)
			//response.sendRedirect(null); // => 어지간하면 사용X
			HttpSession session = request.getSession();
			session.setAttribute("id", dto.getId());
			
			forward = new ActionForward();
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			
			return forward;
		} else if(result == 0) {
			// 페이지 이동(JS)
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(" <script> ");
			out.println(" alert(' 사용자 비밀번호 오류! ') ");
			out.println(" history.back(); ");
			out.println(" </script> ");
			out.close();
			
			return null; // ActionForward 정보가 null => 컨트롤러 페이지 이동X
		} else {
			// 페이지 이동(JS)
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(" <script> ");
			out.println(" alert(' 회원 정보 없음! ') ");
			out.println(" history.back(); ");
			out.println(" </script> ");
		}
		
		return null;
	}
	
}
