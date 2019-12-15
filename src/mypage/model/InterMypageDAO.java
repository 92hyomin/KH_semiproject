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
	
	//주문 총액 조회
	String getTotalOrder(String email)throws SQLException;
	
	//주문 내역 조회(페이징)
	List<OrderVO> searchRecentlyOrder(HashMap<String, String> paraMap) throws SQLException;

	//최근주문 페이징 처리(총갯수)
	int getTotalPageRecentlyOrder(HashMap<String, String> paraMap) throws SQLException;

	//반려동물 마릿수 구하기
	int selectTotalPet(String email) throws SQLException;

	//반려동물 리스트 조회
	List<MyPetVO> selectMyPetList(String email) throws SQLException;

	//내 반려동물 정보 조회
	MyPetVO selectMyPetInfo(String seq, String email) throws SQLException;

	//반려동물 추가
	int addMypet(HashMap<String, String> paraMap) throws SQLException;

	//반려동물 수정
	int updateMypet(HashMap<String, String> paraMap) throws SQLException;

	//반려동물 삭제
	int deleteMypet(String pet_seq, String email) throws SQLException;

	//회원탈퇴
	int deleteUser(String email, String resign_reason, String userid) throws SQLException;

	//주문 상세보기
	List<OrderVO> searchOrderDetail(HashMap<String, String> paraMap) throws SQLException;

	

}
