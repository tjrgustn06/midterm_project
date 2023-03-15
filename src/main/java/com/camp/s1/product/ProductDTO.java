package com.camp.s1.product;

import java.util.List;

public class ProductDTO {
	
	private Long productNum;
	private String name;
	private String contents;
	private String status;
	private String summary;
	
	private List<ProductGradeDTO> productGradeDTOs;
	
	public List<ProductGradeDTO> getProductGradeDTOs() {
		return productGradeDTOs;
	}
	public void setProductGradeDTOs(List<ProductGradeDTO> productGradeDTOs) {
		this.productGradeDTOs = productGradeDTOs;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
