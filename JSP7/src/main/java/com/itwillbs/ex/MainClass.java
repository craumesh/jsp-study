package com.itwillbs.ex;
//import java.util.*;

public class MainClass {
	
//	private static int sum(int n1, int n2, int n3) {
//		return n1 + n2 + n3;
//	}
//	
//	private static int sum(Student s) {
//		return sum(StudgetKor());
//	}
	
//	private static int average = 0;
//	
//	private static void avr(int n1, int n2, int n3) {
//		average = (int)Math.floor((double)(sum(n1, n2, n3) / 3));
//	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		String name = "홍길동";
//		int kor = 100, eng = 50, math = 70;
//		
//		List<String> list = new ArrayList<>(Arrays.asList(name.split("")));
//		
//		avr(kor, eng, math);
//		
//		System.out.printf("%s의 총점 : %d, 평균 : %d", list.toString().replaceAll("[\\[\\], ]", ""), sum(kor, eng, math), average);
		
		Student s1 = new Student(100, 50, 70);
		s1.setName("홍길동");
		Student s2 = new Student();
		
		Calculator calc = new Calculator();
		System.out.printf("%s 학생\n총점 : %d, 평균 : %d\n", s1.getName(), calc.sum(s1), calc.avr(s1));
		System.out.println();
		System.out.printf("%s 학생\n총점 : %d, 평균 : %d\n", s2.getName(), calc.sum(s2), calc.avr(s2));
		
	}

}
