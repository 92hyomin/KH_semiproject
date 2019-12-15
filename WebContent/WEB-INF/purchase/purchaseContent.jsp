<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header_dog.jsp"/>

<script type="text/javascript">
</script>
<style type="text/css">
	.subTitle {
		color: #858585;
    	font-family: 'Notokr', sans-serif;
    	text-align: right;
    	font-size: 12px;
    	padding: 15px;
    	
	}
	.subTitle div {
		display: inline-block;
	}
	
	.mainContent{
		display: inline-block;
	}
	
	.contentTitle{
		font-size: 30px;
		font-family: 'NotokrLight', sans-serif;
		padding-bottom: 30px;
    	margin-bottom: 30px;
    	border-bottom: 1px solid #e1e1e1;
        color: #111;
        font-weight: bold;
	}
	
	.borderBottom {
		padding-bottom: 30px;
    	margin-bottom: 30px;
    	border-bottom: 1px solid #e1e1e1;
	}
	
	.cate1 {
		 font-size: 15px;
    	 color: #999;
   		 line-height: 55px;
   		 text-align: center;
   		 font-family: 'Notokr', sans-serif;
   		 margin: 0;
	}
	.cate1 div {
		border: solid 1px gray;
		display: inline-block;
		width: 24%;
	}
	
	.cate3 {
		border: solid 1px gray;
		width: 2%;
		text-align: center;
		height: 50px;
		font-family: 'Notokr';
		font-size: 15px;
    	color: #777;
    	cursor: pointer;
	}
	
	.Bin_order {
		margin: auto;
		width: 30%;
		border: 1px solid #111;
		display: inline-block;
		text-align: center;
		font-size: 14px;
	}
	
</style>
<div style="width: 80%; margin: 0 auto;">
	<div class="subTitle">
			<div>HOME></div>
			<div>브랜드별></div>
			<div>브랜드></div>
			<div>제품명</div>
	</div>
	<div style="width: 43%; text-align: left;" class="mainContent">
		<img style="width: 100%;" src="/Semi_Team1/images/${thumb}">
	</div>
	<div style="width: 43%; text-align: right;" class="mainContent">
		<div class="contentTitle">${name}</div>
		<div class="borderBottom">
			<div style="margin-right:15%; display: inline-block; color: #969696; font-family: 'Notokr', sans-serif; font-size: 14px;">판매가격</div>
			<div style="display: inline-block; font-family: 'LatoLight', sans-serif; font-size: 18px; font-weight: bold; color: #CD1313;"><span>${price}</span>원</div>
		</div>
		<div class="borderBottom">
			<div style="margin-bottom: 3%;">${name}</div>
			<div style="height: 20px;"><input type="text" size="1" value="1" style="text-align: center; float: left;"><span style="float: right;"><span>${price}</span>원</span></div>
		</div>
		<div style="width: 100%;">
			<span style="width:45%; font-size: 22px; color: #0e0e0e; font-family: 'Notokr', sans-serif; font-weight: bold;">총 상품 금액</span>
			<span style="width:45%; font-size: 28px; color: #cd1313; font-family: 'Lato', sans-serif;  font-weight: bold;"><span>${price}</span>원</span>
		</div>
		<div>
			<div class="Bin_order" style="border: 1px solid #da291c; background: #da291c;     color: #fff;">바로구매</div>
			<div class="Bin_order">장바구니</div>
			<div class="Bin_order">관심상품</div>
		</div>
	</div>
	<div style="margin-bottom: 4.5%;">
		<table style="margin: auto;">
			<tr>
				<td class="cate3 ">상품상세</td>
				<td class="cate3 ">배송/반품/교환/환불</td>
				<td class="cate3 ha_sort">상품문의(숫자)</td>
				<td class="cate3 ">상품후기(숫자)</td>
			</tr>
		</table>
	</div>
	<div>
		<img src="http://harimpetfood.godohosting.com/bb/bb_healthyball_immunity_1_1.jpg">
		<img src="http://harimpetfood.godohosting.com/bb/bb_healthyball_immunity_2.jpg">
		<img src="http://harimpetfood.godohosting.com/bb/bb_healthyball_3.jpg">
		<img src="http://harimpetfood.godohosting.com/bb/bb_healthyball_immunity_4.jpg">
	</div>
</div>
<jsp:include page="../footer_dog.jsp"/>
