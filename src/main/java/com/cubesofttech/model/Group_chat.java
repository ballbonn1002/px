package com.cubesofttech.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="group_chat")
public class Group_chat {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Group_chat_id")
	private int Group_chat_id;
	
	@Column(name = "Group_chat_Name")
	private String Group_chat_Name;
	
	@Column(name = "Group_chat_user_create")
	private String Group_chat_user_create;
	
	@Column(name = "Group_time_create")
	private Timestamp Group_time_create;

	@Column(name = "Group_Description")
	private String Group_Description;
	
	@Column(name = "Group_img_path")
	private String Group_img_path;

	@Column(name="Group_chat_user_update")
	private String Group_chat_user_update;
	
	@Column(name="Group_chat_time_update")
	private Timestamp Group_chat_time_update;
	
	

	
	public String getGroup_chat_user_update() {
		return Group_chat_user_update;
	}

	public void setGroup_chat_user_update(String group_chat_user_update) {
		Group_chat_user_update = group_chat_user_update;
	}

	public Timestamp getGroup_chat_time_update() {
		return Group_chat_time_update;
	}

	public void setGroup_chat_time_update(Timestamp group_chat_time_update) {
		Group_chat_time_update = group_chat_time_update;
	}

	public String getGroup_img_path() {
		return Group_img_path;
	}

	public void setGroup_img_path(String group_img_path) {
		Group_img_path = group_img_path;
	}

	public String getGroup_Description() {
		return Group_Description;
	}

	public void setGroup_Description(String group_Description) {
		Group_Description = group_Description;
	}

	public int getGroup_chat_id() {
		return Group_chat_id;
	}

	public void setGroup_chat_id(int group_chat_id) {
		Group_chat_id = group_chat_id;
	}

	public String getGroup_chat_Name() {
		return Group_chat_Name;
	}

	public void setGroup_chat_Name(String group_chat_Name) {
		Group_chat_Name = group_chat_Name;
	}

	public String getGroup_chat_user_create() {
		return Group_chat_user_create;
	}

	public void setGroup_chat_user_create(String group_chat_user_create) {
		Group_chat_user_create = group_chat_user_create;
	}

	public Timestamp getGroup_time_create() {
		return Group_time_create;
	}

	public void setGroup_time_create(Timestamp group_time_create) {
		Group_time_create = group_time_create;
	}
	
	
}
