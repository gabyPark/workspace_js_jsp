<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>WebContent/JSP6/logout.jsp</h1>
   
   <%
     // 로그아웃 => 세션정보 초기화
     session.invalidate();
     System.out.println("logout.jsp 페이지 실행~! 세션 초기화! ");
   
   %>
   <script type="text/javascript">
       alert(" 로그아웃! ");
       location.href="main.jsp"; 
   </script>
   
   <%
     // jsp 페이지 실행순서
     // JSP(java) > html > JavaScript 
     // => JSP 페이지이동, JS 페이지이동을 같이 사용X
    
    // response.sendRedirect("main.jsp");
   
   %>
   
   
   
   
   
   

</body>
</html>