<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/JSP1/TestPro2.jsp</h1>
  
  <%
    // form태그-post 방식으로 한글데이터 전달시 한글 깨짐 (인코딩방식)
    
    // 한글 처리 
    request.setCharacterEncoding("UTF-8");
     
    //전달된 정보 저장(파라미터값) myname,myage
    String name = request.getParameter("myname");
    //String age = request.getParameter("myage");
    int age = Integer.parseInt(request.getParameter("myage"));
  
  %>
   이름 : <%=name %><br>
   나이 : <%=age %><br>
  
  <hr>
  <!--
        사용자의 나이가 20살 이상인경우  "성인입니다."
          "         미만인경우  "미성년자 입니다." 
        
        화면에 출력(java,java+html,표현식)            
   -->
  <%
    //1. java 사용
    
    if(age >= 20){
    	//System.out.println("성인입니다.");
    	out.print("<h3> 성인입니다. </h3>");
    }else{
    	out.print("<h3> 미성년자입니다. </h3>");    	
    }
   ////////////////////////////////////////////
   // 2. java + html 사용
   
   if(age >= 20){
	   %>
	     성인입니다<br>
	   <%
   }else{
	   %>
	   미성년자 입니다<br>
	   <%
   }
   
   // 3. 표현식
    
   if(age >= 20){
	   %>
	     <%="성인입니다." %> <br>
	   <%
   }else{
	   %>
	     <%="미성년자 입니다." %><br>
	   <%
   }
   
   
  %>
  
  
  
  
  

</body>
</html>