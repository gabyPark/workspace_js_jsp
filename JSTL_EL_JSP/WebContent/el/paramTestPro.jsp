<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/el/paramTestPro.jsp</h1>
  
  <%
    request.setCharacterEncoding("UTF-8");   
    // 전달되는 정보 저장
    String name = request.getParameter("name");
  %>
  
  <h2> 이름 : <%=name %></h2>
  
  <hr>
  
  <h2> el 표현식 사용 </h2>
  
  <h2> 이름 : ${ param.name }</h2>
  <h2> 전화번호 : ${param.tel }</h2>
  <h2> 좋아하는 음식 : ${param.food }</h2>
  <h2> 음식1 : ${paramValues.food[0] } </h2>
  <h2> 음식2 : ${paramValues.food[1] } </h2>
  
  <h2> 취미 : ${paramValues.hobby[0] }</h2>
  <h2> 취미 : ${paramValues.hobby[1] }</h2>
  <h2> 취미 : ${paramValues.hobby[2] }</h2>
  
  <%
     String[] hobbys = request.getParameterValues("hobby");
  
     for(int i=0;i<hobbys.length;i++){
    	 out.print(hobbys[i]+"<br>");
     }
  %>
  
  
  
  
  
  
  
  
  
</body>
</html>