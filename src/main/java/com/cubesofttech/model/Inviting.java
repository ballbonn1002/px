package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "inviting")
public class Inviting implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idinvite")
	private int idinvite;
	@Column(name = "member")
	private String member;
	@Column(name = "idmeeting")
	private int idmeeting;
	
	public String getMember() {
        return member;
    }
    public void setMember(String member) {
        this.member = member;
    }
    public int getIdmeeting() {
        return idmeeting;
    }
	public int getIdinvite() {
		return idinvite;
	}
	public void setIdinvite(int idinvite) {
		this.idinvite = idinvite;
	}
	public void setIdmeeting(int idmeeting) {
		this.idmeeting = idmeeting;
	}
    
}
