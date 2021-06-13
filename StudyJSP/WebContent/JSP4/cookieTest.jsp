<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/JSP4/cookieTest.jsp</h1>

	<!--  버튼 클릭시 cookieSet.jsp 페이지로 이동  -->
	<input type="button" value="쿠키값 생성"
		onclick="location.href='cookieSet.jsp'">

	<hr>

	<!-- 버튼 클릭시 cookieDel.jsp 페이지로 이동 -->
	<input type="button" value="쿠키값 삭제"
	    onclick="location.href='cookieDel.jsp'"
	>

	<hr>
    <%
    	// 쿠키의 값을 가져오기(서버에서 보낸 쿠키 배열)
    	Cookie[] cookies = request.getCookies();

    	// 쿠키 배열의 값 확인
    	/* for(int i=0;i<cookies.length;i++){
    		System.out.println(cookies[i].getName()+" : "+cookies[i].getValue());
    	} */

    	String cName = "";
    	String cValue = "";

    	if (cookies != null) {
    		// 쿠키값을 꺼내서 화면에 출력
    		for (int i = 0; i < cookies.length; i++) {
    			// 쿠키의 이름이 내가 생성한 쿠키의 이름과 같은지 비교
    			if (cookies[i].getName().equals("ckName")) {
    				cName = cookies[i].getName();
    				cValue = cookies[i].getValue();
    			}
    		}
    	}
    %>
    
    <h2> 클라이언트 </h2>
    
    <h2> 쿠키 이름 : <%=cName %></h2>
    <h2> 쿠키 값 : <%=cValue %></h2>









</body>
</html>