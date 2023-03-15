package com.camp.s1.product;

public class ProductGradeDTO {

	private Long gradeNum;
	private Long productNum;
	private String gradeStock;
	private String gradeName;
	
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
	public String getGradeStock() {
		return gradeStock;
	}
	public void setGradeStock(String gradeStock) {
		this.gradeStock = gradeStock;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
}
