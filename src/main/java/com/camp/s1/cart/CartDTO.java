package com.camp.s1.cart;

import java.sql.Date;

public class CartDTO {
	private Long cartNum;
	private String id;
	private String orderer;
	private Long gradeNum;
	private Long indexCode;
	private String name;
	private Date regDate;
	private String startDate;
	private String lastDate;
	private Integer amount;
	private Long cost;
	
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getGradeNum() {
		return gradeNum;
	}
	public void setGradeNum(Long gradeNum) {
		this.gradeNum = gradeNum;
	}
	public Long getIndexCode() {
		return indexCode;
	}
	public void setIndexCode(Long indexCode) {
		this.indexCode = indexCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Long getCost() {
		return cost;
	}
	public void setCost(Long cost) {
		this.cost = cost;
	}

}
