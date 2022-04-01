package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "payment_type")
@NamedQueries({
    @NamedQuery(name = "Payment_type.findAll", query = "SELECT t FROM Payment_type t")})
public class Payment_type implements Serializable {
	public  Payment_type() {
		
	}
	public Payment_type(
			String payment_type_id,
			String payment_type_name,
			String type,
			String system,
			String sequence,
			String config_flag,
			String description,
			String usercreate,
			String userupdate,
			java.sql.Timestamp timeCreate,
			java.sql.Timestamp timeUpdate	
			
	) {
        this.Payment_type_id  = payment_type_id ;	
        this.Payment_type_name = payment_type_name;
        this.type = type;
        this.system = system;
        this.sequence = sequence;	
        this.config_flag = config_flag;	
        this.description = description;	
        this.usercreate = usercreate;
        this.userupdate = userupdate;
        this.timeCreate = timeCreate;	
        this.timeUpdate = timeUpdate;	
	}
	@Id
    @Column(name = "Payment_type_id ")
    private String Payment_type_id ;	
    @Column(name = "Payment_type_name")
    private String Payment_type_name;
    @Column(name = "type")
    private String type;
    @Column(name = "system")
    private String system;
    @Column(name = "sequence")
    private String sequence;
    @Column(name = "config_flag")
    private String config_flag;	
    @Column(name = "description")
    private String description;	
   
    public String getPayment_type_id() {
		return Payment_type_id;
	}
	public void setPayment_type_id(String payment_type_id) {
		Payment_type_id = payment_type_id;
	}
	public String getPayment_type_name() {
		return Payment_type_name;
	}
	public void setPayment_type_name(String payment_type_name) {
		Payment_type_name = payment_type_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getConfig_flag() {
		return config_flag;
	}
	public void setConfig_flag(String config_flag) {
		this.config_flag = config_flag;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUsercreate() {
		return usercreate;
	}
	public void setUsercreate(String usercreate) {
		this.usercreate = usercreate;
	}
	public String getUserupdate() {
		return userupdate;
	}
	public void setUserupdate(String userupdate) {
		this.userupdate = userupdate;
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
	@Column(name = "user_create")
    private String usercreate;
    @Column(name = "user_update")
    private String userupdate;	
    @Column(name = "time_create")
    private java.sql.Timestamp timeCreate;	
    @Column(name = "time_update")
    private java.sql.Timestamp timeUpdate;
    
    
    
    
    
    
    public String toString() {
        return super.toString() + "Payment_type_id  =[" + Payment_type_id  + "]\n" + "Payment_type_name=[" + Payment_type_name + "]\n" 
        						+ "type=[" + type + "]\n" + "system=[" + system + "]\n" + "sequence=[" + sequence + "]\n"
        						+ "config_flag=[" + config_flag + "]\n" + "description=[" + description + "]\n" + "timeCreate=[" + timeCreate + "]\n" 
        						+ "timeUpdate=[" + timeUpdate + "]\n";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
                return true;
        }
        if (!(obj instanceof Payment_type)) {
                return false;
        }
        Payment_type that = (Payment_type) obj;
        if (!(that.getPayment_type_id  () == null ? this.getPayment_type_id () == null
                        : that.getPayment_type_id  ().equals(this.getPayment_type_id ()))) {
                return false;
        }
        if (!(that.getPayment_type_name() == null ? this.getPayment_type_name() == null
                        : that.getPayment_type_name().equals(this.getPayment_type_name()))) {
                return false;
        }
        if (!(that.getType() == null ? this.getType() == null
                : that.getType().equals(this.getType()))) {
        return false;
        }
        if (!(that.getSystem() == null ? this.getSystem() == null
                : that.getSystem().equals(this.getSystem()))) {
        return false;
        }
        if (!(that.getSequence() == null ? this.getSequence() == null
                : that.getSequence().equals(this.getSequence()))) {
        return false;
        }
        if (!(that.getConfig_flag() == null ? this.getConfig_flag() == null
                : that.getConfig_flag().equals(this.getConfig_flag()))) {
        return false;
        }
        if (!(that.getDescription() == null ? this.getDescription() == null
                        : that.getDescription().equals(this.getDescription()))) {
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