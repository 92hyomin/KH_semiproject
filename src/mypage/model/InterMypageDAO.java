package mypage.model;

import java.sql.SQLException;
import java.util.List;

public interface InterMypageDAO {

	//적립금 내역 조회
	List<ReserveVO> searchReserve(String email) throws SQLException;

}
