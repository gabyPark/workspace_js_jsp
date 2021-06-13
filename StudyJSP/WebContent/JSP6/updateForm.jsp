<%@page import="com.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP6/updateForm.jsp</h1>
	
	<h2> 회원정보 수정 페이지 </h2>
	
	<%
	 // 회원 아이디 (로그인 체크)
	 String id = (String) session.getAttribute("id");
	 
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	 
	 // DB 테이블에서 확인된 회원정보를 화면 출력	
	 
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
	 
	 
	 // 폼태그에 채워넣기 (비밀번호 비우기)
	%>
	
	

	<fieldset>
	    <form action="updatePro.jsp" method="post">
		      아이디 : <input type="text" name="id" value="<%=mb.getId()%>" readonly ><br>
		      비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하시오."><br>
		      이름 : <input type="text" name="name" value="<%=mb.getName()%>"><br>
		      나이 : <input type="text" name="age" value="<%=mb.getAge()%>"><br>
		      성별 : <input type="radio" name="gender" value="남자" 
		      <%if(mb.getGender().equals("남자")){ %>
		      checked="checked"
		      <%} %>
		      >남자
		      <input type="radio" name="gender" value="여자"
		      <%if(mb.getGender().equals("여자")){ %>
		      checked="checked"
		      <%} %>
		      >여자        
		      <br>
		      이메일 : <input type="text" name="email" value="<%=mb.getEmail() %>"><br>
		      <hr>
		      
	    <input type="submit" value="수정하기">  
	    </form>  
    </fieldset>
  












</body>
</html>