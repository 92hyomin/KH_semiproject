package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class FindIDPWAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		super.setViewPage("/WEB-INF/login/findIDPW.jsp");
		
	} // end of execute ----------------------
	
} // end of class ------------------------------------
