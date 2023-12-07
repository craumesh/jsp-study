package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Resultset;

/**
 * 
 * MemberDAO : DB관련 처리를 모두 수행하는 객체
 * 	(Data Access Object)
 *
 */

public class MemberDAO {
	
	// 공통 변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 공통메서드(기능)
	
	/////////////////////////////////////////디비 연결 메서드/////////////////////////////////////////////////
	private Connection getCon() throws Exception {
//		final String DRIVER = "com.mysql.cj.jdbc.Driver";
//		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
//		final String DBID = "root";
//		final String DBPW = "1234";		
//		
//		Class.forName(DRIVER);
//		System.out.println(" DAO : 드라이버 로드 성공!");
//		con = DriverManager.getConnection(DBURL, DBID, DBPW);
//		System.out.println(" DAO : DB 연결 성공!");
		
		// Connection Pool을 사용한 디비 연결
		
		// 프로젝트의 정보를 확인(JNDI)
		Context initCTX = new InitialContext();
		// 프로젝트안에 작성된 DB 연결정보(context.xml)를 불러오기
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mvc");
		// DB 연결 수행
		con = ds.getConnection();
		System.out.println(" DAO : DB 연결 성공! (커넥션풀)");
		System.out.println(" DAO : " + con);
		
		return con;
	}
	/////////////////////////////////////////디비 연결 메서드/////////////////////////////////////////////////
	
	/////////////////////////////////////////디비 연결(자원) 해제 메서드/////////////////////////////////////////////////
	public void CloseDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println(" DAO : DB 자원해제 완료! ");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/////////////////////////////////////////디비 연결(자원) 해제 메서드/////////////////////////////////////////////////
	
	// 회원가입 메서드
	public void insertMember(MemberDTO dto){
		try {
			// 1.2. DB연결
			con = getCon();
			
			// 3. SQL 작성 & pstmt 객체
			sql = "insert into itwill_member (id,pw,name,gender,age,email,regdate) "
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setInt(5, dto.getAge());
			pstmt.setString(6, dto.getEmail());
			pstmt.setTimestamp(7, dto.getRegdate());
			
			// 4. SQL 실행
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 회원가입 성공! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
	}
	// 회원가입 메서드
	
	// 로그인 메서드
	public int loginMember(MemberDTO dto) {
		int result = -1;
		try {
			con = getCon();
			
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pw").equals(dto.getPw())) {
					result = 1;
				} else {
					result = 0;
				}
			}
			System.out.println(" DAO : 로그인 처리 완료 (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return result;
	}
	// 로그인 메서드
	
	// 정보조회 메서드
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		try {
			con = getCon();
			
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}	
			System.out.println(" DAO : 회원 정보 조회 완료 ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
		return dto;
	}
	// 정보조회 메서드
	
	// 정보변경 메서드
//	public MemberDTO updateMember(MemberDTO dto) {
//		try {
//			con = getCon();
//			
//			sql = "select * from itwill_member where id=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getId());			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				sql = "update itwill_member set name=?, email=? where id=?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, dto.getName());
//				pstmt.setString(2, dto.getEmail());
//				pstmt.setString(3, dto.getId());
//				pstmt.executeUpdate();
//			}
//			System.out.println(" DAO : 회원 정보 수정 완료 ");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			CloseDB();
//		}		
//		return dto;
//	}
	
	public int updateMember(MemberDTO dto) {
		int result = -1;
		
		try {
			con = getCon();
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(dto.getPw().equals(rs.getString("pw"))) {
					sql = "update itwill_member set name=?, email=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getEmail());
					pstmt.setString(3, dto.getId());
					result = pstmt.executeUpdate();					
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			System.out.println(" DAO : 회원 정보 수정 완료 (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return result;
	}
	// 정보변경 메서드
	
	// 회원탈퇴 메서드	
	public int deleteMember(MemberDTO dto) {
		int result = -1;
		
		try {
			con = getCon();
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(dto.getPw().equals(rs.getString("pw"))) {
					sql = "delete from itwill_member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getId());
					result = pstmt.executeUpdate();					
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			System.out.println(" DAO : 회원 정보 수정 완료 (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return result;
	}
	// 회원탈퇴 메서드
	
	// 회원정보확인 메서드
	public ArrayList getMemberList() {
		ArrayList arr = new ArrayList();
		try {
			con = getCon();
			sql = "select * from itwill_member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setAge(rs.getInt("age"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				arr.add(dto);
			}
			System.out.println(" DAO : 회원 목록 조회 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return arr;
	}
	// 회원정보확인 메서드
}
