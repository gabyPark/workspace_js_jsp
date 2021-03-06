package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberBean;
import com.member.db.MemberDAO;

public class MemberUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : MemberUpdate_execute() 호출 ");

		// 로그인 세션 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}

		// DAO객체 생성 - getMember(id)
		MemberDAO mdao = new MemberDAO();
		
		/*MemberBean mb = mdao.getMember(id);

		// request 영역 정보 저장
		request.setAttribute("mb", mb);*/
		request.setAttribute("mb", mdao.getMember(id));

		// 페이지 이동(./member/updateForm.jsp)
		forward.setPath("./member/updateForm.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
