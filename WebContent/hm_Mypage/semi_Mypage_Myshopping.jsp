<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header_dog.jsp" %>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
#login_container {
	/* border: dashed 1px gray; */
	width: 70%;
	margin: 0 auto;
	margin-bottom: 10px;
	font-family: 'Nanum Gothic', '나눔고딕', '돋움', Dotum, sans-serif;
	color: black;
}

#top_comment {
	color: gray;
	float: right;
	font-size: 9pt;
}

#myinfo{
	background: #f4f4f4;
	margin: 0 auto;
	margin-bottom: 50px;
	padding: 40px;
}

#myinfobox{
	width: 100%;
}

.myinfo_txt{
	text-align: center;
	font-size: 15pt;
	font-weight: bold;
	list-style-type: none;
	cursor: pointer;
}

.myinfobox_txt{
	text-align: center;
	font-size: 10pt;
	list-style-type: none;
	cursor: pointer;
}

.col-md-4{
	border-bottom: solid 2px #c1c1c1;
}

ul.hm{
	display: inline;
	color: black;
}

li{
	list-style-type: none;
}

#myinfobtn{
	/* border: solid 1px #ddd; */
	border: solid 1px #ddd;
	background-color: white;
	color: #666;
	width: 100px;
	height: 30px;
	font-size: 10pt;
}

#infoli{
	float: left;
	margin-right: 5px;
}

#gradetxt{
	font-size: 15pt;
	color: #666;
	padding-top: 10px;

}

#bottom_img{
	float: left;
	margin-right: 15px;
}

.myinfo_left{
	/* border: dashed 1px black; */
	width: 60%;
	padding-bottom: 30px;
}

.subtabli{
	display: inline-block;
	margin: 5px 10px;
	cursor: pointer;
	color: #666;
	text-decoration: none;
}

.tabClick{
	border-bottom: solid 2px #9d6849;
	color: #9d6849;
}

.subtabClick{
	color: #9d6849;
	font-weight: bold;
}

.hm_h1{
	text-align: center;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 70px;
	font-weight: bold;
	font-family: 'Notokr', sans-serif;
}

.leftMenu{ cursor: pointer; }

.msg{
	color: #626262;
	padding-top: 20px;
}
.hm_thead > tr > th{ font-size: 10pt; text-align: center;}
.hm_tbody{ font-size: 9pt;  text-align: center;}

#couponArea{ text-align: center; }

a{ text-decoration: none; color: black;}
a:hover{ text-decoration: none; color: #9d6849; }

#prodName, #prodPrice{
	width: 200px;
	text-align: center;
}

.prodImg{
	width: 200px;
	height: 200px;
}

#prodPrice{
	font-size: 15pt;
	font-weight: bold;
}

.wishProd{
	padding-left: 30px;
}

.recentlyProd, .wishProd{
	cursor: pointer; 
}

.wishListDiv, .recentlyProdDiv, .myPetInfoDiv{
	display: inline-block;
	width: 100%;
}

#selectProdDel{
	float: right;
	margin-top: 20px;
	margin-bottom: 100px;
	border: solid 1px silver; 
	font-weight: bold; 
	background-color: white;
	width: 130px;
	height: 40px;
}

.mypetInfo{
	border: solid 1px silver;
	width: 270px;
	height: 400px;
	margin: 5px 5px 0 5px;
	padding-left: 0;
	padding-right: 0;
}

.mypetInfo img{
	margin-top: 20px;
	margin-left: 20px;
	width: 200px;
	height: 200px;
	margin-bottom: 20px;
}

.myPetTxt{
	margin-left: 30px;
	margin-bottom: 5px;
	font-size: 9pt;
}

.myPetBtn{
	width: 134px; 
	font-weight: bold;
	border: solid 1px silver;
	background-color: #f2f2f2;
	height: 30px;
	margin-top: 20px;
}

.ptxt{
	text-align: center;
	color: gray;
}

.input_textarea{
	width: 100%;
	height: 280px;
	margin-top: 30px;
	margin-bottom: 50px;
	border: solid 1px silver;
}

.btn{
	width: 230px;
	height: 50px;
	border: solid 1px #231f20;
	padding: 15px;
	font-size: 12pt;
	border-radius: 0px;
}

#btnArea{
	text-align: center;
	margin-bottom: 50px;
}

.delUserBtn{
	background-color: #231f20;
	color: white;
}

.cancelBtn{
	background-color: white;
	color: #231f20;
}

</style>
<script type="text/javascript">
$(document).ready(function(){

	$(".tabMenu").click(function(){
		$(".subTab").hide();
		$(".tabMenu").removeClass("tabClick");
		var activeTab = $(this).attr("rel");
        $("#" + activeTab).show()
		$(this).addClass("tabClick");
	});
	
	$(".delUserBtn").hover(
			function(){
				$(this).removeClass("delUserBtn");
				$(this).addClass("cancelBtn");
			},
			function(){
				$(this).removeClass("cancelBtn");
				$(this).addClass("delUserBtn");
			});
		
	$(".cancelBtn").hover(
		function(){
			$(this).removeClass("cancelBtn");
			$(this).addClass("delUserBtn");
			$(this).css("color","white");
		},
		function(){
			$(this).removeClass("delUserBtn");
			$(this).addClass("cancelBtn");
			$(this).css("color","#231f20");
		});
	
	$("#delUserBtn").click(function(){
		delMember();		
	});

});

function delMember(){
	if(confirm("회원을 탈퇴하시겠습니까?") == true){
		
		////////////////////////
		/* 회원탈퇴 작업 작성 */
		////////////////////////
		
		alert("회원탈퇴가 완료되었습니다.")
		location.href="semi_Mypage_Myshopping.jsp?tabMenu=1";
	}
	else{
		location.href="semi_Mypage_Myshopping.jsp?tabMenu=1";
		return;
	}
}
</script>

<body>
<div id="login_container">
	<span id="top_comment"></span><br>
	<h1 class="hm_h1">마이페이지</h1>
		
	<%@include file="semi_Mypage_Submenu.jsp" %>
    
    
    
	<div id="myHistory">
	
	<!-- 최근주문내역 -->
	<c:if test="${param.tabMenu eq 1}">
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
						<td>test</td>
						<td>test</td>
					</tr>
				</tbody>
			</table>
	</c:if>
	
	
	<!-- 적립금 내역 -->
	<c:if test="${param.tabMenu eq 2}">
	<script type="text/javascript">
		$("#subtabli2 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab1").addClass("tabClick")
		$(".subTab:first").show();
		$("#top_comment").html("Home>Mypage>적립금 내역");
	</script>
	<h4 style="font-weight: bold; margin-top: 40px;">적립금 내역</h4>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
				<thead class="hm_thead">
					<tr>
						<th>날짜</th>
						<th>내용</th>
						<th>적립금</th>
					</tr>
				</thead>
				<tbody class="hm_tbody">
					<tr>
						<td>2019-11-21</td>
						<td>사료1000개 구입</td>
						<td>+50,000원</td>
					</tr>
				</tbody>
			</table>
	</c:if>
	
	<!-- 포인트내역 -->
	<c:if test="${param.tabMenu eq 3}">
	<script type="text/javascript">
		$("#subtabli3 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab1").addClass("tabClick")
		$(".subTab:first").show();
		$("#top_comment").html("Home>Mypage>포인트 내역");
	</script>
	<h4 style="font-weight: bold; margin-top: 40px;">포인트 내역</h4>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
				<thead class="hm_thead">
					<tr>
						<th>날짜</th>
						<th>내용</th>
						<th>포인트</th>
					</tr>
				</thead>
				<tbody class="hm_tbody">
					<tr>
						<td>2019-11-21</td>
						<td>사료1000개 구입</td>
						<td>+300,000점</td>
					</tr>
				</tbody>
			</table>
	</c:if>
	
	
	<!-- 쿠폰내역 -->
	<c:if test="${param.tabMenu eq 4}">
	<script type="text/javascript">
		$("#subtabli4 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab1").addClass("tabClick")
		$(".subTab:first").show();
		$("#top_comment").html("Home>Mypage>쿠폰내역");
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			
			<!-- 쿠폰등록창 -->
			<hr style="border: solid 0.5px silver;">
			<div id="couponArea">
				<strong>쿠폰등록</strong>
				<input type="text" size="50" style="height: 35px; border: solid 0.5px silver;"></input>
				<button type="button" style="height: 35px; border: solid 0.5px silver; background-color: silver; color: white;">쿠폰번호 등록</button>
			</div>
			
			<!-- 쿠폰목록 -->
			<hr style="border: solid 0.5px silver;" >
				<thead class="hm_thead">
					<tr>
						<th>번호</th>
						<th>쿠폰명</th>
						<th>할인금액/적립금액(%)</th>
						<th>제한금액</th>
						<th>적용품목</th>
						<th>사용기간</th>
					</tr>
				</thead>
				<tbody class="hm_tbody">
					<tr>
						<td>60934128</td>
						<td>신규회원 5,000원 샘플 구매 쿠폰	</td>
						<td>할인액 5,000원</td>
						<td>제한없음</td>
						<td>하림펫푸드 Mall > 샘플신청</td>
						<td>2019.11.14~2019.12.15</td>
					</tr>
				</tbody>
			</table>
	</c:if>
	
	
	<!-- 나의활동->최근 본 상품 -->
	<c:if test="${param.tabMenu eq 5}">
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
	</c:if>
	
	
	<!-- 나의활동->관심 상품 -->
	<c:if test="${param.tabMenu eq 6}">
	<script type="text/javascript">
		$("#subtabli6 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab2").addClass("tabClick")
		$(".subTab:eq(1)").show();
		$("#top_comment").html("Home>Mypage>관심 상품");
	</script>
		<hr style="border: solid 0.5px gray; margin-top: 50px;">
		<div class="wishListDiv">
				<div class="wishProd col-md-3">
					<img class="prodImg" src="../hm_img/product.png"/>
					<p id="prodName"><input type="checkbox" /><br/>[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
					<p id="prodPrice">4,200원</p>
				</div>
				<div class="wishProd col-md-3">
					<img class="prodImg" src="../hm_img/product.png"/>
					<p id="prodName"><input type="checkbox" /><br/>[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
					<p id="prodPrice">4,200원</p>
				</div>
				<div class="wishProd col-md-3">
					<img class="prodImg" src="../hm_img/product.png"/>
					<p id="prodName"><input type="checkbox" /><br/>[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
					<p id="prodPrice">4,200원</p>
				</div>
				<div class="wishProd col-md-3">
					<img class="prodImg" src="../hm_img/product.png"/>
					<p id="prodName"><input type="checkbox" /><br/>[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
					<p id="prodPrice">4,200원</p>
				</div>
				<div class="wishProd col-md-3">
					<img class="prodImg" src="../hm_img/product.png"/>
					<p id="prodName"><input type="checkbox" /><br/>[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
					<p id="prodPrice">4,200원</p>
				</div>
				<div class="wishProd col-md-3">
					<img class="prodImg" src="../hm_img/product.png"/>
					<p id="prodName"><input type="checkbox" /><br/>[12/27생산] 가장맛있는시간30일 스마트 발란스 시니어 500g</p>
					<p id="prodPrice">4,200원</p>
				</div>
		</div>
		<hr style="border: solid 0.5px gray;">
		<button id="selectProdDel" type="button">선택상품 삭제</button>
	</c:if>
	
	
	
	<!-- 나의활동->내 게시글-->
	<c:if test="${param.tabMenu eq 8}">
	<script type="text/javascript">
		$("#subtabli8 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab2").addClass("tabClick")
		$(".subTab:eq(1)").show();
		$("#top_comment").html("Home>Mypage>내 게시글");
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			<h4 style="font-weight: bold; margin-top: 40px;">내 게시글</h4>
				<thead class="hm_thead">
					<tr>
						<th>NO.</th>
						<th>BOARD</th>
						<th>SUBJECT</th>
						<th>DATE</th>
						<th>HITS</th>
					</tr>
				</thead>
				<tbody class="hm_tbody">
					<tr>
						<td>1</td>
						<td>게시판</td>
						<td>제목제목제목제목</td>
						<td>2019-11-19</td>
						<td>19</td>
					</tr>
				</tbody>
			</table>
	</c:if>
	
	<!-- 나의 반려동물 정보 -->
	<c:if test="${param.tabMenu eq 10}">
	<script type="text/javascript">
		$("#subtabli10 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab3").addClass("tabClick")
		$(".subTab:eq(2)").show();
		$("#top_comment").html("Home>Mypage>반려동물 정보");
	</script>
		<div style="border-top: solid 1px black; border-bottom: solid 1px black; width: 500px; text-align: center; margin: 50px auto; padding: 10px;">
		<span style="font-size: 13pt;">[이름]님께서 등록한 반려 동물은 <strong style="color: #da291c; font-size: 15pt;">총[마리수]</strong> 입니다.</span>
		</div>
		
		<div class="myPetInfoDiv" >
			<div class="mypetInfo col-md-3">
			<table>
			<tr><td colspan="2">
				<img src="../hm_img/mypet.png" style="border-radius: 100%;">
				<p class="myPetTxt">이름: [반려동물이름]</p>
				<p class="myPetTxt">견종: [견종]</p>
				<p class="myPetTxt">체중: [체중]kg</p>
				<p class="myPetTxt">성별: [성별]</p>
				<p class="myPetTxt">생년: [생년월일]</p>
			</tr></td>
			<tr>
				<td style="width: 50%;"><button class="myPetBtn" type="button">수정</button></td>
				<td style="width: 50%;"><button class="myPetBtn" type="button">삭제</button></td>
			</tr>
			</table>
			</div>
		
			<div class="mypetInfo col-md-3" style="padding-top: 80px;">
				<img src="../hm_img/addPetimg.png">
			</div>
		</div>
	</c:if>
	
	
	<!-- 회원탈퇴 -->
	<c:if test="${param.tabMenu eq 11}">
	<script type="text/javascript">
		$("#subtabli11 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab3").addClass("tabClick")
		$(".subTab:eq(2)").show();
		$("#top_comment").html("Home>Mypage>회원탈퇴");
	</script>
	
	<h1 class="hm_h1" style="margin-bottom: 20px; margin-top: 100px;">회원정보 탈퇴신청</h1>
	<p class="ptxt">
	저희 쇼핑몰의 부족했던 점과 아쉬웠던 점을 적어주십시오. 더 좋은 모습으로 발전하도록 최선을 다하겠습니다. <br/>
	앞으로 더 나은 모습으로 고객님을 다시 만날 수 있도록 노력하겠습니다. 그동안 이용해주신 것을 진심으로 감사드립니다. <br />
	</p>
	<p class="ptxt" style="color: black;">탈퇴 사유를 적어주시면 쇼핑몰 운영에 적극 반영하겠습니다.</p>
	
	<textarea class="input_textarea" rows="10" cols="70"></textarea>
	
	<div id="btnArea">
		<a class="btn delUserBtn" id="delUserBtn">회원탈퇴</a>
		<a class="btn cancelBtn" id="cancelBtn" href="javascript:history.back()">취소하기</a>
	</div>
			
	</c:if>
</body>


<%@include file="../footer_dog.jsp" %>






