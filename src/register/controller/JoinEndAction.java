package register.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class JoinEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("POST".equals(method)) {
			
			// multipart 사용하기 
			
			
			
			
			
			
			
			// 추후에 수정할 것 !!
			int n = 1;
			
			String message = "";		// alert 로 띄울 메시지
			String loc = "";			// 이동할 페이지
			
			if(n==1) {
				message = "회원가입 성공";
				loc = request.getContextPath()+"/main.dog";
				
			}
			else {
				
				message = "회원가입 실패";
				loc = request.getContextPath()+"/register/mainJoinPage.dog";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		
	} // end of execute -----------
	
} // end of class ------------------------
