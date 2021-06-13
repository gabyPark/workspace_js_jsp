<%@page import="com.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
    <h1>WebContent/JSP6/info.jsp</h1>
    
    <h2> 회원 정보 출력 페이지 </h2>
    
    <%
      // 로그인 여부 체크 -> 로그인 페이지로 이동
      String id = (String)session.getAttribute("id");
      
      if(id == null){
    	  response.sendRedirect("loginForm.jsp");
      }
      
      // DB에서 해당 회원의 정보를 가져오기
      
      // 연결에 필요한 정보
      final String DRIVER = "com.mysql.jdbc.Driver";
      final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
      final String DBID = "root";
      final String DBPW = "1234";
      
      //1. 드라이버로드
      Class.forName(DRIVER);
      
      System.out.println("드라이버 로드 성공!");
      //2. 디비연결
      Connection con 
              = DriverManager.getConnection(DBURL, DBID, DBPW);
      
      System.out.println("디비 연결 성공!");
      //3. sql 쿼리(select) & pstmt 객체
      String sql ="select * from itwill_member where id=?";
      
      PreparedStatement pstmt = con.prepareStatement(sql);
      
      // ?
      pstmt.setString(1, id);		  
      
      //4. sql 실행
      ResultSet rs = pstmt.executeQuery();
      
      MemberBean mb = null;
      //5. 데이터 처리
      if(rs.next()){ //데이터 있을때 
    	  // 회원정보를 저장
    	  //id = rs.getString("id");
          // 자바빈 객체 사용
           mb = new MemberBean();
          
          //mb.id = ""; (x)
          // DB컬럼값 -> mb 자바빈에 저장
          mb.setId(rs.getString("id"));
          mb.setPw(rs.getString("pw"));
          mb.setName(rs.getString("name"));
          mb.setAge(rs.getInt("age"));
          mb.setGender(rs.getString("gender"));
          mb.setEmail(rs.getString("email"));
          mb.setReg_date(rs.getTimestamp("reg_date"));          
          
          System.out.println(mb);
      }
      
      System.out.println("SQL 실행완료! DB 정보 저장완료!");
      
      // 화면에 출력
      // 메인페이지로 이동 링크 만들기
    
    %>
    <hr>
    
    <h2> 회원 정보 </h2>
    
    <h3>아이디 : <%=mb.getId() %></h3>
    <h3>비밀번호 : <%=mb.getPw() %></h3>
    <h3>이름 : <%=mb.getName() %> </h3>
    <h3>나이 : <%=mb.getAge() %></h3>
    <h3>성별 : <%=mb.getGender() %></h3>
    <h3>이메일 : <%=mb.getEmail() %></h3>
    <h3>가입일 : <%=mb.getReg_date() %></h3>    
    
    <!-- ctrl + alt + 방향키 아래 : 코드라인 복사 -->
    
    <hr>
    
    <h2><a href="main.jsp">메인페이지로...</a></h2>
    
    

</body>
</html>