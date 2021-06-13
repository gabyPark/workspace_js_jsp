<%@page import="com.itwillbs.beantest.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>WebContent/javabean/BeanPro2.jsp</h1>
   
   <%
   
    request.setCharacterEncoding("UTF-8");
    
    // 해당정보를 저장 자바빈 객체 사용
    // JavaBean2 
    
    // 자바 코드 사용해서 정보를 화면 출력
    // 전달된 파라미터값 저장
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    int num = Integer.parseInt(request.getParameter("num"));
    
    JavaBean2 jb2 = new JavaBean2();
    
   jb2.setId(id);
   jb2.setPw(pw);
   jb2.setNum(num);
   
   out.print(jb2.getId()+"<br>");
   out.print(jb2.getPw()+"<br>");
   out.print(jb2.getNum()+"<br>");
    
    
   %>
   <!-- 액션태그 사용하여 정보 화면 출력 -->
   
   <jsp:useBean id="jb3" class="com.itwillbs.beantest.JavaBean2" />
   
   <jsp:setProperty property="id" name="jb3" param="id"/>
   <jsp:setProperty property="pw" name="jb3" param="pw"/>
   <jsp:setProperty property="num" name="jb3" param="num"/>
   <%-- <jsp:setProperty property="num" name="jb3"/> --%>
   <!-- property와 param 이름이 같은경우 param 생략 가능 -->
   
   <%-- <jsp:setProperty property="*" name="jb3" param="*"/> --%>
   <jsp:setProperty property="*" name="jb3"/>
   <!-- 전달되는 모든 파라미터값을 모든 프로퍼티에 알아서 저장 -->   
   
   <jsp:getProperty property="id" name="jb3"/>
   <jsp:getProperty property="pw" name="jb3"/>
   <jsp:getProperty property="num" name="jb3"/>
   
   
   
   
   
   
   


</body>
</html>