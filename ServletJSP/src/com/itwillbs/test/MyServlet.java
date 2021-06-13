package com.itwillbs.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{
	
	// 페이지 호출 카운트 변수
	private int cnt = 0;
	
	// alt shift s + v (오버라이딩)

	@Override
	public void init() throws ServletException {
	    System.out.println(" 서블릿 최소 생성시 실행! ");
	}
	
	// http://localhost:8088/ServletJSP/test.wi
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" get 방식 호출 발생시 실행! ");
		cnt++;
		System.out.println("방문자수 : "+cnt+"명");
		
		// 응답하는 내용의 타입을 설정(html)
		response.setContentType("text/html; charset=utf-8");
		
		// 화면으로 응답(출력-> 출력스트림 사용)
		// 클라이언트 화면으로 통신(전달) 가능한 통로 생성
		PrintWriter out = response.getWriter();
		
		//out.write("테스트");
		//out.print(b);
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1> 안녕하세요 . </h1>");
		
		out.print("<script>");
		out.print(" alert('Hello~"+cnt+"');");
		out.print("</script>");
		
		out.print("</body>");
		out.print("</html>");	
		

		// 연결 통로 해제 
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(" post 방식 호출 발생시 실행! ");
		
		
	}

	@Override
	public void destroy() {
		System.out.println("서블릿 소멸시 실행! ");
	}


}
