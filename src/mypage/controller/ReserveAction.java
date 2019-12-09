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

public class ReserveAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_Reserve.jsp");
		
	}

}
