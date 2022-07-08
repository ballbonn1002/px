package com.cubesofttech.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "payment_detail")
public class Payment_detail {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
    @Column(name = "payment_detail_id ")
    private Integer payment_detail_id ;	
    @Column(name = "payment_id")
    private String payment_id;
    @Column(name = "user_id")
    private String user_id;
    @Column(name = "payment_type_id")
    private String payment_type_id;
    @Column(name = "amount")
    private BigDecimal amount;
    @Column(name = "user_update")
    private String user_update;
    @Column(name = "user_create")
    private String user_create;	
    @Column(name = "time_create")
    private java.sql.Timestamp time_create;
    @Column(name = "time_update")
    private java.sql.Timestamp time_update;
	public Integer getPayment_detail_id() {
		return payment_detail_id;
	}
	public void setPayment_detail_id(Integer payment_detail_id) {
		this.payment_detail_id = payment_detail_id;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPayment_type_id() {
		return payment_type_id;
	}
	public void setPayment_type_id(String payment_type_id) {
		this.payment_type_id = payment_type_id;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public java.sql.Timestamp getTime_create() {
		return time_create;
	}
	public void setTime_create(java.sql.Timestamp time_create) {
		this.time_create = time_create;
	}
	public java.sql.Timestamp getTime_update() {
		return time_update;
	}
	public void setTime_update(java.sql.Timestamp time_update) {
		this.time_update = time_update;
	}
	@Override
	public String toString() {
		return "Payment_detail [payment_detail_id=" + payment_detail_id + ", payment_id=" + payment_id + ", user_id="
				+ user_id + ", payment_type_id=" + payment_type_id + ", amount=" + amount + ", user_update="
				+ user_update + ", user_create=" + user_create + ", time_create=" + time_create + ", time_update="
				+ time_update + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Payment_detail))
			return false;
		Payment_detail other = (Payment_detail) obj;
		if (amount == null) {
			if (other.amount != null)
				return false;
		} else if (!amount.equals(other.amount))
			return false;
		if (payment_detail_id == null) {
			if (other.payment_detail_id != null)
				return false;
		} else if (!payment_detail_id.equals(other.payment_detail_id))
			return false;
		if (payment_id == null) {
			if (other.payment_id != null)
				return false;
		} else if (!payment_id.equals(other.payment_id))
			return false;
		if (payment_type_id == null) {
			if (other.payment_type_id != null)
				return false;
		} else if (!payment_type_id.equals(other.payment_type_id))
			return false;
		if (time_create == null) {
			if (other.time_create != null)
				return false;
		} else if (!time_create.equals(other.time_create))
			return false;
		if (time_update == null) {
			if (other.time_update != null)
				return false;
		} else if (!time_update.equals(other.time_update))
			return false;
		if (user_create == null) {
			if (other.user_create != null)
				return false;
		} else if (!user_create.equals(other.user_create))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_update == null) {
			if (other.user_update != null)
				return false;
		} else if (!user_update.equals(other.user_update))
			return false;
		return true;
	}
    
    
	
    
    
    
	
}
