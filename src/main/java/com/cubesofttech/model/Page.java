package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="page")
public class Page implements Serializable{
	@Id
	@Column(name="page_id")
	public String page_id;
	
	@Column(name="page_group_id")
	public String page_group_id;
	
	@Column(name="page_name")
	public String page_name;
	
	@Column(name="is_active")
	public String is_active;
	
	@Column(name="redirect")
	public String redirect;
	
	@Column(name="check_view")
	public String check_view;
	
	@Column(name="check_create_update")
	public String check_create_update;
	
	@Column(name="check_delete")
	public String check_delete;
	
	@Column(name="check_approve")
	public String check_approve;
	
	public String getPage_id() {
		return page_id;
	}

	public void setPage_id(String page_id) {
		this.page_id = page_id;
	}

	public String getPage_group_id() {
		return page_group_id;
	}

	public void setPage_group_id(String page_group_id) {
		this.page_group_id = page_group_id;
	}

	public String getPage_name() {
		return page_name;
	}

	public void setPage_name(String page_name) {
		this.page_name = page_name;
	}

	public String getIs_active() {
		return is_active;
	}

	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	public String getCheck_view() {
		return check_view;
	}

	public void setCheck_view(String check_view) {
		this.check_view = check_view;
	}

	public String getCheck_create_update() {
		return check_create_update;
	}

	public void setCheck_create_update(String check_create_update) {
		this.check_create_update = check_create_update;
	}

	public String getCheck_delete() {
		return check_delete;
	}

	public void setCheck_delete(String check_delete) {
		this.check_delete = check_delete;
	}

	public String getCheck_approve() {
		return check_approve;
	}

	public void setCheck_approve(String check_approve) {
		this.check_approve = check_approve;
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


}
