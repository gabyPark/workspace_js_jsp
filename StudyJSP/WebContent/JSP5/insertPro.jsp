<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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

   <h1>WebContent/JSP5/insertPro.jsp</h1>
   <%
     // 한글처리
     request.setCharacterEncoding("UTF-8");
     
     // 전달받은 정보 출력 (이름,성별,나이,주민번호)
     
     String name = request.getParameter("name");
     String gender = request.getParameter("gender");
     int age = Integer.parseInt(request.getParameter("age"));
     String ju1 = request.getParameter("ju1");
     String ju2 = request.getParameter("ju2");
     
     String jumin = ju1+"-"+ju2;
     
   %>
   
   <h2> 전달 정보 </h2>
     이름  : <%=name%><br>
     성별 : <%=gender %><br>
     나이 : <%=age %><br>
   주민번호 : <%=ju1 %>-<%=ju2 %><br>
   
  <hr>
  <h2> 전달받은 정보를 DB(mysql) 전달</h2>
  
  <%
    // DB 연결에 필요한 정보를 미리 선언
    final String DRIVER ="com.mysql.jdbc.Driver";   
    final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
    // jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul(8버전)
    final String DBID = "root";
    final String DBPW = "1234";
  
    // 1. 드라이버 로드
    Class.forName(DRIVER);
    
    System.out.println(" 드라이버 로드 성공! ");
    
    // 2. 디비연결
    
    Connection con
        = DriverManager.getConnection(DBURL, DBID, DBPW);
    
    System.out.println(" 디비 연결 성공!  "+con);
    
    // 3. SQL 쿼리 작성 & stmt객체 생성
    // Statement 객체 사용(x) => 자바에서 SQL 쿼리를 실행할수있게 해주는 객체 
    // 전달받은 정보를 DB에 저장
    
    // PreparedStatement 객체 사용 => 자바에서 SQL 쿼리를 실행할수있게 해주는 객체
    // 객체 생성시 sql 쿼리를 미리 가져가서 준비 
    
   /*  String SQL
    ="insert into itwill_member (idx,name,gender,age,jumin) values (null,'"+name+"','"+gender+"',"+age+",'"+jumin+"');";
    Statement stmt = con.createStatement(); */

    String SQL
    ="insert into itwill_member (idx,name,gender,age,jumin) "+
     "values (null,?,?,?,?);";
     
     PreparedStatement pstmt = con.prepareStatement(SQL);
     
    // ?
     pstmt.setString(1, name); // 1번째 물음표에 파라미터로 받은 값을 저장(설정)
     pstmt.setString(2, gender);
     pstmt.setInt(3, age);
     pstmt.setString(4, jumin);     
         
    
    // 4. sql 쿼리 실행
    //stmt.executeUpdate(SQL);
    pstmt.executeUpdate();
    
    
    System.out.println(" SQL 구문 실행 완료! ");    
    
  
  %>
   
   
   
   
   

</body>
</html>