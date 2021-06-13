<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JQuery_jsp / WebContent / jq2 / test4.jsp</title>

<script src="../js/jquery-3.5.1.js"></script>
<script src="../js/jquery.innerfade.js"></script>

<style type="text/css">
 ul{
 list-style: none;
 }
</style>

<script type="text/javascript">
	$(document).ready(function(){	
		
		$('#news').innerfade({
			animationtype: 'slide',
			speed: 300,
			timeout: 2000,
			type: 'random',
			containerheight:'350px'
		});
		

	}); // jQuery end
</script>

</head>
<body>

	<h1>JQuery_jsp / WebContent / jq2 / test4.jsp</h1>
	
	<ul id="news">
		<li><img src="../jq1/1.jpg"></li>
		<li><img src="../jq1/2.jpg"></li>
		<li><img src="../jq1/3.jpg"></li>
	</ul>

</body>
</html>