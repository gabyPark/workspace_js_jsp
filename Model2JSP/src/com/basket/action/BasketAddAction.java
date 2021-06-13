package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketBean;
import com.basket.db.BasketDAO;

public class BasketAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : BasketAddAction_execute() 호출");
		
		// 로그인 여부 체크
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// BasketBean 생성후 저장
		BasketBean basket = new BasketBean();
		
		basket.setB_g_num(Integer.parseInt(request.getParameter("num")));
		basket.setB_g_amount(Integer.parseInt(request.getParameter("amount")));
		basket.setB_g_size(request.getParameter("size"));
		basket.setB_g_color(request.getParameter("color"));
		
		basket.setB_m_id(id);
		
		System.out.println("M : 장바구니 정보 "+basket);
		
		// BasketDAO 객체 
		BasketDAO bkdao = new BasketDAO();
		
		// 장바구니 상품 중복체크 + 동일상품이 있을경우 수량증가 
		int check = bkdao.checkGoods(basket);
		
		if(check != 1){
			// 중복상품이 없음
			// 장바구니에 저장
			bkdao.basketAdd(basket);
		}
		System.out.println("M : 장바구니 저장완료!");
		
		
		// 페이지 이동
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);

		return forward;
	}

}
