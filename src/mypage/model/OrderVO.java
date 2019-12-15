package mypage.model;

public class OrderVO {
	private int order_num;
	private int fk_order_num;
	private String fk_email;
	private String order_day;       // 주문일자
	private String order_deliverynum; // 배송번호
	private String order_status;    // [배송상태] 0:입금확인중 1:상품준비중 2:배송중 3:배송완료  
	private String order_freedeliv; // [입금상태] 0:입금전 1:입금완료
	private String delivery;        // 배송지
	private String delivery_msg;    // 배송메세지
	private String receiver;        // 수취인
	private String memo;            // 주문메모
	
	//주문상세VO
	private int amountmoney;
	private int product_code;
	private String product_name;
	private int quantity;
	
	//제품
	private int product_price;
	
	//제품사진
	private String photoname;
	
	
	public OrderVO() {}
	
	public OrderVO(int order_num, String fk_email, String order_day, String order_deliverynum, String order_status,
			String order_freedeliv, String delivery, String delivery_msg, String receiver, String memo, int amountmoney,
			int product_code, String product_name, int fk_order_num, String photoname, int product_price, int quantity) {
		super();
		this.order_num = order_num;
		this.fk_email = fk_email;
		this.order_day = order_day;
		this.order_deliverynum = order_deliverynum;
		this.order_status = order_status;
		this.order_freedeliv = order_freedeliv;
		this.delivery = delivery;
		this.delivery_msg = delivery_msg;
		this.receiver = receiver;
		this.memo = memo;
		this.amountmoney = amountmoney;
		this.product_code = product_code;
		this.product_name = product_name;
		this.fk_order_num = fk_order_num;
		this.photoname = photoname;
		this.product_price = product_price;
		this.quantity = quantity;
	}


	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getFk_email() {
		return fk_email;
	}

	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}

	public String getOrder_day() {
		return order_day;
	}

	public void setOrder_day(String order_day) {
		this.order_day = order_day;
	}

	public String getOrder_deliverynum() {
		return order_deliverynum;
	}

	public void setOrder_deliverynum(String order_deliverynum) {
		this.order_deliverynum = order_deliverynum;
	}

	public String getOrder_status() {
		if("0".equals(order_status))
			order_status = "입금확인중";
		else if("1".equals(order_status))
			order_status = "상품준비중";
		else if("2".equals(order_status))
			order_status = "배송중";
		else if("3".equals(order_status))
			order_status = "배송완료";
		
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_freedeliv() {
		if("1".equals(order_freedeliv))
			order_freedeliv = "입금완료";
		else
			order_freedeliv = "입금전";
		return order_freedeliv;
	}

	public void setOrder_freedeliv(String order_freedeliv) {
		this.order_freedeliv = order_freedeliv;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getDelivery_msg() {
		return delivery_msg;
	}

	public void setDelivery_msg(String delivery_msg) {
		this.delivery_msg = delivery_msg;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getAmountmoney() {
		return amountmoney;
	}

	public void setAmountmoney(int amountmoney) {
		this.amountmoney = amountmoney;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getFk_order_num() {
		return fk_order_num;
	}

	public void setFk_order_num(int fk_order_num) {
		this.fk_order_num = fk_order_num;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getPhotoname() {
		return photoname;
	}

	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
