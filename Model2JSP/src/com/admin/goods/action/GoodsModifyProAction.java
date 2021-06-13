package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;
import com.admin.goods.db.GoodsBean;

public class GoodsModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : GoodsModifyProAction_execute() 호출");
		// 한글처리
		
		request.setCharacterEncoding("utf-8");
		
		// 파라미터값 저장
		// -> GoodsBean 객체에 저장
		GoodsBean gb = new GoodsBean();
		
		gb.setAmount(Integer.parseInt(request.getParameter("amount")));
		gb.setBest(Integer.parseInt(request.getParameter("best")));
		gb.setCategory(request.getParameter("category"));
		gb.setColor(request.getParameter("color"));
		gb.setContent(request.getParameter("content"));
		gb.setName(request.getParameter("name"));
		gb.setNum(Integer.parseInt(request.getParameter("num")));
		gb.setPrice(Integer.parseInt(request.getParameter("price")));
		gb.setSize(request.getParameter("size"));
		
		// DAO 객체생성 - modifyGoods(상품정보)
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.modifyGoods(gb);
		
		// 페이지이동 (GoodsList)
		ActionForward forward = new ActionForward();
		forward.setPath("./GoodsList.ag");
		forward.setRedirect(true);
		
		return forward;
	}

}
