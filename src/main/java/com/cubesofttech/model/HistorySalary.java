package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "history_saraly")
public class HistorySalary implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "history_id")
	private Integer history_id;
	@Column(name = "user")
	private String user;
	@Column(name = "present_holiday")
	private Integer present;
	@Column(name = "leaves")
	private Integer leave;
	@Column(name = "absent")
	private Integer absent;
	@Column(name = "late")
	private Integer late;
	@Column(name = "salary")
	private Integer salary;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "time_create")
	private java.sql.Timestamp time_create;
	
	public Integer getHistory_id() {
		return history_id;
	}
	public void setHistory_id(Integer history_id) {
		this.history_id = history_id;
	}

	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	
	public java.sql.Timestamp getTime_create() {
		return time_create;
	}
	public void setTime_create(java.sql.Timestamp time_create) {
		this.time_create = time_create;
	}
	
	public Integer getPresent() {
		return present;
	}
	public void setPresent(Integer present) {
		this.present = present;
	}
	
	public Integer getLeave() {
		return leave;
	}
	public void setLeave(Integer leave) {
		this.leave = leave;
	}
	
	public Integer getAbsent() {
		return absent;
	}
	public void setAbsent(Integer absent) {
		this.absent = absent;
	}
	
	public Integer getLate() {
		return late;
	}
	public void setLate(Integer late) {
		this.late = late;
	}
	
	public Integer getsalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}	

}
