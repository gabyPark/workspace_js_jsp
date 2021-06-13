<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%!
  //선언문
  public void TestMethod(){
	System.out.println("콘솔창 출력 : TestMethod() 호출");
	}

%>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/ServletTest.jsp</h1>

	안녕하세요. 서블릿 테스트 입니다.
	
	<%
	   System.out.println("선언문의 메서드 호출");
	   TestMethod();
	   
	   int i=0;
	   for(;i<=10;i++){
		   out.print("반복문 : "+i+"실행 <br>");
	   }
	%>
	
	<h3>최종 i값 : <%=i %></h3>

    <!--  jsp 액션태그를 사용한 forward이동  -->
    <%-- <jsp:forward page=""></jsp:forward> --%>



</body>
</html>