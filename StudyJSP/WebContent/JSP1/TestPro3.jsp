<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/TestPro3.jsp</h1>
	<%
		// 한글처리 : 파라미터값을 받기 전에 미리 설정
		request.setCharacterEncoding("UTF-8");

		// 전달되는 정보 출력
		// 이름, 나이, 성별, 취미, 강의장
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String classNum = request.getParameter("classNum");

		//String hobby = request.getParameter("hobby");
		// 동일한 파라미터 이름으로 여러개의 데이터가 넘어온경우
		String[] hobbyArr = request.getParameterValues("hobby");
	%>
	이름 :
	<%=name%><br> 나이 :
	<%=age%><br> 성별 :
	<%=gender%><br> 강의장 :
	<%=classNum%>
	강의장
	<br>
	<%-- 취미 : <%=hobby %><br> --%>
	취미 :
	<%
		if (hobbyArr != null) {
			for (int i = 0; i < hobbyArr.length; i++) {
				out.print(hobbyArr[i] + " ");
			}
		}
	%>







</body>
</html>