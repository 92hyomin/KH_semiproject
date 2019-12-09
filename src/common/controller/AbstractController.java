package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class AbstractController implements InterCommand {
	
	
	
	private boolean isRedirect = false;
	private String viewPage;
	
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getViewPage() {
		return viewPage;
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	// 로그인 유무를 검사해서 로그인했으면 true , 아니면 false 리턴하는 메소드 ( get방식을 이용한 해킹을 막기 위함 )
	
//	public boolean checkLogin(HttpServletRequest request) {
//	
//		HttpSession session = request.getSession();
//		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
//		
//		if(loginuser != null) return true;
//		else return false;
//		
//	} // end of checkLogin ------------------------------------
	
	
} // end of class ---------------------------------------------
