package com.itwillbs.el;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ElServlet extends HttpServlet {

	// http://localhost:8088/JSTL_EL_JSP/testel
	
	// alt shift s + v
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   System.out.println("doGet() 호출");
	   doPost(req, resp);
	   
	}

	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
	  System.out.println("doPost() 호출");
	  
	  //request 영역에 데이터 저장
	  req.setAttribute("cnt", 1000);
	  
	  //session 영역에 데이터 저장
	  HttpSession session = req.getSession(); 
	  
	  session.setAttribute("cnt", 2000);
	  
	  /*resp.setContentType("text/html; charset=UTF-8");
	  
	  PrintWriter out = resp.getWriter();
	  out.print("<html>");
	  out.print("<head>");
	  out.print("</head>");
	  out.print("<boby>");
	  out.print(" 서블릿에서 생성된 화면입니다. ");
	  out.print("</body>");
	  out.print("</html>");
	  
	  out.close();*/
	  
	  // 서블릿 화면을 지정 (특정 jsp페이지와 연결)
	  // 포워딩
	  RequestDispatcher dis
	        = req.getRequestDispatcher("/el/elTest.jsp");
	  
	  dis.forward(req, resp); 
	  
	}

	
	
	
}
