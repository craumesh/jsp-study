package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFuction;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberDeleteAction_execute() 호출 ");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO dto = new MemberDTO();
		dto.setId((String)session.getAttribute("id"));
		dto.setPw(request.getParameter("pw"));
		System.out.println(dto.getPw());
		
		ActionForward forward = new ActionForward();
		if(dto.getId() == null) {
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMember(dto);
				
		System.out.println(" M : 업데이트 결과 " + result);
		
		if(result == 1) { // 수정 완료 -> 메인 페이지 이동
			JSMoveFuction.alertLocation(response, "회원탈퇴 완료!", "./Main.me");
			session.invalidate();
			return null;
		} else if(result == 0) { // 수정실패 -> 비밀번호 오류 -> 뒤로가기 이동
			JSMoveFuction.alertHistory(response, "탈퇴실패 - 비밀번호 오류!");
			return null;
		} else {
			JSMoveFuction.alertHistory(response, "탈퇴실패 - 회원정보 없음!");
			return null;
		}
	}

}
