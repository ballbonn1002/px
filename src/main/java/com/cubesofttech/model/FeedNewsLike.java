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
	@Table(name = "feednewslike")
	public class FeedNewsLike implements Serializable {

		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		@Column(name = "like_id")
		private Integer like_id;
		@Column(name = "feed_id")
		private Integer feed_id;
		@Column(name = "user_id")
		private String user_id;
		@Column(name = "reactType")
		private String reactType;
		

		public FeedNewsLike() {
			// TODO Auto-generated constructor stub
		}

		public FeedNewsLike(String user_id, Integer feed_id) {
			super();
			this.feed_id = feed_id;
			this.user_id = user_id;
			
		}

		public Integer getLike_id() {
			return like_id;
		}

		public void setLike_id(Integer like_id) {
			this.like_id = like_id;
		}

		public Integer getFeed_id() {
			return feed_id;
		}

		public void setFeed_id(Integer feed_id) {
			this.feed_id = feed_id;
		}

		public String getUser_id() {
			return user_id;
		}

		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}

		public String getReactType() {
			return reactType;
		}

		public void setReactType(String reactType) {
			this.reactType = reactType;
		}

	
	

	}
