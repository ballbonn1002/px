package com.cubesofttech.ms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.User;
import com.cubesofttech.util.MD5;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class UserMS extends ActionSupport {

	private static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String ONLINEUSER = "onlineUser";
	public static final String USERSEQ = "userseq";
	public static final String USERID = "userId";
	public static final String ARTICLEID = "articleId";
	public static final String ARTICLELIST = "articleList";

	String id;
	String password;

	@Autowired
	private UserDAO userDAO;

	public String getAllUser() {
		try {

			Gson gson = new GsonBuilder().create();
				
			String responseJSON = gson.toJson(userDAO.findAll());

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getUserByLogin() {
		try {
			String responseJSON = null;

			Gson gson = new GsonBuilder().create();

			log.debug("ID: " + id);
			//log.debug("Password: " + password);

			String encryptPassword = MD5.getInstance().hashData(password.getBytes());

			User user = userDAO.findById(id);
			
			if (user != null && encryptPassword.equals(user.getPassword())) {
				//Login Success
				user.setPassword(null); //hidden password
				responseJSON = gson.toJson(user);
			}

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
