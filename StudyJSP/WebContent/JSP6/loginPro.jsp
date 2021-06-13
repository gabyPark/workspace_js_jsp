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

   <h1>WebContent/JSP6/loginPro.jsp</h1>
   <%
     // 이전페이지에서 전달된 정보 (ID,PW) 저장
     
     // 한글처리
     request.setCharacterEncoding("UTF-8");
   %>
   
   <h2> 자바빈 객체 생성 </h2>
   <jsp:useBean id="mb" class="com.member.MemberBean" />
   
   <h2> 전달된 파라미터값 저장 </h2>
   <jsp:setProperty property="*" name="mb"/>
   
   <h2> 전달된 정보 확인 </h2>
   <%=mb %>
   <hr>
   
   <h2> 로그인 처리 로직  </h2>
   <%
     /*
      1. 디비 접근 (모든 회원정보가 저장됨)
      2. 전달받은 정보(ID/PW)와 일치하는 정보를 찾기
      3. 로그인 동작     
     */
     
     // 1. 디비 접근 (모든 회원정보가 저장됨)
     // 연결에 필요한 정보
     final String DRIVER = "com.mysql.jdbc.Driver";
     final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
     final String DBID = "root";
     final String DBPW = "1234";
     
     
     // 1. 드라이버로드
     Class.forName(DRIVER);
     System.out.println("드라이버 로드 성공!");
     // 2. 디비연결
     Connection con 
        = DriverManager.getConnection(DBURL, DBID, DBPW);
     System.out.println("디비 연결 성공!");
     
     // 3. sql 쿼리(select) & pstmt 객체 생성
     String sql ="select pw from itwill_member where id=?";
     PreparedStatement pstmt =
    		 con.prepareStatement(sql);
     
     // ?
     pstmt.setString(1, mb.getId());		 
    
     // 4. sql 실행
     ResultSet rs = pstmt.executeQuery();
     
     // 5. 데이터 처리 
     if(rs.next()){ // 참일때 
    	 // 회원정보가 있다.
    	 System.out.println("회원 정보가 있음!");
         // 비밀번호 확인 (입력받은 비밀번호 , 디비에 있는 비밀번호)
         if(mb.getPw().equals(rs.getString("pw"))){ 
        	 // 회원정보가 있으면서, 비밀번호도 일치 => 본인 => 로그인
        	 System.out.println("로그인 성공!");
        	 // 로그인 성공정보를 기억 => 로그인 성공한 ID정보를 세션에 저장
        	 session.setAttribute("id", mb.getId());
        	 
        	 // main.jsp 페이지로 이동
        	 System.out.println("메인 페이지로  이동!");
        	 response.sendRedirect("main.jsp");
        	 
         }else{
        	 // 회원정보는 있음, 비밀번호가 다름
        	 System.out.println("비밀번호가 다름!");
        	 System.out.println("아이디 혹은 비밀번호가 잘못되었습니다.");
        	 %>
        	 <script type="text/javascript">
        	     alert("비밀번호 오류");
        	     history.back();
        	 </script>        	 
        	 <%
         }
     
     }else{
    	 // 회원정보가 없다.
    	 System.out.println("회원 정보가 없음!");
         System.out.println("아이디 혹은 비밀번호가 잘못되었습니다."); 
         // 회원정보 없을때 js를 사용해서 
         //  " 비회원 입니다. 회원가입 페이지로 이동하겠습니까? " 
         // Y - 회원가입 페이지로 이동/N - 뒤로가기를 선택 
         %>
         <script type="text/javascript">
            var result = confirm("비회원 입니다. 회원가입 페이지로 이동하겠습니까?");
            //alert("결과 : "+result);
            if(result){
            	location.href="insertForm.jsp";
            }else{
            	history.back();
            }
         
         </script>         
         <%
         
     }
     
     
     
   %>
   
   
   
   
   
   
   
   
   
   

</body>
</html>