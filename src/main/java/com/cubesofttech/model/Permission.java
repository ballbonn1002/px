package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="permission")
public class Permission implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="permission_id")
	public Integer permission_id;
	
	@Column(name="sys_role_id")
	public String sys_role_id;
	
	@Column(name="page_id")
	public String page_id;
	
	@Column(name="page_name")
	public String page_name;
	
	public String getPage_name() {
		return page_name;
	}

	public void setPage_name(String page_name) {
		this.page_name = page_name;
	}

	@Column(name="description")
	public String description;
	
	@Column(name="page_group_active")
	public String page_group_active;
	
	@Column(name="page_active")
	public String page_active;
	
	@Column(name="view")
	public String view;
	
	@Column(name="create_update")
	public String create_update;
	
	@Column(name="delete_role")
	public String delete_role;
	
	@Column(name="approve")
	public String approve;
	
	@Column(name="user_create")
	public String user_create;
	
	@Column(name="user_update")
	public String user_update;
	
	@Column(name="time_create")
	public java.sql.Timestamp time_create;
	
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

	@Column(name="time_update")
	public java.sql.Timestamp time_update;
	
	public Integer getPermission_id() {
		return permission_id;
	}

	public void setPermission_id(Integer permission_id) {
		this.permission_id = permission_id;
	}

	public String getSys_role_id() {
		return sys_role_id;
	}

	public void setSys_role_id(String sys_role_id) {
		this.sys_role_id = sys_role_id;
	}

	public String getPage_id() {
		return page_id;
	}

	public void setPage_id(String page_id) {
		this.page_id = page_id;
	}

	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPage_group_active() {
		return page_group_active;
	}

	public void setPage_group_active(String page_group_active) {
		this.page_group_active = page_group_active;
	}

	public String getPage_active() {
		return page_active;
	}

	public void setPage_active(String page_active) {
		this.page_active = page_active;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getCreate_update() {
		return create_update;
	}

	public void setCreate_update(String create_update) {
		this.create_update = create_update;
	}

	public String getDelete_role() {
		return delete_role;
	}

	public void setDelete_role(String delete_role) {
		this.delete_role = delete_role;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
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
	
	 public String toString() {
	        return super.toString() + "permission_id=[" + permission_id + "]\n" + "sys_role_id=["+ sys_role_id + "]\n" + "page_id=["+page_id + "]\n" + "page_name=[" + page_name + "]\n"+ "description=[" + description + "]\n"
	                                   +"page_group_active=[" + page_group_active + "]\n" + "page_active=[" + page_active + "]\n"
	                                   +"view=[" + view + "]\n"+"create_update=[" + create_update + "]\n"+"delete_role=[" + delete_role + "]\n"+"approve=[" + approve + "]\n"
	        		                   +"user_create=[" + user_create + "]\n"+"user_update=[" + user_update + "]\n"+"timeCreate=[" + time_create + "]\n" + "timeUpdate=[" + time_update + "]\n";
	    }

	    public boolean equals(Object obj) {
	        if (this == obj) {
	                return true;
	        }
	        if (!(obj instanceof Permission)) {
	                return false;
	        }
	        Permission that = (Permission) obj;
	        if (!(that.getPermission_id() == null ? this.getPermission_id() == null
	                        : that.getPermission_id().equals(this.getPermission_id()))) {
	                return false;
	        }
	        if (!(that.getSys_role_id() == null ? this.getSys_role_id() == null
                    : that.getSys_role_id().equals(this.getSys_role_id()))) {
            return false;
	        }
	        if (!(that.getPage_id() == null ? this.getPage_id() == null
                    : that.getPage_id().equals(this.getPage_id()))) {
            return false;
	        }
	        if (!(that.getPage_name() == null ? this.getPage_name() == null
	                        : that.getPage_name().equals(this.getPage_name()))) {
	                return false;
	        }
	        if (!(that.getDescription() == null ? this.getDescription() == null
	                        : that.getDescription().equals(this.getDescription()))) {
	                return false;
	        }
	        if (!(that.getPage_group_active() == null ? this.getPage_group_active() == null
                    : that.getPage_group_active().equals(this.getPage_group_active()))) {
            return false;
	        }
	        if (!(that.getPage_active() == null ? this.getPage_active() == null
                    : that.getPage_active().equals(this.getPage_active()))) {
            return false;
	        }
	        if (!(that.getView() == null ? this.getView() == null
                    : that.getView().equals(this.getView()))) {
            return false;
	        }
	        if (!(that.getCreate_update() == null ? this.getCreate_update() == null
                    : that.getCreate_update().equals(this.getCreate_update()))) {
            return false;
	        }
	        if (!(that.getDelete_role() == null ? this.getDelete_role() == null
                    : that.getDelete_role().equals(this.getDelete_role()))) {
            return false;
	        }
	        if (!(that.getApprove() == null ? this.getApprove() == null
                    : that.getApprove().equals(this.getApprove()))) {
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
	
	

	

}
