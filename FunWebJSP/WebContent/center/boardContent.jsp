<%@page import="com.itwillbs.Board.BoardBean"%>
<%@page import="com.itwillbs.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
   <jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
  <jsp:include page="../inc/left.jsp"/>
<!-- 왼쪽메뉴 -->

<%
  // 전달된 파라미터값 저장 (num,pageNum)
  int num = Integer.parseInt( request.getParameter("num") );
  String pageNum = request.getParameter("pageNum");
  
  // DAO 객체 생성
  BoardDAO bdao = new BoardDAO();
  // 해당 글의 조회수를 1증가 
  bdao.updateReadCount(num); 
  
  // DB에서 해당 번호(num)에 해당하는 글 정보를 조회 
  BoardBean bb = bdao.getBoard(num); 
  
  System.out.println("pro : "+bb);
  // 해당정보를 화면에 출력

  // 본문의 내용 줄바꿈 표시하기
  // \n -> <br>
  
  String content = bb.getContent();
  
  if(content != null){
	  content = content.replace("\r\n", "<br>");
  }
  
  
  
  
%>

<!-- 게시판 -->
<article>
<h1> 게시판 본문보기 </h1>
	<table id="notice">
		<tr>
			<th class="tno" colspan="5">아이티윌 게시판</th>
		</tr>
		    
		<tr>
		    <td>글번호</td>
		    <td><%=bb.getNum() %></td>
		    <td>조회수</td>
		    <td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
		    <td>글쓴이</td>
		    <td><%=bb.getName() %></td>
		    <td>작성일</td>
		    <td><%=bb.getDate() %></td>
		</tr>
		<tr>
		    <td>제목</td>
		    <td colspan="3"><%=bb.getSubject() %></td>
		</tr>
		<tr>
		    <td>내용</td>
		    <td colspan="3"><%=content %></td>
		</tr>
		
		
	</table>
	<div id="table_search">
		<input type="button" value="수정하기" class="btn" 
		       onclick="location.href='updateForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>'"
		>
		<input type="button" value="삭제하기" class="btn"
		       onclick="location.href='deleteForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>'"		
		>
		<input type="button" value="답글쓰기" class="btn"
			   onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>';"				
		>
		<input type="button" value="목록으로" class="btn" 
		       onclick="location.href='boardList.jsp?pageNum=<%=pageNum %>';"
		>
	</div>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
	
	
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
  <jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>