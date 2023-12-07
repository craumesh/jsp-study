package com.itwillbs.board.db;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 공통) 디비 연결하기(CP)
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mvc");
		con = ds.getConnection();
		
		System.out.println("\t DAO : DB 연결 성공! ");
		System.out.println("\t DAO : " + con);
		
		return con;
	}
	
	// 공통) DB 자원해제	
	public void CloseDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 글쓰기 메서드 - insertBoard()
	public void insertBoard(BoardDTO dto) {
		int bno = 0;
		try {
			// 1.2. DB연결
			con = getCon();	
			
			// * bno 계산하기 => 1부터 1씩 증가
			sql = "select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bno = rs.getInt(1)+1;
			}
			
			System.out.println("\t DAO : 글번호 - "+bno);
			
			// 3. sql 구문 & pstmt 객체
			sql = "insert into itwill_board(bno,name,pass,subject,content,readcount,"
					+ "re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, bno);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());
						
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("\t DAO : "+bno+"번 글쓰기 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
	}
	
	// 글 개수 계산 메서드
	public int getBoardCount() {
		int result = 0;
		try {
			con = getCon();
			sql = "select count(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("\t DAO : 개수 " + result + "개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
		return result;
	}
	
	// 글 개수 계산 메서드(검색어 O)
	public int getBoardCount(String search) {
		int result = 0;
		try {
			con = getCon();
			sql = "select count(*) from itwill_board where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("\t DAO : 개수 " + result + "개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
		return result;
	}
	
	// 글 정보 가져오기 메서드
	public ArrayList getBoardList(int startRow, int pageSize) {		
		ArrayList boardList = new ArrayList();
		try {	
			con = getCon();
			sql = "select * from itwill_board order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));				
				boardList.add(dto);
			}		
			System.out.println("\t DAO : 게시판 글 목록 조회 성공!");
			System.out.println("\t DAO : " + boardList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return boardList;
	}	
	
	// 글 정보 가져오기 메서드
	public ArrayList getBoardList(int startRow, int pageSize, String search) {		
		ArrayList boardList = new ArrayList();
		try {	
			con = getCon();
			sql = "select * from itwill_board where subject like ? order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));				
				boardList.add(dto);
			}		
			System.out.println("\t DAO : 게시판 글 목록 조회 성공!");
			System.out.println("\t DAO : " + boardList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return boardList;
	}	
	
	public void updateReadCount(int bno) {
		try {
			con = getCon();
			sql = "update itwill_board set readcount=readcount + 1 where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
			System.out.println("\t DAO : 게시판 조회수 1 증가 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	public BoardDTO getBoard(int bno) {
		BoardDTO dto = null;
		try {	
			con = getCon();
			sql = "select * from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));	
			}		
			System.out.println("\t DAO : 게시글 조회 성공");	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return dto;
	}
	
	public int updateBoard(BoardDTO bdto) {
		int result = -1;
		try {
			con = getCon();
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getBno());
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				if(rs.getString("pass").equals(bdto.getPass())) {
					sql = "update itwill_board set name=?, subject=?, content=? where bno = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bdto.getName());
					pstmt.setString(2, bdto.getSubject());
					pstmt.setString(3, bdto.getContent());
					pstmt.setInt(4, bdto.getBno());
					result = pstmt.executeUpdate();
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			System.out.println("\t DAO : 게시글 수정 성공");	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
		return result;
	}
	
	public int deleteBoard(BoardDTO bdto) {
		int result = -1;
		try {
			con = getCon();
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getBno());
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				if(rs.getString("pass").equals(bdto.getPass())) {
					sql = "delete from itwill_board where bno = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bdto.getBno());
					result = pstmt.executeUpdate();
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			System.out.println("\t DAO : "+bdto.getBno()+"번 게시글 삭제 성공");	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
		return result;
	}
	
	// 답글쓰기 메서드 - reInsertBoard()
		public void reInsertBoard(BoardDTO dto) {
			int bno = 0;
			try {
				// 1.2. DB연결
				con = getCon();	
				
				sql = "select max(bno) from itwill_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					bno = rs.getInt(1) + 1;
				}
				
				System.out.println("\t DAO : 답글번호 - "+bno);
				
				sql = "update itwill_board set re_seq = re_seq + 1 where re_ref = ? and re_seq > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRe_ref());
				pstmt.setInt(2, dto.getRe_seq());
				int tmp = pstmt.executeUpdate();
				
				if(tmp != 0) {
					System.out.println("\t DAO : 답글 순서 재배치 완료!");
				}
				
				// 3. sql 구문 & pstmt 객체
				sql = "insert into itwill_board(bno,name,pass,subject,content,readcount,"
						+ "re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPass());
				pstmt.setString(4, dto.getSubject());
				pstmt.setString(5, dto.getContent());
				pstmt.setInt(6, 0);
				pstmt.setInt(7, dto.getRe_ref());
				pstmt.setInt(8, dto.getRe_lev()+1);
				pstmt.setInt(9, dto.getRe_seq()+1);
				pstmt.setString(10, dto.getIp());
				pstmt.setString(11, dto.getFile());
							
				// 4. sql 실행
				pstmt.executeUpdate();
				
				System.out.println("\t DAO : "+bno+"번 답글쓰기 완료!");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseDB();
			}		
		}
	
}


