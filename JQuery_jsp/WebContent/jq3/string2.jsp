<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    	System.out.println("string2.jsp 호출 ");
    
    	// 전달된 파라미터 값을 저장
    	String name = request.getParameter("name");
    	int age = Integer.parseInt(request.getParameter("age"));
    	
    	System.out.println("전달값 : "+name);
    	System.out.println("전달값 : "+age);
    	
    %>
    
    
    <h2>이름 : <%=name %> / 나이 : ${param.age }</h2>