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

.orderTabTbl, .orderTbl, .reviewTbl{
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
	background-color: #f8f8f8;
	font-size: 10pt;
	padding-left: 10px;
}

.tdCenter tr td, .tdCenter tr th{
	padding-left: 0; 
}

td.active{
	color: black;
	border-bottom: solid 3px black;
}

.tblText{
	font-weight: bold;
	font-size: 11pt;
}

#orderBtn1{
	border: solid 1px black; 
	font-size: 10pt;
	text-align: center;
	cursor: pointer;
	display: inline-block;
	width: 70px; 
	padding: 3px 0;
}

#closeBtn{
	border: solid 1px black;
	text-align: center;
	margin: 0 auto;
	display: inline-block;
	width: 100px;
	padding: 10px;
	cursor: pointer;
}

.prod{
	border: solid 1px silver;
	text-align: center;
	padding: 10px;
}

.reviewTbl{
}

.reviewTbl tr td{
	font-size: 9pt;
	text-align: left;
}

#writeReview{
	cursor: pointer;
	border: solid 1px black;
	padding: 5px;
}

.submitBtn{
	background-color: #231f20;
	color: white;
}

.cancelBtn{
	background-color: white;
	color: #231f20;
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
	
	$(".submitBtn").hover(
			function(){
				$(this).removeClass("submitBtn");
				$(this).addClass("cancelBtn");
			},
			function(){
				$(this).removeClass("cancelBtn");
				$(this).addClass("submitBtn");
			});
		
		$(".cancelBtn").hover(
			function(){
				$(this).removeClass("cancelBtn");
				$(this).addClass("submitBtn");
				$(this).css("color","white");
			},
			function(){
				$(this).removeClass("submitBtn");
				$(this).addClass("cancelBtn");
				$(this).css("color","#231f20");
			});
		
		$("#submitBtn").click(function(){
			var passwd = $("#inputPasswd").val().trim();
			
			if(passwd==""){
				alert("패스워드를 입력하세요");
				$("#inputPasswd").focus();
			}
			else{
				location.href="semi_Mypage_MyInfoEdit.jsp"
				////////////////
				/* Submit작업 */
				////////////////
			}
			
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
		<tr>
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
		
		<table class="orderTbl tdCenter">
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
		<tbody style="text-align: center;">
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
		</tbody>
		</table>
		<br/><br/>
		
		<span class="tblText">결제정보</span>
		<table class="orderTbl tdCenter" style="margin-bottom: 10px;">
		
		<thead>
			<tr>
				<th style="width:15%">결제방법</th>
				<th style="width:25%">결제금액</th>
				<th style="width:60%">세부내역</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<tr>
				<td>사용한 적립금</td>
				<td>원</td>
				<td></td>
			</tr>
			
			<tr>
				<td>사용한 예치금</td>
				<td>원</td>
				<td></td>
			</tr>
			
			<tr>
				<td>카드</td>
				<td>2,500원[입금상태]</td>
				<td>[영수증]</td>
			</tr>
		</tbody>
		</table>
		
		<span id="orderBtn1" onclick="alert('결제대금의 환불/취소는 쇼핑몰로 연락주시기 바랍니다.')">주문취소</span>
	</div>
	
	
	<div class="tabContent" id="menu2" >
		상품후기상품후기상품후기상품후기상품후기상품후기상품후기상품후기상품후기
		<div class="prod">
			<table class="reviewTbl">
				<tbody>
					<tr>
						<td><img alt="img" src="../hm_img/product.png" width="50px" height="50px"></td>
						<td>더리얼 그레인프리 오븐베이크드 어덜트 50g X 3종</td>
						<td>수량: 1</td>
						<td>금액: 5,000</td>
						<td><span id="writeReview">후기작성</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<div style="text-align: center; margin-top: 30px;">
	<span id="closeBtn" onclick="self.close()">닫기</span>
	</div>
</body>
</html>