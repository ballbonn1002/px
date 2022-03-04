package com.cubesofttech.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_chat_message")
public class Group_chat_message {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Group_chat_message_id")
	private int Group_chat_message_id;
	
	@Column(name="Group_chat_id")
	private int Group_chat_id;
	
	@Column(name="Sender_id")
	private String Sender_id;
	
	@Column(name="Date_time_message")
	private Timestamp Date_time_message;
	
	@Column(name="image_message_status")
	private char image_message_status;
	
	@Column(name="image_path")
	private String image_path;
	
	@Column(name="file_message_status")
	private char file_message_status;
	
	@Column(name="file_path")
	private String file_path;
	
	@Column(name="sticker_message_status")
	private char sticker_message_status;
	
	@Column(name="sticker_path")
	private String sticker_path;
	
	@Column(name="Group_chat_message")
	private String Group_chat_message;
	
	@Column(name="file_name")
	private String file_name;
	
	@Column(name="information_message_status")
	private String information_message_status;
	
	@Column(name="information_message")
	private String information_message;
	
	
	
	public String getInformation_message_status() {
		return information_message_status;
	}


	public void setInformation_message_status(String information_message_status) {
		this.information_message_status = information_message_status;
	}


	public String getInformation_message() {
		return information_message;
	}


	public void setInformation_message(String information_message) {
		this.information_message = information_message;
	}


	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}


	public String getGroup_chat_message() {
		return Group_chat_message;
	}


	public void setGroup_chat_message(String group_chat_message) {
		Group_chat_message = group_chat_message;
	}


	public int getGroup_chat_message_id() {
		return Group_chat_message_id;
	}

	
	public void setGroup_chat_message_id(int group_chat_message_id) {
		Group_chat_message_id = group_chat_message_id;
	}

	public int getGroup_chat_id() {
		return Group_chat_id;
	}

	public void setGroup_chat_id(int group_chat_id) {
		Group_chat_id = group_chat_id;
	}

	public String getSender_id() {
		return Sender_id;
	}

	public void setSender_id(String sender_id) {
		Sender_id = sender_id;
	}

	public Timestamp getDate_time_message() {
		return Date_time_message;
	}

	public void setDate_time_message(Timestamp date_time_message) {
		Date_time_message = date_time_message;
	}

	public char getImage_message_status() {
		return image_message_status;
	}

	public void setImage_message_status(char image_message_status) {
		this.image_message_status = image_message_status;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public char getFile_message_status() {
		return file_message_status;
	}

	public void setFile_message_status(char file_message_status) {
		this.file_message_status = file_message_status;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public char getSticker_message_status() {
		return sticker_message_status;
	}

	public void setSticker_message_status(char sticker_message_status) {
		this.sticker_message_status = sticker_message_status;
	}

	public String getSticker_path() {
		return sticker_path;
	}

	public void setSticker_path(String sticker_path) {
		this.sticker_path = sticker_path;
	}
	
	
}
