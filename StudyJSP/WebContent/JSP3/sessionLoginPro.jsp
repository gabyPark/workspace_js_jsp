<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>WebContent/JSP3/sessionLoginPro.jsp</h1>
     
     <%
        // 한글 처리(인코딩)
        request.setCharacterEncoding("UTF-8");
     
        // 입력받은 정보를 받아서 출력        
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        
        // 사용자정보
        String userID="admin";
        String userPW="1234";
        
        //=> Pro 페이지에서 로그인 체크

        /*
               아이디  - O => 비밀번호  - O : "본인 로그인 성공" 
                             => 로그인 성공한 사용자의 ID를 세션값으로 저장
                             => sessionMain.jsp페이지이동
                            - X : 화면 출력 " 비밀번호 오류! "       
              - X => 화면출력 "회원 정보가 없음!"
        */
     
     %>
     <h2> 입력된 정보 확인 </h2>
          아이디 : <%=id %><br>
          비밀번호 :  <%=pass %><br>
     
     <%
      //  ==   , equals()
      // 1.  == 비교  : 기본형 타입의 값 비교, 참조형 타입의 값(객체 주소) 비교
      // 2. equals() : 모든 타입에서 사용가능하나 별도의 구현이 필요함.
      //               String 타입은 이미 구현되어 있음.
      //               String 타입의 값이 같은지 비교(T/F)
      
      // String s1 = "Hello";  => 문자열 상수
      // String s2 = new String("Hello"); => 문자열 객체
       
//       System.out.println("id : "+id);
//       System.out.println("userID : "+userID);
//       System.out.println("id : "+id.toString());
//       System.out.println("userID : "+userID.toString());
//       System.out.println("id : "+id.hashCode());
//       System.out.println("userID : "+userID.hashCode());
      
      
      
       
      if(id.equals(userID)){
    	  // 아이디가 같다
    	  if(pass.equals(userPW)){
    		  // (아이디도 같으면서) 비밀번호도 같음
    		  // 세션값 생성
    		  session.setAttribute("LoginID", id);
    		  // 페이지 이동
    		  response.sendRedirect("sessionMain.jsp");
    	  }else{
    		  // (아이디도 같으면서) 비밀번호는 다름
    		  out.print("비밀번호 오류! <br>");
    	  }
      }else{
    	  // 아이디가 다르다
    	  out.print("회원 정보가 없음! <br>");
      }     
     
     %>
     
     
     
     
     
     
     
     
     
     
     

</body>
</html>