<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*  h2{ */
/*    background: orange; */
/*  } */

  .high_0{background: red;}
  .high_1{background: orange;}
  .high_2{background: yellow;}
  .high_3{background: green;}
  .high_4{background: blue;}  

</style>


<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  // 'h2'태그의 배경색을 모두 다른색으로 지정
	  // $('h2').css('background',"red");
	  
/* 		var col = ["red","orange","yellow","green","blue"];
	  
	  $('h2').css('background',function(index){
		  return col[index];
	  });  	 
 */
	 
 		// 각각의 요소에 클래스명을 생성
		// 대상.addClass(클래스명);
 		// 각각 요소마다 다르게 적용해야 하는 경우 -> 대상을 this 로 사용
 		
 		// this : 클라이언트가 페이지에 방문해서 이벤트를 발생할때마다,
 		// 		  해당 동작의 정보를 this 레퍼런스가 가지고 있음.
	  
 		// ⭐⭐⭐ 실제 업무에 가장 많이 쓰임
	  $('h2').each(function(index){
		  //alert(index);
		  $(this).addClass("high_"+index);
	  });
	  
  });
  
</script>

</head>
<body>
  <h1>WebContent/jq1/test8.jsp</h1>
  
 <!--  <h2 class="high_0">head-0</h2>
  <h2 class="high_1">head-1</h2>
  <h2 class="high_2">head-2</h2>
  <h2 class="high_3">head-3</h2>
  <h2 class="high_4">head-4</h2> -->
  
  <h2>head-0</h2> 
  <h2>head-1</h2>
  <h2>head-2</h2>
  <h2>head-3</h2>
  <h2>head-4</h2>
  
  
  
</body>
</html>