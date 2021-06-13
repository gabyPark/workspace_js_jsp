<%@page import="com.itwillbs.Board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
 <jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
  <jsp:include page="../inc/left.jsp"/>
<!-- 왼쪽메뉴 -->

	<%
		// DB정보를 가져와야함.
		// DAO 객체 생성 
		BoardDAO bdao = new BoardDAO();
		// DB에 글정보가 있는지 체크 : getBoardCount();
		int cnt = bdao.getBoardCount();
		System.out.println("pro : 글 개수 -> " + cnt);
		///////////////////////////////////////////////////////////
		// 페이징 처리 - 게시판 보여질 글의 개수를 페이징 처리
		
		// 한 페이지에서 보여줄 글의 수 
		int pageSize = 10;
		
		// 현 페이지 정보 저장
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 페이지 출력 첫행 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		///////////////////////////////////////////////////////////
		
		
		ArrayList boardList = null;
		if( cnt !=0 ){
			// 정보를 처리해주는 메서드를 생성 : getBoardList()
			// boardList = bdao.getBoardList();
		
			boardList = bdao.getBoardList(startRow,pageSize);
		    System.out.println("pro : 글목록 저장완료! ");
		}
	%>

<!-- 게시판 -->
<article>
<h1>게시판 목록</h1>
	<table id="notice">
		<tr>
			<th class="tno">No.</th>
		    <th class="ttitle">Title</th>
		    <th class="twrite">Writer</th>
		    <th class="tdate">Date</th>
		    <th class="tread">Read</th>
	    </tr>
	    <%
	    if(cnt != 0){
	    	for(int i=0;i<boardList.size();i++){
	    		  BoardBean bb = (BoardBean) boardList.get(i);
	    	%>
			<tr>
				<td><%=bb.getNum() %></td>
				<td class="left">
						<!-- re_lev값에 따른 들여쓰기 표현 -->
						<!-- 답글 일때만 이미지 사용(re_lev) -->
						<%
						    int wid = 0;
							if(bb.getRe_lev()>0){
								wid = 10 * bb.getRe_lev();
						%>
						    <img src="level.gif" height="10" width="<%=wid%>">
							<img src="re.gif" height="10" >
						<%
							}
						%>
						<!-- ------------------------ -->
					<a href="boardContent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
						<%=bb.getSubject() %>
					</a>
				</td>
		   	 	<td><%=bb.getName() %></td>
		    	<td width="80px"><%=bb.getDate() %></td>
		    	<td><%=bb.getReadcount() %></td>
		    </tr>
		    <%
	    	}
	    }
	    %>
	</table>
		<div id="table_search"></div>
		
		<div class="clear"></div>
		
		<div id="page_control">
		<%
          if(cnt != 0){		
        	  
           // 전체 페이지수 계산하기
           int pageCount = cnt/pageSize+(cnt%pageSize==0? 0:1);
           
           // 한 페이지에 보여줄 페이지수(페이지 블럭)
           int pageBlock = 5;
           
           // 한 페이지에서 시작하는 페이지 번호
           int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
           // 한 페이지에서 끝나는 페이지 번호
           int endPage = startPage+pageBlock-1;
           
           if(endPage > pageCount){
        	   endPage = pageCount;
           }
           
		%>
		    <%//이전페이지 활성화
		     if(startPage > pageBlock){
		    %>
				<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
			<%
		     }
			%>
			
			<%
			  for(int i=startPage;i<=endPage;i++){
			%>
				<a href="boardList.jsp?pageNum=<%=i %>"><%=i %></a>
			<%
			  } 
			%>
			
			<%
			  if(endPage<pageCount){
			%>
				<a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
			<%
			  }
			%>
			
		<%} %>
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