package purchase.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterPurchaseDAO {

	int purchaseInsert(HashMap<String, String> paraMap) throws SQLException;

	int getPrdNum() throws SQLException;

	int purchaseImg(int prdNum, String attachFileName) throws SQLException;

	List<HashMap<String, String>> prdList(String sort1, String sort2) throws SQLException;

	List<HashMap<String, String>> purchaseContent(String prdcode) throws SQLException;
	
}
