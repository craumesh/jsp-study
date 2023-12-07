package com.itwillbs.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 인터페이스는 추상메서드를 포함하기 때문에 객체 생성 불가능
// => 추상메서드는 body가 없어서 실행구문이 없다(실행 불가능)
public interface Action {
	// 상수
	// 추상메서드
	ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
