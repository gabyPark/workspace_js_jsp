package com.itwillbs.beantest;

public class JavaBean2 {
	private String id;
	private String pw;
	private int num;
	
	// alt shift s + r
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	// alt shift s + s
	@Override
	public String toString() {
		return "JavaBean2 [id=" + id + ", pw=" + pw + ", num=" + num + "]";
	}
	
	
	

}
