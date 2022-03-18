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
            , String description	
            , java.sql.Timestamp timeCreate	
            , java.sql.Timestamp timeUpdate	
        ) {
        this.employee_type_id  = employee_type_id ;	
        this.name = name;	
        this.description = description;	
        this.timeCreate = timeCreate;	
        this.timeUpdate = timeUpdate;	
    }


	@Id
    @Column(name = "employee_type_id ")
    private String employee_type_id ;	
    @Column(name = "name")
    private String name;	
    @Column(name = "description")
    private String description;	
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
        return super.toString() + "employee_type_id =[" + employee_type_id  + "]\n" + "name=[" + name + "]\n" + "description=[" + description + "]\n" + "timeCreate=[" + timeCreate + "]\n" + "timeUpdate=[" + timeUpdate + "]\n";
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
