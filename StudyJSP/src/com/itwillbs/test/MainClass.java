package com.itwillbs.test;


public class MainClass {
	
	// 메서드 오버로딩 : 동일한 이름의  메서드 재사용
	// -> 전달인자의 데이터 타입, 전달인자의 개수 다른경우 다른 메서드로 인지
	
	// * 메서드 시그니처 (구분인자): 이름, 전달인자 데이터 타입, 전달인자 개수
	
	/*private void sum(int k,int e, int m){
		System.out.println("총점 : "+(k+e+m)+"점 ");
	}*/
	
	public void sum(int k,int e, int m){
		System.out.println("총점 : "+(k+e+m)+"점 ");
	}
	// 가변인자 : 메서드를 사용할때 인자의 개수를 가변으로 처리 하기위해서 사용
	// => 인자를 배열의 형태로 저장, 처리 
	public void sum(int ... a){
		int sum=0;
		for(int i=0;i<a.length;i++){
			sum += a[i];
		}
		System.out.println("총점 : "+sum+"점 ");
	}
	
	// 객체 생성없이 사용하는 메서드 => static
	// => 학생의 정보를 객체로 받아서 계산후 출력
	public static void sum(StuBean sb){
		int result = sb.getKor()+sb.getEng()+sb.getMath();
		System.out.println("총점 : "+result+"점 (static)");
	}
	
	
	public static void main(String[] args){
		
		// 학생의 정보생성 -> 정보 출력
		String name="홍길동";
		int kor = 90;
		int eng = 88;
		int math = 78;
		
		System.out.println("--------------------------------");
		// 학생의 총점, 평균 출력
		
		System.out.print(name+"님의 총점 : "+(kor+eng+math)+"점 ");
		System.out.println("평균 : "+(double)((kor+eng+math)/3)+"점");
		System.out.println("평균 : "+((kor+eng+math)/3d)+"점");
		System.out.println("평균 : "+Math.round((kor+eng+math)/3d)+"점");
		
		System.out.println("--------------------------------");
		// 메서드 사용해서 학생의 평균,총점
		//sum();
		System.out.println("--------------------------------");
		
		MainClass mc = new MainClass();
	    mc.sum(kor,eng,math);
		mc.sum(10,20,30,40,50);
		
		System.out.println("--------------------------------");
		
		// 학생 정보를 저장 객체
		StuBean sb1 = new StuBean();
		System.out.println("sb1 : "+sb1);
		System.out.println("sb1 : "+sb1.toString());
		
		sb1.setName("홍길동");
		sb1.setKor(100);
		sb1.setEng(66);
		sb1.setMath(77);
		
		System.out.println("객체 정보 : "+sb1);
		
		sum(sb1);
		
		System.out.println("--------------------------------");
		
		// 기능 분리 
		// => 총점, 평균을 계산하는 객체 
		// MyCal 객체
		MyCal mycal = new MyCal();
		
		System.out.println(mycal.MySum(kor, eng, math));
		
		System.out.println(mycal.MyAvg(kor, eng, math));
		
		System.out.println("--------------------------------");
		
		// 회원 정보를 저장하는 StuBean객체를 사용해서 
		// 회원의 총점, 평균 계산 => MyCal객체를 사용
		// => 메서드 오버 로딩사용 => 결과 출력
		StuBean sb2 = new StuBean();
		sb2.setKor(100);
		sb2.setEng(99);
		sb2.setMath(88);
		
		mycal.MySum(sb2);
		mycal.MyAvg(sb2);
		
		
		
		
		
		
		
	  	
		
	}
}
