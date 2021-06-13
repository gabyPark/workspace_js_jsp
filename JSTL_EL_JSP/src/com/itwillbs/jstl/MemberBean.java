package com.itwillbs.jstl;

public class MemberBean {
	//(번호,이름,나이,전화번호)
	private int num;
	private String name;
	private int age;
	private String tel;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "MemberBean [num=" + num + ", name=" + name + ", age=" + age + ", tel=" + tel + "]";
	}
	

}
