<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP6/deletePro.jsp</h1>
	<%
		// 로그인 세션제어
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}

		// 전달 정보 저장(비밀번호)
		String pw = request.getParameter("pw");

		// DB처리 (본인확인-> 삭제)
		// 연결에 필요한 정보
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		
		// 1. 드라이버 로드
	    Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");
		// 2. 디비연결
		Connection con = 
		   DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("디비 연결 성공!");
		// 3. sql 쿼리(select) & pstmt객체
		String sql ="select pw From itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		// 4. sql 실행
		ResultSet rs = pstmt.executeQuery();
				
		// 5. 데이터 처리 
		if(rs.next()){
			if(pw.equals(rs.getString("pw"))){
				// 3. sql 쿼리(delete) & pstmt 객체
				sql = "delete from itwill_member where id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				// 4. sql 실행
				pstmt.executeUpdate();
				
				// 로그인정보 초기화(세션값 초기화)
				session.invalidate();
				
				// 삭제후 다시 메인페이지로 이동
				response.sendRedirect("main.jsp");
				
			}else{
				%>
				 <script type="text/javascript">
				   alert(" 비밀번호 오류 입니다. ");
				   history.back();
				 </script>
				<%
			}
		}else{
			%>
			 <script type="text/javascript">
			   alert(" 비회원 정보 입니다. ");
			   history.back();
			 </script>
			<%
		}
		
		

		
	%>






</body>
</html>