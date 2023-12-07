package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class AjaxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : /AjaxAction_execute 호출");
		
//		BoardDAO dao = new BoardDAO();
		// 1. 데이터 전달
//		String msg = "집에 보내줘요";
//		int num = 100;
//		response.setContentType("text/html; charset=UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().print(num);
		
		// 2. 일반 객체 전달
//		BoardDTO dto = dao.getBoard(1);
//		response.setContentType("application/json; charset=UTF-8");
//		response.getWriter().print(dto);
		// => ajax 호출X (js-BoardDTO 객체를 인식불가)
		
		// 3. JSON 객체 전달
//		JSONObject obj = new JSONObject();
//		obj.put("bno", 100);
//		obj.put("subject", "애옹");
		JSONObject obj2 = new JSONObject();
		obj2.put("bno", 100);
		obj2.put("subject", "애옹");
		JSONObject obj3 = new JSONObject();
		obj3.put("id", "ADMIN");
		obj3.put("pw", "1234");
		
		// => MAP 형태로 2가지 객체 전달
//		JSONObject obj4 = new JSONObject();
//		obj4.put("obj2",obj2);
//		obj4.put("obj3",obj3);
		
		// => ArrayList 형태로 여러개의 객체 전달
		JSONArray arrlist = new JSONArray();
		arrlist.add(obj2);
		arrlist.add(obj3);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(arrlist);
		
//		BoardDTO dto = dao.getBoard(4);
//		obj.put("name", dto.getName());
//		response.setContentType("application/json; charset=UTF-8");
//		response.getWriter().print(obj);
		
		return null;
	}

}
