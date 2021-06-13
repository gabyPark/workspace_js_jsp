<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP3/sessionMain.jsp</h1>
     <%
       // 세션 정보를 확인
       // 로그인 성공한경우에만  "ooo님이 로그인 하셨습니다." 화면에 출력
       // 로그인을 성공하지 않은경우 -> 로그인 페이지로 이동     
       
       String id = (String)session.getAttribute("LoginID");
       
       if(id == null){
    	   response.sendRedirect("sessionLoginForm.jsp");
       }
     %>
     
     <!--  로그아웃 버튼 클릭시
           로그인정보(세션) 초기화/삭제
       -->
     
     <%=id %>님 환영합니다! 
     <input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
     
     
     






</body>
</html>