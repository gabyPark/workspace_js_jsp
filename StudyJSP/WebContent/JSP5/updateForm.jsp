<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/JSP5/updateForm.jsp</h1>
   
   <!-- 이름,주민번호를 입력해서 나이를 수정 -->
   <!-- 폼태그 사용 이름,주민번호,나이 입력
        updatePro.jsp 페이지로 이동 후 DB정보 수정
    -->
   
   <fieldset>
     <form action="updatePro.jsp" method="post">
           이름 : <input type="text" name="name"><br> 
      주민번호 : <input type="text" name="jumin"><br>
      수정할 나이 : <input type="text" name="age"><br>
      <hr>
      <input type="submit" value="수정하기">
     </form>   
   </fieldset>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 

</body>
</html>