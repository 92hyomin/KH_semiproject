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
		//내 반려동물 정보 조회
		@Override
		public MyPetVO selectMyPetInfo(String seq, String email) throws SQLException {
			MyPetVO myPetInfo = null;
			try {
				conn = ds.getConnection();
				
				String sql = "select pet_seq, fk_email, pet_name, pet_birthday, pet_type, pet_neutral, pet_weight, pet_gender, pet_photo " + 
						"from TBL_DOG_PET " + 
						"where status='1' and fk_email= ? and pet_seq= ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aes.encrypt(email));
				pstmt.setString(2, seq);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					myPetInfo = new MyPetVO();
					myPetInfo.setPet_name(rs.getString("pet_name"));
					myPetInfo.setPet_type(rs.getString("pet_type"));
					myPetInfo.setPet_weight(Integer.parseInt(rs.getString("pet_weight")));
					myPetInfo.setPet_gender(rs.getString("pet_gender"));
					myPetInfo.setPet_birthday(rs.getString("pet_birthday"));
					myPetInfo.setPet_photo(rs.getString("pet_photo"));
					myPetInfo.setPet_neutral(rs.getString("pet_neutral"));
				}
				
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return myPetInfo;
		}

		@Override
		public int addMypet(HashMap<String, String> paraMap) throws SQLException {
			int n = 0;
			
			try {
				conn = ds.getConnection();
				String petPhoto = paraMap.get("petPhoto");
				
				String sql = "insert into TBL_DOG_PET(pet_seq, fk_email, pet_name, pet_birthday, pet_type, pet_neutral, pet_weight, pet_gender, pet_photo, status) " + 
						"values(SEQ_DOG_PET.nextval, ? , ? , ? , ? , ?, ?, ?, ? ,'1' )";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(paraMap.get("email")));
				pstmt.setString(2, paraMap.get("petName"));
				pstmt.setString(3, paraMap.get("petBirthday"));
				pstmt.setString(4, paraMap.get("petType"));
				pstmt.setString(5, paraMap.get("petNeutral"));
				pstmt.setString(6, paraMap.get("petWeight"));
				pstmt.setString(7, paraMap.get("petGender"));
				
				if(petPhoto == null)
					pstmt.setString(8, "noimage.gif");
				else 
					pstmt.setString(8, paraMap.get("petPhoto"));
				
				n = pstmt.executeUpdate();
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace(); 
			}finally {
				close();
			}
			
			return n;
		}

		//반려동물 수정
		@Override
		public int updateMypet(HashMap<String, String> paraMap) throws SQLException {
			int n = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "update TBL_DOG_PET "  
						 + "set pet_name= ? , pet_type= ?, pet_weight= ?, pet_gender= ?, pet_birthday= ?, pet_neutral= ? , pet_photo= ? "
					     + "where  status='1' and fk_email= ? and pet_seq= ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("petName"));
				pstmt.setString(2, paraMap.get("petType"));
				pstmt.setString(3, paraMap.get("petWeight"));
				pstmt.setString(4, paraMap.get("petGender"));
				pstmt.setString(5, paraMap.get("petBirthday"));
				pstmt.setString(6, paraMap.get("petNeutral"));
				pstmt.setString(7, paraMap.get("CurrentPetPhoto"));
				pstmt.setString(8, aes.encrypt(paraMap.get("email")));
				pstmt.setString(9, paraMap.get("pet_seq"));
				
				n = pstmt.executeUpdate();
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace(); 
			}finally {
				close();
			}
			
			return n;
		}

		//반려동물 삭제
		@Override
		public int deleteMypet(String pet_seq, String email) throws SQLException {
			int n = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "update TBL_DOG_PET " + 
						"set status='0' " + 
						"where fk_email= ? and pet_seq= ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(email));
				pstmt.setString(2, pet_seq);
				
				n = pstmt.executeUpdate();
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace(); 
			}finally {
				close();
			}
			
			return n;
		}

		//회원탈퇴
		@Override
		public int deleteUser(String email, String resign_reason, String userid) throws SQLException {
			int n = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "update TBL_DOG_MEMBER " + 
						"set status='0',resign_reason= ?, user_id= ? " + 
						"where status='1' and email= ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, resign_reason);
				pstmt.setString(2, "탈퇴회원_"+userid );
				pstmt.setString(3, aes.encrypt(email));
				
				
				n = pstmt.executeUpdate();
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace(); 
			}finally {
				close();
			}
			
			return n;
		}

		@Override
		public List<OrderVO> searchRecentlyOrder(HashMap<String, String> paraMap) throws SQLException {
			List<OrderVO> orderList = null;
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			String email = paraMap.get("email");
			
			try {
				conn = ds.getConnection();
				/*
				String sql = "select rownum as RNO, fk_order_num, order_num, order_day , product_name, quantity, amountmoney\n" + 
						"from(\n" + 
						"    select rownum as RNO, fk_order_num, order_num, order_day , product_name, quantity, amountmoney\n" + 
						"    from(\n" + 
						"        select fk_order_num,order_num, order_day , C.product_name, B.quantity, amountmoney\n" + 
						"        from tbl_dog_order A, tbl_dog_orderdetail B, tbl_dog_product C\n" + 
						"        where A.order_num = B.fk_order_num and B.fk_product_code = C.product_code and A.fk_email = ? \n" + 
						"        order by order_day desc\n" + 
						"    )V\n" + 
						")T\n" + 
						"where T.RNO between ? and ?";
				*/
				
				String sql = "select RNO, fk_order_num, order_num, order_day , product_name, quantity, amountmoney\n" + 
						"from(\n" + 
						"    select rownum as RNO, fk_order_num, order_num, order_day , product_name, quantity, amountmoney\n" + 
						"    from(\n" + 
						"        select fk_order_num, A.order_num, order_day , C.product_name, B.quantity, amountmoney\n" + 
						"        from (\n" + 
						"            select * from tbl_dog_order\n" + 
						"            where ROWID IN (SELECT MAX(ROWID) FROM tbl_dog_order GROUP BY order_num)) A, \n" + 
						"            (\n" + 
						"            select * from tbl_dog_orderdetail\n" + 
						"            where ROWID IN (SELECT MAX(ROWID) FROM tbl_dog_orderdetail GROUP BY fk_order_num)) B, \n" + 
						"            tbl_dog_product C\n" + 
						"        where A.order_num = B.fk_order_num and B.fk_product_code = C.product_code and A.fk_email = ? \n" + 
						"        order by order_day desc\n" + 
						"    )V\n" + 
						")T\n" + 
						"where RNO between ? and ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(email));
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage-1));
				pstmt.setInt(3, (currentShowPageNo * sizePerPage));
				
				rs = pstmt.executeQuery();
				
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					if(cnt == 1)
						orderList = new ArrayList<OrderVO>();
					
					OrderVO ovo = new OrderVO();
					ovo.setFk_order_num(rs.getInt("fk_order_num"));
					ovo.setOrder_num(rs.getInt("order_num"));
					ovo.setOrder_day(rs.getString("order_day"));
					ovo.setProduct_name(rs.getString("product_name"));
					ovo.setAmountmoney(rs.getInt("amountmoney"));
					orderList.add(ovo);
				}
				
				
			} catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			
			return orderList;
		}

		@Override
		public int getTotalPageRecentlyOrder(HashMap<String, String> paraMap) throws SQLException {
			int totalPage = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "select ceil(count(*)/?) as totalPage\r\n" + 
						"from TBL_DOG_order\r\n" + 
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

		@Override
		public String getTotalOrder(String email) throws SQLException {
			String totalOrder = "";
			
			try {
				conn = ds.getConnection();
				
				String sql = "select sum(amountmoney) as amountmoney " + 
						"from tbl_dog_order A, tbl_dog_orderdetail B " + 
						"where A.order_num = B.fk_order_num and fk_email = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(email));
				
				rs = pstmt.executeQuery();
				rs.next();
				totalOrder = rs.getString("amountmoney");
				
			}catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return totalOrder;
		}

		@Override
		public List<OrderVO> searchOrderDetail(HashMap<String, String> paraMap) throws SQLException {
			List<OrderVO> orderDetailList = null;
			String email = paraMap.get("email");
			String orderNum = paraMap.get("orderNum");
			try {
				conn = ds.getConnection();
				String sql = "select order_num, order_day, order_deliverynum, order_status, order_freedeliv, delivery, delivery_msg, receiver, memo, quantity, amountmoney, product_name, photoname\n" + 
						"from tbl_dog_order A, tbl_dog_orderdetail B, tbl_dog_product C, tbl_dog_prodphoto D\n" + 
						"where fk_email= ? and \n" + 
						"    A.order_num= ? and B.fk_order_num= ? and \n" + 
						"    B.fk_product_code = C.product_code and\n" + 
						"    C.product_code = D.fk_product_code";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, aes.encrypt(email));
				pstmt.setString(2, orderNum);
				pstmt.setString(3, orderNum);
				
				rs = pstmt.executeQuery();
				
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					if(cnt == 1)
						orderDetailList = new ArrayList<OrderVO>();
					
					OrderVO ovo = new OrderVO();
					ovo.setOrder_num(rs.getInt("order_num"));
					ovo.setOrder_day(rs.getString("order_day"));
					ovo.setOrder_deliverynum(rs.getString("order_deliverynum"));
					ovo.setOrder_status(rs.getString("order_status"));
					ovo.setOrder_freedeliv(rs.getString("order_freedeliv"));
					ovo.setDelivery(rs.getString("delivery"));
					ovo.setDelivery_msg(rs.getString("delivery_msg"));
					ovo.setReceiver(rs.getString("receiver"));
					ovo.setMemo(rs.getString("memo"));
					ovo.setQuantity(rs.getInt("quantity"));
					ovo.setAmountmoney(rs.getInt("amountmoney"));
					ovo.setProduct_name(rs.getString("product_name"));
					ovo.setPhotoname(rs.getString("photoname"));
					
					orderDetailList.add(ovo);
				}
				
				
			} catch(UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			
			return orderDetailList;
		}
		
		
			
}
