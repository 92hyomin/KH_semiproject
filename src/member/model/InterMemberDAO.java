package member.model;

import java.sql.SQLException;
import java.util.*;

public interface InterMemberDAO {

	// 이메일 중복 확인하기 
	int getEmailCheck(String email) throws SQLException;
	
	// SNS 로 회원가입 하기 & 가입 적립금 넣기
	int joinMemberBySNS(HashMap<String,String> paraMap) throws SQLException;
	
	// 특정 아이디를 가지고 아이디 중복 확인 하기
	int idDuplicateCheck(String user_idCheck) throws SQLException;
	
	// 일반 회원가입하기 & 가입 적립금 넣기
	int joinMemberByNormal(HashMap<String,String> paraMap) throws SQLException;
	
	// 반려견 정보 insert 하기 
	int insertPetInfo(List<PetVO> petMap) throws SQLException;
	
	// SNS 로 로그인하기
	MemberVO loginBySNS(String email) throws SQLException;
	
	// 일반 로그인하기
	MemberVO loginByNormal(HashMap<String,String> paraMap) throws SQLException;
	
} // end of interface ---------------------------------
