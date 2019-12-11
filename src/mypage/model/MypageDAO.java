package mypage.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.EncryptMyKey;
import util.security.AES256;

public class MypageDAO implements InterMypageDAO {
	
	private DataSource ds ;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs ;
	private AES256 aes ;
	
	public MypageDAO() {
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

		//적립금 내역 조회
		@Override
		public List<ReserveVO> searchReserve(HashMap<String, String> paraMap) throws SQLException{
			List<ReserveVO> reserveList = null;
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			String email = paraMap.get("email");
			
			try {
				conn = ds.getConnection();
				String sql = "select RNO, usedate, content, reserve\r\n" + 
						"from\r\n" + 
						"(\r\n" + 
						"select rownum as RNO,  usedate, content, reserve\r\n" + 
						"from\r\n" + 
						"(\r\n" + 
						"select usedate, content, NVL(reserve_plus,reserve_minus) as reserve\r\n" + 
						"from TBL_DOG_RESERVE\r\n" + 
						"where fk_email = ? \r\n" + 
						"order by usedate desc\r\n" + 
						")V\r\n" + 
						")T\r\n" + 
						"where T.RNO between ? and ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(email));
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage-1));
				pstmt.setInt(3, (currentShowPageNo * sizePerPage));
				
				rs = pstmt.executeQuery();
				
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					if(cnt == 1)
						reserveList = new ArrayList<ReserveVO>();
					
					ReserveVO rvo = new ReserveVO();
					rvo.setUsedate(rs.getString("usedate"));
					rvo.setContent(rs.getString("content"));
					rvo.setReserve(rs.getString("reserve"));
					reserveList.add(rvo);
				}
				
				
			} catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			
			return reserveList;
		}

		//적립금 페이징 처리(총갯수)
		@Override
		public int getTotalPageReserve(HashMap<String, String> paraMap) throws SQLException {
			int totalPage = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "select ceil(count(*)/?) as totalPage\r\n" + 
						"from TBL_DOG_RESERVE\r\n" + 
						"where fk_email = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("sizePerPage"));
				pstmt.setString(2, aes.encrypt(paraMap.get("email")));
				
				rs = pstmt.executeQuery();
				rs.next();
				totalPage = Integer.parseInt(rs.getString("totalPage"));
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return totalPage;
		}

		//적립금 총액 조회
		@Override
		public String getTotalReserve(String email) throws SQLException {
			String totalReserve = "";
			
			try {
				conn = ds.getConnection();
				
				String sql = "select sum(NVL(reserve_plus,0)+NVL(reserve_minus,0)) as totalReserve \r\n" + 
						"from TBL_DOG_RESERVE\r\n" + 
						"where fk_email = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(email));
				
				rs = pstmt.executeQuery();
				rs.next();
				totalReserve = rs.getString("totalReserve");
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return totalReserve;
		}

		//반려동물 마릿수 구하기
		@Override
		public int selectTotalPet(String email) throws SQLException {
			int totalPet = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "select count(*) as CNT \r\n" + 
						"from TBL_DOG_PET\r\n" + 
						"where status='1' and fk_email= ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aes.encrypt(email));
				
				rs = pstmt.executeQuery();
				rs.next();
				totalPet = rs.getInt("CNT");
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return totalPet;
		}

		//반려동물 리스트 조회
		@Override
		public List<MyPetVO> selectMyPetList(String email) throws SQLException{
			List<MyPetVO> myPetList = null;
			
			try {
				conn = ds.getConnection();
				
				String sql = "select pet_seq, fk_email, pet_name, pet_birthday, pet_type, pet_neutral, pet_weight, pet_gender, pet_photo\r\n" + 
						"from TBL_DOG_PET\r\n" + 
						"where status='1' and fk_email= ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aes.encrypt(email));
				
				rs = pstmt.executeQuery();
				
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					if(cnt == 1)
						myPetList = new ArrayList<MyPetVO>();
					
					MyPetVO pvo = new MyPetVO();
					pvo.setPet_seq(rs.getInt("pet_seq"));
					pvo.setFk_email(rs.getString("fk_email"));
					pvo.setPet_name(rs.getString("pet_name"));
					pvo.setPet_birthday(rs.getString("pet_birthday"));
					pvo.setPet_type(rs.getString("pet_type"));
					pvo.setPet_neutral(rs.getString("pet_neutral"));
					pvo.setPet_weight(rs.getInt("pet_weight"));
					pvo.setPet_gender(rs.getString("pet_gender"));
					pvo.setPet_photo(rs.getString("pet_photo"));
					
					myPetList.add(pvo);
				}
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return myPetList;
		}
		
		
			
}
