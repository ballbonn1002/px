package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "employee_type")
@NamedQueries({
    @NamedQuery(name = "Employee_type.findAll", query = "SELECT t FROM Employee_type t")})
public class Employee_type implements Serializable {
    
	/** Creates a new instance of Department */
    public  Employee_type() {
    }
    public  Employee_type(
            String employee_type_id 	
            , String name
            , String payout_type	
            , String pay_period	
            , String day_period	
            , String description
            , String usercreate	
            , String userupdate
            , java.sql.Timestamp timeCreate	
            , java.sql.Timestamp timeUpdate	
        ) {
        this.employee_type_id  = employee_type_id ;	
        this.name = name;
        this.payout_type = payout_type;
        this.pay_period = pay_period;	
        this.day_period	 =day_period;	
        this.description = description;	
        this.usercreate = usercreate;
        this.userupdate = userupdate;
        this.timeCreate = timeCreate;	
        this.timeUpdate = timeUpdate;	
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

	@Id
    @Column(name = "employee_type_id ")
    private String employee_type_id ;	
    @Column(name = "name")
    private String name;
    
    @Column(name = "payout_type")
    private String payout_type;
    @Column(name = "pay_period")
    private String pay_period;	
    @Column(name = "day_period")
    private String day_period;	
    
    @Column(name = "description")
    private String description;	
    @Column(name = "user_create")
    private String usercreate;
    @Column(name = "user_update")
    private String userupdate;	
    @Column(name = "time_create")
    private java.sql.Timestamp timeCreate;	
    @Column(name = "time_update")
    private java.sql.Timestamp timeUpdate;
    



    public String getemployee_type_id () {
        return this.employee_type_id ;
    }		
    public void setemployee_type_id (String employee_type_id ) {
        this.employee_type_id  = employee_type_id ;
    }
    public String getName() {
        return this.name;
    }		
    public void setName(String name) {
        this.name = name;
    }
    public String getpayout_type () {
        return this.payout_type ;
    }		
    public void setpayout_type (String payout_type ) {
        this.payout_type  = payout_type ;
    }
    public String getpay_period () {
        return this.pay_period ;
    }		
    public void setpay_period (String pay_period ) {
        this.pay_period  = pay_period ;
    }
    public String getday_period () {
        return this.day_period ;
    }		
    public void setday_period (String day_period ) {
        this.day_period  = day_period ;
    }
    public String getDescription() {
        return this.description;
    }		
    public void setDescription(String description) {
        this.description = description;
    }
    public java.sql.Timestamp getTimeCreate() {
        return this.timeCreate;
    }		
    public void setTimeCreate(java.sql.Timestamp timeCreate) {
        this.timeCreate = timeCreate;
    }
    public java.sql.Timestamp getTimeUpdate() {
        return this.timeUpdate;
    }		
    public void setTimeUpdate(java.sql.Timestamp timeUpdate) {
        this.timeUpdate = timeUpdate;
    }
    


    
    public String toString() {
        return super.toString() + "employee_type_id =[" + employee_type_id  + "]\n"
        						+ "name=[" + name + "]\n" 
        						+ "payout_type=[" + payout_type + "]\n" + "pay_period=[" + pay_period + "]\n"+ "day_period=[" + day_period + "]\n"
        						+ "description=[" + description + "]\n" + "timeCreate=[" + timeCreate + "]\n" + "timeUpdate=[" + timeUpdate + "]\n";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
                return true;
        }
        if (!(obj instanceof Employee_type)) {
                return false;
        }
        Employee_type that = (Employee_type) obj;
        if (!(that.getemployee_type_id () == null ? this.getemployee_type_id () == null
                        : that.getemployee_type_id ().equals(this.getemployee_type_id ()))) {
                return false;
        }
        if (!(that.getName() == null ? this.getName() == null
                        : that.getName().equals(this.getName()))) {
                return false;
        }
        if (!(that.getpayout_type() == null ? this.getpayout_type() == null
                : that.getpayout_type().equals(this.getpayout_type()))) {
        return false;
        }
        if (!(that.getpay_period() == null ? this.getpay_period() == null
                : that.getpay_period().equals(this.getpay_period()))) {
        return false;
        }
        if (!(that.getday_period() == null ? this.getday_period() == null
                : that.getday_period().equals(this.getday_period()))) {
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
