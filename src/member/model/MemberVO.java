package member.model;

public class MemberVO {

	private int member_seq;
    private String user_id;			// 유저 아이디
    private String user_name;		// 유저 이름
    private String user_pw;         // 유저 비밀번호 ( 암호화 )
    private String user_birthday;	// 유저 생년월일
    private String user_gender;		// 유저 성별 ( 1: 남자 , 2: 여자 )
    private String postcode;		// 우편번호
    private String addr1; 			// 주소1
    private String addr2;			// 주소2
    private String phone;			// 휴대전화번호 ( 암호화 / 복호화 )
    private String email;			// 이메일 ( 암호화 / 복호화 )
    private String user_sns;		// 유저 가입시에 sns 이용 여부
    private String alert_email;		// 이메일 알림 유무 ( 0: 거부 , 1: 수신 )
    private String alert_sms;		// SMS 알림 유무 ( 0: 거부 , 1: 수신 )
    private String registerday;		// 가입일
    private String pwchangeday; 	// 비밀번호 변경일
    private String lastloginday; 	// 최종 로그인 날짜
    private String status;  		// 회원 상태 ( 0: 탈퇴 , 1: 활동 )
    private String resign_reason; 	// 탈퇴사유
    
    private boolean needPwChange = false;	// 비밀번호 변경 ?!
	private boolean needDormancy = false;	// 휴면계정 ?!
    
    
 // getter & setter    

    public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_sns() {
		return user_sns;
	}
	public void setUser_sns(String user_sns) {
		this.user_sns = user_sns;
	}
	public String getAlert_email() {
		return alert_email;
	}
	public void setAlert_email(String alert_email) {
		this.alert_email = alert_email;
	}
	public String getAlert_sms() {
		return alert_sms;
	}
	public void setAlert_sms(String alert_sms) {
		this.alert_sms = alert_sms;
	}
	
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	public String getPwchangeday() {
		return pwchangeday;
	}
	public void setPwchangeday(String pwchangeday) {
		this.pwchangeday = pwchangeday;
	}
	public String getLastloginday() {
		return lastloginday;
	}
	public void setLastloginday(String lastloginday) {
		this.lastloginday = lastloginday;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getResign_reason() {
		return resign_reason;
	}
	public void setResign_reason(String resign_reason) {
		this.resign_reason = resign_reason;
	}
	
	public boolean isNeedPwChange() {
		return needPwChange;
	}
	public void setNeedPwChange(boolean needPwChange) {
		this.needPwChange = needPwChange;
	}
	public boolean isNeedDormancy() {
		return needDormancy;
	}
	public void setNeedDormancy(boolean needDormancy) {
		this.needDormancy = needDormancy;
	}
	
	
	
	
	
	
} // end of class ------------------------------------------------------------
