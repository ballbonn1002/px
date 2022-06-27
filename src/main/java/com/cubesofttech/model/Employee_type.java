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
@Table(name = "employee_type")
public class Employee_type implements Serializable {
    
	/** Creates a new instance of Department */
    public  Employee_type() {
    }
    public  Employee_type(
            Integer employee_type_id 	
            , String name
            , String description
            , String payment
            , String term
            , String term_day
            , String usercreate	
            , String userupdate
            , java.sql.Timestamp timeCreate	
            , java.sql.Timestamp timeUpdate	
        ) {
        this.employee_type_id  = employee_type_id ;	
        this.name = name;	
        this.description = description;	
        this.payment = payment;
        this.term = term;
        this.term_day = term_day;
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
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "employee_type_id ")
    private Integer employee_type_id ;	
    @Column(name = "name")
    private String name;	
    @Column(name = "description")
    private String description;	
    @Column(name = "payment")
    private String payment;	
    @Column(name = "term")
    private String term;
    @Column(name = "term_day")
    private String term_day;	
    @Column(name = "user_create")
    private String usercreate;
    @Column(name = "user_update")
    private String userupdate;	
    @Column(name = "time_create")
    private java.sql.Timestamp timeCreate;	
    @Column(name = "time_update")
    private java.sql.Timestamp timeUpdate;
    


    public Integer getEmployee_type_id() {
		return employee_type_id;
	}
	public void setEmployee_type_id(Integer employee_type_id) {
		this.employee_type_id = employee_type_id;
	}
	public String getName() {
        return this.name;
    }		
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return this.description;
    }		
    public void setDescription(String description) {
        this.description = description;
    }
    public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getTerm_day() {
		return term_day;
	}
	public void setTerm_day(String term_day) {
		this.term_day = term_day;
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
        						+ "name=[" + name + "]\n" + "description=[" + description + "]\n"
        						+ "payment=[" + payment + "]\n" + "term=[" + term + "]\n"+ "term_day=[" + term_day + "]\n"
        						+ "timeCreate=[" + timeCreate + "]\n" + "timeUpdate=[" + timeUpdate + "]\n";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
                return true;
        }
        if (!(obj instanceof Employee_type)) {
                return false;
        }
        Employee_type that = (Employee_type) obj;
        if (!(that.getEmployee_type_id()== null ? this.getEmployee_type_id() == null
                        : that.getEmployee_type_id().equals(this.getEmployee_type_id()))) {
                return false;
        }
        if (!(that.getName() == null ? this.getName() == null
                        : that.getName().equals(this.getName()))) {
                return false;
        }
        if (!(that.getPayment() == null ? this.getPayment() == null
                		: that.getPayment().equals(this.getPayment()))) {
        		return false;
        }
        if (!(that.getTerm() == null ? this.getTerm() == null
                		: that.getTerm().equals(this.getTerm()))) {
        		return false;
        }
        if (!(that.getTerm_day() == null ? this.getTerm_day() == null
                		: that.getTerm_day().equals(this.getTerm_day()))) {
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
