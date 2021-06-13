<%@page import="com.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/memberList.jsp</h1>

	<h2>모든 회원의 정보를 확인</h2>

	<%
	   // <추가 구현>
	   // - 로그인 세션 제어 (1.로그인 여부,2. 관리자 여부)
	   String id = (String) session.getAttribute("id");
	   if(id == null || !id.equals("admin")){
           response.sendRedirect("loginForm.jsp");	   
	   }
	   
	   // 회원가입된 모든 회원의 정보를 출력
	   // -> 테이블 출력(동적 생성)
	   
	   // DAO 객체 생성 -> 메서드 getMemberList();
	   // 처리 결과로 회원 목록을 DB에서 가져와야함
	   MemberDAO mdao = new MemberDAO();
	   ArrayList memberList = mdao.getMemberList();
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
      <%for(int i=0;i<memberList.size();i++){ 
         // 배열 -> MemberBean -> 출력
          MemberBean mb = (MemberBean)memberList.get(i);
      %>
	      <tr>
	        <td><%=mb.getId() %></td>
	        <td><%=mb.getPw() %></td>
	        <td><%=mb.getName() %></td>
	        <td><%=mb.getAge() %></td>
	        <td><%=mb.getGender() %></td>
	        <td><%=mb.getEmail() %></td>
	        <td><%=mb.getReg_date() %></td>
	      </tr>	
      <%}%>
      </table>

    <h1><a href="main.jsp">메인페이지로 이동하기</a></h1>








</body>
</html>