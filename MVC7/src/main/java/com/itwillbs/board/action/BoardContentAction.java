package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardContentAction_execute() 호출");
		
		// 전달 정보 저장
		int bno = Integer.valueOf(request.getParameter("bno"));
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		String search = request.getParameter("search");
		
		// BoardDAO 객체 - 특정 글 조회수 증가, 내용 가져오기
		BoardDAO bdao = new BoardDAO();
		bdao.updateReadCount(bno);
		
		// 글 정보 request 영역에 저장
		// pageNum값도 같이 저장
		BoardDTO dto = bdao.getBoard(bno);
		request.setAttribute("dto", dto);
		request.setAttribute("bno", bno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("search", search);
			
		// 페이지 이동 준비(./board/content.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/content.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
