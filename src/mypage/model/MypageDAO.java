package mypage.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

		@Override
		public List<ReserveVO> searchReserve(String email) throws SQLException{
			List<ReserveVO> reserveList = null;
			
			try {
				conn = ds.getConnection();
				String sql = "select usedate, content, NVL(reserve_plus,reserve_minus) as reserve\r\n" + 
						"from TBL_DOG_RESERVE\r\n" + 
						"where fk_email = '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc='";
				
				pstmt = conn.prepareStatement(sql);
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
				
				
			} finally {
				close();
			}
			
			return reserveList;
		}
		
			
}
