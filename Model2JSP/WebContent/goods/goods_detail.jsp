<%@page import="com.admin.goods.db.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
    function isBasket(){
    	alert(" 장바구니 처리 ");
    	
    	// 구매 수량,크기,색상 미 선택시 이동 X
    	
    	if(document.gfr.amount.value == ""){
    		alert(" 구매수량을 입력하세요.");
    		document.gfr.amount.focus();
    		return;
    	}
    	
    	if(document.gfr.size.value == ""){
    		alert(" 크기를 선택하세요! ");
    		document.gfr.size.focus();
    		return;
    	}
    	
    	if(document.gfr.color.value == ""){
    		alert(" 색상을 선택하세요! ");
    		document.gfr.color.focus();
    		return;
    	}
    	
    	// 구매 정보를 모두 입력상태 
    	// "장바구니에 저장하시겠습니까?"
        //  Y - 장바구니 저장  (./BasketAdd.ba)
    	//  N - 동작 X
    	
    	var check = confirm("장바구니에 저장하시겠습니까?");
    	
    	if(check){
    		document.gfr.action = "./BasketAdd.ba";
    		document.gfr.submit();	    		
    	}else{
    		return;
    	}
    	
    	
    }

</script>

</head>
<body>

 <h1>WebContent/goods/goods_detail.jsp</h1>
 <%
    //request.setAttribute("goods", goods);
 
    GoodsBean gb = (GoodsBean)request.getAttribute("goods");
 
 %>
  <h2> 상품 상세보기 </h2>
  <form action="" method="post" name="gfr">
   <input type="hidden" name="num" value="<%=gb.getNum()%>">
  
  <table border="1">
     <tr>
        <td>
          <img width="300" height="300"
               src="./upload/<%=gb.getImage().split(",")[0]%>">
        </td>
        <td width="300" height="300">
                    상품이름 : <%=gb.getName() %><br>
                    판매가격 : <%=gb.getPrice() %>원<br>
                    구매수량 : <input type="number" name="amount"><br>
                    남은수량 : <%=gb.getAmount() %>개<br>
                    크기 : <select name="size">
                    <option value="">크기를 선택하시오.</option>
                    <c:forTokens var="size" items="${goods.size }" delims=",">
                      <option value="${size }">${size }</option>
                    </c:forTokens>                    
                </select>
                    <br>
                    
                   <%--  <select name="size">
                    <option value="">크기를 선택하시오.</option>
                  <%
                     String[] gbArr = gb.getColor().split(",");
                     for(String col : gbArr){
                    	 %>
                    	 <option value="<%=col%>"><%=col %></option>
                    	 <%
                     }
                  %>  
                    </select> --%>
                    색상 : 
                <select name="color">
                  <option value="">색상을 선택하시오</option>
                   <c:forTokens var="color" items="${goods.color }" delims=",">
                     <option value="${color }">${color }</option>
                   </c:forTokens>
                </select>   
                    <br> 
               <hr><hr>
             
             <a href="javascript:isBasket()">[장바구니 담기]</a>       
             <a href="javascript:isBuy()">[구매하기]</a>       
        </td>
     </tr>
     <tr>
       <td colspan="2">
       
       <c:forTokens var="imgName" items="${goods.image }" delims=",">
        <img  width="600" src="./upload/${imgName }"><br>
       </c:forTokens>
       
       </td>
     </tr>
  </table>
 
  </form>
 
 
 
 
 

</body>
</html>