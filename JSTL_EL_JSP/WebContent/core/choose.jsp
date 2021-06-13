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
  <h1>WebContent/core/choose.jsp</h1>
  
  <c:set var="num1" value="100"/>
  <c:set var="num2" value="200"/>
  
  <c:choose>
  	<%-- 조건이 맞을때  --%>
    <c:when test="${num1 == num2 }">
       <h2> 동일한 값! </h2>
    </c:when>
    <%-- 조건이 아닐때 --%>
    <c:otherwise>
       <h2> 다른 값! </h2>
       <c:if test="${num1 > num2 }">
          ${num1 } 크다<br>
       </c:if>    
       <c:if test="${num1 < num2 }">
          ${num2 } 크다<br>
       </c:if>
    </c:otherwise>
  </c:choose>
  
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>