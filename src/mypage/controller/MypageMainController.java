package mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import mypage.model.InterMypageDAO;
import mypage.model.MypageDAO;
import mypage.model.OrderVO;
import mypage.model.ReserveVO;

public class MypageMainController extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(loginuser == null) {
			String message = "로그인 후 이용해주세요";
			String loc = "/Semi_Team1/login/login.dog";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		if(currentShowPageNo == null)
			currentShowPageNo = "1";
		
		String email = loginuser.getEmail();
		InterMypageDAO mdao = new MypageDAO();
		
		InterMypageDAO dao = new MypageDAO();
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("currentShowPageNo", currentShowPageNo);
		paraMap.put("sizePerPage", "10");
		paraMap.put("email", loginuser.getEmail());	
		int totalPage = dao.getTotalPageRecentlyOrder(paraMap);
		
		if(totalPage < Integer.parseInt(currentShowPageNo) ) {
			currentShowPageNo = "1";
			paraMap.put("currentShowPageNo", currentShowPageNo);
		}
		
		List<OrderVO> orderList = dao.searchRecentlyOrder(paraMap);
		
		int pageNo = 1;      // 페이지 첫번호(1,11,21)
		int blockSize = 5;  // 1블럭에 들어올 갯수
		int loop = 1;        // 1~10까지 증가하는 용도=>1블럭
		
		pageNo = ( (Integer.parseInt(currentShowPageNo) -1 ) / blockSize) * blockSize + 1;
		
		
		String pageBar = "";

		if( !(pageNo == 1) )
			pageBar += "<a href='recentlyOrder.dog?currentShowPageNo="+(pageNo-1)+"'>[이전]</a>&nbsp;&nbsp;";
		
		while(!(loop>blockSize || pageNo > totalPage)) {
			if(pageNo == Integer.parseInt(currentShowPageNo))
				pageBar += "&nbsp;<a href='#' class='active'>"+pageNo+"</span>&nbsp;";
			
			else
				pageBar += "<a href='recentlyOrder.dog?currentShowPageNo="+pageNo+"'>"+pageNo+"</a>&nbsp;&nbsp;";
			
			pageNo++;
			loop++;
		}
		if( !(pageNo > totalPage) )
			pageBar += "<a href='recentlyOrder.dog?currentShowPageNo="+pageNo+"'>[다음]</a>&nbsp;&nbsp;";
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("orderList", orderList);
		
		String totalReserve = mdao.getTotalReserve(email);
		String totalOrder = mdao.getTotalOrder(email);
		
		request.setAttribute("lastLogin", loginuser.getLastloginday());
		request.setAttribute("name", loginuser.getUser_name());
		request.setAttribute("totalReserve", totalReserve);
		request.setAttribute("totalOrder", totalOrder);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_main.jsp");
		
	} 

}
