package kh.spring.dto;

public class Camp_memberDTO {
	private int cm_no;
	private String cm_category;
	private String cm_id;
	private String cm_pw;
	private String cm_name;
	private int cm_phone;
	private String cm_zipcode;
	private String cm_address;
	private String cm_address2;
	
	public Camp_memberDTO() {
	}
	
	public Camp_memberDTO(int cm_no, String cm_category, String cm_id, String cm_pw, String cm_name, int cm_phone,
			String cm_zipcode, String cm_address, String cm_address2) {
		super();
		this.cm_no = cm_no;
		this.cm_category = cm_category;
		this.cm_id = cm_id;
		this.cm_pw = cm_pw;
		this.cm_name = cm_name;
		this.cm_phone = cm_phone;
		this.cm_zipcode = cm_zipcode;
		this.cm_address = cm_address;
		this.cm_address2 = cm_address2;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public String getCm_category() {
		return cm_category;
	}

	public void setCm_category(String cm_category) {
		this.cm_category = cm_category;
	}

	public String getCm_id() {
		return cm_id;
	}

	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}

	public String getCm_pw() {
		return cm_pw;
	}

	public void setCm_pw(String cm_pw) {
		this.cm_pw = cm_pw;
	}

	public String getCm_name() {
		return cm_name;
	}

	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}

	public int getCm_phone() {
		return cm_phone;
	}

	public void setCm_phone(int cm_phone) {
		this.cm_phone = cm_phone;
	}

	public String getCm_zipcode() {
		return cm_zipcode;
	}

	public void setCm_zipcode(String cm_zipcode) {
		this.cm_zipcode = cm_zipcode;
	}

	public String getCm_address() {
		return cm_address;
	}

	public void setCm_address(String cm_address) {
		this.cm_address = cm_address;
	}

	public String getCm_address2() {
		return cm_address2;
	}

	public void setCm_address2(String cm_address2) {
		this.cm_address2 = cm_address2;
	}
	
	
	
	
}
