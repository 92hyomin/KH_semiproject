package mypage.model;

public class ReserveVO {
	private int reserve_seq;
	private String fk_order_num;
	private String fk_email;
	private String reserve_plus;
	private String reserve_minus;
	private String usedate;
	private String content;
	private String reserve;
	
	public ReserveVO() {}
	
	public ReserveVO(int reserve_seq, String fk_order_num, String fk_email, String reserve_plus, String reserve_minus,
			String usedate, String content, String reserve) {
		super();
		this.reserve_seq = reserve_seq;
		this.fk_order_num = fk_order_num;
		this.fk_email = fk_email;
		this.reserve_plus = reserve_plus;
		this.reserve_minus = reserve_minus;
		this.usedate = usedate;
		this.content = content;
		this.reserve = reserve;
	}

	public int getReserve_seq() {
		return reserve_seq;
	}

	public void setReserve_seq(int reserve_seq) {
		this.reserve_seq = reserve_seq;
	}

	public String getFk_order_num() {
		return fk_order_num;
	}

	public void setFk_order_num(String fk_order_num) {
		this.fk_order_num = fk_order_num;
	}

	public String getFk_email() {
		return fk_email;
	}

	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}

	public String getReserve_plus() {
		return reserve_plus;
	}

	public void setReserve_plus(String reserve_plus) {
		this.reserve_plus = reserve_plus;
	}

	public String getReserve_minus() {
		return reserve_minus;
	}

	public void setReserve_minus(String reserve_minus) {
		this.reserve_minus = reserve_minus;
	}

	public String getUsedate() {
		return usedate;
	}

	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReserve() {
		return reserve;
	}

	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	
	
	
}
