package purchase.controller;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import purchase.model.*;

public class PurchaseInsertAction extends AbstractController {

	private String replaceParameter(String param) {
		String result = param;
		
		if(param != null) {
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}// end of private String replaceParameter(String param)------
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest mtrequest = null;
		HttpSession sesssion = request.getSession();
		ServletContext svlCtx = sesssion.getServletContext();
		String imagesDir = svlCtx.getRealPath("/images");
		mtrequest = new MultipartRequest(request, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
		
		HashMap<String, String> paraMap = new HashMap<String,String>();
		paraMap.put("Ha_title", mtrequest.getParameter("Ha_title"));
		paraMap.put("Ha_price", mtrequest.getParameter("Ha_price"));
		paraMap.put("mainImg", mtrequest.getFilesystemName("mainImg"));		
		paraMap.put("Ha_brand", mtrequest.getParameter("Ha_brand"));
		String sample = mtrequest.getParameter("sample");
		if(sample == null) {
			sample = "0";
		}
		paraMap.put("sample", sample);
		paraMap.put("Ha_meat", mtrequest.getParameter("Ha_meat"));
		paraMap.put("texture", mtrequest.getParameter("texture"));
		paraMap.put("capacity", mtrequest.getParameter("capacity"));		
		paraMap.put("age", mtrequest.getParameter("age"));
		paraMap.put("quantity", mtrequest.getParameter("quantity"));
		paraMap.put("quantity", mtrequest.getParameter("quantity"));
		
		InterPurchaseDAO dao = new PurchaseDAO();
		int PrdNum = dao.getPrdNum(); 
		paraMap.put("PrdNum", String.valueOf(PrdNum));
		int n = dao.purchaseInsert(paraMap);  
		
		
		// 내용파일첨부 
		  int m = 0;
		  String str_attachCount = mtrequest.getParameter("attachCount");
		  if(!"".equals(str_attachCount)||n==1) {
			  int attachCount = Integer.parseInt(str_attachCount); 
					  
			  for(int i=0; i<attachCount; i++) {
				  String attachFileName = mtrequest.getFilesystemName("attach"+i); 
				  // jsp_product_imagefile 테이블에 추가이미지 파일명 insert 해주기 
				  m = dao.purchaseImg(PrdNum, attachFileName);
				  if(m==0) break;
			  }// end of for---------------------
		  }// end of if--------------------------
		  String insert = "";
		  
		  if(n==1 || m==0) {
			  insert = "제품등록 성공!!";
		  }
		  else {
			  insert = "제품등록 실패!!";		  
		  }
		  
		  request.setAttribute("insert", insert);
		  super.setViewPage("/WEB-INF/purchase/purchaseWrite.jsp");

	}

}
