package com.itwillbs.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardListAction_execute() 호출");

		// 전달 검색어 정보 저장
		String search = request.getParameter("search");		

		// 기존에 저장된 글정보를 가져와서 화면에 출력
		BoardDAO dbao = new BoardDAO();

		int count = 0;
		
		if (search == null) {
			System.out.println("\t M : 검색어 없음!");
			count = dbao.getBoardCount();
		} else {
			// - 검색어가 있을때는 검색어에 대한 결과값의 존재유무를 확인해야함(결과값이 없을 시 에러발생)
			System.out.println("\t M : 검색어 - " + search);
			count = dbao.getBoardCount(search);
		}
		System.out.println("\t M : 글 개수 : " + count);

		// DB에 저장된 글의 수를 체크해서 있을때만
		// 글정보 모두를 조회
		/******************** 페이징 처리 1 *********************/
		// 한페이지에 출력할 글의 개수 설정
		int pageSize = 10;

		// 현 페이지가 몇 페이지 인지 확인
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		// 시작 행 번호 계산하기 - 1 11 21 31 41
		int currentPage = Integer.valueOf(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝 행 번호 계산하기 - 10 20 30 40 50
		int endRow = currentPage * pageSize;
		/********************* 페이징 처리 1 ********************/

		// DAO - 글정보 모두(list)를 가져오는 메서드 호출
		ArrayList boardList = new ArrayList();
		if (count > 0 && search == null) {
			boardList = dbao.getBoardList(startRow, pageSize);
		} else if(count > 0 && search != null) {
			boardList = dbao.getBoardList(startRow, pageSize, search);
		} else {
			System.out.println("\t M: 게시글이 존재하지 않음!");
		}
		System.out.println("\t M : size - " + boardList.size());

		// 리스트를 출력 => 연결된 뷰페이지에서 출력하도록 정보 전달
		request.setAttribute("boardList", boardList);

		/********************* 페이징 처리 2 ********************/
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1) + 1;

		// 한 화면에 보여줄 페이지 블럭 개수
		int pageBlock = 2;

		// 페이지 블럭의 시작 번호 계산
		// 1페이지 => 1 , 11페이지 => 11
		// 5페이지 => 1 , 25페이지 => 21
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

		// 페이지 블럭의 마지막 번호 계산
		// 1페이지 => 10
		// 13페이지 => 20
		int endPage = startPage + pageBlock;
		// 페이지의 글이 없는 경우
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		/********************* 페이징 처리 2 ********************/

		// 페이징 처리에 필요한 정보 모두를 request영역에 저장해서 전달
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardList.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
