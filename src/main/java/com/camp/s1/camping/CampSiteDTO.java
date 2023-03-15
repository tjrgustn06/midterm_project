package com.camp.s1.camping;

public class CampSiteDTO {

	private Long areaNum;
	private Long campNum;
	private String sizeInfo;
	private Long price;
	private String status;
	
	public CampSiteDTO() {
		
	}

	public Long getAreaNum() {
		return areaNum;
	}

	public void setAreaNum(Long areaNum) {
		this.areaNum = areaNum;
	}

	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}

	public String getSizeInfo() {
		return sizeInfo;
	}

	public void setSizeInfo(String sizeInfo) {
		this.sizeInfo = sizeInfo;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
