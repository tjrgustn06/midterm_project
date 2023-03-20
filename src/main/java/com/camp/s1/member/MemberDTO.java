package com.camp.s1.member;

public class MemberDTO {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String roleName;
	private AddressDTO addressDTO;
	private MemberImgDTO memberImgDTO;

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public AddressDTO getAddressDTO() {
		return addressDTO;
	}
	public void setAddressDTO(AddressDTO addressDTO) {
		this.addressDTO = addressDTO;
	}
	
	
	public MemberImgDTO getMemberImgDTO() {
		return memberImgDTO;
	}
	public void setMemberImgDTO(MemberImgDTO memberImgDTO) {
		this.memberImgDTO = memberImgDTO;
	}

	
	
}