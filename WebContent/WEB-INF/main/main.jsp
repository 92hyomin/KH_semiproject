<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../header_dog.jsp"/>
<title>우리 강아지의 건강을 생각한다면, 하빈 펫푸드!</title>
<style>
	
	#main_body {
		text-align:center;
		margin: 0 auto;
		width: 90%;
	}
	
	#main_hoverLinks {
		padding:20px 0;
		height: 15%;
	}
	
	#main_redbox {
	
		background: #da291c;
		padding: 110px 0;
	}
	
	#main_redbox div {
		color: white;
		text-align: center;
	}
	
	#main_danceLink {
		height: 500px;
		background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("images/artcenter.jpg");
		background-position: center;
 	 	background-repeat: no-repeat;
  		background-size: cover;
  		position: relative;
  		padding: 12% 0;
	}	
	
	#studioLink {
	
		border: solid 2px white;
		font-size: 11pt;
		text-decoration: none;
		color: white;
		padding: 20px 25px;
		cursor: pointer;
		background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5));
	}
	
	
	
	
	<!-- slide up css  --> 
	
	.slideInUp1 {
		 animation-name: slideInUp;
		 animation-duration: 1s;
		 animation-fill-mode: both;
	 }
	 
	 @keyframes slideInUp {
		 0% {
			 transform: translateY(100%);
			 visibility: visible;
		 }
		 100% {
		 	transform: translateY(0);
		 }
	 } 
	 
	 .slideInUp2 {
		 animation-name: slideInUp;
		 animation-duration: 1s;
		 animation-fill-mode: both;
	 }
	 
	 @keyframes slideInUp {
		 0% {
			 transform: translateY(100%);
			 visibility: visible;
		 }
		 100% {
		 	transform: translateY(0);
		 }
	 } 
	 
	 .slideInUp3 {
		 animation-name: slideInUp;
		 animation-duration: 1s;
		 animation-fill-mode: both;
	 }
	 
	 @keyframes slideInUp {
		 0% {
			 transform: translateY(100%);
			 visibility: visible;
		 }
		 100% {
			 transform: translateY(0);
		 }
	 } 
	 
	
</style>
<script type="text/javascript">
	
	$(function(){
		
		
		$(window).scroll( function(){
			document.getElementById("slideInUp1").style.display="none";
			document.getElementById("slideInUp2").style.display='none';
			document.getElementById("slideInUp3").style.display='none';
		
		setTimeout(function(){
			document.getElementById("slideInUp1").style.display='block';
		},1000)	
			
		setTimeout(function(){
			document.getElementById("slideInUp2").style.display='block';
		},2000)
		
		setTimeout(function(){
			document.getElementById("slideInUp3").style.display='block';
		},3000)
			});
		
		$(".hover1").mouseover(function(){
			
			this.src="images/main/natural_balance_red.png";
		});
		$(".hover1").mouseout(function(){
			
			this.src="images/main/natural_balance.png";
		});
		$(".hover2").mouseover(function(){
			
			this.src="images/main/amio_red.png";
		});
		$(".hover2").mouseout(function(){
			
			this.src="images/main/amio.png";
		});
		$(".hover3").mouseover(function(){
			
			this.src="images/main/bowwow_red.png";
		});
		$(".hover3").mouseout(function(){
			
			this.src="images/main/bowwow.png";
		});
		$(".hover4").mouseover(function(){
			
			this.src="images/main/iskhan_red.png";
		});
		$(".hover4").mouseout(function(){
			
			this.src="images/main/iskhan.png";
		});
		
	});
	
</script>


<div id="main_body" >

	<div id="main_carousel" style="padding-top:1px;">
		
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		 <ol class="carousel-indicators" style="display:none;">
		  <li  data-target="#myCarousel" data-slide-to="0" class="active"></li>
		  <li  data-target="#myCarousel" data-slide-to="1"></li>
		  <li  data-target="#myCarousel" data-slide-to="2"></li>
		  <li  data-target="#myCarousel" data-slide-to="3"></li>
		</ol> 
		
		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			 <div class="item active">
			    <img src="images/main/rolling1.png" alt="" style="width:100%;height:50%;cursor:pointer;" onclick="location.href=''">
			</div>
			
			<div class="item">
			  <img src="images/main/rolling2.jpg" alt="" style="width:100%;height:50%;cursor:pointer;" onclick="location.href=''">
			</div>
			
			<div class="item">
			  <img src="images/main/rolling3.jpg" alt="" style="width:100%;height:50%;cursor:pointer;" onclick="location.href=''">
			  </div>
			
			
			<div class="item">
			  <img src="images/main/rolling4.jpg" alt="" style="width:100%;height:50%;cursor:pointer;" onclick="location.href=''">
			  </div>
		</div>
		
		<!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		
	</div>

	<div id="main_hoverLinks">
		
		<div style="width:18%;display:inline-block;">
			<a href="" style='cursor:pointer;'><img class="hover1" src='images/main/natural_balance.png' style='width:100%;'></a>
		</div>
		<div style="width:18%;display:inline-block;">
			<a href="" style='cursor:pointer;'><img class="hover2" src='images/main/amio.png' style='width:100%;'></a>
		</div>
		<div style="width:18%;display:inline-block;">
			<a href="" style='cursor:pointer;'><img class="hover3" src='images/main/bowwow.png' style='width:100%;'></a>
		</div>
		<div style="width:18%;display:inline-block;">
			<a href="" style='cursor:pointer;'><img class="hover4" src='images/main/iskhan.png' style='width:100%;'></a>
		</div>
	
		
	</div>

	<div id="main_redbox" >
		<div style="font-weight:bold;font-size:22pt;">이게 바로 우리가 하빈 펫푸드를 시작한 이유입니다.</div>
		<div style="font-weight:bold;font-size:22pt;">-</div>
		<div style="font-size:13pt;">우리 펫페어런츠들은 사랑하는 네발의 아이들에게도</div>
		<div style="font-size:13pt;">자연에서 오는 영양이 건강과 행복에 꼭 필요하다는 것을 알았습니다.</div>
	</div>
	
	
	<div id="main_danceLink">
		<div class="slideInUp1" id="slideInUp1" style="color:white;font-weight:bold;font-size:30pt;">PET CARE CENTER TOUR</div>
		<div class="slideInUp2" id="slideInUp2" style="margin-top:10px;color:white;font-size:13pt;">여러분과 여러분의 사랑스러운 아이들을 초대합니다.</div>
		<div style="color:white;font-weight:bold;font-size:22pt;">-</div>
		<div class="slideInUp3" id="slideInUp3" style="margin-top:20px;"><a href="" id="studioLink">센터 투어 신청하기 &gt;</a></div>
	</div>
	

</div>



<jsp:include page="../footer_dog.jsp"/>