<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

     <h1>WebContent/Attribute.jsp</h1>
     
     <%
       //request 영역에 저장된 속성 저장->출력
       int num = (Integer) request.getAttribute("cnt");
       
       out.print("out.print : "+num);
     
     %>
     <h2> 서블릿 페이지에서 정보(속성)를 전달 </h2>
     *JSP 표현식 : 변수의 값을 사용
          결과 : <%=num %><br> 
          결과 : <%=num+100 %><br> 
          
          
     <hr>
     <h2> EL 표현식 </h2>
     * el 표현식 : 영역 객체의 값을 사용 (어트리뷰트)
      <%--  $ { }  jsp 표현식을 대신해서 사용< % =  % > --%>
      <h2> EL 표현식 결과 : ${cnt }</h2>
      <h2> EL 표현식 결과 : ${cnt+100}</h2>
      <h2> EL 표현식 결과 : ${requestScope.cnt}</h2>
      <hr>
         <h3> 세션값 출력 </h3>
         <%=session.getAttribute("cnt") %> <br>
         ${sessionScope.cnt }<br>
         ${cnt }<br>
      
      <hr>
      
      
      <h3> el표현식으로 데이터를 가져올때 </h3>
      <p>
         * 영역의 이름을 명시하지 않을경우 순차적으로 영역을 검색<br>
         1. pageScope 에서 cnt 찾아서 있으면-> 사용, 없음 ->다음<br>
         2. requestScope 에서              "<br>
         3. sessionScope 에서              "<br>
         4. applicationScope에서         "<br> 
         
         5. 데이터 없을경우 값이 없다라고 판단.   <br>      
      </p>
      
      
     
     
     
     
     
     
     
     
    

</body>
</html>