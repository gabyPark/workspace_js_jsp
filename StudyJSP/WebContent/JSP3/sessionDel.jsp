<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/JSP3/sessionDel.jsp</h1>
   
   <h2> 서버 (세션삭제) </h2>
   
   <%
    // 세션 삭제 ("itwill")
     session.removeAttribute("itwill");
   
   %>
   <script type="text/javascript">
      alert("서버에서 세션삭제 완료");
      location.href="sessionTest.jsp";
   </script>
   
   
   
   
   
</body>
</html>