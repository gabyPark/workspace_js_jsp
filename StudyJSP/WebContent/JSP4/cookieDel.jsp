<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP4/cookieDel.jsp</h1>
	<h2> 서버 - 쿠키값 삭제 </h2>
	
	<%
	 // 쿠키값 삭제
	 // => 기존의 쿠키 정보를 받아서  해당 쿠키만 삭제후 다시 전달
	 
	 // 쿠키값 가져오기 (클라이언트에서 보낸 쿠키정보)	 
	 Cookie[] cookies = request.getCookies();
	 
	 // 쿠키배열의 값 중에서 해당 쿠키 정보만 삭제후 다시 전달
	 if(cookies != null){
		 for(int i=0;i<cookies.length;i++){
			// 해당 쿠키정보 (서버에서 생성한)
			if(cookies[i].getName().equals("ckName")){
				// 쿠키값 사용하는 시간 0 설정
				cookies[i].setMaxAge(0);
				// 변경된 정보를 저장해서 다시 클라이언트로 전달
				response.addCookie(cookies[i]);				
			}			 
		 }		 
	 }
	 
	 // 페이지 이동
	 
	%>
	<script type="text/javascript">
	   alert(" 쿠키값 삭제 완료! ");
	   location.href="cookieTest.jsp";	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>