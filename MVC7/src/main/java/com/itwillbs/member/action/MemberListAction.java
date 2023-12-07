package com.itwillbs.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberListAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberListAction_execute() 호출");
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = new MemberDTO();
		dto.setId((String)session.getAttribute("id"));
		
		ActionForward forward = new ActionForward();
		if(dto.getId() == null || !dto.getId().equals("admin")) {
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO dao = new MemberDAO();
		ArrayList arr = dao.getMemberList();
		
		request.setAttribute("memberList", arr);
		
		forward.setPath("./member/list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
