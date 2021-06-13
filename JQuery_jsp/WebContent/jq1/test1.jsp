<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- JQuery 라이브러리 추가 -->
<!-- 제이쿼리 사용할 때 마다 항상 추가 (파일당 한번씩) -->
<script src="../js/jquery-3.5.1.js"></script>

<!-- CDN 사용 추가 -->
<!-- 
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 -->

<!-- JQuery 사용 -->
<script type="text/javascript">

	alert("안녕하세요 자바스크립트");
	
	$(document).ready(function(){
		// 제이쿼리 사용준비 완료
		alert("안녕하세요 제이쿼리");
		
	});
	
	$(function(){
		alert("안녕 제이쿼리 2");
	});
	
	jQuery(document).ready(function(){
		alert("안녕 제이쿼리3");
	});
	
	jQuery(function(){
		alert("안녕 제이쿼리4");		
	});

</script>

</head>
<body>

<h1>WebContent / jq1 / test1.jsp </h1>
   
  

</body>
</html>