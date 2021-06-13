<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/core/foreach.jsp</h1>
	
	<%
	  // 1~10 출력
	  // jsp 반복문  - for
	  for(int i=1;i<=10;i++){
		  out.print(i+"<br>");
	  }
	  out.print("<hr>");
	  
	  // jsp + 표현식 - for
	  for(int i=1;i<11;i++){
		  %>
		   <%=i %><br>
		  <%
	  }
	%>
	<hr>
	
	<h2> JSTL 사용해서 반복문 </h2>
	<!-- begin="시작" end="끝" step="증감" var="변수"  -->
	<c:forEach begin="1" end="10" step="1" var="i" >
               출력${i }<br>	   
	</c:forEach>
	
	<h2> JSTL 사용 출력 (홀수만 가로 출력 1~10) </h2>
	<c:forEach begin="1" end="10" step="2" var="i">
	    ${i } 	   
	</c:forEach>
	
	<%
	   ArrayList testArr = new ArrayList();
	   testArr.add("1");
	   testArr.add("2");
	   testArr.add("3");
	   testArr.add("4");
	   testArr.add("5");
	   
	   pageContext.setAttribute("testArr", testArr);
	%>
	
	
	<h2> JSTL 사용해서 List 정보 출력 </h2>
	${testArr }
	
	<hr>
	<!-- 해당 배열/리스트의 값의 크기만큼 반복 -->
	<!-- 해당 요소의 값은 var 변수에 담아서 반복문에서 el표현식으로  사용가능 -->
	<c:forEach var="arrValue" items="${testArr }">
	    test -> ${arrValue}
	</c:forEach>
	
	<hr>
	<c:forTokens var="str" items="a,s,d,r,q,w,t,g,x,t,t" delims=",">
	     반복! ${str }<br>   
	</c:forTokens>
	
	<!-- forTokens 사용해서 출력 -->
	<c:set var="data" value="hello@itwill@busan@test@bye"/>
	
	<c:forTokens items="${data}" delims="@" var="Dvalue">
	  ${Dvalue }<br>	
	</c:forTokens>
	
	
	


	
	
	
	
	
	
	
	

</body>
</html>