<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style type="text/css">
#tab_menu{
	margin-bottom: 25px;
}

td.tab{
	border: solid 1px silver;
	width: 50%;
	margin: 0 auto;
	text-align: center;
	height: 50px;
	cursor: pointer;
	color: silver;
}

.orderTabTbl, .orderTbl{
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

.orderTbl tr td{
	border: solid 1px gray;
	padding-left: 10px;
	font-size: 9pt;
}
.orderTbl tr th{
	border: solid 1px gray;
	width: 15%;
	background-color: #e6e6e6;
	font-size: 10pt;
	padding-left: 10px;
}

td.active{
	color: black;
	border-bottom: solid 3px black;
}

.tblText{
	font-weight: bold;
	font-size: 11pt;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#menu2").hide();
	$(".tab").click(function(){
		$(".tab").removeClass("active");
		$(this).addClass("active");
		$(".tabContent").hide();
		var menubar = ("#menu"+($(this).index()+1));
		$(menubar).show();
	});
});

</script>
<head>
<meta charset="EUC-KR">
<title>주문조회</title>
</head>
<body>
<div id="topArea" style="margin-bottom: 10px;">
	<div style="float: left;">
		<span style="font-weight: bold; font-size: 16pt;">주문정보</span>
	</div>
		<div style="text-align: right; padding-top: 10px;">
		<span style="font-size: 9pt;"><strong id="name">[이름]</strong>님께서 <strong id="date">[날짜]</strong>에 주문하신 내역입니다</span>
	</div>
</div>

	<div id="tab_menu">
		<table class="orderTabTbl">
		<tr style="border: solid 1px red;">
			<td class="tab active" >주문상세내역</td>
			<td class="tab" >상품후기등록</td>
		</tr>
		</table>
	</div>
	
	<div class="tabContent" id="menu1" >
	
		<span class="tblText">주문자</span>
		<table class="orderTbl" style="text-align: left;">
			<tr>
				<th>주문번호</th>
				<td>201912040001</td>
				<th>주문일자</th>
				<td>2019.12.04</td>
			</tr>
			<tr>
				<th>주문자</th>
				<td>[이름]</td>
				<th>주문서 입금현황</th>
				<td>입금완료</td>
			</tr>
			<tr>
				<th>주문메모</th>
				<td colspan="4">[메모]</td>
			</tr>
		</table>
		<br/><br/>
		
		<span class="tblText">배송지</span>
		<table class="orderTbl" style="text-align: left;">
			<tr>
				<th>배송번호</th>
				<td>S-191204-0001</td>
				<th>송장번호</th>
				<td>1234-5678</td>
			</tr>
			<tr>
				<th>수취인</th>
				<td>[수취인이름]</td>
				<th>연락처</th>
				<td>[연락처]</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="4">[주소]</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td colspan="4">[메세지]</td>
			</tr>
		</table>
		<br/><br/>
		
		<span class="tblText">주문상품</span>
		<table class="orderTbl">
		
		<thead>
			<tr>
				<th colspan="2" style="width:40%">주문상품정보</th>
				<th style="width:15%">상품별주문번호</th>
				<th style="width:6%">수량</th>
				<th style="width:8%">가격</th>
				<th style="width:8%">적립</th>
				<th style="width:10%">처리상태</th>
				<th style="width:12%">배송번호</th>
			</tr>
		</thead>
			<tr>
				<td><img alt="img" src="../hm_img/product.png" width="50px" height="50px"></td>
				<td width="290px">더리얼 그레인프리 오븐베이크드 어덜트 50g X 3종</td>
				<td>201912040001</td>
				<td>[수량]</td>
				<td>[가격]</td>
				<td>[적립금액]</td>
				<td>상품준비</td>
				<td>S-191204-0001</td>
			</tr>
		</table>
	</div>
	
	<div class="tabContent" id="menu2" >
		상품후기상품후기상품후기상품후기상품후기상품후기상품후기상품후기상품후기
	</div>
</body>
</html>