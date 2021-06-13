package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;

public class BasketDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : BasketDeleteAction_execute() 호출");

		// 로그인 체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);

			return forward;
		}
		
		// 파라미터 저장
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		// DAO 객체 생성 - 메서드 호출
		BasketDAO bkdao = new BasketDAO();
		bkdao.basketDelete(b_num);

		// 페이지이동 (BasketList.ba)
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);

		return forward;
	}

}
