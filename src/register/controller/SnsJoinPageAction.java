package register.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class SnsJoinPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		if("POST".equals(method)) {
			
			String user_sns = request.getParameter("user_sns");
			String email = request.getParameter("email");
			
			request.setAttribute("user_sns", user_sns);
			request.setAttribute("email", email);
		}
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/register/snsJoinPage.jsp");
		
	} // end of execute ----------------------
	
} // end of class ----------------------------------------
