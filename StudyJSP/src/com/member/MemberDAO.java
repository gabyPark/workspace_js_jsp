package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// itwill_member DB 관련된 모든 처리를 하는 객체
//  DAO (Data Access object)
public class MemberDAO {
	
	/*// 필요한 정보 준비
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	// 디비연결에 필요한 참조변수 준비
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	

	// 디비 연결
	public Connection getConnection() {
		try {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("insertPro : 드라이버 로드 성공! ");
			
			// 2. 디비 연결
			con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("디비 연결 성공! con : " + con);
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		return con;
	}

	// 데이터 처리(회원가입,수정,탈퇴....)

	public void exInsertMember(MemberBean mb) {

		try {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("insertPro : 드라이버 로드 성공! ");
			// 2. 디비 연결
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("디비 연결 성공! con : " + con);
			
			con = getConnection();

			// 3. sql 생성(insert) & pstmt 생성
			String sql = "insert into itwill_member values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(sql);

			// ?
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getReg_date());

			// 4. sql 실행
			pstmt.executeUpdate();

			System.out.println("SQL 구문 실행완료! ");
			System.out.println("회원 가입 성공!");

		} catch (SQLException e) {
			System.out.println(" 디비 연결 실패! ");
			System.out.println(" SQL 구문 오류! ");
			e.printStackTrace();
		}

	}// 메서드 종료
*/
	
	// 필요한 레퍼런스 준비
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

/////////////////////////////////////////////////////////
	// private 접근지정자: 외부에서 사용 X, 자신의 클래스 안에서만 사용가능 

	// 디비연결 처리 메서드
	private Connection getCon(){
		// 커넥션풀 사용
		try {
			// Context 객체 생성
			Context initCTX = new InitialContext();
			// Context 사용해서 디비정보를 가져오기
			DataSource ds 
			= (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			// 연결정보를 사용해서 연결
			con = ds.getConnection();
			
			System.out.println("DAO : 디비 연결성공!!!");
			System.out.println("DAO : "+con);
			
		} catch (Exception e) {
			System.out.println("디비 연결 오류발생!");
			e.printStackTrace();
		}
		
		return con;		
	}
///////////////////////////////////////////////////////////////
	// 디비 자원해제 메서드 
	public void closeDB(){
		try {
			if(rs != null) { rs.close();}
			if(pstmt != null) { pstmt.close(); }
			if(con != null) { con.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
///////////////////////////////////////////////////////////////
	
	
	// InsertMember(mb)
	public void InsertMember(MemberBean mb){
		// 회원가입 처리
		
		// 1.드라이버로드
		// 2. 디비연결
		con = getCon();
		
		try {
			// 3. sql 쿼리 & pstmt
			sql = "insert into itwill_member(id,pw,name,age,gender,email,reg_date) "
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getReg_date());
			
			// 4. sql 실행
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : sql 실행완료! , 회원가입 완료!");
			
		} catch (SQLException e) {
			System.out.println("DAO : sql 구문 실행 에러(회원가입 실패)");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// InsertMember(mb)
	
	//idCheck(id,pw)
	public int idCheck(String id,String pw){
		int result = -1;
		
		try {
			// 1.2 디비 연결
			con = getCon();
			// 3. sql 쿼리(select) & pstmt 객체 생성
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()){
				// 아이디 있음
				if(pw.equals(rs.getString("pw"))){
					// 아이디 O, 비밀번호 O
					result = 1;
				}else{
					// 아이디 O, 비밀번호 X
					result = 0;
				}
			}else{
				// 아이디 없음
				result = -1;
			}
			
			System.out.println("DAO : sql 구문 실행 성공");
			System.out.println("DAO : 로그인체크 완료 => "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			// 예외 발생여부와 상관없이 반드시 실행되는 코드
			// => DB 자원해제  con.pstmt.rs
			try {
				if(rs != null) { rs.close();}
				if(pstmt != null) { pstmt.close(); }
				if(con != null) { con.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	//idCheck(id,pw)
	
	// getMember(id)
	public MemberBean getMember(String id){
		// 회원정보를 저장하는 변수
		MemberBean mb = null;		
		
		// 1.2. 디비연결
		con = getCon();
		
		try {
			// 3. sql 구문 & pstmt 객체 
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// DB 정보 -> MemberBean 객체 저장
			if(rs.next()){
				// 데이터를 저장할 객체 생성
				mb = new MemberBean();
				
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPw(rs.getString("pw"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}
			
			System.out.println("DAO : 회원 정보 조회 완료!");
			System.out.println("DAO : "+mb);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return mb;
	}
	
	// getMember(id)
	
	
	// mdao.updateMember(updateMember);
	// updateMember(수정할 정보객체)
	public int updateMember(MemberBean umb){
		int result = -1;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 쿼리(select) & pstmt 객체
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, umb.getId());
			
			// 4. sql 쿼리 실행
			rs = pstmt.executeQuery();			
			
			// 5. 데이터 처리
			if(rs.next()){
				// 회원
				if(umb.getPw().equals(rs.getString("pw"))){
					// 3. sql 쿼리(update) & pstmt 객체
					sql = "update itwill_member "
							+ "set name=?,age=?,gender=?,email=? where id=?";

					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, umb.getName());
					pstmt.setInt(2, umb.getAge());
					pstmt.setString(3, umb.getGender());
					pstmt.setString(4, umb.getEmail());
					pstmt.setString(5, umb.getId());
					// 4. sql 쿼리 실행
					pstmt.executeUpdate();
					result = 1;
				}else{
					// 비밀번호 오류
					result = 0;
				}
			}else{
				// 비회원
				result = -1;
			}
			
			System.out.println("DAO : 회원정보 수정완료 => "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}	
	// updateMember(수정할 정보객체)
	
	// deleteMember(id,pw)
	public int deleteMember(String id,String pw){
		int result = -1;
		
		try {
			// 1.2 디비연결
			con = getCon();
			
			// 3. sql 쿼리(select) & pstmt 객체
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					// 3. sql쿼리(delete) & pstmt 객체
					sql = "delete from itwill_member where id=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					result = 1;
				}else{
					// 비밀번호 오류
					result = 0;
				}
			}else{
				// 비회원
				result = -1;
			}
			
			System.out.println("DAO : 회원 삭제 처리 완료 => "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// deleteMember(id,pw)
	
	// ArrayList => 가변길이 배열, 데이터를 순차적으로 저장
	//  => 크기를 지정하지 않아도 알아서 필요할때 공간을 자동으로 생성
	// getMemberList()
	public ArrayList getMemberList(){
		ArrayList memberList = new ArrayList();
		
		try {
			// 1.2. 디비 연결
			con = getCon();
			
			// 3. sql & pstmt
			sql = "select * from itwill_member";
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 
			while(rs.next()){
				// 회원 정보를 가변길이 배열에 저장
				// 회원정보 -> MemberBean -> ArrayList 한칸
				MemberBean mb = new MemberBean();
				
				mb.setId(rs.getString("id"));
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setName(rs.getString("name"));
				mb.setPw(rs.getString("pw"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				
				// ArrayList memberList = new ArrayList();
				// 한명의 정보를 배열 한칸에 저장 -> 업캐스팅
				//  Object o = mb;
				memberList.add(mb);				
			}
			
			System.out.println("DAO : 회원목록 저장완료");
			System.out.println("DAO : "+memberList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;
	}
	// getMemberList()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
