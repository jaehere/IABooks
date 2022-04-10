package product.model;

public class CartVO {
	
	private int pk_cartno;				// 장바구니 번호
	private String fk_userid;			// 회원아이디
	private String fk_pro_num; 			// 국제표준도서번호
	private int ck_odr_qty;				// 총 주문량
	private String ck_cart_register;	// 장바구니 등록일자
	private int c_status;				// 장바구니 등록여부(1이면 등록, 0이면 아님) 
	
	private ProductVO product;
	private CategoryVO category;
	
	// 추가
<<<<<<< HEAD
	private int totalPrice;				// ck_odr_qty * ck_odr_qty
=======
	private int partPrice;				// ck_odr_qty * ck_odr_qty
	private int totalPoint;
>>>>>>> refs/remotes/origin/sub_main
	
	///////////////////////////////////////////////
	

	// 기본생성자
	public CartVO() {}

	public CartVO(int pk_cartno, String fk_userid, String fk_pro_num, int ck_odr_qty, String ck_cart_register,
<<<<<<< HEAD
			int c_status, ProductVO product, CategoryVO category, int totalPrice) {
=======
			int c_status, ProductVO product, CategoryVO category, int partPrice, int totalPoint) {
>>>>>>> refs/remotes/origin/sub_main
		super();
		this.pk_cartno = pk_cartno;
		this.fk_userid = fk_userid;
		this.fk_pro_num = fk_pro_num;
		this.ck_odr_qty = ck_odr_qty;
		this.ck_cart_register = ck_cart_register;
		this.c_status = c_status;
		this.product = product;
		this.category = category;
<<<<<<< HEAD
		this.totalPrice = totalPrice;
=======
		this.partPrice = partPrice;
		this.totalPoint = totalPoint;
		
>>>>>>> refs/remotes/origin/sub_main
	}

	public int getPk_cartno() {
		return pk_cartno;
	}

	public void setPk_cartno(int pk_cartno) {
		this.pk_cartno = pk_cartno;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getFk_pro_num() {
		return fk_pro_num;
	}

	public void setFk_pro_num(String fk_pro_num) {
		this.fk_pro_num = fk_pro_num;
	}

	public int getCk_odr_qty() {
		return ck_odr_qty;
	}

	public void setCk_odr_qty(int ck_odr_qty) {
		this.ck_odr_qty = ck_odr_qty;
	}

	public String getCk_cart_register() {
		return ck_cart_register;
<<<<<<< HEAD
=======
	}
	
	public void setCk_cart_register(String ck_cart_register) {
		this.ck_cart_register = ck_cart_register;
	}

	public int getC_status() {
		return c_status;
	}
	
	public void setC_status(int c_status) {
		this.c_status = c_status;
	}

	public ProductVO getProduct() {
		return product;
	}

	public void setProduct(ProductVO product) {
		this.product = product;
	}

	
	public CategoryVO getCategory() {
		return category;
	}

	public void setCategory(CategoryVO category) {
		this.category = category;
	}

	public int getPartPrice() {
		return partPrice;
	}

	public void setPartPrice(int partPrice) {
		this.partPrice = partPrice;
		
	}
	
	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
>>>>>>> refs/remotes/origin/sub_main
	}
	
	public void setCk_cart_register(String ck_cart_register) {
		this.ck_cart_register = ck_cart_register;
	}

	public int getC_status() {
		return c_status;
	}
	
<<<<<<< HEAD
	public void setC_status(int c_status) {
		this.c_status = c_status;
	}

	public ProductVO getProduct() {
		return product;
	}

	public void setProduct(ProductVO product) {
		this.product = product;
	}

	public CategoryVO getCategory() {
		return category;
	}

	public void setCategory(CategoryVO category) {
		this.category = category;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int ck_odr_qty) { // 나중에
	//	this.totalPrice = this.product.getPro_saleprice() * ck_odr_qty;
		
		this.totalPrice = 40 * ck_odr_qty; // 꼭 기억! 나중에
		
	}
	
=======
>>>>>>> refs/remotes/origin/sub_main
}