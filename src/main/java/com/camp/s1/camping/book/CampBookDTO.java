package com.camp.s1.camping.book;

import java.sql.Date;

public class CampBookDTO {
	
	private Long num;
	private Long areaNum;
	private String id;
	private Long indexCode;
	private Long orderNum;
	private Long price;
	private Date regDate;
	private String startDate;
	private String lastDate;
	private String account;
	private String status;
	private String siteName;
	
	public CampBookDTO() {
		
	}

	public Long getNum() {
		return num;
	}

	public void setNum(Long num) {
		this.num = num;
	}

	public Long getAreaNum() {
		return areaNum;
	}

	public void setAreaNum(Long areaNum) {
		this.areaNum = areaNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getIndexCode() {
		return indexCode;
	}

	public void setIndexCode(Long indexCode) {
		this.indexCode = indexCode;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	
}
