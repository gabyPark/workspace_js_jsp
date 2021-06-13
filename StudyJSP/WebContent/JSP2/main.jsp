<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %>	

<%-- <%
		String col1 = "yellow";
		String col2 = "red";
		String col3 = "blue";
		String col4 = "orange";
		String col5 = "pink";
%> --%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col5%>">
	<h1>WebContent/JSP2/main.jsp</h1>
	<!-- 페이지 모듈화 : 하나의 페이지를 여러개의 페이지 모듈로 구성 -->
	
	<!-- include
	   
	   1) < %@ include  file="파일" % > 
	    공통의 변수(값)을 파일에 선언해서 추가
	    - jsp 디렉티브(include) : 두개의 파일이 하나의 파일로 합쳐진 후 컴파일
	   
	   2) < jsp:inclue page="페이지" > 
	   공통으로 사용되는 메뉴들을 파일로 생성해서 추가
	    - 액션태그 : 두개의 파일을 각각 컴파일 한 후에 파일을 추가해서 사용	
	 -->
	
	
	
	<table border="1" width="600" height="600">
	  <tr>
	     <td colspan="2" height="100">
	     
	       <jsp:include page="top.jsp">
	          <jsp:param value="itwill" name="id"/>
	       </jsp:include>
	     
	     </td>
	  </tr>
	  <tr>
	     <td width="100">
	        <jsp:include page="left.jsp"></jsp:include>
	     </td>
	     <td>
	        <h2> 본문 내용 </h2>
	     </td>
	  </tr>
	  <tr>
	      <td colspan="2" height="100">
	        <jsp:include page="bottom.jsp"></jsp:include>
	      </td>
	  </tr>
	</table>
	
	
	
	
	
	
	
	
	





</body>
</html>