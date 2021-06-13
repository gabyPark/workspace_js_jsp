<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP2/scopePro.jsp</h1>
       * 영역객체 사용 <br> 
          - 영역내장객체.setAttribute("key(이름)","값"); (저장)<br>
          - 영역내장객체.getAttribute("key(이름)"); (사용)<br>
          
    <%
       // 영역객체를 사용 정보를 저장
       pageContext.setAttribute("pageKey", "page영역 값!");
       request.setAttribute("reqKey", "request 영역값@");
       session.setAttribute("sesKey", "session 영역값#");
       application.setAttribute("appKey", "application 영역값$");
    
    %>      
	<%
	   String id = request.getParameter("id");
	
	   //String reqID = (String)request.getAttribute("id");
	   //System.out.println(reqID); (x)
	%>
	<h2> 아이디 : <%=id %> (파라미터) </h2>
    <hr>
    page영역(pageContext객체) 속성값(공유데이터) : <%=pageContext.getAttribute("pageKey") %>
    <hr>
    request영역(request객체) 속성값(공유데이터 ) :
    <%=request.getAttribute("reqKey") %>
    <hr>
    session영역(session객체) 속성값(공유데이터) : 
    <%=session.getAttribute("sesKey") %>
    <hr>
    application영역(application객체) 속성값(공유데이터) : 
    <%=application.getAttribute("appKey") %>
    <hr>
    
    <h2> 페이지 이동 </h2>
        
    <h3> a태그 : 파라미터,session,application </h3>
    <a href="scopeProPro.jsp?id=<%=id%>&pw=1234">scopeProPro.jsp페이지로 이동</a>
    
    <h3> 자바스크립트 (location): 파라미터,session,application </h3>
    <script type="text/javascript">
       //alert("자바스크립트로 페이지 이동!");
       //location.href="scopeProPro.jsp?id=<%=id%>&pw=1234";
    </script>
    
    <h3> JSP(response) : 파라미터, session,application </h3>
    <%
       // response 객체 사용 페이지 이동    
       //response.sendRedirect("scopeProPro.jsp?id="+id+"&pw=1234");
    %>
    
    <h3> 액션태그(forward) : 파라미터,request,session,application </h3>
    
    <h4>
            액션태그 : jsp에서 제공하는 기능(태그를 사용해서, JSP(java)의 동작 실행가능)
            -> 자바를 모르는 디자이너도 같이 사용(include,forward,자바빈)
            -> 간결하게 태그의 형태로 JSP 동작 실행
    </h4>
    
    <h4> 
       forward이동(포워딩 방식) : 액션태그 사용/사용X
       - 페이지의 주소가 변경X, 페이지 화면의 값이 변경O  
       - 페이지 이동시 request,response 객체를 가지고 이동
    </h4>
    
    <%-- <jsp:forward page="scopeProPro.jsp?pw=1234"></jsp:forward> --%>
    <jsp:forward page="scopeProPro.jsp">
       <jsp:param value="12345" name="pw"/>
    </jsp:forward>
    
    
    
    






</body>
</html>