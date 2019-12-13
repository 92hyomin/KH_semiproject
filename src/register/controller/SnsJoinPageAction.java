package register.controller;



import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.*;

public class SnsJoinPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		if("POST".equals(method)) {
			
			String user_sns = request.getParameter("user_sns");
			String email = request.getParameter("email");
			
			// 회원 가입창으로 넘기기 전에 이미 기존에 회원가입되어 있는지 확인해보기
						
			InterMemberDAO mdao = new MemberDAO();
			int result = mdao.getEmailCheck(email);
			
			if ( result == 0) {		// 이메일 중복되는 것이 없다!! 
				
				request.setAttribute("user_sns", user_sns);
				request.setAttribute("email", email);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/register/snsJoinPage.jsp");
				
			}
			else {		// 이메일이 중복된다 !!
				
				String message = "이 이메일은 기존 회원이 사용중이거나 탈퇴한 상태입니다.";
				String loc = request.getContextPath()+"/login/login.dog";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
			}
			
		}
		else {	// GET 방식으로 들어온 경우
			String message = "잘못된 접근 경로입니다.";						// alert 로 띄울 메시지
			String loc = request.getContextPath()+"/main.dog";		// 이동할 페이지
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
		
		}
		
		
	} // end of execute ----------------------
	
} // end of class ----------------------------------------
