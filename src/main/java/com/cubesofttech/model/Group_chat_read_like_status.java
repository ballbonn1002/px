package com.cubesofttech.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_chat_read_like_status")
public class Group_chat_read_like_status {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Group_chat_read_like_status_id")
	private int Group_chat_read_like_status_id;
	
	@Column(name="Group_chat_message_id")
	private int Group_chat_message_id;
	
	@Column(name="Group_chat_id")
	private int Group_chat_id;
	
	@Column(name="read_status")
	private char read_status;

	@Column(name="like_status")
	private char like_status;

	@Column(name="user_id")
	private String user_id;

	
	public int getGroup_chat_id() {
		return Group_chat_id;
	}

	public void setGroup_chat_id(int group_chat_id) {
		Group_chat_id = group_chat_id;
	}

	public int getGroup_chat_read_like_status_id() {
		return Group_chat_read_like_status_id;
	}

	public void setGroup_chat_read_like_status_id(int group_chat_read_like_status_id) {
		Group_chat_read_like_status_id = group_chat_read_like_status_id;
	}

	public int getGroup_chat_message_id() {
		return Group_chat_message_id;
	}

	public void setGroup_chat_message_id(int group_chat_message_id) {
		Group_chat_message_id = group_chat_message_id;
	}

	public char getRead_status() {
		return read_status;
	}

	public void setRead_status(char read_status) {
		this.read_status = read_status;
	}

	public char getLike_status() {
		return like_status;
	}

	public void setLike_status(char like_status) {
		this.like_status = like_status;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
