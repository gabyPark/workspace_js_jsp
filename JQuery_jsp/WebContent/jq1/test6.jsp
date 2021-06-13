<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent / jq1 / test6.jsp</title>

<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 추가 - append(), prepend()
		
		$('body').append("<h2> append 사용 추가 </h2>");
		$('body').append("<h2> prepend 사용 추가 </h2>");
		
		// "내용 0, 1, 2"
		$('div').append(function(index){
			return index;
		});
		
		// 데이터 배열
		var data = [
			{name:"김학생", region:"부산"},
			{name:"박학생", region:"서울"},
			{name:"정학생", region:"대구"},
			];
		
		// 배열의 정보를 테이블에 추가
		// $('tr').append("<tr><td></td><td>2</td></tr>");  ❌ 
		$('table').append("<tr><td>1</td><td>2</td></tr>");
		
		// 대상.each() 구문 : 선택한 여러개의 요소에 순차적으로 접근하는 방법
		// 배열의 값을 순차적으로 접근해서 사용
		$.each(data, function(index, item){
			// alert(index+" // "+item);
			// console.log(index+" // "+item);
			// console.log(item);
			// console.log(item.name, item.region);
			$('table').append("<tr><td>"+item.name+"</td><td>"+item.region+"</td></tr>");
		});
		
		
		// 배열 data의 값을 'div' 태그에 추가
		/* $.each(data, function(index, item){
		$('div').append(function(){
				return item.name;
			});
		}); */
		
		$('div').append(function(index){
			var arr = data[index];
			return arr.name;
		});
	});
</script>

</head>
<body>

	<h1> WebContent / jq1 / test6.jsp</h1>
	
	<div> 내용 </div>
	<div> 내용 </div>
	<div> 내용 </div>

	<hr>
	
	<table border=1>
	  <tr>
	  	<td>이름</td><td>지역</td>
	  </tr>
	</table>
	
</body>
</html>