package purchase.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import purchase.model.InterPurchaseDAO;
import purchase.model.PurchaseDAO;

public class PurchaseContentAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prdcode = request.getParameter("prdcode");
		InterPurchaseDAO pdao = new PurchaseDAO();
		List<HashMap<String,String>> purchaseContent = pdao.purchaseContent(prdcode);
		String name = purchaseContent.get(1).get("PRODUCT_NAME");
		String thumb = purchaseContent.get(1).get("PRODUCT_EXPLANATION");
		String price = purchaseContent.get(1).get("PRODUCT_PRICE");
		String photo = purchaseContent.get(1).get("PHOTONAME");
		request.setAttribute("thumb", thumb);
		request.setAttribute("name", name);
		DecimalFormat dec = new DecimalFormat("###,###");
		price = dec.format(Integer.parseInt(price));
		request.setAttribute("price", price);
		
		super.setViewPage("/WEB-INF/purchase/purchaseContent.jsp");
	}

}
