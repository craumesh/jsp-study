package com.itwillbs.ex;

/**
 * 학생의 점수 kor, eng, math 정보 저장하는 객체
 */

public class Student {
	
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	// public Student(){}
	// => 기본생성자 포함
	// => 컴파일러가 기본생성자를 자동으로 생성
	//	(오버로딩된 생성자가 있을 경우 제외)
	
	public Student() {}
	
	public Student(String name) {
		this.name = name;
	}

	public Student(int n, String sub) {
		switch(sub) {
		case "kr": kor = n; break;
		case "en": eng = n; break;
		case "ma": math = n; break;
		}
	}
	
	public Student(int kor, int eng, int math) {
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	public void setSubJect(int n, String sub) {
		switch(sub) {
		case "kr": kor = n; break;
		case "en": eng = n; break;
		case "ma": math = n; break;
		}
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setSubNum(int n, String sub) {
		switch(sub) {
		case "kr": kor = n; break;
		case "en": eng = n; break;
		case "ma": math = n; break;
		}
	}	
	
	public int getKor() {
		return kor;
	}
	
	public int getEng() {
		return eng;
	}
	
	public int getMath() {
		return math;
	}
	
	public String getName() {
		return name;
	}

}
