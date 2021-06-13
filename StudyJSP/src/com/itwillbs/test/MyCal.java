package com.itwillbs.test;

public class MyCal {
	// 계산 기능만 하는 객체 
	
	// 총점 계산 후 리턴기능
	public int MySum(int k,int e,int m){
		System.out.println("MyCal 객체 - MySum() 메서드 실행");
		
		return k+e+m;
	}
	
	public void MySum(StuBean sb){
		System.out.println("MyCal 객체 - MySum() 메서드 실행");
		
		System.out.println(sb.getKor()+sb.getEng()+sb.getMath());
	}
	
	// 평균 계산 후 리턴 기능
	public double MyAvg(int k,int e,int m){
		System.out.println("MyCal객체-MyAvg() 메서드 실행");
		//return (k+e+m)/3.0 ;
		return MySum(k, e, m)/3.0;
	}
	
	public void MyAvg(StuBean sb){
		System.out.println("MyCal객체-MyAvg() 메서드 실행");
		//return (k+e+m)/3.0 ;
		//return MySum(sb)/3.0;
		System.out.println( MySum(sb.getKor(), sb.getEng(), sb.getMath()) / 3.0 );
	}
	
	
	

}
