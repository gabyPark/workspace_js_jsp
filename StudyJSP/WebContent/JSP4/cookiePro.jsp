<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>WebContent/JSP4/cookiePro.jsp</h1>
   
   <%
     //cookieForm.jsp 에서 전달된 정보를 사용해서 해당값을 쿠키값으로 설정
     
     // 전달된 정보 저장
     //String lang = request.getParameter("language");
     // 쿠키 객체 생성
     //Cookie cookie = new Cookie("lang",lang);
     Cookie cookie 
       = new Cookie("lang",request.getParameter("language"));
     
     // 쿠키 설정
     cookie.setMaxAge(3600); // 60 * 60
     
     // 쿠키값 전달하기    
     response.addCookie(cookie);
     
     // 페이지 이동
   %>
   <script type="text/javascript">
       alert(" 쿠키값 생성 완료! ");
       location.href="cookieForm.jsp";   
   </script>
   
   
   
   
   
   
   
   
   
   

</body>
</html>