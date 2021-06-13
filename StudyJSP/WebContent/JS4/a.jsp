<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h1> 안녕하세요 </h1>
    <script type="text/javascript">
       document.write("자바스크립트 테스트 입니다.");    
    </script>
    <!-- html코드 주석 -->
    <%
      request.setCharacterEncoding("UTF-8");
      // java코드 주석
      
      String name = request.getParameter("name");
           request.getparame
    
      //String hobby = request.getParameter("hobby");
      //String hobby2 = request.getParameter("hobby");
      
      String[] hb = request.getParameterValues("hobby");
    
      if(hb != null){
    	  for(int i=0;i<hb.length;i++){
    		 //System.out.println(hb[i]);  
    		 out.println(hb[i]+"<br>");  
    	  }    	  
      }
      
      
    %>
    <hr>
        이름 : <%=name %>
    <hr>
    <%--     취미 : <%=hobby %><br>
        취미2 : <%=hobby2 %> --%>
        <%-- 취미 : <%=hb[0] %><br>
        취미2 : <%=hb[1] %><br>
        취미3 : <%=hb[2] %><br> --%>
    <!-- 취미의 개수 상관없이 출력 -->
    
    
    
    
    
    

</body>
</html>