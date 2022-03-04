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
@Table(name = "faq_category")
@NamedQueries({ @NamedQuery(name = "FAQCategory.findAll", query = "SELECT f FROM FAQCategory f") })
public class FAQCategory implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "faq_cat_id")
	private Integer faq_cat_id;
	@Column(name = "faq_cat_name")
	private String faq_cat_name;
	@Column(name = "faq_cat_user_id")
	private String faq_cat_user_id;
	@Column(name = "faq_cat_add_time")
	private Timestamp faq_cat_add_time;
	
	public FAQCategory() {
		// TODO Auto-generated constructor stub
	}

	public FAQCategory(Integer faq_cat_id, String faq_cat_name, String faq_cat_user_id, Timestamp faq_cat_add_time) {
		super();
		this.faq_cat_id = faq_cat_id;
		this.faq_cat_name = faq_cat_name;
		this.faq_cat_user_id = faq_cat_user_id;
		this.faq_cat_add_time = faq_cat_add_time;
	}

	public Integer getFaq_cat_id() {
		return faq_cat_id;
	}

	public void setFaq_cat_id(Integer faq_cat_id) {
		this.faq_cat_id = faq_cat_id;
	}

	public String getFaq_cat_name() {
		return faq_cat_name;
	}

	public void setFaq_cat_name(String faq_cat_name) {
		this.faq_cat_name = faq_cat_name;
	}

	public String getFaq_cat_user_id() {
		return faq_cat_user_id;
	}

	public void setFaq_cat_user_id(String faq_cat_user_id) {
		this.faq_cat_user_id = faq_cat_user_id;
	}

	public Timestamp getFaq_cat_add_time() {
		return faq_cat_add_time;
	}

	public void setFaq_cat_add_time(Timestamp faq_cat_add_time) {
		this.faq_cat_add_time = faq_cat_add_time;
	}

	
	
	
	
	
}
