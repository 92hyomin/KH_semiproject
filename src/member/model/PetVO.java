package member.model;

public class PetVO {

	private int pet_seq;			// 펫 시퀀스
    private String fk_email;		// fk 이메일
    private String pet_name;		// 펫 이름
    private String pet_birthday; 	// 펫 생년월일
    private String pet_type ; 		// 견종
    private String pet_neutral ;	// 중성화 유무 ( 0: 안함 , 1: 함 )
    private int pet_weight ;  		// 펫 무게 
    private String pet_gender; 		// 펫 성별 ( 1: 남자 , 2: 여자 ) 
    private String pet_photo; 		// 펫 사진명
    private String status; 			// 삭제 유무 ( 0: 삭제 , 1: 보존 )
    
    // getter & setter 
    
	public int getPet_seq() {
		return pet_seq;
	}
	public void setPet_seq(int pet_seq) {
		this.pet_seq = pet_seq;
	}
	public String getFk_email() {
		return fk_email;
	}
	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_birthday() {
		return pet_birthday;
	}
	public void setPet_birthday(String pet_birthday) {
		this.pet_birthday = pet_birthday;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_neutral() {
		return pet_neutral;
	}
	public void setPet_neutral(String pet_neutral) {
		this.pet_neutral = pet_neutral;
	}
	public int getPet_weight() {
		return pet_weight;
	}
	public void setPet_weight(int pet_weight) {
		this.pet_weight = pet_weight;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getPet_photo() {
		return pet_photo;
	}
	public void setPet_photo(String pet_photo) {
		this.pet_photo = pet_photo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
} // end of class ------------------------------------------------------
