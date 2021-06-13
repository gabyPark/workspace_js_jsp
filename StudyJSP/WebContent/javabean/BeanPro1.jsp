<%@page import="com.itwillbs.beantest.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>WebContent/javabean/BeanPro1.jsp</h1>
   <%
      //한글처리
      request.setCharacterEncoding("UTF-8");
      String id = request.getParameter("id");
   %>
   <h2>전달된 아이디 : <%=id %></h2>
   
   <%
    // 자바빈 객체 사용
    // 패키지 : com.itwillbs.beantest
    // JavaBean1 - id값 저장 객체 
    
    // 객체 생성
    JavaBean1 jb1 = new JavaBean1();
    // 값 초기화
    // 값 설정 -> 전달된 정보를 사용
    jb1.setId(request.getParameter("id"));
    System.out.println(jb1);
    
    jb1.setId(id);
    System.out.println(jb1);
    System.out.println(jb1.getId());
   
   %>
   
   <h2> 액션 태그-자바빈 사용 </h2>
    <%
      // 액션태그 사용 자바빈 객체 생성
      // JavaBean1 jb2 = new JavaBean1();
    %>   
 
   <jsp:useBean id="jb2" class="com.itwillbs.beantest.JavaBean1" />
   
   <%
    // 값 설정 : 파라미터 -> set()
    // jb2.setId(request.getParameter("id"))
   %> 
   <jsp:setProperty property="id" name="jb2" param="id"/>
   
   <% 
    // 값 확인 (출력)
    // jb2.getId()
   %>
   <h3>액션태그 사용 결과 </h3>
   <jsp:getProperty property="id" name="jb2"/>
   

</body>
</html>