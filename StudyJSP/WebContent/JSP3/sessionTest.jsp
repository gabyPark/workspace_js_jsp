<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/JSP3/sessionTest.jsp</h1>
  <%
    // 세션(session) : 웹 서버의 정보를 저장하기위해서 사용하는 객체
    //                웹 컨테이너의 상태를 유지하는 정보 저장
    //                웹 브라우저당 1개의 객체 생성
    //                안정적이고, 보안상위험이 적음
    
    // 세션객체 생성 -> JSP 내장객체 (객체 생성 할 필요없음)
    
    // 세션의 속성 설정
    // session.setAttribute("키", "값");
    // 세션의 속성 삭제
    // session.removeAttribute("키");
    // 세션정보 초기화
    // session.invalidate();
    
    String id = (String) session.getAttribute("itwill");
    
    if(id == null){
    	id=" 세션값 없음! ";
    }
  
  %>
  
  <h2> 클라이언트 </h2>
  
  <h3>세션정보 : <%=id %> </h3>
  
  <input type="button" value="세션값 생성"
         onclick="location.href='sessionSet.jsp'"
  ><br>
  
  <input type="button" value="세션값 삭제"
         onclick="location.href='sessionDel.jsp'"
  ><br>
  
  <input type="button" value="세션값 초기화"
         onclick="location.href='sessionInval.jsp'"
  ><br>
  
  
  
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>