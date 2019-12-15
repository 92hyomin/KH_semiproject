<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>항상 건강을 생각하는 기업! 하빈 펫푸드</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

  
  
  <style>
  	
  	#header , #footer {
  		font-family: 'Notokr', sans-serif;
  	}
  	
    ul {
    	margin:0;
        padding:0;
    }
 	
    #header a {
    	text-decoration: none;
        cursor: pointer;
    }
    
    #header1 {
    	height: 100px;
    }
    
    #loginBar {
    	list-style: none;
        float:right;
    }
    
    #loginBar li {
    	display: inline-block;
        margin: 20px 0 0 30px;
    }
    
    #loginBar li a {
    	color: #999999;
    }
    
    #header2 {
    	border-bottom: solid 2px black;
        background-color: white;
        z-index: 100;
        position: relative;
    }
    
    #navbar {
    	
        background-color: white;
        
    }
    
    #navbarUl li a {
    	color: black;
    }
    
    #navbarUl li a:hover {
    	color: #996633;
    }
    
    #navbarMenu li {
    	display: inline-block;
        
    }
    
    #search {
    	border: none;
        padding-left: 20px;
        padding-bottom: 2px;
    }
    
    #search:focus {
    	outline:none;
        color: #999999;
    }
    
    #dropContent {
    	display : none;
        background-color: white;
        position: absolute;
        border-top: solid 2px black;
        width: 100%;
        
    }
    
    .dropCntMenu {
    	display: inline-block;
        vertical-align: top;
    }
    
    .dropCntMenu ul {
    	list-style:none;
        padding: 35px 0 35px 0;
    }
    
    .dropCntMenu ul li {
    	margin: 8px 0 8px 0;
    }
    
    .dropCntMenu a {
    	color: #999999;
    }
    
    #navbar:hover #dropContent {
    	display: block;
    }
    
    .notification .badge {
		position: absolute;
		top: -10px;
		right: -10px;
		padding: 3px 7px;
		border-radius: 50%;
		background-color: red;
		color: white;
	}
    
    #imageBox {
    
    	margin: 35px 0 35px 0;
    	border: solid 1px black;
    	height: 130px;
    }
    
    
    
    
    /* footer css */
    
    #footer {
    	text-align: left;
        padding: 40px 0;
        border-top: solid 2px black;
        height: 260px;
        clear:both;
    }
    
    .footer-box {
    	display: inline-block;
        vertical-align: top;
       
    }
    
    .fb_title {
    	text-align:left;
    	font-size: 13pt;
        font-weight: bold;
        margin-bottom: 10px;
    }
    
    .fb_content {
    	text-align:left;
        font-size: 9pt;
    }
    
    .fb_content > div {
    	margin: 5px 0;
        color: #999999;
    }
    
    #fb_images li {
    	display: inline-block;
    }
    
    #footerDropContent {
    	position: absolute;
        display: none;
        background-color: white;
        list-style: none;
        width: 160px;
        border-top: solid 1px black;
        background-color: #f2f2f2;
    }
    
    #footerDropContent li {
        text-align: left;
        margin:2px 0 2px 20px;
    }
    
    #footerDropContent li a {
    	color: black;
    }
    
    #footerDropMenu:hover #footerDropContent{
    	display: block;
    }
    
    #footer a {
    	cursor: pointer;
    	font-size: 9pt;
        color: #999999;
        text-decoration: none;
    }
    
    #footerDropMenu {
    	border-bottom: solid 1px black;
    }
    
    #fdm_title {
    	font-size:10pt;
        padding-left: 7px;
    }
    
  </style>
  
  <script>
  
  	$(function(){ 
    	
		var nav = $("#navbar").height();
		var header = $("#header").height();
		
		$(window).scroll( function(){ 
			
			if( pageYOffset > header ){
				$("#header1").css("display","none");
				$("#header2").css("position", "fixed");
               	$("#header2").css("width","100%");
                $("#header2").css("margin","0");
				
			}
			else {
            	$("#header1").css("display","");
				$("#header2").css("position", "relative");
				$("#header2").css("width","");
			}
			
		} );

    });
  	
  </script>
  
</head>
<body>

<div id="header">
	<div id="header1" >
    	<div class="col-xs-9 col-md-2"></div>
        <div class="col-xs-9 col-md-8">
        	<img width="300" height="80" src="/Semi_Team1/images/mainLogo.png" style="margin-top:20px;cursor:pointer;" onclick="javascript:location.href=">
  			<ul id ="loginBar">
  				<li><a href="">LOGIN</a></li>
   				<li><a href="">JOIN</a></li>
  				<li><a href="">ORDER</a></li>
    			<li><a href="">CUSTOMER</a></li>
  			</ul>
        </div>
  		
    </div>  
    
	<div id="header2" class="row">
   		<div class="col-xs-9 col-md-2"></div>	
        <div class="col-xs-9 col-md-8" id="navbar">
        	<div  id="navbarMenu">
            	<ul id="navbarUl">
                	<li style="width:8%;font-weight:bold;font-size:13pt;text-align:center;padding:15px 0;"><img alt="" src="/Semi_Team1/images/list.png"></li>
                    <li style="width:10%;font-weight:bold;font-size:13pt;"><a href="">브랜드</a></li>
                    <li style="width:10%;font-weight:bold;font-size:13pt;"><a href="">구매하기</a></li>
                    <li style="width:10%;font-weight:bold;font-size:13pt;"><a href="">매거진</a></li>
                    <li style="width:10%;font-weight:bold;font-size:13pt;"><a href="">우리 이야기</a></li>
                    <li style="width:10%;font-weight:bold;font-size:13pt;text-align:center;"><a href="">투어신청</a></li>
                    <li style="width:7%;"></li>
                    <li style="width:16%; position:relative; border-bottom:solid 1px black;">
                    	<input id="search" size="15" onclick="" />
                    	<a id="searchIcon"><img width="23" height="23" src="/Semi_Team1/images/search.png" /></a>
                    </li>
                    <li style="width:7%; text-align: end;"><a href=""><img src="/Semi_Team1/images/user-image-with-black-background.png"></a></li>
                    <li style="width:7%; text-align: end;"><a href="" style="padding:0; position: relative;" class="notification"><img alt="장바구니" src="/Semi_Team1/images/shopping-cart.png"><span class="badge">0</span></a></li>
                </ul>
            </div>
            
            <div>
                <ul id="dropContent">
                	<li class="dropCntMenu" style="width:8%;"></li>
                    <li class="dropCntMenu" style="width:10%;">
                    	<ul>
                        	<li><a href="">더리얼</a></li>
                            <li><a href="">더리얼(냉동군)</a></li>
                            <li><a href="">밥이보약</a></li>
                            <li><a href="">더베터</a></li>
                        </ul>
                    </li>
                    <li class="dropCntMenu" style="width:10%;">
                    	<ul>
                        	<li><a href="">브랜드별</a></li>
                            <li><a href="">연령별</a></li>
                            <li><a href="">샘플신청</a></li>
                            <li><a href="">상품후기</a></li>
                        </ul>
                    </li>
                    <li class="dropCntMenu" style="width:10%;">
                    	<ul>
                        	<li><a href="">칼로리 계산기</a></li>
                            <li><a href="">영양성분</a></li>
                            <li><a href="">원료사전</a></li>
                            <li><a href="">이벤트</a></li>
                        </ul>
                    </li>
                    <li class="dropCntMenu">
                    	<ul>
                        	<li><a href="">우리이야기</a></li>
                            <li><a href="">우리의약속</a></li>
                            <li><a href="">100%휴먼그레이드</a></li>
                            <li><a href="">이노베이션</a></li>
                            <li><a href="">제조시설</a></li>
                            <li><a href="">반려견 동반</a></li>
                        </ul>
                    </li>
                    <li class="dropCntMenu" style="width:15%;"></li>
                    <li class="dropCntMenu" style="width:25%;">
                    	<div id="imageBox">
                    		<a href="">이미지</a>
                    	</div>
                    </li>
                </ul>
            </div>
            
		</div>
   
	</div>
  
</div>
    
    
<div style="height: 2000px;background-color:green;">    
    안 보이면 좋은 페이지
</div>    


<div id="footer">
	<div class="col-xs-9 col-md-2"></div>
    <div class="col-xs-9 col-md-8" style="padding:0;text-align:center;">
      <div class="footer-box" style="width:20%">
          <div class="fb_title">COMPANY INFO</div>
          <div class="fb_content">
              <div>㈜ 하빈펫푸드</div>
              <div>대표 : 정하빈</div>
              <div>인천광역시 서구</div>
              <div>사업자 등록 번호 : 240-81-00698</div>
          </div>
      </div>
      <div class="footer-box" style="width:20%">
          <div class="fb_title">CUSTOMER CENTER</div>
          <div class="fb_content">
              <div style="font-size:20pt;color:red;font-weight:bold;">080-850-0085</div>
              <div>Open : AM 09:00 ~ PM 06:00</div>
              <div>Lunch : PM 12:00 ~ PM 01:00</div>
              <div>토, 일, 공휴일 휴무</div>
          </div>
      </div>
      <div class="footer-box" style="width:17%">
          <div class="fb_title">SITE INFO</div>
          <div class="fb_content">
              <div><a href="">우리의 이야기</a></div>
              <div><a href="">이용약관</a></div>
              <div><a href="">개인정보처리방침</a></div>
              <div><a href="">사업자정보확인</a></div>
              <div><a href="">방문판매원찾기</a></div>
          </div>
      </div>
      <div class="footer-box" style="width:15%;">
          <ul style="list-style: none;">
              <li id="footerDropMenu" style="text-align:left;">
                  <span id="fdm_title">FAMILY SITE</span>
                      <ul id="footerDropContent">
                          <li><a href="">(주)하림</a></li>
                          <li><a href="">하림몰</a></li>
                          <li><a href="">선진</a></li>
                          <li><a href="">팜스코</a></li>
                          <li><a href="">주원산오리</a></li>
                          <li><a href="">NS홈쇼핑</a></li>
                          <li><a href="">멕시칸치킨</a></li>
                          <li><a href="">디디치킨</a></li>
                      </ul>
              </li>
          </ul>
          <br>
          <br>
          <br>
          <ul id="fb_images"  style="text-align:right;">
              <li><a href=""><img src="/Semi_Team1/images/facebook-logo.png"></a></li>
              <li><a href=""><img src="/Semi_Team1/images/naver_blog_logo.png" width="32" height="32" ></a></li>
              <li><a href=""><img src="/Semi_Team1/images/instagram-logo.png"></a></li>
          </ul>
      </div>
    </div>
</div>

    
</body>
</html>
