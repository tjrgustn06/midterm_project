package com.camp.s1.payment;

import java.sql.Date;

public class PaymentDTO {

	private Long payNum;
	private Long orderNum;
	private String payMethod;
	private Date payDate;
	
	public PaymentDTO() {
		
	}

	public Long getPayNum() {
		return payNum;
	}

	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public String getPayMethod() {
		if(this.payMethod==null) {
			this.payMethod="온라인 결제";
		}
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
}
