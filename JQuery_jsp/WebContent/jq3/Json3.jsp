<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.test.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  //DB 연결후 데이터 가져오기
  //커넥션 풀 없이 바로 디비연결해서 회원 목록전부를 가져오기 
  
  String DRIVER ="com.mysql.jdbc.Driver";
  String DBURL ="jdbc:mysql://localhost:3306/model2";
  String DBID ="root";
  String DBPW ="1234";
  
  // 1. 드라이버로드
  Class.forName(DRIVER);
  // 2. 디비연결
  Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
  // 3. sql 작성 & pstmt 객체 생성
  String sql ="select * from itwill_member";
  PreparedStatement pstmt = con.prepareStatement(sql);
  // 4. sql 실행
  ResultSet rs = pstmt.executeQuery();
  
  
  /*
   json-simple.jar 라이브러리
   
   - 자바 데이터를 JSON형태로 사용가능하도록 하는 라이브러리 
   - Map/List를 사용해서 구현
  
  */
  
  // 5. 데이터 처리
  /* ArrayList memberList = new ArrayList();
  while(rs.next()){
	  MemberBean mb = new MemberBean();
	  mb.setAge(rs.getInt("age"));
	  mb.setEmail(rs.getString("email"));
	  mb.setGender(rs.getString("gender"));
	  mb.setId(rs.getString("id"));
	  mb.setName(rs.getString("name"));
	  mb.setPw(rs.getString("pw"));
	  mb.setReg_date(rs.getTimestamp("reg_date"));
	  
	  memberList.add(mb);	  
  } */
  
  
  // 5.데이터 처리 (DB->객체->JSON)
  // 배열객체 생성
  JSONArray memberList = new JSONArray();
  
  while(rs.next()){
	  JSONObject mb = new JSONObject();
	  
	  mb.put("id", rs.getString("id"));
	  mb.put("pass", rs.getString("pass"));
	  
	  memberList.add(mb);	  
  }

%>

 <%=memberList %>




