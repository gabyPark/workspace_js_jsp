package com.admin.goods.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;
import com.admin.goods.db.GoodsBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GoodsAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : GoodsAddAction_execute() 호출");
		
		// 파일 업로드
		// upload 가상폴더 생성
		
		// 파일이 저장되는 위치
		ServletContext ctx = request.getServletContext();
		String realpath = ctx.getRealPath("/upload");
		
		System.out.println("M : realpath -"+realpath);
		
		// 파일의 용량
		int maxSize = 10 * 1024 * 1024; //10MB
		
		MultipartRequest multi =
				new MultipartRequest(
						request,
						realpath,
						maxSize,
						"UTF-8",
						new DefaultFileRenamePolicy()
						);
		
		System.out.println("M : 파일업로드 완료!");
		
		// 파라미터 저장
		GoodsBean goods = new GoodsBean();
		
		goods.setAmount(Integer.parseInt(multi.getParameter("amount")));
		goods.setBest(0); // 기본값 0 / 인기상품 1
		goods.setCategory(multi.getParameter("category"));
		goods.setColor(multi.getParameter("color"));
		goods.setContent(multi.getParameter("content"));
		//goods.setDate(date);
		String img=multi.getFilesystemName("file1")+","
		          + multi.getFilesystemName("file2")+","
		          + multi.getFilesystemName("file3")+","
		          + multi.getFilesystemName("file4");
		System.out.println("M : img "+ img);
		
		goods.setImage(img);
		goods.setName(multi.getParameter("name"));
		//goods.setNum(Integer.parseInt(multi.getParameter("num")));
		goods.setPrice(Integer.parseInt(multi.getParameter("price")));
		goods.setSize(multi.getParameter("size"));
		
		System.out.println("M : 전달된 파라미터값 저장완료");
		
		// DAO객체 생성후 메서드 호출
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		
		agdao.insertGoods(goods);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./GoodsList.ag");
		forward.setRedirect(true);
		return forward;
	}

}
