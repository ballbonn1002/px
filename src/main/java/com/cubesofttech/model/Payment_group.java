package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "payment_group")
@NamedQueries({
    @NamedQuery(name = "Payment_group.findAll", query = "SELECT t FROM Payment_group t")})
public class Payment_group implements Serializable {
	public  Payment_group() {
		
	}
	public Payment_group(
			Integer payment_group_id,
			String name,
			java.sql.Date transaction_date,
			java.sql.Date payment_date,
			java.sql.Date start_date,
			java.sql.Date end_date,
			String social_security,
			String description,
			String status,
			String system,
			String user_create,
			String user_update,
			java.sql.Timestamp timeCreate,
			java.sql.Timestamp timeUpdate	
			
	) {
        this.payment_group_id  = payment_group_id  ;	
        this.name = name;
        this.transaction_date = transaction_date;
        this.payment_date = payment_date;	
        this.start_date = start_date;
        this.end_date = end_date;
        this.social_security = social_security;
        this.description = description;	
        this.status = status;
        this.system = system;
        this.user_create = user_create;
        this.user_update = user_update;
        this.timeCreate = timeCreate;	
        this.timeUpdate = timeUpdate;	
	}
	@Id
    @Column(name = "payment_group_id ")
    private Integer payment_group_id ;	
    @Column(name = "name")
    private String name;
    @Column(name = "transaction_date")
    private java.sql.Date transaction_date;
    @Column(name = "payment_date")
    private java.sql.Date payment_date;
    @Column(name = "start_date")
    private java.sql.Date start_date;
    @Column(name = "end_date")
    private java.sql.Date end_date;	
    @Column(name = "social_security")
    private String social_security;
    @Column(name = "description")
    private String description;	
    @Column(name = "status")
    private String status;	
    @Column(name = "system")
    private String system;
    @Column(name = "user_update")
    private String user_update;	
    @Column(name = "user_create")
    private String user_create;
    @Column(name = "time_create")
    private java.sql.Timestamp timeCreate;	
    @Column(name = "time_update")
    private java.sql.Timestamp timeUpdate;
    
    
    
	public Integer getPayment_group_id() {
		return payment_group_id;
	}
	public void setPayment_group_id(Integer payment_group_id) {
		this.payment_group_id = payment_group_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Date getTransaction_date() {
		return transaction_date;
	}
	public void setTransaction_date(java.sql.Date transaction_date) {
		this.transaction_date = transaction_date;
	}
	public java.sql.Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(java.sql.Date payment_date) {
		this.payment_date = payment_date;
	}
	public java.sql.Date getStart_date() {
		return start_date;
	}
	public void setStart_date(java.sql.Date start_date) {
		this.start_date = start_date;
	}
	public java.sql.Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(java.sql.Date end_date) {
		this.end_date = end_date;
	}
	public String getSocial_security() {
		return social_security;
	}
	public void setSocial_security(String social_security) {
		this.social_security = social_security;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
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
        return super.toString() + "Payment_group_id  =[" + payment_group_id  + "]\n" + "name=[" + name + "]\n" 
        						+ "Transaction_date=[" + transaction_date + "]\n" + "Payment_date=[" + payment_date + "]\n" + "start_date=[" + start_date + "]\n"
        						+ "end_date=[" + end_date + "]\n" + "social_security=[" + social_security + "]\n" + "description=[" + description + "]\n"
        						+ "status=[" + status + "]\n" + "system=[" + system + "]\n" + "user_update=[" + user_update + "]\n" + "user_create=[" + user_create + "]\n" 
        						+ "timeCreate=[" + timeCreate + "]\n" + "timeUpdate=[" + timeUpdate + "]\n";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
                return true;
        }
        if (!(obj instanceof Payment_group)) {
                return false;
        }
        Payment_group that = (Payment_group) obj;
        if (!(that.getPayment_group_id  () == null ? this.getPayment_group_id () == null
                        : that.getPayment_group_id  ().equals(this.getPayment_group_id ()))) {
                return false;
        }
        if (!(that.getName() == null ? this.getName() == null
                        : that.getName().equals(this.getName()))) {
                return false;
        }
        if (!(that.getTransaction_date() == null ? this.getTransaction_date() == null
                : that.getTransaction_date().equals(this.getTransaction_date()))) {
        return false;
        }
        if (!(that.getPayment_date() == null ? this.getPayment_date() == null
                : that.getPayment_date().equals(this.getPayment_date()))) {
        return false;
        }
        if (!(that.getStart_date() == null ? this.getStart_date() == null
                : that.getStart_date().equals(this.getStart_date()))) {
        return false;
        }
        if (!(that.getEnd_date() == null ? this.getEnd_date() == null
                : that.getEnd_date().equals(this.getEnd_date()))) {
        return false;
        }
        if (!(that.getSocial_security() == null ? this.getSocial_security() == null
                : that.getSocial_security().equals(this.getSocial_security()))) {
        return false;
        }
        if (!(that.getDescription() == null ? this.getDescription() == null
                        : that.getDescription().equals(this.getDescription()))) {
                return false;
        }
        if (!(that.getStatus() == null ? this.getStatus() == null
                : that.getStatus().equals(this.getStatus()))) {
        return false;
        }
        if (!(that.getSystem() == null ? this.getSystem() == null
                : that.getSystem().equals(this.getSystem()))) {
        return false;
        }
        if (!(that.getUser_create() == null ? this.getUser_create() == null
                : that.getUser_create().equals(this.getUser_create()))) {
        return false;
        }
        if (!(that.getUser_update() == null ? this.getUser_update() == null
                : that.getUser_update().equals(this.getUser_update()))) {
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