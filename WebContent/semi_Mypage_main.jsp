<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
}

ul.hm li a {
	color: black;
}

li{
	list-style-type: none;
}

#gradeimg{
	float: left;
	margin-right: 30px;
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

.img{
	float: left;
	margin-right: 10px;
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
}

.tabClick{
	border-bottom: solid 2px #9d6849;
	color: #9d6849;
}

.subtabClick{
	color: #9d6849 !important;
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

a{ text-decoration: none; color: black;}
a:hover{ text-decoration: none; color: #9d6849; }


</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".subTab").hide();
	$("#subTab1").show();
	$("#tab1").addClass("tabClick")
	$("#subtabli1 > a").addClass('subtabClick');
	
	$(".tabMenu").click(function(){
		$(".subTab").hide();
		$(".tabMenu").removeClass("tabClick");
		var activeTab = $(this).attr("rel");
        $("#" + activeTab).show()
		$(this).addClass("tabClick");
	});
	
	

});
</script>
<%@include file="header_dog.jsp" %>
</head>
<body>
<div id="login_container">
	<span id="top_comment">Home>Mypage>마이페이지 메인</span><br>
	<h1 class="hm_h1">마이페이지</h1>
	<div id="myinfo">
		<div class="row" style="margin: 0 auto;">
			<table id="myinfobox">
			    <tr>
				    <td class="myinfo_left" colspan="4" >
					    <p id="gradeimg"><img src="img/royalimg_RQ04.gif" style="border-radius: 100%;"/></p>
					    <p id="gradetxt">[아이디]님은 <span style="color: #916b4a;">First Member</span>등급입니다.</p>
					    <ul class="hm">
					    <li id="infoli"><button id="myinfobtn" type="button">등급별 혜택</button></li>
					    <li id="infoli"><button id="myinfobtn" type="button">회원정보수정</button></li>
					    </ul>
				    </td>
				    <td rowspan="2" style="background-color: #2d2926; color: white;">
				    	가장 맛있는시간 30일 골드멤버가 되기위해 5개의 밥그릇을 채워주세요.
				    </td>
			    </tr>
			    <tr >
				    <td>
				    	<a class="leftMenu" href="semi_Mypage_Myshopping.jsp?tabMenu=1">
					    <p id="bottom_img"><img src="img/orderList.png" width=50px  style="background-color:white; border-radius: 100%;"/></p>
						주문<br/>
					    <strong style="color: #ff4800;">0원</strong>
				    	</a>
				    </td>
				    <td>
				    	<a class="leftMenu" href="semi_Mypage_Myshopping.jsp?tabMenu=2">
					    <p id="bottom_img"><img src="img/reserve.png" width=50px  style="background-color:white; border-radius: 100%;"/></p>
					    적립금<br/>
					    <strong style="color: #ff4800;">0원</strong>
					    </a>
					</td>
				    <td>
					    <a class="leftMenu" href="semi_Mypage_Myshopping.jsp?tabMenu=3">
					    <p id="bottom_img"><img src="img/point.png" width=50px  style="background-color:white; border-radius: 100%;"/></p>
					    포인트<br/>
					    <strong style="color: #ff4800;">0점</strong>
					    </a>
					</td>
				    <td>
					    <a class="leftMenu" href="semi_Mypage_Myshopping.jsp?tabMenu=4">
					    <p id="bottom_img"><img src="img/coupon.png" width=50px  style="background-color:white; border-radius: 100%;"/></p>
					    쿠폰<br/>
					    <strong style="color: #ff4800;">0개</strong>
					    </a>
				    </td>
			    </tr>
		    </table>
  		</div>
	</div>
	
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
  
  <div id="recentlyOrderList">
  	<!-- 최근주문내역 -->
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
  </div>
 </div>
 	
</body>



<%@include file="footer_dog.jsp" %>





