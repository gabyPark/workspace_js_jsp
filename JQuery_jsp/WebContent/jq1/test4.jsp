<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent / jq1 / test4.jsp</title>

<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 대상.attr(); => 태그의 속성값을 제어하는 함수
		
		// img 태그의 src 속성값을 가져오기 -> 출력(alert)
		var txt = $('img').attr('src');
		alert("경로 : "+txt);
		
		// img 태그에 'border-5' 를 설정
		$('img').attr('border',5);
		
		// 각각의 img 태그에 테두리 (5, 10, 15) 지정
/* 		이렇게도 사용 가능
 
 		var bor = [5, 10, 15];
		
		$('img').attr('border',function(index){
			return bor[index];
		});
*/
		$('img').attr('border',function(index){
			return (index+1)*5;
		});
		
		
		// img 모든 테두리 5, 가로길이(width) 300, 세로길이(height) 100
		$('img').attr({
				'border':5,
				'width':300,
				'height':100});
		
		// 가로길이만 100, 200, 300 형태로 변경
		$('img').attr({
			'border':10,
			'width':function(index){
					return (index+1)*100;
			},
			'height':100
		});				
	});
</script>

</head>
<body>

	<h1> WebContent / jq1 / test4.jsp</h1>
	
	<img src="1.jpg">
	<img src="2.jpg">
	<img src="3.jpg">

</body>
</html>