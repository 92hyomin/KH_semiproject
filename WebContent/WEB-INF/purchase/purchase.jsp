<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header_dog.jsp"/>

<style type="text/css">

	.Ha_a, .Ha_a:hover, .Ha_a:visited, .Ha_a:link {
		text-decoration: none; 
		color: #858585;
	}
	
	.purchaseMenu {

		 display: inline-block;
    	 
	}
	
	.cate2 {
		display: inline-block;
		font-family: 'Notokr', sans-serif;
  		color: #b3b3b3;
  		font-size: 13px;
  		cursor: pointer;
	}
	
	.cate3 {
		border: solid 1px gray;
		width: 2%;
		text-align: center;
		height: 50px;
		font-family: 'Notokr';
		font-size: 15px;
    	color: #777;
    	cursor: pointer;
	}
	
	.pageBar {
		clear: both;
		margin: 4% 0;
	}
	
	.Ha_img {
		width:100%;
		height: 20vw;
	}
	
	.Ha_content {
		display: inline-block;
		width: 23.2%;
		border: 1px solid #ebebeb;
		margin-right: 2%;
	}
		
	.prd_name {
		font-family: 'Notokr', sans-serif;
 	    font-size: 15px;
        color: #1c1c1c; 
	}
	
	.prd_name_margin {
		margin-top: 5%;
	}
	
	.prd_price {
		 color: #000;
   		 font-size: 15px;
  	 	 font-family: 'Lato', sans-serif;
  	 	 margin-top: 10%;
  	 	 margin-bottom: 10%;
	}

	.Ha_a {
		text-decoration: none; 
		color: #858585;
	}
	
	.Ha_root {
		display: inline-block; 
		font-size: 12px; 
		font-family: 'Notokr';
	}
	
	.Ha_content_container {
		margin-bottom: 3%;
	}
	
	.prd_info {
		text-align: center;
	}
	
	.ha_sort {
		cursor: pointer;
	}	
	
	/* dropdown */
	.cate3_sub_container {
		display: inline-block;
		width: 25%;
		position: absolute;
	}
	
	
	
	.cate3_sub {
		display: inline-block;
		font-family: 'Notokr', sans-serif;
    	font-size: 13px;
    	color: #787878;
    	width: 50%;
    	margin-top: 2%;
    	cursor: pointer;
	}
	
	/* dropdown end */
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".cate3_sub_container").hide();
		
		$(".habin_hover").hover(function(event){
				$(".cate3_sub_container").show();
		} ,function(){
			$(".cate3_sub_container").hide();
		}); 
		
		$(".ha_sort").click(function(event){
			var url = "purchase.dog?sort1="+$(".ha_sort").index(this);
			javascript:location.href=url;
		});
		
		$(".ha_sort2").click(function(event){
			javascript:location.href="purchase.dog?sort1=${sort1}&sort2="+$(".ha_sort2").index(this);
		});
	});
</script>
<div style="width:80%; margin: 0 auto;">
	<div>
		<a href="#">
			<img style="width: 100%;" src="http://harimpetfood.godohosting.com/event/princecogi/PC_prince.jpg">
		</a>
	</div>
	<div style="margin: 20px 0px;">
		<div style="text-align: right;">
			<div class="Ha_root"><a class="Ha_a Ha_a:visited Ha_a:hover Ha_a:link" href="<%= request.getContextPath()%>/purchase/purchaseWrite.dog" onclick="">글쓰기 > </a></div>
			<div class="Ha_root"><a class="Ha_a Ha_a:visited Ha_a:hover Ha_a:link" href="#">홈 > </a></div>
			<div class="Ha_root"><a class="Ha_a Ha_a:visited Ha_a:hover Ha_a:link" href="#">브랜드별</a></div>
		</div>
		<div style="font-family: 'Notokr'; font-size: 46px; text-align: center; font-weight: bold;">
			구매하기
		</div>
	</div>
	<div class="habin_hover">
		<div>
			<table style="margin: auto;">
				<tr>
					<td class="cate3 ">브랜드별</td>
					<td class="cate3 ">연령별</td>
					<td class="cate3 ha_sort">샘플신청</td>
					<td class="cate3 ">상품후기</td>
				</tr>
			</table>
		</div>
		<div style="margin-bottom: 9%;">
			<div class="cate3_sub_container ">
				<div class="cate3_sub ha_sort">-전체보기</div>
				<div class="cate3_sub ha_sort">-네추럴 발란스</div>
				<div class="cate3_sub ha_sort">-아미오</div>
				<div class="cate3_sub ha_sort">-바우와우</div>
				<div class="cate3_sub ha_sort">-이즈칸</div>
			</div>
			<div class="cate3_sub_container " style="margin-left: 20%;">
				<div class="cate3_sub ha_sort">-전체보기</div>
				<div class="cate3_sub ha_sort">-퍼피</div>
				<div class="cate3_sub ha_sort">-어덜트</div>
				<div class="cate3_sub ha_sort">-시니어</div>
				<div class="cate3_sub ha_sort">-전연령</div>
			</div>
		</div>
	</div>
	<div style="text-align: right; margin-bottom: 1%;">
		<div class="cate2 ha_sort2">신상품</div>
		<div class="cate2 ha_sort2">인기상품</div>
		<div class="cate2 ha_sort2">낮은가격</div>
		<div class="cate2 ha_sort2">높은가격</div>
	</div>
	<div style="text-align: left;">
		${contents}
	</div>
	<div class="pageBar" style="text-align: center;">
		${pageBar}
	</div>
</div>
					
<jsp:include page="../footer_dog.jsp"/>