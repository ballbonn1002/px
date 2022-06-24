package com.cubesofttech.model;

import java.math.BigDecimal;

public class UserPayment {
	private String id;
	private String flag;
	private String name;
	private BigDecimal value;
	
	public UserPayment(String id, String flag, String name, BigDecimal value) {
		this.id = id;
		this.flag = flag;
		this.name = name;
		this.value = value;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}
	

}
