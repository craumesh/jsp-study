package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardReWriteAction_execute() 호출");
		
		// 전달정보 저장
		BoardDTO dto = new BoardDTO();
		dto.setBno(Integer.valueOf(request.getParameter("bno")));
		dto.setName(request.getParameter("name"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));		
		dto.setIp(request.getRemoteAddr());
		dto.setRe_ref(Integer.valueOf(request.getParameter("re_ref")));
		dto.setRe_lev(Integer.valueOf(request.getParameter("re_lev")));
		dto.setRe_seq(Integer.valueOf(request.getParameter("re_seq")));
		System.out.println("\t M : " + dto.toString());		
		
		// BoardDAO 객체 생성 - 글쓰기 수행 메서드
		BoardDAO bdao = new BoardDAO();
		bdao.reInsertBoard(dto);
		
		// 페이지 이동 준비
		String pageNum = request.getParameter("pageNum");
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo?pageNum"+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}
	
}
