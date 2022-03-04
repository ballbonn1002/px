package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "feednews")
public class FeedNews implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "feed_id")
	private Integer feed_id;
	
	
	@Column(name = "details")
	private String details;
	@Column(name = "user_id")
	private String user_id;
	@Column(name = "status_post")
	private Integer 	status_post;
	@Column(name = "backgroundType")
	private String 	backgroundType;
	@Column(name = "backgroundRGB")
	private String 	backgroundRGB;
	@Column(name = "backgroundpathid")
	private String backgroundpathid;
	@Column(name = "path_url")
	private String path_url;
	@Column(name = "time_posted")
	private Timestamp time_posted;
	@Column(name = "time_updated_post")
	private Timestamp time_updated_post;

	public FeedNews() {
		// TODO Auto-generated constructor stub
	}

	public FeedNews(String details, String user_id,Integer status_post,String backgroundRGB,String backgroundType,String path_url,Timestamp time_posted, Timestamp time_updated_post) {
		super();
//		this.feed_id = feed_id;
		this.details = details;
		this.user_id = user_id;
		this.path_url = path_url;
		this.status_post = status_post;
		this.time_posted = time_posted;
		this.time_updated_post = time_updated_post;
		this.backgroundType = backgroundType;
		this.backgroundRGB = backgroundRGB;
		
	}
	
	public String getBackgroundpathid() {
		return backgroundpathid;
	}

	public void setBackgroundpathid(String backgroundpathid) {
		this.backgroundpathid = backgroundpathid;
	}

	public String getBackgroundRGB() {
		return backgroundRGB;
	}

	public void setBackgroundRGB(String backgroundRGB) {
		this.backgroundRGB = backgroundRGB;
	}
	public String getBackgroundType() {
		return backgroundType;
	}

	public void setBackgroundType(String backgroundType) {
		this.backgroundType = backgroundType;
	}
	public Integer getStatus_post() {
		return status_post;
	}

	public void setStatus_post(Integer status_post) {
		this.status_post = status_post;
	}

	public Integer getFeed_id() {
		return feed_id;
	}

	public void setFeed_id(Integer feed_id) {
		this.feed_id = feed_id;
	}

	public String 	getPath_url() {
		return 	path_url;
	}

	public void 	setPath_url(String path_url) {
		this.path_url = path_url;
	}
	
	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Timestamp getTime_posted() {
		return time_posted;
	}

	public void setTime_posted(Timestamp time_posted) {
		this.time_posted = time_posted;
	}

	public Timestamp getTime_updated_post() {
		return time_updated_post;
	}

	public void setTime_updated_post(Timestamp time_updated_post) {
		this.time_updated_post = time_updated_post;
	}

}
