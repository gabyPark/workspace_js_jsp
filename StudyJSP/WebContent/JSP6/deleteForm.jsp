<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>WebContent/JSP6/deleteForm.jsp</h1>
    
    <h2> 회원 탈퇴 </h2>
    <!-- 회원의 비밀번호만 입력받아서 삭제 (update 구문의 로직) -->
    
    <%
      String id = (String) session.getAttribute("id");
    
      if(id == null){
    	  response.sendRedirect("loginForm.jsp");
      }
    
    %>
    
    
    <fieldset>
      <legend>탈퇴하기</legend>
      
      <form action="deletePro.jsp" method="post">
              비밀번호 : <input type="password" name="pw">
              <input type="submit" value="탈퇴하기">
      </form>
    
    </fieldset>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>