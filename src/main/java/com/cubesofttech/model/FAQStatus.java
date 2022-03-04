package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "faq_status")
@NamedQueries({ @NamedQuery(name = "FAQStatus.findAll", query = "SELECT f FROM FAQStatus f") })
public class FAQStatus implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "faq_status_id")
	private Integer faq_status_id;
	@Column(name = "faq_status_name")
	private String faq_status_name;
	
	public FAQStatus() {
		// TODO Auto-generated constructor stub
	}

	public FAQStatus(Integer faq_status_id, String faq_status_name) {
		super();
		this.faq_status_id = faq_status_id;
		this.faq_status_name = faq_status_name;
	}

	public Integer getFaq_status_id() {
		return faq_status_id;
	}

	public void setFaq_status_id(Integer faq_status_id) {
		this.faq_status_id = faq_status_id;
	}

	public String getFaq_status_name() {
		return faq_status_name;
	}

	public void setFaq_status_name(String faq_status_name) {
		this.faq_status_name = faq_status_name;
	}

	
	
}
