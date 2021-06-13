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
	<h1>WebContent/JSP6/updatePro.jsp</h1>
	<%
		// 로그인 세션 제어
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}

		// 한글데이터 처리
		request.setCharacterEncoding("UTF-8");

		// 수정에 필요한 정보들을 전달받아서 사용-> 출력
		// 액션 태그 사용해서 저장
	%>
	<jsp:useBean id="umb" class="com.member.MemberBean" />
	<jsp:setProperty property="*" name="umb" />
	<%
		System.out.println(" 수정할 정보 : " + umb);
	%>
	<hr>
	<%
		// 전달받은 수정정보를 가지고 DB로 이동
		// 연결에 필요한 정보
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드 
		Class.forName(DRIVER);
		System.out.println(" 드라이버 로드 성공! ");
		
		// 2. 디비 연결
		Connection con =
		    DriverManager.getConnection(DBURL,DBID,DBPW);
		// 3. sql 쿼리(select) & pstmt 객체 
		String sql ="select pw from itwill_member where id=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		// 4. sql 실행
		ResultSet rs = pstmt.executeQuery();
		// 5. 데이터 처리 
		if(rs.next()){
			// 회원
			if(umb.getPw().equals(rs.getString("pw"))){
			    // ID/PW를 제외한 나머지 모두를 변경
				// 3. sql 쿼리(update) & pstmt 객체
				sql="update itwill_member set name=?,age=?,gender=?,email=? " 
						+"where id=?";
			    
			    pstmt = con.prepareStatement(sql);
			    
			    pstmt.setString(1, umb.getName());
			    pstmt.setInt(2, umb.getAge());
			    pstmt.setString(3, umb.getGender());
			    pstmt.setString(4, umb.getEmail());
			    pstmt.setString(5, umb.getId());
			    
				// 4. sql 실행
				pstmt.executeUpdate();
				
				System.out.println("sql 구문 실행 완료! 정보 수정완료! ");
				%>
				 <script type="text/javascript">
				   alert(" 회원정보 수정완료! ");
				   location.href="main.jsp";		 
				 </script>
				<%
			}else{
				%>
				 <script type="text/javascript">
				   alert(" 비밀번호 오류! ");
				   history.back();			 
				 </script>
				<%
			}
		}else{
			// 비회원
			%>
			 <script type="text/javascript">
			   alert(" 해당 정보가 없습니다. ");
			   history.back();			 
			 </script>
			<%
		}
		
	%>



</body>
</html>