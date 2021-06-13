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
	<h1>WebContent/member/loginPro.jsp</h1>
	
	<%
	  // 한글처리
	  request.setCharacterEncoding("UTF-8");
	  // 입력정보 ID,PW 저장
	  String id = request.getParameter("id");
	  String pw = request.getParameter("pw");
	  
	  // MemberDAO 객체 생성 - idCheck(id,pw)
	  // -> DB에서의 처리 결과를 가져와서 이동
	  MemberDAO mdao = new MemberDAO();
	  int check = mdao.idCheck(id,pw);
	  
	  System.out.println("로그인 체크값 : "+check);
	  
	  // 로그인 성공 - [1]
	  // 비밀번호 오류 - [0]
	  // 아이디가 없는경우 - [-1]
	  // 결과에 따른 페이지 이동
	  if(check == 1){
		  // 아이디 정보를 사용해서 session값
		  session.setAttribute("id", id);
		  // 메인페이지로 이동		  
		  response.sendRedirect("main.jsp");
	  }else if(check == 0){
		  // 메세지 + 페이지 뒤로이동
		  %>
		    <script type="text/javascript">
		       alert(" 비밀번호 오류! ");
		       history.back();
		    </script>
		  <%
	  }else{ // check == -1
		  // 메세지 + 페이지 뒤로이동
		  %>
		    <script type="text/javascript">
		       alert(" 아이디 없음! ");
		       history.back();
		    </script>
		  <%
	  }
	
	%>
	
	
	
	
	
	
	
	

</body>
</html>