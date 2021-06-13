package com.order.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.admin.goods.db.GoodsBean;
import com.basket.db.BasketBean;

public class OrderDAO {

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
	
	// addOrder(ob,basketList,goodsList)
	public void addOrder(OrderBean ob,ArrayList basketList,ArrayList goodsList){
		int o_num = 0; //주문번호(일련번호)
		int trade_num = 0; //주문번호 (사용자 확인)
		
		// 주문번호 생성
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		try {
			//1.2. 디비연결
			con = getCon();
			
			//3. sql( o_num 일련번호 계산 )
			sql = "select max(o_num) from itwill_order";
			pstmt = con.prepareStatement(sql);
			
			//4. sql실행
			rs = pstmt.executeQuery();
			
			//5. 데이터처리
			if(rs.next()){
				o_num = rs.getInt(1)+1;
			}
			
			trade_num = o_num;
			
			System.out.println("DAO : 일련번호(o_num) "+o_num+", 주문번호 (trade_num): "+trade_num);
			
			// 상품정보를 저장(order 테이블)
			
			
			for(int i=0;i<basketList.size();i++){
				BasketBean bk =(BasketBean) basketList.get(i);
				GoodsBean gb = (GoodsBean) goodsList.get(i);				
				
				// 3. sql 작성 & pstmt 객체 (insert)
				sql="insert into itwill_order "
						+ "values("
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,now(),?,now(),?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, o_num);
				pstmt.setString(2, 
						sdf.format(cal.getTime())+"-"+trade_num
						);
				pstmt.setInt(3, bk.getB_g_num());
				pstmt.setString(4, gb.getName());
				pstmt.setInt(5, bk.getB_g_amount());
				pstmt.setString(6, bk.getB_g_size());
				pstmt.setString(7, bk.getB_g_color());
				pstmt.setString(8, ob.getO_m_id());
				
				pstmt.setString(9, ob.getO_receive_name());
				pstmt.setString(10, ob.getO_receive_addr1());
				pstmt.setString(11, ob.getO_receive_addr2());
				pstmt.setString(12, ob.getO_receive_phone());
				pstmt.setString(13, ob.getO_memo());
				
				pstmt.setInt(14, bk.getB_g_amount() * gb.getPrice());
				pstmt.setString(15, ob.getO_trade_type());
				pstmt.setString(16, ob.getO_trade_payer());
				
				pstmt.setString(17, ""); // 운송장번호 - 주문시 공백문자
				pstmt.setInt(18, 0); // 주문상태
				
				// 4. sql 실행
				pstmt.executeUpdate();
				
				o_num++; // 일련번호 증가 
				
			}// for
			
			System.out.println("DAO : 주문정보 저장 완료");			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// addOrder(ob,basketList,goodsList)
	
	
	
	
	
	
}
