<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/el/elTest2.jsp</h1>
   
   ${requestScope.itwill.classNum }<br>
   
   <hr> 
     학생정보 <br>
     이름 : ${requestScope.itwill.student.name }<br>
     전화번호 : ${itwill.student.tel }<br>
     
      
   
   
   
</body>
</html>