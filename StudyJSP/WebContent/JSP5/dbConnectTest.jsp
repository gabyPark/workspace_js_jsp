<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/JSP5/dbConnectTest.jsp</h1>
   <%
     // JDBC 드라이버 설치
     // WebContent/WEB-INF/lib/ 폴더에 (외부에 가져온프로그램 설치)
     // mysql-connector-java-5.1.49-bin.jar 파일 추가 
     // => 설치 완료!
     
     // 1단계  드라이버 로드 
     Class.forName("com.mysql.jdbc.Driver");
     
     System.out.println("드라이버 로드 성공!");

     // http://localhost:8088/StudyJSP/JSP5/dbConnectTest.jsp
     // jdbc:mysql://localhost:3306/jspdb
    // jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul(8버전) 
     //  [프로토콜]    [IP]      [port][디비명]
     
     // 2단계  디비 연결
     
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
   
     System.out.println(" 디비 연결 성공! ");
     
     // 연결 정보 출력
   %>
   
   연결정보 : <%=con %>
   
   
   
   
   
   
   
   
   
   
</body>
</html>