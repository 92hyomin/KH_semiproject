package member.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

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
				ds = (DataSource)envContext.lookup("jdbc/semidog");		// myoracle
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
			
	
			
			
			
			
			
	
	
} // end of MemberDAO -----------------------------------------------------------
