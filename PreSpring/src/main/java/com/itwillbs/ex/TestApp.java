package com.itwillbs.ex;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class TestApp {
	public static void main(String[] args) {
		
		MessageBean mb = new MessageBean();
		mb.sayHello("아이터월");
		// => TestApp 클래스는 MessageBean 클래스(객체)를 필요로(의존) 한다
		// => 둘 사이에는 의존관계(강한결합)가 있다
		
		// 메세지 출력
//		MsgBeanImpl mbi = new MsgBeanImpl(); // 강한결합
		MsgBean mbi = new MsgBeanImpl(); // 약한결합(1)
		mbi.sayHello("어이터월");
		
		// 메세지 출력 ( 약한결합(2) - 의존관계 주입 )
		// 의존 객체를 직접생성X -> 생성된 객체(스프링)를 주입(전달)
		
		// 외부 파일(xml)에 있는 객체정보를 가져오기(스프링과 연결)
		// => 이후는 어노테이션을 사용한 처리로 대체 될 것
		BeanFactory fac = new XmlBeanFactory(new FileSystemResource("springBeans.xml"));
		
		// 객체 정보를 가져오기(객체 주입-DI)
		MsgBean mb2 = (MsgBean)fac.getBean("msgBean",MsgBean.class);
		// => 제네릭은 생략 가능하지만 성능 상 입력이 가능하다면 입력해주는 것을 추천
		mb2.sayHello("ITWILL");
	}
}
