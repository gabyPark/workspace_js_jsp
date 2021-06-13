package com.itwillbs.el;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 애노테이션 - @뒤에 특수한 단어를 사용해서 특정 기능을 부여
// @WebServlet("주소") : 특정 주소에 서블릿을 매핑
//                      (JSP/서블릿 2.3/3.1~ 이후) 

@WebServlet("/eltest2")
public class ElServlet2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()  호출");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("doPost() 호출");
	    
	    // ITWILL 객체 - 강의실번호(1~7),...
	    // '5강의장' 정보 저장후 전달
	    
	    ITWILL itwill = new ITWILL();
	    itwill.classNum = "5강의장";
	    
	    //itwill.student.setName("홍길동");
	    //itwill.student.setTel("010-1234-1234");
	    
	    Student kim = new Student();
	    kim.setName("김학생");
	    kim.setTel("010-1231-1231");
	    
	    itwill.setStudent(kim);
	    
	    
	    // request영역에 저장
	    request.setAttribute("itwill", itwill);
	    
	    // /el/elTest2.jsp 페이지에 출력
	    RequestDispatcher dis =
	    		request.getRequestDispatcher("/el/elTest2.jsp");
	    
	    dis.forward(request, response);
	    
	    
	    
	    
	}

}
