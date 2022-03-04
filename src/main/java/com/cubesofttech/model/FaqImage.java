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
@Table(name = "faq_image")
@NamedQueries({ @NamedQuery(name = "FaqImage.findAll", query = "SELECT f FROM FaqImage f") })
public class FaqImage implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "faq_img_id")
	private Integer faq_img_id;
	
	@Column(name = "faq_user_id")
	private String faq_user_id;
	
	@Column(name = "faq_img_name")
	private String faq_img_name;
	
	@Column(name = "faq_img_type")
	private String faq_img_type;
	
	@Column(name = "faq_img_size")
	private String faq_img_size;
	
	@Column(name = "faq_img_path")
	private String faq_img_path;
	
	@Column(name = "faq_time_upload")
	private Timestamp faq_time_upload;

	public FaqImage() {

	}

	public FaqImage(Integer faq_img_id, String faq_user_id, String faq_img_name, String faq_img_type,
			String faq_img_size, String faq_img_path, Timestamp faq_time_upload) {
		super();
		this.faq_img_id = faq_img_id;
		this.faq_user_id = faq_user_id;
		this.faq_img_name = faq_img_name;
		this.faq_img_type = faq_img_type;
		this.faq_img_size = faq_img_size;
		this.faq_img_path = faq_img_path;
		this.faq_time_upload = faq_time_upload;
	}

	public Integer getFaq_img_id() {
		return faq_img_id;
	}

	public void setFaq_img_id(Integer faq_img_id) {
		this.faq_img_id = faq_img_id;
	}

	public String getFaq_user_id() {
		return faq_user_id;
	}

	public void setFaq_user_id(String faq_user_id) {
		this.faq_user_id = faq_user_id;
	}

	public String getFaq_img_name() {
		return faq_img_name;
	}

	public void setFaq_img_name(String faq_img_name) {
		this.faq_img_name = faq_img_name;
	}

	public String getFaq_img_type() {
		return faq_img_type;
	}

	public void setFaq_img_type(String faq_img_type) {
		this.faq_img_type = faq_img_type;
	}

	public String getFaq_img_size() {
		return faq_img_size;
	}

	public void setFaq_img_size(String faq_img_size) {
		this.faq_img_size = faq_img_size;
	}

	public String getFaq_img_path() {
		return faq_img_path;
	}

	public void setFaq_img_path(String faq_img_path) {
		this.faq_img_path = faq_img_path;
	}

	public Timestamp getFaq_time_upload() {
		return faq_time_upload;
	}

	public void setFaq_time_upload(Timestamp faq_time_upload) {
		this.faq_time_upload = faq_time_upload;
	}

}
