package com.admin.goods.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminGoodsDAO {
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
	
	
	// insertGoods(goods)
	public void insertGoods(GoodsBean goods){
		int num = 0;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3.sql생성 & pstmt객체
			// 상품번호 계산 (select)
			sql = "select max(num) from itwill_goods";
			pstmt = con.prepareStatement(sql);
			
			// 4.sql 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
			System.out.println("DAO : 상품번호 생성 - "+num);
			
			// 상품등록 (insert)
			sql ="insert into itwill_goods(num,category,name,content,size,color,"
					+ "amount,price,image,best,date) values(?,?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, goods.getCategory());
			pstmt.setString(3, goods.getName());
			pstmt.setString(4, goods.getContent());
			pstmt.setString(5, goods.getSize());
			pstmt.setString(6, goods.getColor());
			pstmt.setInt(7, goods.getAmount());
			pstmt.setInt(8, goods.getPrice());
			pstmt.setString(9, goods.getImage());
			pstmt.setInt(10, goods.getBest());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 상품등록완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// insertGoods(goods)
	
	
	// getGoodsList()
	public List<GoodsBean> getGoodsList(){
		List<GoodsBean> goodsList = new ArrayList<GoodsBean>();
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 작성 & pstmt생성 (select)
			sql="select * from itwill_goods";
			pstmt = con.prepareStatement(sql);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 
			while(rs.next()){
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
				
				goodsList.add(gb);
				
			}// while
			
			System.out.println("DAO : 관리자 상품목록 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return goodsList;
	}
	// getGoodsList()
	
	// getGoods(num)
	public GoodsBean getGoods(int num){
		GoodsBean gb = null;
		
		try {
			// 1.2.디비연결
			con = getCon();
			// 3. sql 생성 & pstmt 객체 
			sql = "select * from itwill_goods where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			// 4. sql 실행 
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리
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
	
	// modifyGoods(gb)
	public void modifyGoods(GoodsBean gb){
		
		try {
			//1.2. 디비연결
			con = getCon();
			// 3. sql (update) & pstmt 객체 생성
			sql = "update itwill_goods set "
					+ "category=?,name=?,price=?,color=?,amount=?,"
					+ "size=?,content=?,best=? "
					+ "where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, gb.getCategory());
			pstmt.setString(2, gb.getName());
			pstmt.setInt(3, gb.getPrice());
			pstmt.setString(4, gb.getColor());
			pstmt.setInt(5, gb.getAmount());
			pstmt.setString(6, gb.getSize());
			pstmt.setString(7,gb.getContent());
			pstmt.setInt(8, gb.getBest());
			pstmt.setInt(9, gb.getNum());
			
			// 4. sql구문 실행
			pstmt.executeUpdate();

			System.out.println("DAO : 관리자 상품정보 수정완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// modifyGoods(gb)
	
	
	//deleteGoods(num)
	public void deleteGoods(int num){
		
		try {
			//1.2 디비연결
			con = getCon();
			//3 .sql 작성 & pstmt 생성
			sql="delete from itwill_goods where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			// 4. sql 실행
			pstmt.executeUpdate();
			System.out.println("DAO : 관리자 상품 삭제 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//deleteGoods(num)
	
	
	
	
	
	
	
	

}
