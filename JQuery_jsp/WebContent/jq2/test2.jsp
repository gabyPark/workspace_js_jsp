<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JQuery_jsp / WebContent / jq2 / test2.jsp</title>

<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
  
  
  $(document).ready(function(){
  
	  // 보통 키보드 관련은 keyup 을 많이 사용한다.
	  $('textarea').keyup(function(){
		  // alert("키보드 입력");
		  var v = $(this).val().length;
		  var size = 200;
		  
		  $('h3').html(size - v);
		  
		  // 200자가 넘어갈 시 글자색을 빨강으로 변경
		  if((size - v) >= 0) {
			  $('h3').css('color', 'black');		  	  
		  } else {			  
			  $('h3').css('color', 'red');
		  }
		 
	  });  // keyup
  
	  
	  // 제이쿼리로 id, pw 정보를 다른 페이지로넘겨주는 방법
	  // (1) 🔻 태그 안에 타입까지 넣는 방법
/* 	  $("input[type=submit]").click(function(){
		  alert("ㅇㅋ");
	  }); 
*/
	  
	  // (2) 폼태그 안에 id를 부여해준다 my_form, my_name, my_pass ...
	  // 태그 안의 id, class 들은 css 로의 역할만을 구성한다
	  // submit 이벤트 발생시
	  $("#my_form").submit(function(){
		  //이름,비밀번호정보를 출력
		  var name = $("#my_name").val();
		  var pass = $("#my_pass").val();
		  
		  // alert("이름 : "+name+"/ 비밀번호 : "+pass);		  
		  
		  // 이름, 비밀번호 두개의 값이 없을때는 전송 X - focus()
  		  if(name == ""){
		   alert("이름을 입력하세요!");		  			  
			  $("#my_name").focus();
			  return false;
		  }  

		  if(pass == ""){
		   alert("비밀번호를 입력하세요!");		  			  
			  $("#my_pass").focus();
			  return false;
		  }  
	  });
	  
  });  // jQuery end
  
  </script>


</head>
<body>

  <h1>JQuery_jsp / WebContent / jq2 / test2.jsp</h1>
  
  <h2>글자수 200자 카운트</h2>
  <h3>200</h3>
  
  <div>
  	<textarea rows="5" cols="70"></textarea>
  </div>
  
  <form action="a.jsp" method="get" id="my_form">
	  이름 : <input type="text" name="name" id="my_name"><br>
 	 비밀번호 : <input type="password" name="pass" id="my_pass">
  
 	 <input type="submit" value="전달하기">
  </form>

</body>
</html>