package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "migrate")
@NamedQueries({
    @NamedQuery(name = "Migrate.findAll", query = "SELECT t FROM Migrate t")})
public class Migrate implements Serializable{
	
	public Integer getMigrate_id() {
		return migrate_id;
	}
	public void setMigrate_id(Integer migrate_id) {
		this.migrate_id = migrate_id;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "migrate_id")
	private Integer migrate_id;
	@Column(name = "action")
	private String action;
	@Column(name = "status")
	private String status;
	@Column(name = "select_num")
	private String select_num;
	@Override
	public String toString() {
		return "Migrate [migrate_id=" + migrate_id + ", action=" + action + ", status=" + status + ", select_num="
				+ select_num + ", insert_num=" + insert_num + ", error_num=" + error_num + ", description="
				+ description + ", user_create=" + user_create + ", user_update=" + user_update + ", time_create="
				+ time_create + ", time_update=" + time_update + "]";
	}

	@Column(name = "insert_num")
	private String insert_num;
	@Column(name = "error_num")
	private String error_num;
	@Column(name = "description")
	private String description;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "user_update ")
	private String user_update ;
	@Column(name = "time_create")
	private java.sql.Timestamp time_create;
	@Column(name = "time_update")
	private java.sql.Timestamp time_update;	
	
	@Override
	public int hashCode() {
		return Objects.hash(action, description, error_num, insert_num, migrate_id, select_num, status, time_create,
				time_update, user_create, user_update);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Migrate other = (Migrate) obj;
		return Objects.equals(action, other.action) && Objects.equals(description, other.description)
				&& Objects.equals(error_num, other.error_num) && Objects.equals(insert_num, other.insert_num)
				&& Objects.equals(migrate_id, other.migrate_id) && Objects.equals(select_num, other.select_num)
				&& Objects.equals(status, other.status) && Objects.equals(time_create, other.time_create)
				&& Objects.equals(time_update, other.time_update) && Objects.equals(user_create, other.user_create)
				&& Objects.equals(user_update, other.user_update);
	}
	public Migrate() {
		
	}
	public Migrate(Integer migrate_id, String action, String status, String select_num, String insert_num,
			String error_num, String description, String user_create, String user_update, Timestamp time_create,
			Timestamp time_update) {
		super();
		this.migrate_id = migrate_id;
		this.action = action;
		this.status = status;
		this.select_num = select_num;
		this.insert_num = insert_num;
		this.error_num = error_num;
		this.description = description;
		this.user_create = user_create;
		this.user_update = user_update;
		this.time_create = time_create;
		this.time_update = time_update;
	}

}
