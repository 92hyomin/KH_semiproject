<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#OrderDetailView{
	border: solid 1px black;
	display: inline-block;
	width: 40px;
	height: 20px;
	cursor: pointer;
}
.center {
  text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="/Semi_Team1/css/hm/style.css" />
 
<script type="text/javascript">
$(document).ready(function(){
	
});


function orderDetail(orderNum){
        var url = "/Semi_Team1/mypage/orderDetail.dog?orderNum="+orderNum;
        var name = "orderDetail";
        var option = "width = 875px, height = 820px, location = no"
        window.open(url, name, option);
}

</script>

<div id="login_container">
<h1 class="hm_h1">마이페이지</h1>
<jsp:include page="semi_Mypage_Submenu.jsp"/>

<script type="text/javascript">
	$("#subtabli1 > a").addClass('subtabClick');
	$(".subTab").hide();
	$("#tab1").addClass("tabClick")
	$(".subTab:first").show();
	$("#top_comment").html("Home>Mypage>최근 주문내역");
</script>

<h4 style="font-weight: bold; margin-top: 40px;">최근 주문내역</h4>
<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
	<thead class="hm_thead">
		<tr>
			<th>번호</th>
			<th>주문번호</th>
			<th>상품명</th>
			<th>결제금액</th>
			<th>주문일자</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody class="hm_tbody">
		<c:if test="${empty requestScope.orderList}">
			<tr>
				<td colspan="5">주문 내역이 없습니다.</td>
			</tr>
		</c:if>
	
		<c:if test="${!empty requestScope.orderList}">
			<c:forEach var="ovo" items="${requestScope.orderList}" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${ovo.order_num }</td>
					<td>${ovo.product_name }</td>
					<td><fmt:formatNumber maxFractionDigits="3" value="${ovo.amountmoney}" /></td>
					<td>${ovo.order_day }</td>
					<td><span id="OrderDetailView" onclick="orderDetail(${ovo.order_num})">VIEW</span></td>
				</tr>
			</c:forEach>
		</c:if>
		
		<%--
		<tr>
			<td>John</td>
			<td>Doe</td>
			<td>john@example.com</td>
			<td>test</td>
			<td>테스트</td>
			<td><span id="OrderDetailView" onclick="orderDetail()">VIEW</span></td>
		</tr>
		 --%>
		 
	</tbody>
</table>


	<div class="center">
		<div style="text-align: center;" class="pagination">
			${pageBar}
		</div>
	</div>
</div>
<jsp:include page="../footer_dog.jsp"/>