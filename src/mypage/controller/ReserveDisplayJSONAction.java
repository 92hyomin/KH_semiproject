package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import mypage.model.InterMypageDAO;
import mypage.model.MypageDAO;
import mypage.model.ReserveVO;

public class ReserveDisplayJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("asdf");
		InterMypageDAO dao = new MypageDAO();
		List<ReserveVO> reserveList = null;
		String email = "15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc=";
		
		if(email == null) {
			System.out.println("email: null!!!!!!!");
		}
		else {
			reserveList = dao.searchReserve(email);
		}
		
		JSONArray jsonArr = new JSONArray();
		
		if(reserveList != null) {
			for(ReserveVO rvo: reserveList) {
				JSONObject jsobj = new JSONObject();
				jsobj.put("usedate", rvo.getUsedate());
				jsobj.put("content", rvo.getContent());
				jsobj.put("reserve", rvo.getReserve());
				
				jsonArr.put(jsobj);
			}
		}
		String result = jsonArr.toString();
		request.setAttribute("result", result);
		System.out.println(result);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
	}

}
