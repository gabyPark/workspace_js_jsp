package com.goods.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.admin.goods.db.GoodsBean;

public class GoodsDAO {
	// DB - itwill_member 테이블의 모든 처리
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
		
		//getGoodsList(item)
		public List getGoodsList(String item){
			List goodsList = new ArrayList();
			
			StringBuffer SQL = new StringBuffer();
			
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3.sql 작성  & pstmt 객체
				
				SQL.append("select * from itwill_goods");
				
				if(item.equals("all")){
				}else if(item.equals("best")){
					SQL.append(" where best=?");					
				}else{ // category
					SQL.append(" where category=?");
				}
				
				pstmt = con.prepareStatement(SQL.toString());
				
				if(item.equals("all")){}
				else if(item.equals("best")){
					pstmt.setInt(1, 1); // 인기상품 : 1, 일반상품 :0
				}else{
					pstmt.setString(1, item); // item변수에 각 카테고리 저장
				}
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리 
				while(rs.next()){
					// 상품정보 저장(GoodsBean)
					GoodsBean gb = new GoodsBean();
					
					gb.setAmount(rs.getInt("amount"));
					gb.setBest(rs.getInt("best"));
					gb.setCategory(rs.getString("category"));
					gb.setColor(rs.getString("color"));
					gb.setContent(rs.getString("content"));
					gb.setDate(rs.getString("date"));
					gb.setImage(rs.getString("image"));
					gb.setName(rs.getString("name"));
					gb.setNum(rs.getInt("num"));
					gb.setPrice(rs.getInt("price"));
					gb.setSize(rs.getString("size"));
					
					// 리스트 한칸에 저장
					goodsList.add(gb);
				}
				
				System.out.println("DAO : 사용자 상품정보 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return goodsList;			
		}
		//getGoodsList(item)
		
		// getGoods(num)
		public GoodsBean getGoods(int num){
			GoodsBean gb = null;
			
			try {
				//1.2. 디비연결
				con = getCon();
				// 3. sql 구문 & pstmt 객체 생성
				sql = "select * from itwill_goods where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				if(rs.next()){
					gb = new GoodsBean();
					
					gb.setAmount(rs.getInt("amount"));
					gb.setBest(rs.getInt("best"));
					gb.setCategory(rs.getString("category"));
					gb.setColor(rs.getString("color"));
					gb.setContent(rs.getString("content"));
					gb.setDate(rs.getString("date"));
					gb.setImage(rs.getString("image"));
					gb.setName(rs.getString("name"));
					gb.setNum(rs.getInt("num"));
					gb.setPrice(rs.getInt("price"));
					gb.setSize(rs.getString("size"));
					
				}
				
				System.out.println("DAO : 상품정보 저장완료! ");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return gb;
		}
		// getGoods(num)

	// updateAmount(basketList)

	public void updateAmount(List basketList){
		
		try {
			con = getCon();
			
			// sql -> 장바구니에 있는 정보 중에서 각 상품의 개수만큼 감소
			// => 반복 (장바구니 물품 개수만큼)
			
			for(int i=0; i<basketList.size(); i++){
				BasketBean bk = (BasketBean) basketList.get(i);
				
				sql = "update f_goods set f_bas_amount=f_bas_amount-? "
						+ "where f_bas_num=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, bk.getF_bas_amount());
				pstmt.setInt(2, bk.getF_bas_gs_num());
			
				pstmt.executeUpdate();
			
			}
			
			System.out.println("DAO : 구매 후 판매수량 수정 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	// updateAmount(basketList)  - 구매 후 작동 
		
		
		
		
		
}
