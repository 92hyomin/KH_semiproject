<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#OrderDetailView{
	border: solid 1px black;
	display: inline-block;
	width: 40px;
	height: 20px;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#OrderDetailView").click(function(){
		orderDetail();
	});
	
});

function orderDetail(){
        var url = "/Semi_Team1/mypage/orderDetail.dog";
        var name = "orderDetail";
        var option = "width = 875px, height = 820px, location = no"
        window.open(url, name, option);
}
</script>

<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="/Semi_Team1/css/hm/style.css" />
 
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
		<tr>
			<td>John</td>
			<td>Doe</td>
			<td>john@example.com</td>
			<td>test</td>
			<td>테스트</td>
			<td><span id="OrderDetailView" onclick="orderDetail()">VIEW</span></td>
		</tr>
	</tbody>
</table>
</div>
<jsp:include page="../footer_dog.jsp"/>