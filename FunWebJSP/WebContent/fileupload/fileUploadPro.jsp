<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/fileupload/fileUploadPro.jsp</h1>
   
   <%
      // 파일 업로드 -> 정보 저장
      
      // 1. 파일업로드
      
      // 업로드 할 폴더 생성  (WebContent/upload 생성)
	      // D:\workspace_jsp5\.metadata\.plugins
	      //\org.eclipse.wst.server.core\tmp1
	      //\wtpwebapps\FunWebJSP/upload
      // 업로드 폴더로 지정
      
      String uploadPath = request.getRealPath("/upload");
      
      System.out.println("업로드 경로 : "+uploadPath);
      
      // 업로드 파일크기 지정
      int fileSize = 10 * 1024 * 1024; // 10MB
      
      // 파일업로드 -> 파일업로드 객체 생성
      MultipartRequest multi
            = new MultipartRequest(
            		request,
            		uploadPath,
            		fileSize,
            		"UTF-8",
            		new DefaultFileRenamePolicy()
            		);
      
      System.out.println(" 파일 업로드 완료! ");
      
      // 이전페이지에서 전달해준 정보를 출력
      // (사용자,메세지,파일)
      
      //String name = request.getParameter("name"); (x)
      String name = multi.getParameter("name");
      String msg = multi.getParameter("msg");
      //String filename = multi.getParameter("filename");
      // => 업로드시 파일의 정보는 파라미터X
      String filename = multi.getFilesystemName("filename");
      String oFileName = multi.getOriginalFileName("filename");
   %>
   
    <h3>name : <%=name %></h3>
    <h3>msg : <%=msg %></h3>
    <h3>filename : <%=filename %></h3>	
    <h3>oFileName : <%=oFileName %></h3>	
   
   <!-- 업로드 한 파일 정보 확인 -->
   <form action="fileCheck.jsp" method="post">
     <input type="hidden" name="name" value="<%=name%>">
     <input type="hidden" name="msg" value="<%=msg%>">
     <input type="hidden" name="filename" value="<%=filename%>">
     <input type="hidden" name="oFileName" value="<%=oFileName%>">
     <input type="submit" value="확인 페이지 이동">
   </form>
   
   
   

</body>
</html>