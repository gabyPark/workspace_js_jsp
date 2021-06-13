package myServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestServlet1 extends HttpServlet {

	
	//http://localhost:8088/ServletJSP/test1.will1
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//페이지 요청시 get방식 처리 
		System.out.println("doGET 호출!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//페이지 요청시 post방식 처리 
		System.out.println("doPOST 호출!");
		
		// 정보저장 -> (서블릿-jsp) 
		request.setAttribute("cnt", new Integer(1000));
		//request.setAttribute("cnt", 1000); // 오토박싱 (1.6 이상) -> 업캐스팅
		
		//세션 객체에 정보 저장
		HttpSession session = request.getSession();
		session.setAttribute("cnt", 2000);
		
		
		//페이지 이동 -> forward 이동
		RequestDispatcher dis 
		            = request.getRequestDispatcher("Attribute.jsp");
		                                            //이동할 주소
		// 요청,응답 정보를 가지고 이동
		dis.forward(request, response);
		
	}
	

}
