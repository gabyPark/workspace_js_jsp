<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/TestForm2.jsp</h1>
	
	<h2> 사용자의 이름, 나이를 입력하시오. </h2>
	<!-- 
	   이름, 나이정보를 입력받아서 TestPro2.jsp 페이지로 전달
	   전달방식 : get
	   
	  * TestPro2.jsp 페이지에서는 출력 
	 -->
	 
	 <script type="text/javascript">
	    //alert(document.forms[0].myname.value);
	    //alert(document.fr.myname.value);
	    //console.log(document.fr.myname);
	    // -> Jquery 사용해서 유효성 체크
	    
	 </script>
	 
	 
	 <fieldset>
	   <form action="TestPro2.jsp" method="post" name="fr">
	   <!-- input 태그의 name 속성은 전달하는 정보(파라미터)이름 -->
	        이름 : <input type="text" name="myname"><br>
	        나이 : <input type="text" name="myage"><br>
	     <input type="submit" value="정보 전달">    
	   </form>	   
	 </fieldset>
	 
	 
	 
	





</body>
</html>