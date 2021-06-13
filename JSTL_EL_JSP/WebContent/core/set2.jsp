<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.jstl.MemberBean"%>
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
   <h1>WebContent/core/set2.jsp</h1>
   
   <h2> set1.jsp 페이지에서 전달된 상품정보 </h2>
   상품번호 : ${requestScope.number }<br>
   상품이름 : ${name }<br>
   상품가격 : <%=request.getAttribute("price") %><br>
   
  <hr><hr>
  <h2> 전달받은 정보중에서 특정 정보를 삭제 </h2>
  <c:remove var="price" scope="request"/>
  번호 : ${number }<br>
  이름 : ${name }<br>
  가격 : ${price }<br>
  상품가격 : <%=request.getAttribute("price") %><br>
  
 <hr><hr>
 
 <h2> 서블릿에서 전달된 정보를 출력 </h2>
 값 : ${tel }<br>
 값 : ${requestScope.tel }<br>
 
 <hr><hr>
 <h2> 서블릿에서 전달된 객체 정보 출력 </h2>
 객체 : ${mb } <br>
 객체의 값 : ${mb.name }<br>
 객체의 값 : <%=request.getAttribute("mb") %><br>
<% MemberBean mb = (MemberBean) request.getAttribute("mb"); %><br>
  객체의 값 : <%=mb.getAge() %><br>
  <hr><hr>
  <hr><hr>
  
  <h1> 서블릿에서 전달된 ArrayList 정보 출력 </h1>
  객체 : ${memberList } <br>
 리스트 -> 객체 -> 변수 : ${memberList[0] }<br>  
 리스트 -> 객체 -> 변수 : ${memberList[0].tel }<br>  
 
 <%
    ArrayList memberList
           =(ArrayList) request.getAttribute("memberList");
     MemberBean mb1 =(MemberBean) memberList.get(0);
 %>
    <%=mb1.getTel() %>
   
   
 <h2> JSTL + EL표현식 활용 </h2>
 
 <c:set var="memberBean" value="${mb}"/>
 ${memberBean }<br>
 ${memberBean.name}<br>
   
 <hr>
 <c:set value="${requestScope.memberList }" var="mList"/>
 
 ${mList[0] }<br>
 ${mList[0].name }<br>
 ${requestScope.memberList[0].tel }<br>
 
 
  
  
  
  
     
   
   
   
   

</body>
</html>