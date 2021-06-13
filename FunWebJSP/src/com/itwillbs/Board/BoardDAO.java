package com.itwillbs.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	// itwill_board 테이블에 대한 DB처리 객체
	// 공통 변수를 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비 연결 메서드-커넥션풀
	private Connection getCon() throws Exception {

		// 프로젝트 정보를 초기화
		Context initCTX = new InitialContext();
		// 해당 파일을 불러온다(Context.xml-DB연결정보)
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/funwebDB");
		con = ds.getConnection();

		System.out.println("DAO : 디비 연결 성공! " + con);

		return con;
	}

	// 자원해제 메서드
	public void closeMyDB() {
		System.out.println("DAO : 자원해제!! ");

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

	// 글쓰기 메서드
	// insertBoard(bb)
	public void insertBoard(BoardBean bb) {

		int bno = 0;

		try {
			// 1.2. 디비연결
			con = getCon();
			/////////////////////////////////////////
			// 글번호 num 계산하기
			// 3. sql 쿼리 & pstmt 객체
			// 게시판 글번호(num)계산
			sql = "select max(num) from itwill_board";

			pstmt = con.prepareStatement(sql);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// * max(num) 결과 없을경우 => sql null 데이터
				// rs.getInt(1) => 결과가 sql null일경우 [0]리턴,
				// " 아닐경우 해당 숫자 리턴
				bno = rs.getInt(1) + 1; // 1번째 컬럼의 값 : 인덱스번호 사용

				// rs.getInt("num"); (x)
				// rs.getInt("max(num)"); 컬럼명을 사용 (O)
			}

			System.out.println(" 글번호 : " + bno);

			/////////////////////////////////////////
			// 글번호 + 글정보=> 글쓰기
			// 3. sql 쿼리 & pstmt 객체
			sql = "insert into itwill_board (num,name,pass,subject,content,"
					+ "readcount,re_ref,re_lev,re_seq,date,ip,file) " + "values(?,?,?,?,?,?,?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);

			// ?
			pstmt.setInt(1, bno); // 위에서 계산된 글번호 저장
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); // 조회수 항상 0으로 초기화
			pstmt.setInt(7, bno); // re_ref 답변글 그룹 == 일반글 글번호 동일
			pstmt.setInt(8, 0); // re_lev 답변글 들여쓰기 -> 일반글 들여쓰기 없음
			pstmt.setInt(9, 0); // re_seq 답변글 순서 -> 일반글은 순서 맨위에 위치
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			// 4. sql 실행
			pstmt.executeUpdate();

			System.out.println("DAO : 글쓰기 성공! 글번호 : " + bno);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외발생여부와 상관없이 반드시 한번 실행
			closeMyDB();
		}

	}
	// insertBoard(bb)

	// getBoardCount()
	public int getBoardCount() {
		int cnt = 0;

		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 생성(select) & pstmt 객체
			sql = "select count(*) from itwill_board";
			pstmt = con.prepareStatement(sql);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// rs.getInt("count(*)");
				cnt = rs.getInt(1);
			}

			System.out.println("DAO : 글 개수 조회 -> " + cnt);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return cnt;
	}
	// getBoardCount()

	// getBoardList()
	public ArrayList getBoardList() {

		ArrayList boardList = new ArrayList();

		try {
			// 1.2. 디비 연결
			con = getCon();
			// 3. sql 작성 & pstmt 객체
			sql = "select * from itwill_board";
			// re_ref(num)기준으로 정렬 내림차순, re_seq 오름차순 정렬
			// limit 시작행-1, 개수
			// sql ="select * from itwill_board"
			// + " order by re_ref desc,re_seq asc"
			// + " limit 0,5";
			pstmt = con.prepareStatement(sql);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리

			while (rs.next()) { // 데이터가 있을때 마다처리
				// 게시판글 저장-> BoardBean저장 -> ArrayList 저장

				BoardBean bb = new BoardBean();
				// DB데이터 -> BoardBean 객체
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

				// BoardBean객체 -> ArrayList 한칸에 저장
				boardList.add(bb);

			} // while

			System.out.println("DAO : 게시판 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return boardList;
	}

	// getBoardList()

	// getBoardList(startRow,pageSize)
	public ArrayList getBoardList(int startRow, int pageSize) {
		ArrayList boardList = new ArrayList();
		try {
			// 1.2. 디비 연결
			con = getCon();
			// 3. sql 작성 & pstmt 객체
			
			// re_ref(num)기준으로 정렬 내림차순, re_seq 오름차순 정렬
			// limit 시작행-1, 개수
			 sql ="select * from itwill_board"
					 + " order by re_ref desc,re_seq asc"
					 + " limit ?,?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리

			while (rs.next()) { // 데이터가 있을때 마다처리
				// 게시판글 저장-> BoardBean저장 -> ArrayList 저장

				BoardBean bb = new BoardBean();
				// DB데이터 -> BoardBean 객체
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

				// BoardBean객체 -> ArrayList 한칸에 저장
				boardList.add(bb);

			} // while

			System.out.println("DAO : 게시판 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return boardList;
	}
	// getBoardList(startRow,pageSize)
	
	
	// updateReadCount(num)
	public void updateReadCount(int num){
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql 쿼리 & pstmt객체
			// 기존의 조회수를 1증가
			sql = "update itwill_board set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			//4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 조회수 1증가! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
	}
	// updateReadCount(num)
	
	// getBoard(num)
	public BoardBean getBoard(int num){
		BoardBean bb = null;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql 쿼리 & pstmt 객체
			sql = "select * from itwill_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()){
				// DB -> BoardBean 
				bb = new BoardBean();
				
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
			} // if
			
			System.out.println("DAO : 해당 글 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return bb;
	}
	//getBoard(num)
	
	// updateBoard(bb)
	public int updateBoard(BoardBean bb){
		int result = -1;
		// -1 : 아이디없음, 0 : 비밀번호 오류, 1 : 정상처리
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 작성 (select-글이 있는지 판단)& pstmt 객체
			sql ="select pass from itwill_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					//3. sql 작성  (update-해당글 수정) & pstmt 객체 
					sql ="update itwill_board set name=?,subject=?,"
							+ "content=? where num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getNum());
					//4. sql 실행
					result = pstmt.executeUpdate();
					
					//result = 1;				
					System.out.println("DAO : 글 수정- 정상 수정");
					
				}else{
					// 비밀번호 오류
					System.out.println("DAO : 글 수정- 비밀번호 오류");
					result = 0;
				}
			}else{
				// 글없음
				System.out.println("DAO : 글 수정- 글 없음");
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		
		return result;
	}
	// updateBoard(bb)
	
	
	//deleteBoard(bb)
	public int deleteBoard(BoardBean bb){
		int result = -1;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql 작성(select) & pstmt 객체생성
			sql = "select pass from itwill_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					//3. sql 작성(delete) & pstmt 객체 생성
					sql = "delete from itwill_board where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					
					//4. sql 실행 (삭제된 글의 수를 리턴)
					result = pstmt.executeUpdate();
					
				}else{
					//글 비밀번호 오류
					result = 0;
				}
			}else{
				//글이 없음
				result = -1;
			}
			
			 System.out.println("DAO : 글삭제 처리 -> "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return result;		
	}
	//deleteBoard(bb) 
	
	// reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb){
		int num = 0;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql 구문 & pstmt객체 
			//-> 답글번호 계산(num)
			sql = "select max(num) from itwill_board";
			pstmt = con.prepareStatement(sql);
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()){
				num = rs.getInt(1) + 1;				
			}
			
			System.out.println("DAO : 답글번호 확인 ->"+num);
			
			
//////////////////////////////////////////////////////////////////
			// -> 답글 순서 재배치
			// re_ref 값이 같은 그룹, re_seq기존의 값보다 큰값이 있을때 1증가 
			sql="update itwill_board set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 답글 순서 재배치! ");
			
//////////////////////////////////////////////////////////////////
			//-> 답글 작성
			//3. sql구문 & pstmt 객체
			sql="insert into itwill_board(num,name,pass,subject,content,"
					+ "readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); //조회수 0
			pstmt.setInt(7, bb.getRe_ref()); // 답글 ref : 일반글(원글)의 ref값 사용 
			pstmt.setInt(8, bb.getRe_lev()+1); // 답글lev :들여쓰기 1증가
			pstmt.setInt(9, bb.getRe_seq()+1); // 답글 seq : 순서 1증가
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			//4. sql 실행
			pstmt.executeUpdate();

			System.out.println("DAO : 답글 작성완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
	}
	// reInsertBoard(bb)
	
	// getBoardCount(search)
	public int getBoardCount(String search) {
		int cnt = 0;

		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 생성(select) & pstmt 객체
			// where  대상(컬럼) like 값
			// 값 - 데이터가 값이랑 정확하게 일치
			// %값 - ~값 으로 끝나는 데이터
			// 값% - 값~ 으로 시작하는 데이터
			// %값% - 값을 포함하는 데이터
			
			// 전체(all)
			if(search.equals("all")){
				sql = "select count(*) from itwill_board";
			}else{
				sql = "select count(*) from itwill_board "
					+ "where subject like ?";
			}
			
			pstmt = con.prepareStatement(sql);
			
			if(search.equals("all")){}
			else{
				pstmt.setString(1, "%"+search+"%");
			}
			

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// rs.getInt("count(*)");
				cnt = rs.getInt(1);
			}

			System.out.println("DAO : 글 개수 조회 -> " + cnt);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return cnt;
	}
	// getBoardCount(search)
	
	// getBoardList(startRow,pageSize,search)
		public ArrayList getBoardList(int startRow, int pageSize,String search) {
			ArrayList boardList = new ArrayList();
			try {
				// 1.2. 디비 연결
				con = getCon();
				// 3. sql 작성 & pstmt 객체
				
				// re_ref(num)기준으로 정렬 내림차순, re_seq 오름차순 정렬
				// limit 시작행-1, 개수
				
				if(search.equals("all")){
					 sql ="select * from itwill_board"
							 + " order by re_ref desc,re_seq asc"
							 + " limit ?,?";
				}else{
					 sql ="select * from itwill_board"
					 		 + " where subject like ? "
							 + " order by re_ref desc,re_seq asc"
							 + " limit ?,?";
				}
				
				pstmt = con.prepareStatement(sql);
				
				if(search.equals("all")){
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
				}else{
					pstmt.setString(1, "%"+search+"%");
					pstmt.setInt(2, startRow-1);
					pstmt.setInt(3, pageSize);
				}
				
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터 처리

				while (rs.next()) { // 데이터가 있을때 마다처리
					// 게시판글 저장-> BoardBean저장 -> ArrayList 저장

					BoardBean bb = new BoardBean();
					// DB데이터 -> BoardBean 객체
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setName(rs.getString("name"));
					bb.setNum(rs.getInt("num"));
					bb.setPass(rs.getString("pass"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));

					// BoardBean객체 -> ArrayList 한칸에 저장
					boardList.add(bb);

				} // while

				System.out.println("DAO : 게시판 글 저장 완료!");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeMyDB();
			}

			return boardList;
		}
		// getBoardList(startRow,pageSize)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
