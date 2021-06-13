package com.itwillbs.test;

public class StuBean {
	// 자바빈 => 정보를 저장하는 객체 => DB테이블 정보저장

	private String name;
	private int kor;
	private int eng;
	private int math;

	// 기본생성자
	// public StuBean(){
	// 오버로딩된 생성자가 없을경우 컴파일러가 자동으로 기본생성자 생성
	// }

	// set/get
	// alt shift s + r

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}



	// alt shift s + v
	// @Override
	// public String toString() {
	// return "메서드 오버라이딩!";
	// }
	
	// alt shift s + s
	@Override
	public String toString() {
		return "StuBean [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + "]";
	}
	
	
	

}
