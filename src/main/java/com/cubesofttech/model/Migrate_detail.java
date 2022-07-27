package com.cubesofttech.model;

import java.math.BigDecimal;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "migrate_detail")
public class Migrate_detail {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
    @Column(name = "migrate_detail_id ")
    private Integer migrate_detail_id ;	
    @Column(name = "migrate_id")
    private Integer migrate_id;
    @Column(name = "status")
    private String status;
    @Column(name = "select_from")
    private String select_from;
    @Column(name = "insert_to")
    private String insert_to;
    @Column(name = "select_num")
    private String select_num;
    @Column(name = "insert_num")
    private String insert_num;
    @Column(name = "error_num")
    private String error_num;	
    @Column(name = "user_create")
    private String user_create;
    @Column(name = "user_update ")
    private String user_update ;   
    @Column(name = "time_create")
    private java.sql.Timestamp time_create;
    @Column(name = "time_update")
    private java.sql.Timestamp time_update;
	public Integer getMigrate_detail_id() {
		return migrate_detail_id;
	}
	public void setMigrate_detail_id(Integer migrate_detail_id) {
		this.migrate_detail_id = migrate_detail_id;
	}
	public Integer getMigrate_id() {
		return migrate_id;
	}
	public void setMigrate_id(Integer migrate_id) {
		this.migrate_id = migrate_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSelect_from() {
		return select_from;
	}
	public void setSelect_from(String select_from) {
		this.select_from = select_from;
	}
	public String getInsert_to() {
		return insert_to;
	}
	public void setInsert_to(String insert_to) {
		this.insert_to = insert_to;
	}
	public String getSelect_num() {
		return select_num;
	}
	public void setSelect_num(String select_num) {
		this.select_num = select_num;
	}
	public String getInsert_num() {
		return insert_num;
	}
	public void setInsert_num(String insert_num) {
		this.insert_num = insert_num;
	}
	public String getError_num() {
		return error_num;
	}
	public void setError_num(String error_num) {
		this.error_num = error_num;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
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
	@Override
	public String toString() {
		return "Migrate_detail [migrate_detail_id=" + migrate_detail_id + ", migrate_id=" + migrate_id + ", status="
				+ status + ", select_from=" + select_from + ", insert_to=" + insert_to + ", select_num=" + select_num
				+ ", insert_num=" + insert_num + ", error_num=" + error_num + ", user_create=" + user_create
				+ ", user_update=" + user_update + ", time_create=" + time_create + ", time_update=" + time_update
				+ "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(error_num, insert_num, insert_to, migrate_detail_id, migrate_id, select_from, select_num,
				status, time_create, time_update, user_create, user_update);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Migrate_detail other = (Migrate_detail) obj;
		return Objects.equals(error_num, other.error_num) && Objects.equals(insert_num, other.insert_num)
				&& Objects.equals(insert_to, other.insert_to)
				&& Objects.equals(migrate_detail_id, other.migrate_detail_id)
				&& Objects.equals(migrate_id, other.migrate_id) && Objects.equals(select_from, other.select_from)
				&& Objects.equals(select_num, other.select_num) && Objects.equals(status, other.status)
				&& Objects.equals(time_create, other.time_create) && Objects.equals(time_update, other.time_update)
				&& Objects.equals(user_create, other.user_create) && Objects.equals(user_update, other.user_update);
	}
	
	
}
