<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>WebContent/JSP1/TestPro1.jsp</h1>
    
    <%
      // /StudyJSP/JSP1/TestPro1.jsp?num=12345
      // 전달된 정보(파라미터)
      
      // 브라우저 페이지 요청(주소입력) -> 내장 객체 생성(9개)
      // => 페이지 요청을 처리하는객체 (request) 안에 저장된 정보
      //    파라미터값 (주소값/body 포함되어 있음)
            
      
      // 페이지 요청시 전달된 정보를 받아오기
      // request.getParameter("파라미터 이름");
    
      //  파라미터값은 전달시 String타입으로 전달된다.
      String num = request.getParameter("num");    
      int num2 = Integer.parseInt( request.getParameter("num") );   
      
      //String str = 1234;(x)
    
    %>
    
       전달방식 : <%=request.getMethod() %><br>
    <hr>
    <!-- 화면에 출력 -->
       입력한  숫자 :  <%=num %><br>
       입력한  숫자+100(연결자) :  <%=num+100 %><br>
       입력한 숫자를 정수형으로 변경 후 연산 : <%=Integer.parseInt(num)+100 %><br>
       입력한 숫자(정수형) : <%=num2 %><br>
       입력한 숫자(정수형)+200 : <%=num2+200 %><br>
    
    
    
  

</body>
</html>