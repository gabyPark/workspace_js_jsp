package com.itwillbs.jstl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExServlet extends HttpServlet{

	// http://localhost:8088/JSTL_EL_JSP/test.ex
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet() 메서드 호출!");
		
		// 전화번호 : 010-1234-7899 set2.jsp 페이지에 전달해서 출력
		String tel ="010-1234-7899";
		
		//request 영역에 저장
		request.setAttribute("tel", tel);
		
		// 자바빈 객체를 생성후 정보 저장 -> set2.jsp페이지에 전달, 출력
		// 회원정보저장(번호,이름,나이,전화번호)
		MemberBean mb = new MemberBean();
		mb.setAge(20);
		mb.setName("사용자1");
		mb.setNum(1);
		mb.setTel("010-1234-4567");
		
		request.setAttribute("mb", mb);
		
		// 회원정보를 저장하는 ArrayList 생성해서 정보를 전달
		// 회원정보 - 5개 생성 => set2.jsp 출력
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
		for(int i=1;i<=5;i++){
			MemberBean member = new MemberBean();
			member.setAge(20+i);
			member.setName("사용자"+i);
			member.setNum(i);
			member.setTel("010-1234-456"+i);
			
			memberList.add(member);
		}
		
		request.setAttribute("memberList", memberList);		
		
		
		// 페이지 이동
		RequestDispatcher dis 
		= request.getRequestDispatcher("/core/set2.jsp");
		
		dis.forward(request, response);
		
	}	

}
