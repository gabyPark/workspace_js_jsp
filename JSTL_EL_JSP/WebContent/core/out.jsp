<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>WebContent/core/out.jsp</h1>
    
    <!-- 화면에 출력하는 방법 -->
    <%
      out.println("안녕하세요<br>");    
    %>
    <%="안녕" %><br>
    <%=3*5 %><br>
    <c:out value="안녕하세요!" /><br>
    <c:out value="3*5" />(연산x)<br>
    <c:out value="${3*5}" />(연산o)<br>
    
    <!-- member.getName() 출력 -->
    <%
       //out.println(member.getName());
    %>
     <%-- <%=member.getName() %> --%>
    <!-- 해당 데이터의 값이 null이라도 예외가 발생 X
         => el표현식이 null값을 공백문자로 처리
         => default 속성을 사용해서 공백문자 대신 처리 가능한 문자를 지정할 수 있음
     -->
    <c:out value="${member.getName()}" default="null값 대신 출력!"/>
    
    <hr><hr>
    
    <abc>태그는 abc 입니다.
    <%="<abc>" %>
    <%
      out.print("<abc>");
    %>
    
    &lt;abc> 태그는 abc 입니다.<br>
    <!-- 태그를 직접 출력해야할 경우 사용 -->
    <c:out value="<abc>는 abc 입니다." />
    
    
    
    
    
    
    
    
    
    
    
    



</body>
</html>