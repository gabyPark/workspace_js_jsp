<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/fmt/fNumber.jsp</h1>
   
   <h2>숫자 데이터를 원하는 형태로 표현</h2>
   
   HTML : 1000000<br>
   
   <hr>
   <!-- 숫자를 3자리마다 , 사용해서 구분 -->
   <fmt:formatNumber value="1000000" groupingUsed="true"/><br>
   <fmt:formatNumber value="1000000"/><br>
   <fmt:formatNumber value="1000000" groupingUsed="false"/><br>
   
   <hr>
   3.12356356 소수점 자리 2번째 까지만 표시 <br>
   
   <fmt:formatNumber value="3.12356356" pattern="#.##" /><br>
   
   10.5 데이터 출력 => 10.50형태로 출력 <br>
   <fmt:formatNumber value="10.5" /><br>
   <fmt:formatNumber value="10.5" pattern="#.##" /><br>
   <fmt:formatNumber value="10.5" pattern="#.00" /><br>
   
   <hr><hr>
   
   백분율 (퍼센트) 표현 <br>
   <fmt:formatNumber value="0.5" /><br>
   <fmt:formatNumber value="0.124" type="percent"/><br>
   
   통화 (화패단위 ) 표현 <br>
   <fmt:formatNumber value="10000000" type="currency"/> 
   <fmt:formatNumber value="10000000" type="currency" groupingUsed="false"/> 
   <fmt:formatNumber value="10000000" type="currency" groupingUsed="false"
                     currencySymbol="❤" /> 
  
  <!--  ㅁ + 한자 ,  윈도우키 + ; -->                   
                     
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

</body>
</html>