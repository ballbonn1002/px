package com.cubesofttech.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "user_payment_config")
@NamedQueries({
    @NamedQuery(name = "UserPaymentConfig.findAll", query = "SELECT t FROM UserPaymentConfig t")})

public class UserPaymentConfig implements Serializable{
	
	public UserPaymentConfig() {
    }
    public UserPaymentConfig(
            BigDecimal paymentconfigId	
            , String paymentypeId	
            , String userId	
            , BigDecimal amount
            , String configFlag	
            , String userCreate
            , String userUpdate
            , java.sql.Timestamp timeCreate
            , java.sql.Timestamp timeUpdate
    		
    	){
        this.paymentconfigId = paymentconfigId;	
        this.paymentypeId = paymentypeId;	
        this.userId = userId;	
        this.amount = amount;	
        this.configFlag = configFlag;	
        this.userCreate = userCreate;
		this.userUpdate = userUpdate;
		this.timeCreate = timeCreate;
		this.timeUpdate = timeUpdate;
    }
    
    
    public UserPaymentConfig(String paymentypeId, String userId, BigDecimal amount, String configFlag,
			String userCreate, String userUpdate, Timestamp timeCreate, Timestamp timeUpdate) {
		super();
		this.paymentypeId = paymentypeId;
		this.userId = userId;
		this.amount = amount;
		this.configFlag = configFlag;
		this.userCreate = userCreate;
		this.userUpdate = userUpdate;
		this.timeCreate = timeCreate;
		this.timeUpdate = timeUpdate;
	}


	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_payment_config_id")
	private BigDecimal paymentconfigId;
	@Column(name = "payment_type_id")
	private String paymentypeId;
	@Column(name = "user_id")
	private String userId;
	@Column(name = "amount")
	private BigDecimal amount;
	@Column(name = "config_flag")
	private String configFlag;
	@Column(name = "user_create")
	private String userCreate;
	@Column(name = "user_update")
	private String userUpdate;
	@Column(name = "time_create")
	private java.sql.Timestamp timeCreate;
	@Column(name = "time_update")
	private java.sql.Timestamp timeUpdate;
	
	
	
	public BigDecimal getPaymentconfigId() {
		return paymentconfigId;
	}
	public void setPaymentconfigId(BigDecimal paymentconfigId) {
		this.paymentconfigId = paymentconfigId;
	}
	public String getPaymentypeId() {
		return paymentypeId;
	}
	public void setPaymentypeId(String paymentypeId) {
		this.paymentypeId = paymentypeId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getConfigFlag() {
		return configFlag;
	}
	public void setConfigFlag(String configFlag) {
		this.configFlag = configFlag;
	}
	public String getUserCreate() {
		return userCreate;
	}
	public void setUserCreate(String userCreate) {
		this.userCreate = userCreate;
	}
	public String getUserUpdate() {
		return userUpdate;
	}
	public void setUserUpdate(String userUpdate) {
		this.userUpdate = userUpdate;
	}
	public java.sql.Timestamp getTimeCreate() {
		return timeCreate;
	}
	public void setTimeCreate(java.sql.Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}
	public java.sql.Timestamp getTimeUpdate() {
		return timeUpdate;
	}
	public void setTimeUpdate(java.sql.Timestamp timeUpdate) {
		this.timeUpdate = timeUpdate;
	}
	public String toString() {
		return super.toString() + "paymentconfigId=[" + paymentconfigId + "]\n" 
								+ "paymentypeId=[" + paymentypeId + "]\n"
								+ "userId=[" + userId + "]\n" 
								+ "amount=[" + amount + "]\n" 
								+ "configFlag=[" + configFlag + "]"
								+ "userCreate=[" + userCreate + "]\n" 
								+ "userUpdate=[" + userUpdate + "]\n"
								+ "timeCreate=[" + timeCreate + "]\n" 
								+ "timeUpdate=[" + timeUpdate + "] \n";
	}

	public boolean equals(Object obj) {
		if (this == obj) {
            return true;
		}
		if (!(obj instanceof UserPaymentConfig)) {
			return false;
		}
		UserPaymentConfig that = (UserPaymentConfig) obj;
		if (!(that.getPaymentconfigId() == null ? this.getPaymentconfigId() == null 
				: that.getPaymentconfigId().equals(this.getPaymentconfigId()))) {
			return false;
		}
		if (!(that.getPaymentypeId() == null ? this.getPaymentypeId() == null 
				: that.getPaymentypeId().equals(this.getPaymentypeId()))) {
			return false;
		}
		if (!(that.getUserId() == null ? this.getUserId() == null 
				: that.getUserId().equals(this.getUserId()))) {
			return false;
		}
		if (!(that.getAmount() == null ? this.getAmount() == null 
				: that.getAmount().equals(this.getAmount()))) {
			return false;
		}
		if (!(that.getConfigFlag() == null ? this.getConfigFlag() == null 
				: that.getConfigFlag().equals(this.getConfigFlag()))) {
			return false;
		}
		if (!(that.getUserCreate() == null ? this.getUserCreate() == null
				: that.getUserCreate().equals(this.getUserCreate()))) {
			return false;
		}
		if (!(that.getUserUpdate() == null ? this.getUserUpdate() == null
				: that.getUserUpdate().equals(this.getUserUpdate()))) {
			return false;
		}
		if (!(that.getTimeCreate() == null ? this.getTimeCreate() == null
				: that.getTimeCreate().equals(this.getTimeCreate()))) {
			return false;
		}
		if (!(that.getTimeUpdate() == null ? this.getTimeUpdate() == null
				: that.getTimeUpdate().equals(this.getTimeUpdate()))) {
			return false;
		}
		return true;
	}

}
