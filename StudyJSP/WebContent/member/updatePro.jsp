<%@page import="com.member.MemberDAO"%>
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
	<h1>WebContent/member/updatePro.jsp</h1>
	<%
		//로그인 세션 제어
		String id = (String) session.getAttribute("id");
	    
	    if(id == null){
	    	System.out.println("정보 수정->로그인페이지");
	    	response.sendRedirect("loginForm.jsp");
	    }
	 
		//한글 처리 
		request.setCharacterEncoding("UTF-8");
		
		// 수정할 정보를 모두 저장 
		// 액션태그
		// MemberBean updateMember = new MemberBean();
		//updateMember.setName(request.getParameter("name"));
		
		%>
		  <jsp:useBean id="updateMember" class="com.member.MemberBean"/>
		  <jsp:setProperty property="*" name="updateMember"/>
		<%
		
		System.out.println("수정할 정보 : "+updateMember);
		
		// 수정할 정보를 가지고 DB객체(DAO)로 이동
		MemberDAO mdao = new MemberDAO();
		
		// 정보 수정메서드 구현 - updateMember(수정할 정보);
		int check = mdao.updateMember(updateMember);
		
		System.out.println("pro : 수정 결과 => "+check);
	
	    // 처리 결과에 따른 페이지 이동
	    // 수정완료 => 1
	    // 비밀번호 오류 => 0
	    // 아이디가 없는경우 => -1
	    if(check == 1){
	    	//System.out.println("수정완료!");
	    	//response.sendRedirect("main.jsp");
	    	%>
	    	  <script type="text/javascript">
	    	     alert(" 정보 수정 완료! ");
	    	     location.href='main.jsp';
	    	  </script>
	    	<%
	    }else if(check == 0){
	    	%>
	    	  <script type="text/javascript">
	    	     alert(" 수정 비밀번호 오류! ");
	    	     history.back();	    	     
	    	  </script>
	    	<%
	    }else{ //check == -1
	    	%>
	    	  <script type="text/javascript">
	    	     alert(" 회원 정보 없음! ");
	    	     history.back();
	    	  </script>
	    	<%
	    }
	    
	    
	%>





</body>
</html>