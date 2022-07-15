package com.cubesofttech.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "payment")
public class Payment implements Serializable {
	
	@Id
	@Column(name = "payment_id")
	private Integer payment_id;
	@Column(name = "payment_group_id")
	private String payment_group_id;
	@Column(name = "user_id")
	private String user_id;
	@Column(name = "employee_type_id")
	private String employee_type_id;
	@Column(name = "employee_type_name")
	private String employee_type_name;
	@Column(name = "actual_day")
	private String actual_day;
	@Column(name = "salary")
	private BigDecimal salary;
	@Column(name = "income_net")
	private BigDecimal income_net;
	@Column(name = "expend_net")
	private BigDecimal expend_net;
	@Column(name = "total_pay")
	private BigDecimal total_pay;
	@Column(name = "status")
	private String status;
	@Column(name = "remark")
	private String remark;
	@Column(name = "user_update")
	private String user_update;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "time_create")
	private java.sql.Timestamp time_create;
	@Column(name = "time_update")
	private java.sql.Timestamp time_update;
	@Column(name = "actual_hours")
	private String actual_hours;
	@Column(name = "late")
	private String late;
	@Column(name = "absent")
	private String absent;
	@Column(name = "absence")
	private String absence;
	@Column(name = "OT1")
	private String OT1;
	@Column(name = "OT2")
	private String OT2;
	@Column(name = "OT3")
	private String OT3;

	

	public Integer getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(Integer payment_id) {
		this.payment_id = payment_id;
	}
	public String getPayment_group_id() {
		return payment_group_id;
	}
	public void setPayment_group_id(String payment_group_id) {
		this.payment_group_id = payment_group_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getEmployee_type_id() {
		return employee_type_id;
	}
	public void setEmployee_type_id(String employee_type_id) {
		this.employee_type_id = employee_type_id;
	}
	public String getEmployee_type_name() {
		return employee_type_name;
	}
	public void setEmployee_type_name(String employee_type_name) {
		this.employee_type_name = employee_type_name;
	}
	public String getActual_day() {
		return actual_day;
	}
	public void setActual_day(String actual_day) {
		this.actual_day = actual_day;
	}
	public BigDecimal getSalary() {
		return salary;
	}
	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}
	public BigDecimal getIncome_net() {
		return income_net;
	}
	public void setIncome_net(BigDecimal income_net) {
		this.income_net = income_net;
	}
	public BigDecimal getExpend_net() {
		return expend_net;
	}
	public void setExpend_net(BigDecimal expend_net) {
		this.expend_net = expend_net;
	}
	public BigDecimal getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(BigDecimal total_pay) {
		this.total_pay = total_pay;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public java.sql.Timestamp getTime_create() {
		return time_create;
	}
	public void setTime_create(java.sql.Timestamp time_create) {
		this.time_create = time_create;
	}
	public java.sql.Timestamp getTime_update() {
		return time_update;
	}
	public void setTime_update(java.sql.Timestamp time_update) {
		this.time_update = time_update;
	}
	public String getActual_hours() {
		return actual_hours;
	}
	public void setActual_hours(String actual_hours) {
		this.actual_hours = actual_hours;
	}
	public String getLate() {
		return late;
	}
	public void setLate(String late) {
		this.late = late;
	}
	public String getAbsent() {
		return absent;
	}
	public void setAbsent(String absent) {
		this.absent = absent;
	}
	public String getAbsence() {
		return absence;
	}
	public void setAbsence(String absence) {
		this.absence = absence;
	}
	public String getOT1() {
		return OT1;
	}
	public void setOT1(String oT1) {
		OT1 = oT1;
	}
	public String getOT2() {
		return OT2;
	}
	public void setOT2(String oT2) {
		OT2 = oT2;
	}
	public String getOT3() {
		return OT3;
	}
	public void setOT3(String oT3) {
		OT3 = oT3;
	}
	@Override
	public String toString() {
		return "Payment [payment_id=" + payment_id + ", payment_group_id=" + payment_group_id + ", user_id=" + user_id
				+ ", employee_type_id=" + employee_type_id + ", employee_type_name=" + employee_type_name
				+ ", actual_day=" + actual_day + ", salary=" + salary + ", income_net=" + income_net + ", expend_net="
				+ expend_net + ", total_pay=" + total_pay + ", status=" + status + ", remark=" + remark
				+ ", user_update=" + user_update + ", user_create=" + user_create + ", time_create=" + time_create
				+ ", time_update=" + time_update + ", actual_hours=" + actual_hours + ", late=" + late + ", absent="
				+ absent + ", absence=" + absence + ", OT1=" + OT1 + ", OT2=" + OT2 + ", OT3=" + OT3 + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Payment))
			return false;
		Payment other = (Payment) obj;
		if (OT1 == null) {
			if (other.OT1 != null)
				return false;
		} else if (!OT1.equals(other.OT1))
			return false;
		if (OT2 == null) {
			if (other.OT2 != null)
				return false;
		} else if (!OT2.equals(other.OT2))
			return false;
		if (OT3 == null) {
			if (other.OT3 != null)
				return false;
		} else if (!OT3.equals(other.OT3))
			return false;
		if (absence == null) {
			if (other.absence != null)
				return false;
		} else if (!absence.equals(other.absence))
			return false;
		if (absent == null) {
			if (other.absent != null)
				return false;
		} else if (!absent.equals(other.absent))
			return false;
		if (actual_day == null) {
			if (other.actual_day != null)
				return false;
		} else if (!actual_day.equals(other.actual_day))
			return false;
		if (actual_hours == null) {
			if (other.actual_hours != null)
				return false;
		} else if (!actual_hours.equals(other.actual_hours))
			return false;
		if (employee_type_id == null) {
			if (other.employee_type_id != null)
				return false;
		} else if (!employee_type_id.equals(other.employee_type_id))
			return false;
		if (employee_type_name == null) {
			if (other.employee_type_name != null)
				return false;
		} else if (!employee_type_name.equals(other.employee_type_name))
			return false;
		if (expend_net == null) {
			if (other.expend_net != null)
				return false;
		} else if (!expend_net.equals(other.expend_net))
			return false;
		if (income_net == null) {
			if (other.income_net != null)
				return false;
		} else if (!income_net.equals(other.income_net))
			return false;
		if (late == null) {
			if (other.late != null)
				return false;
		} else if (!late.equals(other.late))
			return false;
		if (payment_group_id == null) {
			if (other.payment_group_id != null)
				return false;
		} else if (!payment_group_id.equals(other.payment_group_id))
			return false;
		if (payment_id == null) {
			if (other.payment_id != null)
				return false;
		} else if (!payment_id.equals(other.payment_id))
			return false;
		if (remark == null) {
			if (other.remark != null)
				return false;
		} else if (!remark.equals(other.remark))
			return false;
		if (salary == null) {
			if (other.salary != null)
				return false;
		} else if (!salary.equals(other.salary))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (time_create == null) {
			if (other.time_create != null)
				return false;
		} else if (!time_create.equals(other.time_create))
			return false;
		if (time_update == null) {
			if (other.time_update != null)
				return false;
		} else if (!time_update.equals(other.time_update))
			return false;
		if (total_pay == null) {
			if (other.total_pay != null)
				return false;
		} else if (!total_pay.equals(other.total_pay))
			return false;
		if (user_create == null) {
			if (other.user_create != null)
				return false;
		} else if (!user_create.equals(other.user_create))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_update == null) {
			if (other.user_update != null)
				return false;
		} else if (!user_update.equals(other.user_update))
			return false;
		return true;
	}
	
	
	
	

}
