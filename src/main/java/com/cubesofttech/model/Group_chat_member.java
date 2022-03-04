package com.cubesofttech.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_chat_member")
public class Group_chat_member {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Group_chat_member_id")
	private int Group_chat_member_id;
	
	@Column(name="Group_chat_id")
	private int Group_chat_id;
	
	@Column(name="member_id")
	private String member_id;
	
	@Column(name="inviter_member_id")
	private String inviter_member_id;
	
	@Column(name="member_time_create")
	private Timestamp member_time_create;
	
	@Column(name="favorite_mark")
	private String favorite_mark;

	
	public String getFavorite_mark() {
		return favorite_mark;
	}

	public void setFavorite_mark(String favorite_mark) {
		this.favorite_mark = favorite_mark;
	}

	public int getGroup_chat_member_id() {
		return Group_chat_member_id;
	}

	public void setGroup_chat_member_id(int group_chat_member_id) {
		Group_chat_member_id = group_chat_member_id;
	}

	public int getGroup_chat_id() {
		return Group_chat_id;
	}

	public void setGroup_chat_id(int group_chat_id) {
		Group_chat_id = group_chat_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getInviter_member_id() {
		return inviter_member_id;
	}

	public void setInviter_member_id(String inviter_member_id) {
		this.inviter_member_id = inviter_member_id;
	}

	public Timestamp getMember_time_create() {
		return member_time_create;
	}

	public void setMember_time_create(Timestamp member_time_create) {
		this.member_time_create = member_time_create;
	}
	
	
}
