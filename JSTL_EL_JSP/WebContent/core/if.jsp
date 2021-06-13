<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/core/if.jsp</h1>
   
   <c:set var="str" value="text" />
   
   <c:if test="${str=='text'}" >
           변수 str의 값은 'text'입니다.<br>
   </c:if>
   
   <fieldset>
     <form action="">
       	숫자1 : <input type="text" name="num1"> <br>
       	숫자2 : <input type="text" name="num2"> <br>
       	<input type="submit" value="비교하기"> 
     </form>   
   </fieldset>
   
   <hr>
   <h2> 입력받은 숫자 2개의 데이터가 같은지 다른지 비교 </h2>
  <%
    String num1 = request.getParameter("num1");
    String num2 = request.getParameter("num2");
    
    if(num1 != null && num2 != null){
	    int number1 = Integer.parseInt(num1);
	    int number2 = Integer.parseInt(num2);
	    
	    if(number1 == number2){
	    	out.print("같다!");
	    }else{
	    	out.print("다르다!");
	    	if(number1 > number2){
	    		out.print("number1이 크다");
	    	}else{
	    		out.print("number2이 크다");
	    	}
	    }	    
    }
  %>
  <hr><hr>
  <h3>*el 내장 객체 </h3>
  param : 파라미터값을 저장하는 객체 <br>
  paramValues : 파라미터를 배열로 저장/처리 객체 <br>
  
  파라미터 :  ${param.num1 }<br> 
  파라미터 :  ${param.num2 }<br> 
 <hr>
 <h3> 두개의 값이 같은지, 다른지 비교( 어떤 수가 더 큰지 확인 ) - JSTL사용 </h3>
 
 <c:if test="${param.num1 == param.num2 }">
     <h4>같다.</h4>
 </c:if> 
  <c:if test="${param.num1 != param.num2 }">
     <h4>다르다</h4>
     <c:if test="${param.num1 gt param.num2}">
         ${param.num1 }크다 <br>
     </c:if>
     <c:if test="${param.num1 lt param.num2}">
         ${param.num2 }크다 <br>
     </c:if>
          
 </c:if> 
 
  
  
  
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>