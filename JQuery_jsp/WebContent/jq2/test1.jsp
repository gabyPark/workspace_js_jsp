<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebContent/jq2/test1.jsp</title>

<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">

  $(function(){

	// 이벤트 : 클라이언트가 페이지에서 하는 모든 행동
	$('input').click(function(){
		alert("제이쿼리 이벤트 발생");
	});
	
	// bind(이벤트 종류, 함수)
	$('input').bind('click', function(){
		alert("bind 이벤트 발생");
	});
	
	// h2 태그를 클릭할 때 마다 내용 "+" 문자 추가 (클릭한 대상만)
	$('h2').click(function(){
		// $(this).append("+");
		
		$(this).html(function(index,html){
			return html+"+";
		});
	});
	

	// 마우스 올라갔을 때 이미지 변경 (이미지 태그의 속성을 변경) -> 내려갔을 때 원래 이미지 표시
 	$('img').mouseover(function(){
		// alert("마우스 오버");
		$(this).attr("src", "../jq1/3.jpg");
	});
	
	$('img').mouseout(function(){
		// alert("마우스 아웃");
		$(this).attr("src", "../jq1/2.jpg");
	}); 
	
	// 위의 코드에서 대상이 같다면 이렇게도 가능하다  
	// << 체이닝 기법 >> : 하나 이상의 이벤트를 .으로 연결하는 방법
	$('img').mouseover(function(){
		// alert("마우스 오버");
		$(this).attr("src", "../jq1/3.jpg");
	}).mouseout(function(){
		$(this).attr("src", "../jq1/2.jpg");			
	}); 
	
	
	/////////////////////////////////////////////////////////////
	
	$('a').click(function(event){
		$(this).css("background-color", "blue");
		
		// 기본기능 - 하이퍼링크 기능을 막는다(페이지 이동 X)
		// event.preventDefault(); (기능 ⭕)
		// event.stopPropagation(); (기능 ❌)
		return false;  
		// 클릭 이벤트 자체를 false 만들기 때문에 페이지 이동 안함 (기능 ⭕)
	});
	
	$('h2').click(function(){
		$(this).append("+");
		$(this).unbind();
	});
	
  });

</script> 

</head>
<body>

  <h1>WebContent/jq2/test1.jsp</h1>

  <input type="button" value="버튼" onclick="alert('Hello');">
  
  <hr>
  
  <h2>head-0</h2>
  <h2>head-1</h2>
  <h2>head-2</h2>

 <hr>
 <h2> mouseover 이벤트</h2>
 <img src="../jq1/2.jpg">
 
 <hr>
 <h2> 이벤트 동작 제어 </h2>
 
 <a href="https://www.itwillbs.co.kr">아이티윌</a>
 
 
</body>
</html>