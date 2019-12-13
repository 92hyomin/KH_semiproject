package register.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.*;

public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {		// GET 방식으로 들어올 때 
			
			String message = "잘못된 접근입니다.";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		else {										// POST 방식으로 들어왔을 때
			
			String user_idCheck = request.getParameter("user_id");
			
			InterMemberDAO mdao = new MemberDAO();
			
			int dupResult = mdao.idDuplicateCheck(user_idCheck);
			
			JSONObject jsobj = new JSONObject();
			
			if ( dupResult ==1 ) {			// 아이디가 중복된다.
				
				jsobj.put("dupResult", dupResult);
				jsobj.put("message", "중복된 아이디입니다.");
			}
			else {						// 아이디를 사용할 수 있다.
				
				jsobj.put("dupResult", dupResult);
				jsobj.put("message", "사용가능한 아이디입니다.");
			}
			String result = jsobj.toString();
			System.out.println(result);
			
			request.setAttribute("result", result);
			
			super.setViewPage("/WEB-INF/jsonResult.jsp");
		}
		
	} // end of execute ---------------------------------------

	
	
} // end of class -----------------------------------------------------
