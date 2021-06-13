package myServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

public class TestServlet2 extends HttpServlet {

	// http://localhost:8088/ServletJSP/test.t
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("doGET() 호출!!! ");
		
		// 배열정보 저장 -> 전달
		// 고정길이 배열
		String[] sport = {"축구","야구","농구"};
		
		// request 영역에 저장
		request.setAttribute("sport", sport);
		
		// 컬렉션 정보를 저장 -> 전달
		// 가변길이 배열
		ArrayList movieList = new ArrayList();
		movieList.add("아이언맨");
		movieList.add("어밴저스");
		movieList.add("헐크");
		movieList.add("토르");
		
		// 정보를 저장
		request.setAttribute("movieList", movieList);
		//session.setAttribute("id",id);
		
		
		
		// 화면을 특정 jsp 페이지로 설정
		// ./WebCotent/array.jsp
		RequestDispatcher dis =
				request.getRequestDispatcher("array.jsp");
		
		dis.forward(request, response);
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	

}
