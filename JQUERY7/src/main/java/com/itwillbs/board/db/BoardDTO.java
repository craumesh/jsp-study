package com.itwillbs.board.db;

import java.sql.Date;

public class BoardDTO {
	private int bno;
	private String name;
	private String subject;
	private String content;
	private String pass;
	
	private int readcount;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	
	private Date date;
	private String ip;
	private String File;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFile() {
		return File;
	}
	public void setFile(String file) {
		File = file;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", name=" + name + ", subject=" + subject + ", content=" + content + ", pass="
				+ pass + ", readcount=" + readcount + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq=" + re_seq
				+ ", date=" + date + ", ip=" + ip + ", File=" + File + "]";
	}	
}
