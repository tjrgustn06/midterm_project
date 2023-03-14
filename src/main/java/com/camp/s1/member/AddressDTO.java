package com.camp.s1.member;

public class AddressDTO {

	private Long addressNum;
	private String id;
	private String addressName;
	private String address;
	private String addressDetail;
	private Long postCode;

	
	public Long getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(Long addressNum) {
		this.addressNum = addressNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public Long getPostCode() {
		return postCode;
	}
	public void setPostCode(Long postCode) {
		this.postCode = postCode;
	}
	
}
