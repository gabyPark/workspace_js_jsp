<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/fmt/fDate.jsp</h1>
   
   <%
      Calendar cal = Calendar.getInstance();
   
      System.out.println(cal.get(Calendar.YEAR));
   
   %>
   
   
   <h2> 날짜를 특정 형태에 맞춰서 출력 </h2>
   
   <c:set var="today" value="<%=new Date() %>" />
   
   기본정보 : ${today }<br>
   
  <h2>2021.02.08 표현</h2>
  <fmt:formatDate value="${today }"/> <br> 
  
  <h2>시간정보  출력 : 오후 3:14:00 </h2>
  <fmt:formatDate value="${today }" type="time"/> <br> 
  
  <h2>기본 표현을 다르게 표시</h2>
  <fmt:formatDate value="${today }" type="both"/> <br>
  
  <hr><hr>
  
  <h2>2021년 2월 8일 월요일</h2>
  <fmt:formatDate value="${today }" dateStyle="full"/><br> 
  <h2>2021년 2월 8일 (월)</h2>
  <fmt:formatDate value="${today }" dateStyle="long"/><br> 
  <h2>2021.2.8 (기본값)</h2>
  <fmt:formatDate value="${today }" dateStyle="medium"/><br> 
  <h2>21.2.8</h2>
  <fmt:formatDate value="${today }" dateStyle="short"/><br> 
  <hr><hr>
  
  <fmt:formatDate value="${today }" timeStyle="full" type="time"/><br> 
  <fmt:formatDate value="${today }" timeStyle="long" type="time"/><br> 
  <fmt:formatDate value="${today }" timeStyle="medium" type="time"/><br> 
  <fmt:formatDate value="${today }" timeStyle="short" type="time"/><br> 
   
  <hr><hr>
  
  <h1>Q. 2021년 2월 8일 (월) 오후 3시 30분 00초 </h1>
  
  <fmt:formatDate value="${today }" type="both" dateStyle="long" timeStyle="long"/> 
   
  <h1>Q. 2021/2/8 (월)</h1>
  <fmt:formatDate value="${today }" pattern="yy/MM/dd (E)" />
  
  <h1>Q. (오후) 3:37:00 </h1>
  <fmt:formatDate value="${today }" type="time" pattern="(a) hh:mm:ss"/>
   
   
   
   
   
   
</body>
</html>