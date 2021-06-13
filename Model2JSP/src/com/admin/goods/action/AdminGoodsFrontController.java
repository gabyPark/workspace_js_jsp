package com.admin.goods.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminGoodsFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	   // 웹페이지를 get / post 방식으로 호출시 실행되는 메서드
		System.out.println("doProcess() 호출");
		
		System.out.println("\n\n 1. 가상주소 계산");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : "+command);
		
		System.out.println("\n 1. 가상주소 계산");
		
		System.out.println("\n 2. 가상주소 매핑");
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/GoodsAdd.ag")){
			System.out.println("C : /GoodsAdd.ag 호출");
			System.out.println("C : view페이지로 이동");
			
			forward = new ActionForward();
			forward.setPath("./admingoods/admin_goods_write.jsp");
			forward.setRedirect(false);			
		}else if(command.equals("/GoodsAddAction.ag")){
			System.out.println("C : /GoodsAddAction.ag 호출");
			System.out.println("C : DB에 정보를 저장 후 페이지 이동");
			
			// GoodsAddAction 객체 생성
			action = new GoodsAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		else if(command.equals("/GoodsList.ag")){
			System.out.println("C : /GoodsList.ag  호출");
			System.out.println("C : DB에서 정보를 가져와서 view에서 출력");
			
			// GoodsListAction 객체 생성
			action = new GoodsListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GoodsModify.ag")){
			System.out.println("C : /GoodsModify.ag 호출 ");
			System.out.println("C : DB정보를 가져와서 수정 -> 저장");
			
			// GoodsModifyAction 객체 생성
			action = new GoodsModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GoodsModifyProAction.ag")){
			System.out.println("C : /GoodsModifyProAction.ag 호출");
			System.out.println("C : 전달정보를 받아서 DB에 저장");
			
			// GoodsModifyProAction 객체 생성
			action = new GoodsModifyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/GoodsDelete.ag")){
			System.out.println("C : /GoodsDelete.ag 호출 ");
			System.out.println("C : DB이동후 정보 삭제 ");
			// GoodsDeleteAction
			
			action = new GoodsDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		System.out.println("\n 2. 가상주소 매핑");
		
		System.out.println("\n 3. 페이지 이동");
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}
			else{
				RequestDispatcher dis = 
						request.getRequestDispatcher(forward.getPath());
				
				dis.forward(request, response);
			}
		}
		
		
		System.out.println("\n 3. 페이지 이동");
		
		
		
		
		
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	    // 웹페이지를 get방식으로 호출시 실행되는 메서드
		System.out.println("doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	   // 웹페이지를 post 방식으로 호출시 실행되는 메서드
		System.out.println("doPost() 호출");
		doProcess(request, response);		
	}
	
	

}
