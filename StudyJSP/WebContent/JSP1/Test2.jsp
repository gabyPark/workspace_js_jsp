<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/JSP1/Test2.jsp</h1>
  
  <%!
    //선언문 : 공통으로 사용해야하는 값들 선언
    // 전역변수
    int number = 100;
    
    public void method(){
    	System.out.print(number);
    }
  
  %>
  <%=number %>
  <%-- <%=method() %> (x) --%>
  
  <%  //java코드 사용, 프로그래밍 문법
     // 선언문에 생성된 변수, 메서드 호출 가능
     method();
     System.out.println("number : "+number);
     
     // 지역변수
     int number2 = 200;
     System.out.println("number2 : "+number2);
     
    /*  public void method2(){
    	 System.out.println("num2 : "+number2);
     } */  // 스크립틀릿 에서는 메서드 선언 (x)
  %>
  
  
  <%=number2 %>
  
  


</body>
</html>