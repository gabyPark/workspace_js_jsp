<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP5/select.jsp</h1>

	<h2>회원 정보 출력</h2>

	<%
		// DB -> 화면 (모든 회원 정보 출력)

		// DB연결 필요 정보
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";

		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");

		// 2. 디비 연결
		Connection con 
		 = DriverManager.getConnection(DBURL, DBID, DBPW);
        System.out.println("디비 연결 성공! ");
		// 3. SQL 쿼리 작성 & pstmt 객체 생성
        String sql="select * from itwill_member";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4. sql 실행
		ResultSet rs = pstmt.executeQuery();

		// 5. 데이터 처리
		while(rs.next()){ //데이터 있을때 
			// 화면에 DB정보(rs)를 출력
			
			//out.print(idx+"/"+ name+"/"+gender+"/"+age+"/"+jumin+"/"+"<br>"); 
		    
		    // rs.getXXXX("컬럼명"); 디비 테이블의 데이터 타입에 따라서 변경
		
		  /*   out.print(rs.getInt("idx")+" ");
		    out.print(rs.getString("name")+" ");
		    out.print(rs.getString("gender")+" ");
		    out.print(rs.getInt("age")+" ");
		    out.print(rs.getString("jumin")+"<hr>"); */
		    
		    // rs.getXXXX(컬럼인덱스); 디비 테이블의 데이터 타입에 따라서 변경
		    //  컬럼 인덱스는 1부터 시작
		    // => 처리속도가 빠름
		    out.print(rs.getInt(1)+" ");
		    out.print(rs.getString(2)+" ");
		    out.print(rs.getString(3)+" ");
		    out.print(rs.getInt(4)+" ");
		    out.print(rs.getString(5)+"<hr>");
			
		}
	%>













</body>
</html>