<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/el/elTest.jsp</h1>
  
  request 영역값 : <%=request.getAttribute("cnt") %><br>
  session 영역값 : <%=session.getAttribute("cnt") %><br>
  
  <hr>
  EL 표현식 <br>
  request 영역값 : ${requestScope.cnt } <br>
  session 영역값 : ${sessionScope.cnt } <br>
  <hr>
  <h3> el표현식의 경우  접근하는 영역의 정보가 없을경우
     pageScope -> requestScope -> sessionScope -> applicationScope
     영역을 순차적으로 돌면서 해당이름의 값을 찾는다.
   </h3>
  ${cnt }<br>
  
  
  
  
  
  
  
</body>
</html>