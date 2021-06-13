<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>WebContent/JSP2/scopeProPro.jsp</h1>
	
	<!-- 아이디,pageContext,request,session,application값 
	     출력하기
	-->
	아이디 : <%=request.getParameter("id") %><br>
	비밀번호 : <%=request.getParameter("pw") %><br>
	page영역값 : <%=pageContext.getAttribute("pageKey") %><br>
	request영역값 : <%=request.getAttribute("reqKey") %>  <br>
	session영역값 : <%=session.getAttribute("sesKey") %> <br>
	application영역값 : <%=application.getAttribute("appKey") %><br>
	
	
	
	
	
	

</body>
</html>