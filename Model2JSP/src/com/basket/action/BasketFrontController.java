package com.basket.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 웹서버한태 *.ba로 끝나는 주소를 처리하는 컨트롤러 라고 지정(서블릿3.0이상/tomcat8)
@WebServlet("*.ba")
public class BasketFrontController extends HttpServlet{

	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BasketFrontController-doProcess()");
		
		System.out.println("\n\n 1. 가상주소 계산");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);

		System.out.println("\n 1. 가상주소 계산");

		System.out.println("\n 2. 가상주소 매핑");

		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/BasketAdd.ba")){
			System.out.println("C : /BasketAdd.ba 호출 ");
			System.out.println("C : 전달받은정보를 저장(DB) 리스트로 이동");
			
			// BasketAddAction 객체 생성
			action = new BasketAddAction();
			
			try {
				forward = action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BasketList.ba")){
			System.out.println("C : /BasketList.ba 호출 ");
			System.out.println("C : DB에서 정보를 가져와서 view 출력");
			
			// BasketListAction 객체 
			action = new BasketListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BasketDelete.ba")){
			System.out.println("C : /BasketDelete.ba 호출");
			System.out.println("C : 정보(장바구니번호) 사용해서 DB에 정보 삭제");

			// BasketDeleteAction
		   action = new BasketDeleteAction();	
		   
		    try {
			   forward =action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		

		System.out.println("\n 2. 가상주소 매핑");

		System.out.println("\n 3. 페이지 이동");

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());

				dis.forward(request, response);
			}
		}

		System.out.println("\n 3. 페이지 이동");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("BasketFrontController-doGet()");
	    doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BasketFrontController-doPost()");
		doProcess(request, response);
		
	}
	
	
	
	

	
	
}
