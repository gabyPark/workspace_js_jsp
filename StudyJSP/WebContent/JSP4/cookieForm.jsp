<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>WebContent/JSP4/cookieForm.jsp</h1>
  <%
  String lang = "kor";
  
  // 전달된 쿠키 정보를 사용해서 
  // 정보가 있을때 kor - "안녕하세요. 쿠키연습!" 화면출력
  //      "    eng - "Hello. CookieTest!" 화면출력  
  
  // 쿠키값 가져오기
  Cookie[] cookies = request.getCookies();

  if(cookies != null){
  	for(int i=0;i<cookies.length;i++){
  		if(cookies[i].getName().equals("lang")){
  			lang = cookies[i].getValue();
  		}
  	}
  }
  %>
  
  <%
    // 쿠키 : 페이지 상관없이 값을 저장&사용, 클라이언트쪽 저장(PC-HDD), 보안상 위험이 없는정보 사용
    // 세션 : 페이지 상관없이 값을 저장&사용, 서버쪽 저장(PC), 보안상 중요한 데이터
    // => 쿠키를 사용하는 이유 서버의 부담을 줄여서 효율적인 처리하기위해서     
  %>
  
  
  <!-- radio버튼의 값을 cookiePro.jsp페이지로 전달 -->
  <form action="cookiePro.jsp" method="post">
	   <input type="radio" name="language" value="kor" 
	   <% if(lang.equals("kor")){ %>
	   		checked
	   <%} %>
	   > 한국어
	   <input type="radio" name="language" value="eng"
	    <% if(lang.equals("eng")){ %>
	   		checked
	   <%} %>
	   > 영어
	   <hr>
	   <input type="submit" value="전송(언어설정)">
  </form>
  
  <hr>
  <%
    
    if(lang.equals("kor")){
    	out.print("안녕하세요. 쿠키연습!");
    }else{
    	out.print("Hello. CookieTest!");
    }
    
  %>
  
  <%--  <%=lang %> --%>
  
  
  
  
  
  
  
  
  


</body>
</html>