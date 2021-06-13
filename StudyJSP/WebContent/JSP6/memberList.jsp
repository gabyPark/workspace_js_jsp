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
	<h1>WebContent/JSP6/memberList.jsp</h1>

	<h2>모든 회원의 정보를 확인</h2>

	<%
	   // <추가 구현>
	   // - 로그인 세션 제어 (1.로그인 여부,2. 관리자 여부)
	   String id = (String) session.getAttribute("id");
	   if(id == null || !id.equals("admin")){
           response.sendRedirect("loginForm.jsp");	   
	   }
	   
	   // - 결과 출력시 관리자 정보를 제외한 나머지 모두 출력(sql,코드제어)
	
	
		//DB의 모든 회원정보를 받아서 처리 -> 테이블 표 출력
		// * 회원 1명의 정보 -> MemberBean 저장

		// 연결에 필요한 정보
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공! ");
		
		// 2. 디비연결
		Connection con =
		    DriverManager.getConnection(DBURL, DBID, DBPW);
		
		// 3. sql 쿼리 & pstmt 객체 
		String sql = "select * from itwill_member";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4. sql 실행
		ResultSet rs = pstmt.executeQuery();
		
    %>
	 <table border="1">
      <tr>
        <td>아이디</td>
        <td>비밀번호</td>
        <td>이름</td>
        <td>나이</td>
        <td>성별</td>
        <td>이메일</td>
        <td>회원가입일</td>
      </tr>	
    <%
		// 5. 데이터 처리
		while(rs.next()){
			//System.out.println("아이디 : "+rs.getString("id"));
			// 관리자 이면
			if(id.equals(rs.getString("id"))){
				continue;
			}
			
			%>
		   	  <tr>
		        <td><%=rs.getString("id") %></td>
		        <td><%=rs.getString("pw") %></td>
		        <td><%=rs.getString("name") %></td>
		        <td><%=rs.getInt("age") %></td>
		        <td><%=rs.getString("gender") %></td>
		        <td><%=rs.getString("email") %></td>
		        <td><%=rs.getTimestamp("reg_date") %></td>
		      </tr>	
			<%
		}
	%>
    </table>


    <h1><a href="main.jsp">메인페이지로 이동하기</a></h1>








</body>
</html>