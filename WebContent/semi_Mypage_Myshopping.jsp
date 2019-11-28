<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header_dog.jsp" %>


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

});
</script>

<body>
<div id="login_container">
	<span id="top_comment">Home>Mypage>주문서 리스트</span><br>
	<h1 class="hm_h1">마이페이지</h1>
		
	<div class="row" style="margin: 0 auto; ">
		<ul class="hm">
		    <li class="myinfo_txt"><div id="tab1" class="col-md-4 tabMenu" rel="subTab1">나의 쇼핑/주문</div></li>
		    <li class="myinfo_txt"><div id="tab2" class="col-md-4 tabMenu" rel="subTab2">나의 활동</div></li>
		    <li class="myinfo_txt"><div id="tab3" class="col-md-4 tabMenu" rel="subTab3">나의 정보수정</div></li>
	    </ul>
	</div>
	<div id="subTab1" class="subTab" style="margin: 20px 0 0 0;">
	    <ul class="hm" id="subtab1" style="padding: 0; ">
		    <li id="subtabli1" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=1" >주문목록/배송 조회</a></li><span>|</span>
		    <li id="subtabli2" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=2">적립금 내역</a></li><span>|</span>
		    <li id="subtabli3" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=3">포인트 내역</a></li><span>|</span>
		    <li id="subtabli4" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=4">쿠폰 내역</a></li>
	    </ul>
    </div>
    
    <div id="subTab2" class="subTab" style="margin: 20px 0 0 0;">
	    <ul class="hm" id="subtab2" style="padding: 0; ">
		    <li id="subtabli5" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=5">최근 본 상품</a></li><span>|</span>
		    <li id="subtabli6" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=6">관심 상품</a></li><span>|</span>
		    <li id="subtabli7" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=7">1:1 문의</a></li><span>|</span>
		    <li id="subtabli8" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=8">내 게시글</a></li>
	    </ul>
    </div>
    
    <div id="subTab3" class="subTab" style="margin: 20px 0 0 0;">
	    <ul class="hm" id="subtab3" style="padding: 0; ">
		    <li id="subtabli9" class="subtabli"><a href="semi_Mypage_MyInfoEdit.jsp">정보수정</a></li><span>|</span>
		    <li id="subtabli10" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=10">나의 반려동물 정보</a></li><span>|</span>
		    <li id="subtabli11" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=11">회원탈퇴</a></li>
	    </ul>
    </div>
    
    
    
	<div id="myHistory">
	
	<!-- 최근주문내역 -->
	<c:if test="${param.tabMenu eq 1}">
	<%-- <c:if test="${empty requestScope.memberList}">
		<tr>
			<td colspan="5">가입된 회원이 없습니다</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty requestScope.memberList}">
		<c:forEach var="membervo" items="${requestScope.memberList}">
			<tr>
				<td>${membervo.idx }</td>
				<td>${membervo.userid }</td>
				<td>${membervo.name }</td>
				<td>${membervo.email }</td>
				<td>${membervo.gender }</td>
			</tr>
		</c:forEach>
	</c:if> --%>
	<script type="text/javascript">
		$("#subtabli1 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab1").addClass("tabClick")
		$(".subTab:first").show();
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
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			
			<hr style="border: solid 0.5px silver;">
			<h1>최근 본 상품최근 본 상품최근 본 상품최근 본 상품최근 본 상품최근 본 상품최근 본 상품</h1>
			</table>
	</c:if>
	
	
	<!-- 나의활동->관심 상품 -->
	<c:if test="${param.tabMenu eq 6}">
	<script type="text/javascript">
		$("#subtabli6 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab2").addClass("tabClick")
		$(".subTab:eq(1)").show();
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			
			<hr style="border: solid 0.5px silver;" >
			<h1>관심 상품관심 상품관심 상품관심 상품관심 상품관심 상품관심 상품관심 상품</h1>
			
			</table>
	</c:if>
	
	<!-- 나의활동->1:1문의-->
	<c:if test="${param.tabMenu eq 7}">
	<script type="text/javascript">
		$("#subtabli7 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab2").addClass("tabClick")
		$(".subTab:eq(1)").show();
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			
			<hr style="border: solid 0.5px silver;">
			<h1>없는페이지</h1>
			</table>
	</c:if>
	
	<!-- 나의활동->내 게시글-->
	<c:if test="${param.tabMenu eq 8}">
	<script type="text/javascript">
		$("#subtabli8 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab2").addClass("tabClick")
		$(".subTab:eq(1)").show();
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
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			
			<hr style="border: solid 0.5px silver;" >
			<h1>반려동물 정보 반려동물 정보 반려동물 정보 반려동물 정보 반려동물 정보 반려동물 정보 </h1>
			
			</table>
	</c:if>
	
	<!-- 회원탈퇴 -->
	<c:if test="${param.tabMenu eq 11}">
	<script type="text/javascript">
		$("#subtabli11 > a").addClass('subtabClick');
		$(".subTab").hide();
		$("#tab3").addClass("tabClick")
		$(".subTab:eq(2)").show();
	</script>
			<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
			
			<hr style="border: solid 0.5px silver;" >
			<h1>탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴</h1>
			
			</table>
	</c:if>
	</div>
	</div>
</body>


<%@include file="footer_dog.jsp" %>






