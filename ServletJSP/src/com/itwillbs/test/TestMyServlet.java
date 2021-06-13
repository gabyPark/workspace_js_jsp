package com.itwillbs.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestMyServlet extends HttpServlet{

	// 서블릿 사용
	
	// alt shift s + v

	@Override
	public void init() throws ServletException {
		System.out.println("서블릿 초기화!");		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       System.out.println("doGet() 호출!");	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("doPost() 호출! ");
	}

	@Override
	public void destroy() {
		System.out.println("서블릿 종료!");
	}

 
	
	
}
