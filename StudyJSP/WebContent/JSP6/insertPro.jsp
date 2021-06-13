<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/JSP6/insertPro.jsp</h1>
   
   <%
     // 회원가입 처리페이지
     
     // 한글 데이터 처리
     request.setCharacterEncoding("UTF-8");
   
     //String id = request.getParameter("id");
     
     // 입력된 회원정보 저장(받아오기)
     // => 자바빈 객체를 사용, 액션태그 사용
   %>
   <!-- html영역 -->
   <!-- 자바빈 객체 생성 -->
   <%
     //MemberBean mb = new MemberBean();
   %>
   <jsp:useBean id="mb" class="com.member.MemberBean"/>
   
   <!-- 자바빈 객체에 파라미터 정보 저장 -->
   <%-- <jsp:setProperty property="id" name="mb" param="id"/> --%>
   <jsp:setProperty property="*" name="mb"/>
   
   <h2> 전달된 정보 확인 </h2>
   <%=mb %>
   
   <%
    // 날짜/시간 정보를 mb객체에 추가
    mb.setReg_date(new Timestamp(System.currentTimeMillis()));
   %>
   
   <h2> 날짜 추가후 정보 확인 </h2>
   <%=mb %>
   
   <hr>
   <h2> 전달받은 정보를 DB에 저장 </h2>
   <%
     // 연결에 필요한 정보
     final String DRIVER = "com.mysql.jdbc.Driver";
     final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
     final String DBID = "root";
     final String DBPW = "1234";
     
     // 1. 드라이버 로드
     Class.forName(DRIVER);
     System.out.println("insertPro : 드라이버 로드 성공! ");
     // 2. 디비 연결
     Connection con 
          = DriverManager.getConnection(DBURL, DBID, DBPW);
     
     System.out.println("디비 연결 성공! con : "+con);
     
     // 3. sql 생성(insert) & pstmt 생성
     String sql ="insert into itwill_member values(?,?,?,?,?,?,?)";
     
     PreparedStatement pstmt = con.prepareStatement(sql);
     
     // ? 
     pstmt.setString(1, mb.getId());
     pstmt.setString(2, mb.getPw());
     pstmt.setString(3, mb.getName());
     pstmt.setInt(4, mb.getAge());
     pstmt.setString(5,mb.getGender());
     pstmt.setString(6, mb.getEmail());
     pstmt.setTimestamp(7, mb.getReg_date());
     
     // 4. sql 실행   
     pstmt.executeUpdate();
     
     System.out.println("SQL 구문 실행완료! ");
     System.out.println("회원 가입 성공!");
     
   %>
    <h2> 페이지 이동 </h2>
    
    <script type="text/javascript">
       alert(" 회원가입 성공! ");
       location.href="loginForm.jsp";   
    </script>
    
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   


</body>
</html>