package com.itwillbs.ex;

public class Calculator {
	
	public int sum(Student s) {
		return s.getKor() + s.getEng() + s.getMath();
	}
	
	public int avr(Student s) {
		return (int)Math.floor((double)(sum(s) / 3));
	}	
}
