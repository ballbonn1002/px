package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="page_group")
public class PageGroup implements Serializable{
	@Id
	@Column(name="page_group_id")
	public String page_group_id;
	@Column(name="group_name")
	public String group_name;
	@Column(name="is_active")
	public String is_active;
	@Column(name="description")
	public String description;
	@Column(name="user_create")
	public String user_create;
	@Column(name="user_update")
	public String user_update;
	@Column(name="time_create")
	public String time_create;
	@Column(name="time_update")
	public String time_update;
	
	public String getPage_group_id() {
		return page_group_id;
	}
	public void setPage_group_id(String page_group_id) {
		this.page_group_id = page_group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getIs_active() {
		return is_active;
	}
	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getTime_create() {
		return time_create;
	}
	public void setTime_create(String time_create) {
		this.time_create = time_create;
	}
	public String getTime_update() {
		return time_update;
	}
	public void setTime_update(String time_update) {
		this.time_update = time_update;
	}
	

}
