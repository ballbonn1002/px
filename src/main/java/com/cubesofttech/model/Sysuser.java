package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sys_user")
public class Sysuser implements Serializable{
	
@Id
@Column(name="sys_user_id")
private String sys_user_id;

@Column(name="sys_role_id")
private String sys_role_id;
@Column(name="user_id")
private String user_id;
@Column(name="name_th")
private String name_th;
@Column(name="email")
private String email;
@Column(name="phone")
private String phone;
@Column(name="is_active")
private String is_active;
@Column(name="password")
private String password;
@Column(name="user_create")
private String user_create;
@Column(name="user_update")
private String user_update;
@Column(name="time_create")
private java.sql.Timestamp timeCreate;
@Column(name="time_update")
private java.sql.Timestamp timeUpdate;

public String getSys_user_id() {
	return sys_user_id;
}
public void setSys_user_id(String sys_user_id) {
	this.sys_user_id = sys_user_id;
}
public String getSys_role_id() {
	return sys_role_id;
}
public void setSys_role_id(String sys_role_id) {
	this.sys_role_id = sys_role_id;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getName_th() {
	return name_th;
}
public void setName_th(String name_th) {
	this.name_th = name_th;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getIs_active() {
	return is_active;
}
public void setIs_active(String is_active) {
	this.is_active = is_active;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
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
    return super.toString() + "sys_user_id=[" + sys_user_id + "]\n" + "sys_role_id=[" + sys_role_id + "]\n" + "user_id=[" + user_id + "]\n"
    						+ "name_th=[" + name_th + "]\n"+ "email=[" + email + "]\n"+ "phone=[" + phone + "]\n"+ "is_active=[" + is_active + "]\n"
    						+ "password=[" + password + "]\n" + "user_create=[" + user_create + "]\n" + "user_update=[" + user_update + "]\n" 
    						+ "timeCreate=[" + timeCreate + "]\n" + "timeUpdate=[" + timeUpdate + "]\n";
}

public boolean equals(Object obj) {
    if (this == obj) {
            return true;
    }
    if (!(obj instanceof Sysuser)) {
            return false;
    }
    Sysuser that = (Sysuser) obj;
    if (!(that.getSys_user_id() == null ? this.getSys_user_id() == null
                    : that.getSys_user_id().equals(this.getSys_user_id()))) {
            return false;
    }
    if (!(that.getSys_role_id() == null ? this.getSys_role_id() == null
                    : that.getSys_role_id().equals(this.getSys_role_id()))) {
            return false;
    }
    if (!(that.getUser_id() == null ? this.getUser_id() == null
                    : that.getUser_id().equals(this.getUser_id()))) {
            return false;
    }
    if (!(that.getName_th() == null ? this.getName_th() == null
            : that.getName_th().equals(this.getName_th()))) {
    return false;
}
    if (!(that.getEmail() == null ? this.getEmail() == null
            : that.getEmail().equals(this.getEmail()))) {
    return false;
}
    if (!(that.getPhone() == null ? this.getPhone() == null
            : that.getPhone().equals(this.getPhone()))) {
    return false;
}
    if (!(that.getIs_active() == null ? this.getIs_active() == null
            : that.getIs_active().equals(this.getIs_active()))) {
    return false;
}
    if (!(that.getPassword() == null ? this.getPassword() == null
            : that.getPassword().equals(this.getPassword()))) {
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
