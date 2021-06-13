package com.itwillbs.beantest;

import javax.swing.JFrame;

// Object 클래스는 모든 클래스의 부모 클래스
// 클래스 선언시 별도의 상속 표기가 없을경우 Object 클래스를 상속하고 있음.
// => 자바에서의 모든 클래스는 Object 클래스를 상속하고 있다.
public class JavaBean1 /*extends Object*/ {
	// 자바빈

	private String id;
	
	// 기본생성자
	public JavaBean1() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	// alt shift s + s
	// 오버라이딩 : 부모의 메서드를 재정의 해서 사용(메서드는 원형 그대로 사용) 
	
	@Override
	public String toString() {
		return "JavaBean1 [id=" + id + "]";
	}
	

}
