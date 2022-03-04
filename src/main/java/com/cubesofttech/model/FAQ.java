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

/** BUG*/
@Entity
@Table(name = "faq")
public class FAQ implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "faq_id")
	private Integer faq_id;
	@Column(name = "topic")
	private String topic;
	@Column(name = "details")
	private String details;
	@Column(name = "author")
	private String author;
	@Column(name = "time_posted")
	private Timestamp time_posted;
	@Column(name = "faq_cat_id")
	private Integer faq_cat_id;
	@Column(name = "faq_status_id")
	private Integer faq_status_id;
	@Column(name = "time_updated_post")
	private Timestamp time_updated_post;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}
	
	

//	public FAQ(Integer faq_id, String topic, String details, String author, Timestamp time_posted,
//			Timestamp time_updated_post) {
//		super();
//		this.faq_id = faq_id;
//		this.topic = topic;
//		this.details = details;
//		this.author = author;
//		this.time_posted = time_posted;
//		this.time_updated_post = time_updated_post;
//	}

	

	public FAQ(Integer faq_id, String topic, String details, String author, Timestamp time_posted, Integer faq_cat_id,
			Integer faq_status_id, Timestamp time_updated_post) {
		super();
		this.faq_id = faq_id;
		this.topic = topic;
		this.details = details;
		this.author = author;
		this.time_posted = time_posted;
		this.faq_cat_id = faq_cat_id;
		this.faq_status_id = faq_status_id;
		this.time_updated_post = time_updated_post;
	}

	public Integer getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(Integer faq_id) {
		this.faq_id = faq_id;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Timestamp getTime_posted() {
		return time_posted;
	}

	public void setTime_posted(Timestamp time_posted) {
		this.time_posted = time_posted;
	}

	public Integer getFaq_cat_id() {
		return faq_cat_id;
	}

	public void setFaq_cat_id(Integer faq_cat_id) {
		this.faq_cat_id = faq_cat_id;
	}

	
	
	public Integer getFaq_status_id() {
		return faq_status_id;
	}



	public void setFaq_status_id(Integer faq_status_id) {
		this.faq_status_id = faq_status_id;
	}



	public Timestamp getTime_updated_post() {
		return time_updated_post;
	}

	public void setTime_updated_post(Timestamp time_updated_post) {
		this.time_updated_post = time_updated_post;
	}

	
	
	
	

}
