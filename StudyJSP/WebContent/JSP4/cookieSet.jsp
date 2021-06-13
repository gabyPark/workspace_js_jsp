<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP4/cookieSet.jsp</h1>
	
	<h2> 쿠키값 생성 (서블릿 API 사용) </h2>
	<h2> 서버 역활 </h2>
	
	<%
	   // 쿠키값 생성 => 쿠키객체 생성 (메모리,HDD 저장 X)
	   Cookie cookie = new Cookie("ckName","CookieValue!!");
	   
	   // 필요한 값 설정 - 시간정보 설정
	   cookie.setMaxAge(600);  // 초   10분 * 60초 = 600초
	   
	   // 생성된 쿠키정보를 저장-response
	   response.addCookie(cookie);	
	%>
	
	<script type="text/javascript">
	   alert(" 쿠키값 생성 완료! ");
	   location.href="cookieTest.jsp";	
	</script>
	
</body>
</html>