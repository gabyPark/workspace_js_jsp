<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/el/OperatorPro.jsp</h1>
   
   <h2> el 표현식을 사용해서 전달받은 정보 출력 </h2>
   
   <h3>num1 : ${param.num1 }</h3>
   <h3>num2 : ${param.num2 }</h3>
   
   <h2> el 표현식으로 전달된 값은 자동 형변환(캐스팅)됨. </h2>
   <!-- 사칙연산 : + - * /(div) %(mod)   -->
   
   <h3>num1 + num2 = ${ param.num1 + param.num2 }</h3>
   
   <%=request.getParameter("num1")+request.getParameter("num2") %>
   
   <hr>
   
   <h2> el 표현식 비교연산 </h2>
   
   <h2> 
      비교 연산<br>
      [==] or eq<br>
      [!=] or ne<br>
      [<=] or le<br>
      [>=] or ge<br>
      [<] or lt<br>
      [>] or gt<br>      
   </h2>
   
   <h3> num1 num2 값이 양수 인지를 체크 </h3>
   <h3>
      num1 : ${param.num1 > 0 }<br>
      num2 : ${param.num2 gt 0 }<br>
   </h3>
   <h2> num1,num2 모두 양수 인지 판단 </h2>
   <h3> 논리 연산 </h3>
   <!-- && - and / || - or / ! - not -->
   
   ${ (param.num1 gt 0) && (param.num2 > 0) }
   
   <h2> 삼항연산자를 사용가능 </h2>
   <!--  비교연산? 참 : 거짓  -->
   <h3> num1,num2의 값이 같은지 체크 "같다!","다르다!" </h3>
   
   <h3>결과 : ${ (param.num1 == param.num2)? "같다!":"다르다!" }</h3>
   
   <h3> empty 연산자 : 값이 null 이거나, 배열/컬렉션 크키가 0일경우 true 리턴 </h3>
   
   ${empty param.id }
   
   <h3>  아이디가 입력이 된경우  "ID님 환영합니다",
                 아이디 입력이 안된경우 "geuest님 환영합니다."  </h3>
   
   <h3> 결과 : ${empty param.id? "geuest":param.id }  님 환영합니다. </h3>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>