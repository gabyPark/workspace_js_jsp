<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/array.jsp</h1>
   
   <%
     // request.setAttribute("sport", sport);
     // sport 배열의 정보를 저장해서 출력
     String[] sport = (String[]) request.getAttribute("sport");     
     
     if(sport != null){
    	 out.print(sport[0]+","+sport[1]+","+sport[2]);
     }
     if(sport != null){
    	 for(int i=0;i<sport.length;i++){
    		 %>
    		 <br><%=sport[i] %>
    		 <%
    	 }
     }
     
     // 확장for문 사용 출력
     if(sport != null){
    	 for(String s:sport){
    		 System.out.println(s);
    	 }
     }
   %>
   <hr>
   
   <h3> el 표현식을 사용해서 배열 출력 </h3>
   
   ${requestScope.sport } <!--request 영역에 값을 가져와서 사용  -->
   ${requestScope.sport[0] } <!--request 영역에 값을 가져와서 사용  -->
   ${sport[1] } <!--request 영역에 값을 가져와서 사용  -->
   
   <hr>
   <%
     // request.setAttribute("movieList", movieList);
     //가변길이 배열의 모든 요소를 출력
     ArrayList movieList 
       = (ArrayList)request.getAttribute("movieList");
     
     if(movieList != null){
    	 System.out.println("movieList : "+movieList);
     }
     if(movieList != null){
    	 for(Object s :movieList){
    		 System.out.println("s : "+s);
    	 }
     }
     
   %>
   <h2> el표현식 사용 출력</h2>
   html 코드 : ${requestScope.movieList }
   html 코드 : ${requestScope.movieList[1] }
   html 코드 : ${movieList[2] }
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>