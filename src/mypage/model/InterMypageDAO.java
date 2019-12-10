package mypage.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterMypageDAO {

	//적립금 내역 조회(페이징)
	List<ReserveVO> searchReserve(HashMap<String, String> paraMap) throws SQLException;

	//적립금 페이징 처리(총갯수)
	int getTotalPageReserve(HashMap<String, String> paraMap) throws SQLException;

	//적립금 총액 조회
	String getTotalReserve(String email) throws SQLException;

}
