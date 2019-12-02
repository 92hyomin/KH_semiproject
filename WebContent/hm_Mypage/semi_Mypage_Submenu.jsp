<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		    <li id="subtabli3" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=3">포인트 내역(삭제)</a></li><span>|</span>
		    <li id="subtabli4" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=4">쿠폰 내역(삭제)</a></li>
	    </ul>
    </div>
    
    <div id="subTab2" class="subTab" style="margin: 20px 0 0 0;">
	    <ul class="hm" id="subtab2" style="padding: 0; ">
		    <li id="subtabli5" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=5">최근 본 상품</a></li><span>|</span>
		    <li id="subtabli6" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=6">관심 상품</a></li><span>|</span>
		    <li id="subtabli7" class="subtabli"><a href="semi_Mypage_QnA.jsp">1:1 문의</a></li><span>|</span>
		    <li id="subtabli8" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=8">내 게시글</a></li>
	    </ul>
    </div>
    
    <div id="subTab3" class="subTab" style="margin: 20px 0 0 0;">
	    <ul class="hm" id="subtab3" style="padding: 0; ">
		    <li id="subtabli9" class="subtabli"><a href="passwordCheck.jsp">정보수정</a></li><span>|</span>
		    <li id="subtabli10" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=10">나의 반려동물 정보</a></li><span>|</span>
		    <li id="subtabli11" class="subtabli"><a href="semi_Mypage_Myshopping.jsp?tabMenu=11" >회원탈퇴</a></li>
	    </ul>
    </div>