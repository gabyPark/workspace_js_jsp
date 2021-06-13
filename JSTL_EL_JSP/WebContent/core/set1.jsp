<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- 
     JSTL의 코드를 사용하기위해서 필요한 설정값을 지정
     prefix="접두어" uri="주소"
 -->   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>WebContent/core/set1.jsp</h1>
  
  <%
    // 자바코드를 사용해서 변수를 선언 & 사용
    // => 선언된 변수는 해당페이지(set1.jsp)에서만 사용가능
    int number01 = 100;
    int number02 = 200;
    int sum = number01 + number02;
  
  %>
  	계산 결과 : <%=sum %><br> <hr><hr>
  	
  	<h2>JSTL 사용 변수 선언 & 출력</h2> 
   
   <%-- <jsp:> 액션태그 --%>
   <%-- <c:set var="변수명" value="변수값" scope="page"/> --%>
   <!--  영역의 정보가 없을경우 (생략) page 영역에 생성 -->
   
   <c:set value="10" var="num1" />
   <c:set value="20" var="num2" />
   <c:set var="sum2" value="num1+num2" />
   <c:set var="sum3" value="${num1+num2 }"/>
   <!--  
     => 변수를 생성x, 속성을 생성O(scope에 저장되는 값)
   -->
     <%-- 결과 : <%=num1 %> (x)--%>
     결과 : <%=pageContext.getAttribute("num1") %> <br>
     결과 : <%=pageContext.getAttribute("sum2") %> <br>
     <hr>
   el 표현식 결과 : ${num1 } <br>  
   el 표현식 결과 : ${sum2 } <br>  
   el 표현식 결과 : sum3 : ${sum3 }<br>
   
  <h3>
    스크립틀릿을 사용 -> 자바 변수 <br>
   jstl을 사용 -> 속성(attribute)<br>
  </h3>
  
  <hr><hr>
  
  <h3> 상품이름, 상품가격, 상품번호를 저장하여 set2.jsp 페이지로 전달 </h3>
  <h3> jstl 사용해서 변수(속성)을 선언 </h3>
  
  <%
     /* request.setAttribute("name", "컴퓨터"); */
  %>
  <c:set var="name" value="컴퓨터" scope="request"/>
  <c:set var="price" value="100" scope="request"/>
  <c:set var="number" value="0001" scope="request"/>
  
  ${name } <br>
  ${pageScope.name }<br>
  ${requestScope.name }<br>
  
  <!-- jsp페이지에서 forward 이동 -->
  <!-- 액션태그 사용 -->
  <jsp:forward page="set2.jsp"></jsp:forward>
  
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>