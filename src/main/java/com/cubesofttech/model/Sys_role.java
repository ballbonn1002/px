package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;






@Entity
@Table(name="sys_role")

public class Sys_role implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="sys_role_id")
	public Integer sys_role_id;
	@Column(name="name")
	public String Name;
	@Column(name="description")
	public String description;
	@Column(name="administrator")
	public String administrator;
	@Column(name="user_create")
	public String user_create;
	@Column(name="user_update")
	public String user_update;
	@Column(name="time_create")
	public java.sql.Timestamp time_create;
	
	
	public void setTime_create(java.sql.Timestamp time_create) {
		this.time_create = time_create;
	}
	public void setTime_update(java.sql.Timestamp time_update) {
		this.time_update = time_update;
	}
	public Integer getSys_role_id() {
		return sys_role_id;
	}
	public void setSys_role_id(Integer sys_role_id) {
		this.sys_role_id = sys_role_id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAdministrator() {
		return administrator;
	}
	public void setAdministrator(String administrator) {
		this.administrator = administrator;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	@Column(name="time_update")
	public java.sql.Timestamp time_update;
	
	 public String toString() {
	        return super.toString() + "id=[" + sys_role_id + "]\n" + "name=[" + Name + "]\n" + "description=[" + description + "]\n" + "timeCreate=[" + time_create + "]\n" + "timeUpdate=[" + time_update + "]\n";
	    }

	    public boolean equals(Object obj) {
	        if (this == obj) {
	                return true;
	        }
	        if (!(obj instanceof Sys_role)) {
	                return false;
	        }
	        Sys_role that = (Sys_role) obj;
	        if (!(that.getSys_role_id() == null ? this.getSys_role_id() == null
	                        : that.getSys_role_id().equals(this.getSys_role_id()))) {
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
	        if (!(that.getTime_create() == null ? this.getSys_role_id() == null
	                        : that.getSys_role_id().equals(this.getSys_role_id()))) {
	                return false;
	        }
	        if (!(that.getTime_update() == null ? this.getTime_update() == null
	                        : that.getTime_update().equals(this.getTime_update()))) {
	                return false;
	        }
	    return true;
	    }
		public java.sql.Timestamp getTime_create() {
			return time_create;
		}
		public java.sql.Timestamp getTime_update() {
			return time_update;
		}

	
	
	

}
