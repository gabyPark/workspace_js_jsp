class Parent{
	public void pprn(){
		System.out.println("부모 : pprn() 호출");
	}
}

class Child extends Parent{
	public void cprn(){
		System.out.println("자식 : cprn() 호출");
	}
//	public void pprn(){
//		super.pprn(); // 부모의 은닉된 메서드 호출
//		System.out.println("자식 : pprn() 호출");
//	}
}



public class Test3 {

	public static void main(String[] args) {
		
		// 부모 객체 생성
		Parent p = new Parent();
		p.pprn();
		// p.cprn(); // 자식의 메서드 사용x 
		
		System.out.println("-------------------");
		// 자식 객체 생성 
		Child c = new Child();
		c.cprn();
		c.pprn(); // 상속관계에서는 부모의 기능을 사용가능
		          // 오버라이딩의 경우 부모의 메서드는 은닉
		
		System.out.println("-------------------");
		////////////////////////////////////////////////////////
		// 업캐스팅  : 부모의 타입으로 형변환,
		//    부모의 레퍼런스에 자식의 인스턴스를 저장,
		//    슈퍼클래스의 레퍼런스 변수에 서브클래스의 레퍼런스 값을 저장
		
		Parent p1 = new Child();
		System.out.println("업 캐스팅");
		//Parent p2 = c;
		p1.pprn();
		// p1.cprn(); 
		// => 업캐스팅 된 객체는 상속받은 부분만 사용가능
		
		System.out.println("-------------------");
		// 다운캐스팅  : 자식의 타입으로 형변환,
	    //    자식의 레퍼런스에 부모의 인스턴스를 저장,
		//    서브클래스의 레퍼런스 변수에 슈퍼클래스의 레퍼런스 값을 저장
		
		// 다운캐스팅
		System.out.println("다운 캐스팅");
		//Child c1 = new Parent();
	/*	Child c1 = (Child) new Parent();
		// => 에러(문제)가 있음을 개발자가 인지하고있으나, 그대로 진행하겠다.
		//Child c2 = p;
		c1.cprn();
		c1.pprn();*/
		
		// 안전한 다운캐스팅
		// 업캐스팅 -> 다운캐스팅
		
		Parent p2 = new Child();
		
		// Child c2 = p2; // 컴파일 에러
		 Child c2 = (Child)p2;
		 
		 c2.cprn();
		 c2.pprn();
		 
		/* 업캐스팅 : 부모의 타입으로 형변환
		 session.setAttribute(String,Obejct) => ("id", "admin");

		   Object o = "admin";

		 다운캐스팅 : 자식의 타입으로 형변환
		 String id = (String) session.getAttribute("id");
        */ 
		
		 //업캐스팅
		 Object o = new String("admin");
		 
		 //String id = o;
		 String id =(String)o;
		 
		 System.out.println(id);
		 
		
		
				
		
		
		
		
		
		
		
		
		
		

	}

}
