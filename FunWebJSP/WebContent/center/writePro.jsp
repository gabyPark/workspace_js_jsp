<%@page import="com.itwillbs.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/center/writePro.jsp</h1>
	<%
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		// 전달정보 저장(글쓴이,비밀번호,제목,내용)-> 자바빈 객체
	%>
	   <!-- 액션태그 사용 -->
	   <jsp:useBean id="bb" class="com.itwillbs.Board.BoardBean"/>
	   <jsp:setProperty property="*" name="bb"/>
	<%
	   // 입력한 사람의 IP정보를 저장
	   String ip = request.getRemoteAddr();
	   bb.setIp(ip);
	   
	   //bb.setIp(request.getRemoteAddr());
	
	   // 전달된 정보 확인
	   System.out.println("전달된 정보 : "+bb.toString());
	   
		// DB 처리객체 생성 -> 글쓰기 메서드 호출
		BoardDAO bdao = new BoardDAO();
		
		bdao.insertBoard(bb);
 
		// 페이지로 이동 (글목록 페이지-boardList.jsp)
		
		response.sendRedirect("boardList.jsp");
		
	%>










</body>
</html>