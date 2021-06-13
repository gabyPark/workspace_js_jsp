<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JQuery_jsp / WebContent / jq2 / test3.jsp</title>

<style type="text/css">
#ani{
 width:50px;
 height:50px;
 background-color:orange;
}
</style>

<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {

		// hide(), show(), toggle()

		// ⭐ 홈페이지 메뉴 탭 숨겼다 펴졌다 하는 기능
		$('h2').click(function() {
			/*  
			$(this).next().toggle('fast', function(){
				 // 콜백함수 : 적용되는 효과를 100% 실행하고 나서 동작하는 함수
				 alert("효과 끝");				 
			 });
			 */
			$(this).next().fadeToggle('slow');

			// sildeDown(), slideUp(), slideToggle()
			// fadeIn(), fadeOut(), fadeToggle() . . . 등등		
		});

		
		// animate() 효과
		// $(대상).animate(속성, 속도, 콜백함수);
		$('#ani').click(function(){
			var w = $(this).css('width');
			var h = $(this).css('height');
			
			$(this).animate({
				width : parseInt(w)+50,
				height : parseInt(h)+50
			}, 'slow');
		});
		

	}); // jQuery end
</script>


</head>
<body>

	<h1>JQuery_jsp / WebContent / jq2 / test3.jsp</h1>

	<h1>이벤트 효과</h1>
	<h2>열기 / 닫기 1</h2>

	<div>
		<h2>제목 1</h2>
		<p>내용 1</p>
	</div>

	<h2>열기 / 닫기 2</h2>
	<div>
		<h2>제목 2</h2>
		<p>내용 2</p>
	</div>


	<hr>

	<div id="ani"></div>

</body>
</html>