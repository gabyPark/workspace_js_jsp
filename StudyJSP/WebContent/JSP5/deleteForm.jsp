<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- html5 문법 사용 -->	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP5/deleteForm.jsp</h1>

	<fieldset>
		<form action="deletePro.jsp" method="post">
		  이름 : <input type="text" name="name" > <br>
		  주민번호 : <input type="text" name="jumin" placeholder="- 포함해서 작성하시오" > <br>
		  <hr>
		  <input type="submit" value="삭제하기">		
		</form>
	</fieldset>












</body>
</html>