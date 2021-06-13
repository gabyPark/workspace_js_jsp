<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     

	<h1>WebContent/JSP1/TestForm3.jsp</h1>
	<!-- 
	   입력받은 정보를  TestPro3.jsp 전달 후 출력
	   전달방식 : get	   
	   
	   이름, 나이, 성별(radio), 취미(checkbox)3개, 강의장(select)1~7강
	 -->
	 
	 <fieldset>
	   <legend> 회원정보 입력 </legend>
	   <form action="TestPro3.jsp" method="post">
	         이름 : <input type="text" name="name"><br>
	         나이 : <input type="text" name="age"><br>
	         성별 : <input type="radio" name="gender" value="남"> 남성
	          <input type="radio" name="gender" value="여"> 여성<br>
	          
	         취미 : <input type="checkbox" name="hobby" value="게임">게임 
	         <input type="checkbox" name="hobby" value="영화" >영화
	         <input type="checkbox" name="hobby" value="운동">운동<br>
	         
	         강의장 : <select name="classNum">
	               <option value="1">1강의장</option>
	               <option value="2">2강의장</option>
	               <option value="3">3강의장</option>
	               <option value="4">4강의장</option>
	               <option value="5">5강의장</option>
	               <option value="6">6강의장</option>
	               <option value="7">7강의장</option>
	            </select>
	     <hr>
	     <input type="submit" value="전송">	   
	   </form>	 
	 </fieldset>








</body>
</html>