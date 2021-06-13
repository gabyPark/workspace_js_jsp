<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/Test3.jsp</h1>
	
	<%
	 //스크립틀릿
	 // JSP 내장객체(참조변수)
	 // reqeust,response,session,apllication,
	 // page, pageContext,config,out,  exception
	 
	 /* Itwill it = new Itwill();
	 it.name(); */
	%>
	<h1> request 객체 </h1>
	서버 도메인 주소(이름) : <%=request.getServerName() %><br> 
	서버 포트번호 : <%=request.getServerPort() %><br>
	서버 프로토콜 : <%=request.getProtocol() %><br>
	URL : <%=request.getRequestURL() %><br>
	URI : <%=request.getRequestURI() %><br>
	
	클라이언트 호스트명 : <%=request.getRemoteHost() %><br>
	클라이언트 IP주소 : <%=request.getRemoteAddr() %><br>
	
	페이지 요청방식(전송방식) : <%=request.getMethod() %><br>
	프로젝트 경로(컨텍스트경로) : <%=request.getContextPath() %><br>
	물리적 경로 : <%=request.getRealPath("/")%><br>
	
	http 헤더이름(user-agent) : <%=request.getHeader("user-agent") %><br>
	http 헤더이름(accept-language) : <%=request.getHeader("accept-language")%><br>
	http 헤더이름(host) : <%=request.getHeader("host") %><br>
	http 헤더이름(connection) : <%=request.getHeader("connection") %>
	
	
	<hr>
	
	<h1>Response 객체</h1>
	<%
	  //response.setHeader("해더이름", 값);
	  //response.addCookie("쿠키값");
	  //response.sendRedirect("URL 주소");
	  //response.setContentType("속성");	
	  
	  // 페이지 이동 
	  //response.sendRedirect("Test1.jsp");
	%>
	
	<h1>session 객체</h1>
	
	세션 ID 값 : <%=session.getId() %><br>	
	세션 생성 시간 : <%=session.getCreationTime() %><br>
	세션 최종 접속 시간 : <%=session.getLastAccessedTime() %><br>
	세션 유지시간(1800초,30분) :<%=session.getMaxInactiveInterval() %><br>
	<%
	  //세션 유지시간 변경 30분->60분
	  session.setMaxInactiveInterval(3600);
	%>
	세션 유지시간(3600초,60분) :<%=session.getMaxInactiveInterval() %><br>
	
	<hr>
	
	<h1>application 객체</h1>
	서버 정보 : <%=application.getServerInfo() %><br>
	서버의 물리적경로 : <%=application.getRealPath("/") %><br>
	
	<h1>out 객체</h1>
	<%
	   //out 표준 출력 객체 (모니터)
	   out.print("테스트 메세지<br>");	
	%>
	버퍼 사이즈 : <%=out.getBufferSize() %> Byte<br>
	<%
	  out.print("TEST<br>");
	%>
	버퍼 사용후 : <%=out.getRemaining() %> Byte<br>
	<%
	  out.close(); //객체 자원 해제	 
	  out.print("종료<br>");
	%>
	버퍼 사용후 : <%=out.getRemaining() %> Byte<br>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>