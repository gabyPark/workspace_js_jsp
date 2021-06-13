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
	<h1>WebContent/member/deletePro.jsp</h1>

	<%
	  // 로그인 세션 제어
	  String id = (String) session.getAttribute("id");
	  if(id == null){
		  System.out.println("삭제 페이지 -> 로그인페이지");
		  response.sendRedirect("loginForm.jsp");		  
	  }
	  // 한글처리
	  request.setCharacterEncoding("UTF-8");
	  // 삭제할 계정정보를 받아서 처리 
	  
	  String pw = request.getParameter("pw");
	  // 파라미터값이 입력없이 전달될 경우 "" 공백문자로 저장됨
	  System.out.println("pw : "+pw);
	  
	  // DAO 객체 생성 - deleteMember(id,pw);
	  MemberDAO mdao = new MemberDAO();
	  int check = mdao.deleteMember(id,pw);
	  
	  // 처리 결과를 저장해서 페이지 이동
	  // 삭제 완료->1 비밀번호 오류 ->0 아이디 없음 -> -1
	  if(check == 1){
		  // 로그인 정보를 삭제
		  session.invalidate();		  
		  %>
		    <script type="text/javascript">
		       alert(" 회원 탈퇴 완료! ");
		       location.href="main.jsp";		    
		    </script>
		  <%
	  }else if(check == 0){
		  %>
		    <script type="text/javascript">
		       alert(" 비밀번호 에러! ");
		       history.back();		    
		    </script>
		  <%
	  }else{ //check == -1
		  %>
		    <script type="text/javascript">
		       alert(" 회원정보 없음! ");
		       history.back();		    
		    </script>
		  <%
	  }
	  
	  
	%>









</body>
</html>