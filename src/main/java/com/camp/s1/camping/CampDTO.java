package com.camp.s1.camping;

import java.util.List;

public class CampDTO {
	
	private Long campNum;
	private String name;
	private String phone;
	private String address;
	private String contents;
	private List<CampFileDTO> campFileDTOs;
	
	public CampDTO() {
		
	}

	
	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public List<CampFileDTO> getCampFileDTOs() {
		return campFileDTOs;
	}

	public void setCampFileDTOs(List<CampFileDTO> campFileDTOs) {
		this.campFileDTOs = campFileDTOs;
	}
	
}
