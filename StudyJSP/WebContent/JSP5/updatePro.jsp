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

	<h1>WebContent/JSP5/updatePro.jsp</h1>
	<%
		// 전달받은 정보를 사용해서 수정하기 

		// 한글처리 
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		int age = Integer.parseInt(request.getParameter("age"));

		// DB 정보를 수정
		// DB연결 필요 정보
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";

		// 1. 드라이버 로드
		Class.forName(DRIVER);
		// 2. 디비 연결
		Connection con = 
		  DriverManager.getConnection(DBURL, DBID, DBPW);
		// 3. sql쿼리 & pstmt 생성
		String sql ="select name from itwill_member where jumin=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// ?
	    pstmt.setString(1, jumin);			
		
		// 4. sql 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 5. 데이터 처리 -> 데이터 수정
		if(rs.next()){
			// 회원이다.
			if(name.equals(rs.getString("name"))){
				// 본인 -> 데이터 수정
				// 3. 수정구문
				sql ="update itwill_member set age=? where name=? and jumin=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, age);
				pstmt.setString(2,name);
				pstmt.setString(3,jumin);
				
				// 4.
				pstmt.executeUpdate();
				
			}else{
				// 회원 -> 이름 잘못 입력
				System.out.println(" 정보가 잘못되었습니다. ");
			}
		}else{
			// 회원이 아니다.
			System.out.println(" 비회원 입니다. (수정불가)");
			%>
			  <!-- html -->
			  <script type="text/javascript">
			     alert(" 비회원 입니다. 확인 바랍니다. ");
			     history.back();
			  </script>			  
			<%			
		}	
	%>



</body>
</html>