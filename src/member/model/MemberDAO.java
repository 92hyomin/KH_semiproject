package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.sun.glass.ui.CommonDialogs.Type;

import util.security.AES256;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {

	private DataSource ds ;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs ;
	private AES256 aes ;
	
	public MemberDAO() {
			
			// 암호화/복호화 키 (양방향암호화) ==> 이메일,휴대폰의 암호화/복호화	
			String key = EncryptMyKey.KEY;
				
			try {
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				ds = (DataSource)envContext.lookup("jdbc/semidog");		// jdbc/myoracle    /   jdbc/semidog
				aes = new AES256(key);
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		} // end of 기본 생성자 -----------------------------------------------------------
	
	// 사용한 자원을 반납하는 메소드
	public void close() {
		
		try {
			if(rs!=null) { rs.close(); rs = null; }
			if(pstmt!=null) { pstmt.close(); pstmt = null; }
			if(conn!=null) { conn.close(); conn = null; }
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	} // end of close -----------------------

//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 이메일 중복확인하기
	@Override
	public int getEmailCheck(String email) throws SQLException {

		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select count(*) as count from tbl_dog_member where email = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aes.encrypt(email));
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt("count");
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	} // end of getEmailCheck -------------------------------------------------------

//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	// SNS 로 회원가입 하기 
	@Override
	public int joinMemberBySNS(HashMap<String, String> paraMap) throws SQLException {

		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			String sql = " insert into tbl_dog_member ( member_seq, user_name, email, user_sns , alert_email) "
					+ " values ( seq_dog_member.nextval , ? , ? , ? , ? ) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("user_name") );
			pstmt.setString(2, aes.encrypt(paraMap.get("email")) );
			pstmt.setString(3, paraMap.get("user_sns") );
			pstmt.setString(4, paraMap.get("alert_email") );
			
			result = pstmt.executeUpdate();
			
			if(result == 1) {			// 회원가입에 성공하면 적립금으로 5000원 준다.
				
				sql = " insert into tbl_dog_reserve ( reserve_seq, fk_email, reserve_plus, usedate ) "
						+ " values ( seq_dog_reserve.nextval , ? , ? , default ) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aes.encrypt(paraMap.get("email")) );
				pstmt.setInt(2, 5000 );
							
				int reserveResult = pstmt.executeUpdate();
				
				if(reserveResult == 1) {
					conn.commit();
					result = 1;
				}
				else {
					conn.rollback();
					result = 0;
				}
			}
			else {
				
				conn.commit();
				result = 0;
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	} // end of joinMemberBySNS -------------------------------------------------------

	
//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
	// 특정 아이디를 가지고 아이디 중복확인 하기
	@Override
	public int idDuplicateCheck(String user_idCheck) throws SQLException {

		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select count(*) as count from tbl_dog_member where user_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_idCheck);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt("count");
			
		} finally {
			close();
		}
		
		return result;
		
	} // end of idDuplicateCheck ------------------------------------------------

//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 일반 회원가입하기 
	@Override
	public int joinMemberByNormal(HashMap<String, String> paraMap) throws SQLException {
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			
			String sql = " insert into tbl_dog_member ( "
					+ " member_seq, user_id, user_name, user_pw, user_birthday, user_gender, postcode "
					+ " , addr1, addr2, phone, email, alert_email, alert_sms ) "
					+ " values ( seq_dog_member.nextval , ? , ? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("user_id") );
			pstmt.setString(2, paraMap.get("user_name") );
			pstmt.setString(3, Sha256.encrypt(paraMap.get("user_pw") )  );
			pstmt.setString(4, paraMap.get("user_birthday") );
			pstmt.setString(5, paraMap.get("user_gender") );
			pstmt.setString(6, paraMap.get("postcode") );
			pstmt.setString(7, paraMap.get("addr1") );
			pstmt.setString(8, paraMap.get("addr2") );
			pstmt.setString(9, paraMap.get("phone") );
			pstmt.setString(10, aes.encrypt(paraMap.get("email")) ); 
			pstmt.setString(11, paraMap.get("alert_email") );
			pstmt.setString(12, paraMap.get("alert_sms") );
			
			result = pstmt.executeUpdate();
			
			
			if(result == 1) {			// 회원가입에 성공하면 적립금으로 5000원 준다.
				
				sql = " insert into tbl_dog_reserve ( reserve_seq, fk_email, reserve_plus, usedate ) "
						+ " values ( seq_dog_reserve.nextval , ? , ? , default ) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aes.encrypt(paraMap.get("email")) );
				pstmt.setInt(2, 5000 );
							
				int reserveResult = pstmt.executeUpdate();
				
				if(reserveResult == 1) {
					conn.commit();
					result = 1;
				}
				else {
					conn.rollback();
					result = 0;
				}
			}
			else {
				
				conn.commit();
				result = 0;
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;	
	} // end of joinMemberByNormal -------------------------------------------------------

//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 반려견 정보 insert 하기
	@Override
	public int insertPetInfo(List<PetVO> petMap) throws SQLException {

		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			for ( int i =0 ; i<petMap.size() ; i++) {
				
				PetVO pvo = petMap.get(i);
				
				String sql = "insert into tbl_dog_pet ( pet_seq, fk_email, pet_name, pet_birthday, "
						+ " pet_type, pet_neutral, pet_weight, pet_gender, pet_photo ) "
						+ " values( seq_dog_pet.nextval, ? , ?, ?, ?, ?, ?, ?, ? ) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aes.encrypt(pvo.getFk_email()) );
				pstmt.setString(2, pvo.getPet_name());
				pstmt.setString(3, pvo.getPet_birthday());
				pstmt.setString(4, pvo.getPet_type());
				pstmt.setString(5, pvo.getPet_neutral());
				pstmt.setInt(6, pvo.getPet_weight());
				pstmt.setString(7, pvo.getPet_gender() );
				pstmt.setString(8, pvo.getPet_photo());
				
				int n = pstmt.executeUpdate();
				
				result += n ; 
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	} // end of insertPetInfo -------------------------------------------------------------

//////////////////////////////////////////////////////////////////////////////////////////////////
	
	// SNS 로 로그인하기
	@Override
	public MemberVO loginBySNS(String email) throws SQLException {

		MemberVO mvo = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select member_seq, user_id, user_name, user_birthday, user_gender, "
					+ " postcode, addr1, addr2, phone, email, user_sns, alert_email, alert_sms "
					+ " , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') as registerday "
					+ " , to_char(pwchangeday, 'yyyy-mm-dd hh24:mi:ss') as pwchangeday "
					+ " , to_char(lastloginday, 'yyyy-mm-dd hh24:mi:ss') as lastloginday "
					+ " , trunc( months_between(sysdate, lastloginday) ) AS lastlogindategap"
					+ " from tbl_dog_member where email =? and status = 1 ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aes.encrypt(email));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				mvo = new MemberVO();
				
				mvo.setMember_seq(rs.getInt("member_seq"));
				mvo.setUser_id(rs.getString("user_id"));
				mvo.setUser_name(rs.getString("user_name"));
				mvo.setUser_birthday(rs.getString("user_birthday"));
				mvo.setUser_gender(rs.getString("user_gender"));
				mvo.setPostcode(rs.getString("postcode"));
				mvo.setAddr1(rs.getString("addr1"));
				mvo.setAddr2(rs.getString("addr2"));
				mvo.setPhone(rs.getString("phone"));
				mvo.setEmail(aes.decrypt(rs.getString("email")));
				mvo.setUser_sns(rs.getString("user_sns"));
				mvo.setAlert_email(rs.getString("alert_email"));
				mvo.setAlert_sms(rs.getString("alert_sms"));
				mvo.setRegisterday(rs.getString("registerday"));
				mvo.setPwchangeday(rs.getString("pwchangeday"));
				mvo.setLastloginday(rs.getString("lastloginday"));
			
			    // 마지막으로 로그인 한 날짜가 현재일로부터 1년이 지났으면
                if( rs.getInt("lastlogindategap") >= 12 ) {
                	mvo.setNeedDormancy(true);
                }
                else {
                	// 마지막으로 로그인 한 날짜시간 기록하기
                	sql = " update tbl_dog_member set lastloginday = sysdate "
                		+ " where email = ? ";
                	pstmt = conn.prepareStatement(sql);
                	pstmt.setString(1, aes.encrypt(email));
                	pstmt.executeUpdate();
                }
				
			} // end of if -----------------------------------------------
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mvo;
	} // end of loginBySNS -----------------------------------------------------------------

//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 일반 로그인 하기
	@Override
	public MemberVO loginByNormal(HashMap<String, String> paraMap) throws SQLException {
		
		MemberVO mvo = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select member_seq, user_id, user_name, user_birthday, user_gender, "
					+ " postcode, addr1, addr2, phone, email, user_sns, alert_email, alert_sms "
					+ " , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') as registerday "
					+ " , to_char(pwchangeday, 'yyyy-mm-dd hh24:mi:ss') as pwchangeday "
					+ " , to_char(lastloginday, 'yyyy-mm-dd hh24:mi:ss') as lastloginday "
					+ " , trunc( months_between(sysdate, pwchangeday) ) AS pwdchangegap "
					+ " , trunc( months_between(sysdate, lastloginday) ) AS lastlogindategap "
					+ " from tbl_dog_member where user_id=? and user_pw =? and status = 1 ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("user_pw")));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				mvo = new MemberVO();
				
				mvo.setMember_seq(rs.getInt("member_seq"));
				mvo.setUser_id(rs.getString("user_id"));
				mvo.setUser_name(rs.getString("user_name"));
				mvo.setUser_birthday(rs.getString("user_birthday"));
				mvo.setUser_gender(rs.getString("user_gender"));
				mvo.setPostcode(rs.getString("postcode"));
				mvo.setAddr1(rs.getString("addr1"));
				mvo.setAddr2(rs.getString("addr2"));
				mvo.setPhone(rs.getString("phone"));
				mvo.setEmail(aes.decrypt(rs.getString("email")));
				mvo.setUser_sns(rs.getString("user_sns"));
				mvo.setAlert_email(rs.getString("alert_email"));
				mvo.setAlert_sms(rs.getString("alert_sms"));
				mvo.setRegisterday(rs.getString("registerday"));
				mvo.setPwchangeday(rs.getString("pwchangeday"));
				mvo.setLastloginday(rs.getString("lastloginday"));
				
				if( rs.getInt("pwdchangegap") >= 6 )	mvo.setNeedPwChange(true); 

			    // 마지막으로 로그인 한 날짜가 현재일로부터 1년이 지났으면
                if( rs.getInt("lastlogindategap") >= 12 ) {
                	mvo.setNeedDormancy(true);
                }
                else {
                	// 마지막으로 로그인 한 날짜시간 기록하기
                	sql = " update tbl_dog_member set lastloginday = sysdate "
                		+ " where user_id = ? ";
                	pstmt = conn.prepareStatement(sql);
                	pstmt.setString(1, paraMap.get("user_id"));
                	pstmt.executeUpdate();
                }
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mvo;
	} // end of loginByNormal ---------------------------------------------------------------

//////////////////////////////////////////////////////////////
/////////////////////////// 최효민 ///////////////////////////
//////////////////////////////////////////////////////////////
	
	//ID,PW Check
	@Override
	public boolean isExistUserid(String userid, String passwd) throws SQLException {
		boolean bool = false;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select * \r\n" + 
					"from TBL_DOG_MEMBER \r\n" + 
					"where user_id= ? and user_pw= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, Sha256.encrypt(passwd));
			
			rs = pstmt.executeQuery();
			bool = rs.next();
			
		} finally {
			close();
		}
		
		return bool;
	}//end of isExistUserid

	//내 정보 변경
	@Override
	public int updateMemberInfo(HashMap<String, String> paraMap) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			String email = paraMap.get("email");
			String user_pw = paraMap.get("user_pw");
			String postcode = paraMap.get("postcode");
			String addr1 = paraMap.get("addr1");
			String addr2 = paraMap.get("addr2");
			String phone = paraMap.get("phone");
			String emailreceive = paraMap.get("emailreceive");
			String smsreceive = paraMap.get("smsreceive");
			
			//공백으로 넘어온 항목은 기존 데이터 사용을 위해 if문 사용
			String sql = "update TBL_DOG_MEMBER set user_pw= ? ";
			if(!postcode.isEmpty()) { 
				sql += ",postcode= ? "; 
				}
			if(!addr1.isEmpty()) { 
				sql += ",addr1= ? "; 
				}
			if(!addr2.isEmpty()) { 
				sql += ",addr2= ? "; 
				}
			if(!phone.isEmpty()) { 
				sql += ",phone= ? ";
				}
			
			sql += ", ALERT_EMAIL= ? , "
					+ "ALERT_SMS= ? , "
					+ "pwchangeday=sysdate\r\n"  
					+ "where email= ?";
			
			pstmt = conn.prepareStatement(sql);
			int i = 1;
			
			//공백으로 넘어온 항목은 기존 데이터 사용을 위해 if문 사용
			pstmt.setString(i, Sha256.encrypt(user_pw));
			i++;
			if(!postcode.isEmpty()) {
				pstmt.setString(i, postcode);
				i++;
			}
			if(!addr1.isEmpty()) {
				pstmt.setString(i, addr1);
				i++;
			}
			if(!addr2.isEmpty()) {
				pstmt.setString(i, addr2);
				i++;
			}
			if(!phone.isEmpty()) {
				pstmt.setString(i, phone);
				i++;
			}
			pstmt.setString(i, emailreceive);
			i++;
			pstmt.setString(i, smsreceive);
			i++;
			pstmt.setString(i, aes.encrypt(email));
			
			n = pstmt.executeUpdate();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return n;
	}

//////////////////////////////////////////////////////////////
/////////////////////////// 최효민끝 /////////////////////////
//////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////
			
	
			
			
			
			
			
	
	
} // end of MemberDAO -----------------------------------------------------------
