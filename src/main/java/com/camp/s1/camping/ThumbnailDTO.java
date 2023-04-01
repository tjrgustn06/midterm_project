package com.camp.s1.camping;

public class ThumbnailDTO{
	
	private Long thumbNum;
	private Long campNum;
	private String thumbName;
	
	public ThumbnailDTO() {
		
	}

	public Long getThumbNum() {
		return thumbNum;
	}

	public void setThumbNum(Long thumbNum) {
		this.thumbNum = thumbNum;
	}

	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}

	public String getThumbName() {
		return thumbName;
	}

	public void setThumbName(String thumbName) {
		this.thumbName = thumbName;
	}
	
}
