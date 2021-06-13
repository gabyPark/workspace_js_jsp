<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>WebContent/el/paramTest.jsp</h1>
  
  <fieldset>
    <form action="paramTestPro.jsp" method="post">
            이름 : <input type="text" name="name"><br>
            전화번호 : <input type="text" name="tel"> <br>
      좋아하는 음식 (2가지-input) : <br>	
     		 <input type="text" name="food">,
      		 <input type="text" name="food"> <br>
      취미(3가지-체크박스) : 
      		<input type="checkbox" name="hobby" value="게임">게임     
      		<input type="checkbox" name="hobby" value="운동">운동     
      		<input type="checkbox" name="hobby" value="영화">영화     
      
      <hr><hr>
       <input type="submit" value="데이터 전달">
    </form>
  </fieldset>
  
  
  
  
  
  
  
  

</body>
</html>