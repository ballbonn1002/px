package com.cubesofttech.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "feed_post_background")
public class FeedPostBackground {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "feed_postbackground_id")
	private int feed_postbackground_id;
	
	@Column(name = "background_img_path")
	private String background_img_path;
	
	@Column(name = "time_create")
	private Timestamp time_create;
	
	@Column(name = "time_update")
	private Timestamp time_update;
	
	@Column(name = "background_img_name")
	private String background_img_name;
	
	@Column(name = "background_img_file_type")
	private String background_img_file_type;
	
	@Column(name = "user_upload")
	private String user_upload;
	
	@Column(name = "user_update")
	private String user_update;
	
	@Column(name = "used_status")
	private String used_status;

	public int getFeed_postbackground_id() {
		return feed_postbackground_id;
	}

	
	public String getUsed_status() {
		return used_status;
	}


	public void setUsed_status(String used_status) {
		this.used_status = used_status;
	}


	public void setFeed_postbackground_id(int feed_postbackground_id) {
		this.feed_postbackground_id = feed_postbackground_id;
	}

	public String getBackground_img_path() {
		return background_img_path;
	}

	public void setBackground_img_path(String background_img_path) {
		this.background_img_path = background_img_path;
	}

	public Timestamp getTime_create() {
		return time_create;
	}

	public void setTime_create(Timestamp time_create) {
		this.time_create = time_create;
	}

	public Timestamp getTime_update() {
		return time_update;
	}

	public void setTime_update(Timestamp time_update) {
		this.time_update = time_update;
	}

	public String getBackground_img_name() {
		return background_img_name;
	}

	public void setBackground_img_name(String background_img_name) {
		this.background_img_name = background_img_name;
	}

	public String getBackground_img_file_type() {
		return background_img_file_type;
	}

	public void setBackground_img_file_type(String background_img_file_type) {
		this.background_img_file_type = background_img_file_type;
	}

	public String getUser_upload() {
		return user_upload;
	}

	public void setUser_upload(String user_upload) {
		this.user_upload = user_upload;
	}

	public String getUser_update() {
		return user_update;
	}

	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	
	

}
