package com.order.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.order.db.OrderBean;
import com.order.db.OrderDAO;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : OrderAddAction_execute() 호출");
		
		// 세션정보
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달받은 정보를 저장하는 OrderBean객체
		// 필요한 정보 저장
		OrderBean ob = new OrderBean();
		ob.setO_m_id(id);
		ob.setO_receive_name(request.getParameter("o_receive_name"));
		ob.setO_receive_addr1(request.getParameter("o_receive_addr1"));
		ob.setO_receive_addr2(request.getParameter("o_receive_addr2"));
		ob.setO_receive_phone(request.getParameter("o_receive_phone"));
		ob.setO_memo(request.getParameter("o_memo"));
		ob.setO_trade_type("온라인입금");
		ob.setO_trade_payer(request.getParameter("o_trade_payer"));

		// 장바구니에 있는 상품정보 
		BasketDAO bkdao = new BasketDAO();
		Vector totalList = bkdao.getBasketList(id);
		ArrayList basketList = (ArrayList) totalList.get(0);
		ArrayList goodsList = (ArrayList) totalList.get(1);
		
		// 결제 모듈 호출 => 결제 완료		
		System.out.println("M : 결제모듈 실행 ");
		System.out.println("M : 결제모듈 실행 완료");
		
		// 주문정보 저장 OrderDAO 객체
		OrderDAO ordao = new OrderDAO();
		// 주문정보 저장 메서드
		ordao.addOrder(ob,basketList,goodsList);
		
		System.out.println("M : 주문정보 저장 완료 ");
		
		
		// 상품정보 수정(판매량 제거)
		
		// 장바구니 정보 삭제		
		
		// 페이지 이동
		
		
		return null;
	}

}
