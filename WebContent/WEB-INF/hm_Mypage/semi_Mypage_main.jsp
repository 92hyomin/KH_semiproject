<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

.hm_a{ text-decoration: none; color: black;}
.hm_a:hover{ text-decoration: none; color: #9d6849; }

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


<body>

<div id="login_container">
	<span id="top_comment">Home>Mypage>마이페이지 메인</span><br>
	<h1 class="hm_h1">마이페이지</h1>
	<div id="myinfo">
		<div class="row" style="margin: 0 auto;">
			<table id="myinfobox">
			    <tr>
				    <td class="myinfo_left" colspan="4" >
					    <p id="gradeimg"><img src="../hm_img/gradeimg.gif" style="border-radius: 100%;"/></p>
					    <p id="gradetxt">[아이디]님은 <span style="color: #916b4a;">First Member</span>등급입니다.</p>
					    <ul class="hm">
					    <li id="infoli"><button id="myinfobtn" type="button">등급별 혜택</button></li>
					    <li id="infoli"><button id="myinfobtn" type="button" onclick="location.href='<%= ctxPath %>/mypage/myInfoEdit.dog'">회원정보수정</button></li>
					    </ul>
				    </td>
				    <td rowspan="2" style="background-color: #2d2926; color: white;">
				    	사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 
				    	사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 사진넣는곳 
				    </td>
			    </tr>
			    <tr >
				    <td>
				    	<a class="leftMenu hm_a" href="<%= ctxPath %>/mypage/myshopping.dog?tabMenu=1">
					    <p id="bottom_img"><img src="../hm_img/orderList.png" width=50px  style="background-color:white; border-radius: 100%;"/></p>
						주문<br/>
					    <strong style="color: #ff4800;">0원</strong>
				    	</a>
				    </td>
				    <td>
				    	<a class="leftMenu hm_a" href="<%= ctxPath %>/mypage/myshopping.dog?tabMenu=2">
					    <p id="bottom_img"><img src="../hm_img/reserve.png" width=50px  style="background-color:white; border-radius: 100%;"/></p>
					    적립금<br/>
					    <strong style="color: #ff4800;">0원</strong>
					    </a>
					</td>

			    </tr>
		    </table>
  		</div>
	</div>
	
	<%@include file="semi_Mypage_Submenu.jsp" %>
  
<div id="recentlyOrderList">
	<!-- 최근주문내역 -->
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
	</div>
 	
</body>



<%@include file="../footer_dog.jsp" %>






