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

   <h1>WebContent/JSP5/deletePro.jsp</h1>
   
   <%
     // 한글 처리
     request.setCharacterEncoding("UTF-8");
     
     // 이전페이지에서 전달정보 저장
     // ->화면 출력
     
     String name = request.getParameter("name");
     String jumin = request.getParameter("jumin");
     
     out.print(name+"<br>");
     out.print(jumin+"<br>");
     
     
     // 회원정보 삭제 (DB)
     
     // DB연결 필요 정보
     final String DRIVER ="com.mysql.jdbc.Driver";
     final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
     final String DBID ="root";
     final String DBPW ="1234";     
     
     // 1. 드라이버 로드
     Class.forName(DRIVER);
     System.out.println(" 드라이버 로드 성공! ");
     // 2. 디비 연결
     Connection con 
         = DriverManager.getConnection(DBURL, DBID, DBPW);
     System.out.println(" DB 연결 성공! ");
     
     
    /*  // 3. SQL 구문 작성 & pstmt 객체 생성 
     String sql ="delete from itwill_member where name=? and jumin=?";
     
     PreparedStatement pstmt = con.prepareStatement(sql);
     
     pstmt.setString(1, name);
     pstmt.setString(2, jumin);
     
     // 4. 실행   
     pstmt.executeUpdate();     

     System.out.println("SQL 구문 실행 완료! (삭제완료)"); */
     
     
     // select -> 본인일때만 삭제 -> delete
     // 3. sql문 작성
     String sql ="select name from itwill_member where jumin=?";
     
     PreparedStatement pstmt = con.prepareStatement(sql);
     pstmt.setString(1, jumin);
     
     // 4. sql 실행
     ResultSet rs = pstmt.executeQuery();  
     
     // 5. 데이터 처리 
     if(rs.next()){
    	 //주민번호에 맞는 이름이 있는 경우 => 회원
    	if(name.equals(rs.getString("name"))){ //이름이 같은경우(DB이름-입력이름)
    		// 이름,주민번호 모두 일치 => 삭제
    		
    		// 3.
    		sql = "delete from itwill_member where name=? and jumin=?";
    		
    		pstmt = con.prepareStatement(sql);
    		
    		pstmt.setString(1, name);
    		pstmt.setString(2, jumin);    		
    		
    		// 4. 실행    		
    		pstmt.executeUpdate();
    		
    		System.out.println(" 회원 삭제 완료! ");
    		
    	}else{
    		//주민번호는 있지만 이름이 잘못 입력된 경우
    	    System.out.println("회원 이름 오류!");
    	}
     }else{
    	 //주민번호에 맞는 이름이 없는 경우
    	 System.out.println(" 회원이 아닙니다. ");
     }
   
   %>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

</body>
</html>