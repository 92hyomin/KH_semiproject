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

.hm_a{ text-decoration: none; color: black;}
.hm_a:hover{ text-decoration: none; color: #9d6849; }

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
		<%@include file="semi_Mypage_recentlyOrder.jsp" %>
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
		<%@include file="semi_Mypage_Reserve.jsp" %>
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
		<%@include file="semi_Mypage_RecentlyViewProd.jsp" %>
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
		<%@include file="semi_Mypage_WishList.jsp" %>
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
		<%@include file="semi_Mypage_MyPost.jsp" %>	
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
		<%@include file="semi_Mypage_MyPet.jsp" %>	
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
		<%@include file="semi_Mypage_DelUser.jsp" %>	
			
		</c:if>
</body>


<%@include file="../footer_dog.jsp" %>






