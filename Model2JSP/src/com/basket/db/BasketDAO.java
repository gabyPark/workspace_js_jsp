package com.basket.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.admin.goods.db.GoodsBean;

public class BasketDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비연결 - 커넥션풀
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/model2DB");
		con = ds.getConnection();

		System.out.println("DAO : 디비 연결 성공! -> " + con);

		return con;
	}

	// 자원해제
	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// checkGoods(basket)
	public int checkGoods(BasketBean basket){
		int check = -1;
		
		try {
			// 1.2. 디비 연결
			con = getCon();
			// 3. sql & pstmt 객체 생성

			sql="select * from itwill_basket "
					+ "where b_m_id=? and b_g_num=? and "
					+ "b_g_size=? and b_g_color=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, basket.getB_m_id());
			pstmt.setInt(2, basket.getB_g_num());
			pstmt.setString(3, basket.getB_g_size());
			pstmt.setString(4, basket.getB_g_color());	
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
				// 장바구니에 동일한 옵션의 상품이 존재 => 수량만 증가 (update)
				check = 1;
				
				// 3.sql & pstmt 객체 생성
				sql = "update itwill_basket set b_g_amount=b_g_amount+? "
						+ "where b_m_id=? and b_g_num=? and b_g_size=? "
						+ "and b_g_color=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, basket.getB_g_amount());
				pstmt.setString(2, basket.getB_m_id());
				pstmt.setInt(3, basket.getB_g_num());
				pstmt.setString(4, basket.getB_g_size());
				pstmt.setString(5, basket.getB_g_color());
				
				// 4.sql 실행
				pstmt.executeUpdate();
				
				System.out.println("DAO : 동일상품 수량 수정완료! ");
				
			}
			
			System.out.println("DAO : 장바구니 중복 체크 완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	// checkGoods(basket)
	
	// basketAdd(basket)
	public void basketAdd(BasketBean basket){
		int b_num=0;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql & pstmt
			sql="select max(b_num) from itwill_basket";
			pstmt = con.prepareStatement(sql);
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			
			//5.데이터 처리
			if(rs.next()){
				//rs.getInt("max(b_num)")+1;
				b_num = rs.getInt(1)+1;						
			}
			
			System.out.println("DAO : 장바구니 번호 "+b_num);
			
			//3. insert
			sql = "insert into itwill_basket values(?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.setString(2, basket.getB_m_id());
			pstmt.setInt(3, basket.getB_g_num());
			pstmt.setInt(4, basket.getB_g_amount());
			pstmt.setString(5, basket.getB_g_size());
			pstmt.setString(6, basket.getB_g_color());
			
			//4. 
			pstmt.executeUpdate();
			
			System.out.println("DAO : 장바구니 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// basketAdd(basket)
	
	//getBasketList(id)
	public Vector getBasketList(String id){
		// 상품정보 + 장바구니정보 저장
		Vector totalList = new Vector();
		
		// 장바구니정보 저장(상품번호, 구매수량, 옵션....)
		List basketList = new ArrayList();
		// 상품정보 저장(상품이미지, 가격, 이름....)
		List goodsList = new ArrayList();
		
		try {
			// 1.2. 디비 연결
			con = getCon();
			// 3. sql & pstmt 객체 생성
			sql = "select * from itwill_basket where b_m_id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 
			while(rs.next()){
				// 장바구니가 있다.
				// 장바구니 정보를 저장(bean -> List)
				BasketBean bb = new BasketBean();
				
				bb.setB_date(rs.getDate("b_date"));
				bb.setB_g_amount(rs.getInt("b_g_amount"));
				bb.setB_g_color(rs.getString("b_g_color"));
				bb.setB_g_num(rs.getInt("b_g_num"));
				bb.setB_g_size(rs.getString("b_g_size"));
				bb.setB_m_id(rs.getString("b_m_id"));
				bb.setB_num(rs.getInt("b_num"));
				
				basketList.add(bb);
				
				// 장바구니에 저장된 상품의 정보를 DB에서 가져오기
				//3.
				sql ="select * from itwill_goods where num=?";
				PreparedStatement pstmt2
				   = con.prepareStatement(sql);
				
				pstmt2.setInt(1, bb.getB_g_num());
				
				//4. 
				ResultSet rs2 = pstmt2.executeQuery();
				
				//5. 
				if(rs2.next()){
					// 상품번호에 해당하는 정보가 있을때  정보저장(bean->List)
					GoodsBean gb = new GoodsBean();
					
					gb.setName(rs2.getString("name"));
					gb.setPrice(rs2.getInt("price"));
					gb.setImage(rs2.getString("image"));
					// .... 그외 나머지 정보 
					
					goodsList.add(gb);
					
				} // if끝
				
				
			}// while(장바구니)
			
		System.out.println("DAO : 장바구니 + 상품정보 저장완료(List)");
		
		totalList.add(basketList);
		totalList.add(goodsList);

		System.out.println("DAO : 백터0-장바구니리스트, 백터1-상품리스트");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return totalList;
	}
	//getBasketList(id)
	
	
	// basketDelete(b_num)
	public void basketDelete(int b_num){
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt 생성
			sql = "delete from itwill_basket where b_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b_num);
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 장바구니 삭제 완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}	
	// basketDelete(b_num)
	
	
	
	
}
