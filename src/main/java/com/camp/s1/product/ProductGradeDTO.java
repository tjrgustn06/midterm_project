package com.camp.s1.product;

public class ProductGradeDTO {

	private Long gradeNum;
	private Long productNum;
	private Integer gradeStock;
	private String gradeName;
	private Long price;
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getGradeNum() {
		return gradeNum;
	}
	public void setGradeNum(Long gradeNum) {
		this.gradeNum = gradeNum;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	
	public Integer getGradeStock() {
		return gradeStock;
	}
	public void setGradeStock(Integer gradeStock) {
		this.gradeStock = gradeStock;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
}
