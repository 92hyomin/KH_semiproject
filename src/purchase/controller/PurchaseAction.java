package purchase.controller;

import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import purchase.model.*;

public class PurchaseAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DecimalFormat dec = new DecimalFormat("###,###");
		InterPurchaseDAO pdao = new PurchaseDAO();
		String sort1 = request.getParameter("sort1");
		String sort2 = request.getParameter("sort2");
		if(sort1 == null) {
			sort1 = "1";
		}
		if(sort2 == null) {
			sort2 = "0";
		}
		
		List<HashMap<String,String>> paraMap = pdao.prdList(sort1, sort2);
		// 게시글 컨텐츠 갯수, 제목, 가격, 이미지파일 
		String contents = "";
		
		int contentTotal = Integer.parseInt(paraMap.get(1).get("total")); // 4배수 일떄마다 <div class="item-cont">
		for(int i=0; i<contentTotal; i++) {
			
			if(i%4==0) {
				contents += "<div class='Ha_content_container'>";
			}
			
			if(i%4!=3) {
			contents += " <div class='Ha_content'> "
						+"		<div> "
						+"			<a href='purchaseContent.dog?prdcode="+paraMap.get(i).get("code")+"'> " 
						+"				<img class='Ha_img' src='/Semi_Team1/images/"+paraMap.get(i).get("img")+"'> " 
						+"			</a>	"									
						+" 		</div> "
						+" 		<div class='prd_info' > "
						+"			<div class='prd_name_margin'>"
						+"				<div><a href='' class='prd_name'>"+paraMap.get(i).get("name")+"</a></div>"
						+"				<div class='prd_price'><a href='' class='prd_price'>"+dec.format(Integer.parseInt(paraMap.get(i).get("price")))+"</a></div>"
						+"			</div> "
						+" 		</div>"
						+"</div>";
			}
			
			if(i%4==3) {
				contents += " <div class='Ha_content' style='margin-right: 0;'> "
						+"		<div> "
						+"			<a href='purchaseContent.dog?prdcode="+paraMap.get(i).get("code")+"'> "  
						+"				<img class='Ha_img' src='/Semi_Team1/images/"+paraMap.get(i).get("img")+"'> " 
						+"			</a>	"						
						+" 		</div> "
						+" 		<div class='prd_info' > "
						+"			<div class='prd_name_margin'>"
						+"				<div><a href='' class='prd_name'>"+paraMap.get(i).get("name")+"</a></div>"
						+"				<div class='prd_price'><a href='' class='prd_price'>"+dec.format(Integer.parseInt(paraMap.get(i).get("price")))+"</a></div>"
						+"			</div> "
						+" 		</div>"
						+"</div>";
			}
			
			if(i%4==3 || i == contentTotal-1) {
				contents += "</div>";
			}	
		} // for
		
		
		// 페이지바
		String sizePerPage = "8";
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		if(sizePerPage == null||!("8".equals(sizePerPage))) {
			sizePerPage = "8";
		}
		
		String pageBar = "";
		int totalPage = 2;
		
		// 공식
		int pageNo = 1;
		
		int blockSize = 10; // 블럭당 페이지 개수
		
		int loop = 1; // 최대증설 1블럭
		
		//System.out.println(totalPage);
		
		pageNo = ( (Integer.parseInt(currentShowPageNo) - 1 )/blockSize )*blockSize+1;

		if( pageNo != 1 )
			pageBar += "&nbsp;<a href='habin.up?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"'>[이전]</a>&nbsp;";
			
		while(!(loop>blockSize||pageNo>totalPage)) {
			if(pageNo==Integer.parseInt(currentShowPageNo))
				pageBar += "&nbsp;<span style='color: red; border: solid 1px gray; padding: 2px 4px;'>"+pageNo+"</span>&nbsp;";
			else
				pageBar += "&nbsp;<a href='habin.up?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>"+pageNo+"</a>&nbsp;";
			
			pageNo++;
			loop++;
		
		}// while
	
		if( !(pageNo>totalPage) )
			pageBar += "&nbsp;<a href='habin.up?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>[다음]</a>&nbsp;";
		
		request.setAttribute("contents", contents);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("sort1", sort1);
		super.setViewPage("/WEB-INF/purchase/purchase.jsp");
	}

}
