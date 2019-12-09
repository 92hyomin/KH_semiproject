<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

</style>
<% String ctxPath = request.getContextPath(); %>
<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hm/style.css" /> 

<div id="login_container">
	<h1 class="hm_h1">마이페이지</h1>
	<jsp:include page="semi_Mypage_Submenu.jsp"/>
	
	<script type="text/javascript">
			$("#subtabli5 > a").addClass('subtabClick');
			$(".subTab").hide();
			$("#tab2").addClass("tabClick")
			$(".subTab:eq(1)").show();
			$("#top_comment").html("Home>Mypage>최근 본 상품");
	</script>
	
	<hr style="border: solid 0.5px gray; margin-top: 50px;">
	<div class="recentlyProdDiv" >
		<div class="recentlyProd col-md-3">
			<img class="prodImg" src="../hm_img/product.png" />
			<p id="prodName">[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
			<p id="prodPrice">4,200원</p>
		</div>
		<div class="recentlyProd col-md-3">
			<img class="prodImg" src="../hm_img/product.png" />
			<p id="prodName">[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
			<p id="prodPrice">4,200원</p>
		</div>
		<div class="recentlyProd col-md-3">
			<img class="prodImg" src="../hm_img/product.png" />
			<p id="prodName">[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
			<p id="prodPrice">4,200원</p>
		</div>
		<div class="recentlyProd col-md-3">
			<img class="prodImg" src="../hm_img/product.png" />
			<p id="prodName">[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
			<p id="prodPrice">4,200원</p>
		</div>
		<div class="recentlyProd col-md-3">
			<img class="prodImg" src="../hm_img/product.png" />
			<p id="prodName">[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
			<p id="prodPrice">4,200원</p>
		</div>
		<div class="recentlyProd col-md-3">
			<img class="prodImg" src="../hm_img/product.png" />
			<p id="prodName">[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
			<p id="prodPrice">4,200원</p>
		</div>
	</div>
</div>
<jsp:include page="../footer_dog.jsp"/>