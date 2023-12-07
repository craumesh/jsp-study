package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFuction;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberUpdateProAction_execute() 호출 ");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward;
		}
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		
		MemberDAO dao = new MemberDAO();
		//dto = dao.updateMember(dto);
		int result = dao.updateMember(dto);
		System.out.println(" M : 업데이트 결과 " + result);
		//System.out.println(" M : 업데이트 결과 " + dto);
		
		// JSMoveFuction.alertLocation(response, msg, url);
		if(result == 1) { // 수정 완료 -> 메인 페이지 이동
			JSMoveFuction.alertLocation(response, "회원정보 수정 완료!", "./Main.me");
			return null;
		} else if(result == 0) { // 수정실패 -> 비밀번호 오류 -> 뒤로가기 이동
			JSMoveFuction.alertHistory(response, "수정실패 - 비밀번호 오류!");
			return null;
		} else {
			JSMoveFuction.alertHistory(response, "수정실패 - 회원정보 없음!");
			return null;
		}
		
//		request.setAttribute("dto", dto);
//		
//		forward.setPath("./member/info.jsp");
//		forward.setRedirect(false);
//		
//		return forward;
	}

}
