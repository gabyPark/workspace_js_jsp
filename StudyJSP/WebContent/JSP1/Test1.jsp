<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/Test1.jsp</h1>
	<!-- HTML 주석  -->
	<script type="text/javascript">
		// javascript 주석
		/* JS 주석 */
	</script>
	<%-- <% JSP 주석  %> --%>
	<%
		// Java 주석  /*  자바주석~ */  /** 자바주석~(DOC) */
		// Java 코드를 작성하는 공간
		//안녕하세요
	%>

	<%
		// 배열
		// java,jsp,html,css
		// 출력
		/* String[] strArr = new String[4];
		strArr[0] = "java";
		strArr[1] = "jsp";
		strArr[2] = "html";
		strArr[3] = "css"; */
		
		//String strArr[] = {"java","jsp","html","css"};
		String [] strArr = new String[]{"java","jsp","html","css"};

		// 이클립스 콘솔창에 출력
		for (int i = 0; i < strArr.length; i++) {
			System.out.println(strArr[i]);
		}
		// 페이지에 출력
		for (int i = 0; i < strArr.length; i++) {
			out.println(strArr[i]+"<br>");
		}
	%>
	
	<h1>html</h1>
	<%="안녕" %>
	<hr>
	
	<%
	  for(int i=0;i<strArr.length;i++){
    %>
	   <!-- HTML -->
	    <%=strArr[i] %><br>
	   <!-- HTML -->
	<%	  
	  }	
	%>
	
	<hr>
	
	<!-- 테이블을 사용해서 메세지 출력 -->
	<table border="1">
	 <tr>
	   <td>번호</td><td>값</td>
	 </tr>
	  <tr>
	   <td>0</td><td><%=strArr[0] %></td>
	 </tr>
	  <tr>
	   <td>1</td><td><%=strArr[1] %></td>
	 </tr>
	  <tr>
	   <td>2</td><td><%=strArr[2] %></td>
	 </tr>
	  <tr>
	   <td>3</td><td><%=strArr[3] %></td>
	 </tr>
	 
	
	</table>
	
	
	<table border="1">
	 <tr>
	   <td>번호</td><td>값</td>
	 </tr>
	 <%
	   for(int i=0;i<strArr.length;i++){
	 %>	
		 <tr>
		   <td><%=i %></td><td><%=strArr[i] %></td>
		 </tr>
	 <%
	   }
	 %>
	
	</table>
	
	
	






</body>
</html>