package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MyshoppingAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tabMenu = request.getParameter("tabMenu");
		if("1".equalsIgnoreCase(tabMenu)) {
			System.out.println("111111111111111111");
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_Myshopping.jsp");
		}
		
		else if("2".equalsIgnoreCase(tabMenu)) {
			System.out.println("2222222222222");
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_Myshopping.jsp");
		}
		
		
		
		
	}

}
