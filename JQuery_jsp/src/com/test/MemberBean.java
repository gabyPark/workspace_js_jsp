package com.test;

//import java.lang.*; // 기본패키지 (생략가능)
import java.sql.Timestamp;

// DTO (Data Transfer Object)
// VO (Value Object)

public class MemberBean /*extends Object*/{
	// 자바빈 객체 : 데이터를 저장하는 객체 (DB 테이블 정보저장)
	// 변수명을 테이블의 컬럼명과 동일하게 설정
	
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String email;
	private Timestamp reg_date;
	
	public MemberBean() {	}

	
	// alt shift s + r   // set/get()생성
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}


	// alt shift s  + s
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", gender=" + gender
				+ ", email=" + email + ", reg_date=" + reg_date + "]";
	}
	
	

}
