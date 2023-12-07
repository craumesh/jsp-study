package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFuction;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardDeleteAction_execute() 호출");
				
		BoardDTO bdto = new BoardDTO();
		bdto.setBno(Integer.valueOf(request.getParameter("bno")));
		bdto.setPass(request.getParameter("pass"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bdao = new BoardDAO();
		int result = bdao.deleteBoard(bdto);
				
		if(result == 0) {
			JSMoveFuction.alertHistory(response, "비밀번호가 일치하지 않습니다!");
			return null;
		}
		if(result == -1) {
			JSMoveFuction.alertHistory(response, "게시판 글 없음!");
			return null;
		}		
		
		JSMoveFuction.alertLocation(response, "삭제 성공!", "./BoardList.bo?pageNum="+pageNum);
		
		return null;
	}

}
