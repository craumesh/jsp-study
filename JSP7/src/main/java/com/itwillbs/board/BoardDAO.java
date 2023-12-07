package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * DAO : Date Access Object - 데이터 처리 객체
 * 	=> DB 데이터, MYSQL 과 관련된 모든 처리를 수행하는 객체
 * 
 * DTO : Data Transfer Object - 데이터 전송 객체
 * 	=> 자바빈 객체 / VO
 * 	=> DB에 저장된 데이터를 한번에 저장하는 객체
 */

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	/**
	 * 
	 * getConnection()
	 * BoardDAO 객체 안에서만 사용가능한 메서드
	 * 디비 연결에 관한 동작 모두 처리
	 * @throws Exception 
	 */
	// 디비 연결 처리 메서드-getConnection()
	private Connection getConnection() throws Exception {
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";		
		
		Class.forName(DRIVER);
		System.out.println(" DAO 드라이버 로드 성공!");
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" DAO DB 연결 성공!");
		
		return con;
	}	
	
	// 글정보 저장 메서드 - insertBoard()
	public void insertBoard(BoardBean bb) {
		int bno = 0;
		try {		
			getConnection();
			// 글 번호 계산
			sql = "select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				bno = rs.getInt("max(bno)") + 1; // 컬럼명 조회
				bno = rs.getInt(1) + 1;	// 컬럼인덱스 - 첫번째 요소 조회
				// => rs.getInt() 리턴값이 SQL의 NULL값이라면 0을 리턴
			}
			System.out.println("bno : " + bno);
			
			sql = "insert into itwill_board(bno, name, pass, subject, content, readcount, re_ref, re_lev, re_seq, date, ip, file) values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			
			pstmt.setInt(6, 0); // 생성 시 조회수 0
			pstmt.setInt(7, bno); // bno == re_ref
			pstmt.setInt(8, 0); // 생성 시 re_lev 0
			pstmt.setInt(9, 0); // 생성 시 re_seq 0
			
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			pstmt.executeUpdate();
			System.out.println("글작성 완료!");
			
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	// 글정보 저장 메서드 - insertBoard()	
	
	public int getBoardCount() {
		int result = 0;
		try {
			getConnection();
			// 글 개수 계산
			sql = "select count(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("Cnt : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}
	
//	public String getBoardList() {
//		try {
//			getConnection();
//			sql = "select * from itwill_board";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			String tag = "";
//			while(rs.next()) {
//				tag += "<tr><td>" + rs.getInt("bno") + "</td>";
//				tag += "<td><a href='readForm.jsp'>" + rs.getString("subject") + "</a></td>";
//				tag += "<td>" + rs.getString("name") + "</td>";
//				tag += "<td>" + rs.getDate("date") + "</td>";
//				tag += "<td>" + rs.getInt("readcount") + "</td>";
//				tag += "<td>" + rs.getString("ip") + "</td></tr>";				
//			}			
//			return tag;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
//		return "";
//	}
	
	public ArrayList getBoardList() {		
		ArrayList boardList = new ArrayList();
		try {	
			getConnection();
			sql = "select * from itwill_board order by re_ref desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));				
				boardList.add(bb);
			}		
			System.out.println("DAO 게시판 글 목록 조회 성공!");
			System.out.println("DAO : " + boardList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return boardList;
	}
	
	public ArrayList getBoardList(int startRow, int pageSize) {		
		ArrayList boardList = new ArrayList();
		try {	
			getConnection();
			sql = "select * from itwill_board order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));				
				boardList.add(bb);
			}		
			System.out.println("DAO 게시판 글 목록 조회 성공!");
			System.out.println("DAO : " + boardList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return boardList;
	}	
	
	public void updateReadCount(int bno){
		try {
			getConnection();
			sql = "update itwill_board set readcount=readcount+1 where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
			System.out.println("DAO 게시판 조회수 1 증가 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardBean getBoard(int bno) {
		BoardBean bb = null;
		try {	
			con = getConnection();
			sql = "select * from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bb = new BoardBean();
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));	
			}		
			System.out.println("DAO 게시글 조회 성공");	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bb;
	}
	
	public int updateBoard(BoardBean bb) {
		int result = -1;
		
		try {
			con = getConnection();
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getBno());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(bb.getPass())) {
					// 게시판에 글도 있고 비밀번호도 같음
					// => 글 수정
					sql = "update itwill_board set name=?, subject=?, content=? where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getBno());
					result = pstmt.executeUpdate();
					// => SQL구문(insert, update, delete)이 몇줄 영향을 미치는가를 정수형태로 리턴
					//result = 1;
					System.out.println("DAO 게시글 수정 완료!");
				} else {
					// 비밀번호 틀림
					result = 0;
				}
			} else {
				// 게시판 글 없음
				result = -1;
			}
			System.out.println("DAO 게시글 수정 처리 완료 " + result);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}
	
	public int deleteBoard(BoardBean bb) {
		int result = -1;
		
		try {
			con = getConnection();
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getBno());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(bb.getPass())) {
					// 게시판에 글도 있고 비밀번호도 같음
					// => 글 수정
					sql = "delete from itwill_board where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getBno());
					result = pstmt.executeUpdate();
					// => SQL구문(insert, update, delete)이 몇줄 영향을 미치는가를 정수형태로 리턴
					//result = 1;
					System.out.println("DAO 게시글 삭제 완료!");
				} else {
					// 비밀번호 틀림
					result = 0;
				}
			} else {
				// 게시판 글 없음
				result = -1;
			}
			System.out.println("DAO 게시글 삭제 처리 완료 " + result);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}
	
	public void reInsertBoard(BoardBean bb) {
		int bno = 0;
		try {
			con = getConnection();
			/* 1. 답글 번호 계산 */
			sql = "select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bno = rs.getInt(1) + 1;
			}
			System.out.println("DAO 답글 BNO :" + bno);
			
			
			/* 2. 답글 seq 계산 */
			// => 답글 순서 재배치 (같은 그룹의 글 중에서 기존의 seq보다 큰 값이 존재하는 경우 +1
			sql = "update itwill_board set re_seq = re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			int tmp = pstmt.executeUpdate();
			if(tmp >= 1) {
				System.out.println("DAO 답글 순서 재배치 완료!" + tmp);
			}
			
			
			/* 3. 나머지 정보 사용 글쓰기 */			
			sql = "insert into itwill_board(bno, name, pass, subject, content, readcount, re_ref, re_lev, re_seq, date, ip, file) values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			
			pstmt.setInt(6, 0); // 생성 시 조회수 0
			pstmt.setInt(7, bb.getRe_ref()); // re_ref
			pstmt.setInt(8, bb.getRe_lev()+1); // re_lev
			pstmt.setInt(9, bb.getRe_seq()+1); // re_seq
			
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			pstmt.executeUpdate();
			System.out.println("답글 작성 완료!");			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
	}
	
}
