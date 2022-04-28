package com.cubesofttech.action;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserPaymentConfig;
import com.cubesofttech.util.Convert;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class InfoEmpAction extends ActionSupport {
    
    private static final Logger log = Logger.getLogger(InfoEmpAction.class);
    private static final long serialVersionUID = 1L;
    
    @Autowired
    public UserPaymentConfigDAO userpaymentconfigDAO;
    
    @Autowired
    public UserDAO userDAO;
    
    private String userId;
    
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
    
    
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    public static final String PaymentConfig = "paymentconfigList";
    public static final String IncomeList = "incomeList";
    public static final String ExpendList = "expendList";
    public static final String UserList = "userList";

    public String openInfoEmp() {
        try {
        	User selectUser = userDAO.findById(userId);
        	request.setAttribute("selectUser", selectUser);
        	request.setAttribute("userList", userDAO.sequense());
        	
        	List<UserPaymentConfig> paymentconfigList = userpaymentconfigDAO.findAll();
            List<UserPaymentConfig> incomeList = userpaymentconfigDAO.findIncome();
            List<UserPaymentConfig> expendList = userpaymentconfigDAO.findExpend();
            request.setAttribute(PaymentConfig, paymentconfigList);
            request.setAttribute(IncomeList, incomeList);
            request.setAttribute(ExpendList, expendList);
            return SUCCESS;
         } catch (Exception e) {

            return ERROR;
        }
    }
    
    public String editInfoEmp() {
        try {
        	User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
        	String logonUser = ur.getId(); // Username login 
        	
        	User user = new User();
        	String userId = request.getParameter("username");
        	user = userDAO.findByFbId(userId);
        	
        	//tab1
        	String employeeId = request.getParameter("empId");
        	String prefixTH = request.getParameter("prefixTH");
        	String name = request.getParameter("name");
        	String prefixEN = request.getParameter("prefixEN");
        	String nameEN = request.getParameter("nameEN");
        	String gender = request.getParameter("gender");
        	String IDcard = request.getParameter("IDcard");
        	String email = request.getParameter("email");
        	String nameEmer = request.getParameter("nameEmer");
        	String nickname = request.getParameter("nickname");
        	String nicknameEN = request.getParameter("nicknameEN");
        	String bday = request.getParameter("bday");
        	String passportID = request.getParameter("passportID");
        	String phoneNum = request.getParameter("phoneNum");
        	String phoneEmer = request.getParameter("phoneEmer");
        	
        	//Tab2
        	String department = request.getParameter("depart");
        	
        	log.debug(userId);
        	log.debug(employeeId);
        	log.debug(prefixTH);
        	log.debug(name);
        	log.debug(prefixEN);
        	log.debug(nameEN);
        	log.debug(gender);
        	log.debug(IDcard); //*
        	log.debug(email);
        	log.debug(nameEmer);
        	log.debug(nickname);
        	log.debug(nicknameEN);
        	log.debug(bday);
        	log.debug(passportID); //*
        	log.debug(phoneNum);
        	log.debug(phoneEmer);
        	log.debug(department);
        	
        	//update tab1
        	user.setId(userId);
        	user.setEmployeeId(employeeId);
        	user.setTitle_name_th(prefixTH);
        	user.setName(name);
        	user.setTitle_name_en(prefixEN);
        	user.setNameEN(nameEN);
        	user.setGender(gender);
        	user.setEmail(email);
        	user.setNameEmer(nameEmer);
        	user.setNickName(nickname);
        	user.setNicknameEN(nicknameEN);
        	user.setPhoneNum(phoneNum);
        	user.setPhoneEmer(phoneEmer);
        	
        	userDAO.update(user);
        	
        	User selectUser = userDAO.findById(userId);
        	List<Map<String, Object>> userList = userDAO.sequense();
			request.setAttribute("userList", userList);
			request.setAttribute("selectUser", selectUser);

            return SUCCESS;
         } catch (Exception e) {

            return ERROR;
        }
    }
    
    public String editPayment() {
        try {
        	User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
        	String logonUser = ur.getId(); // Username login 
        	
        	UserPaymentConfig paymentconfig = new UserPaymentConfig();
        	
        	String paymentconfigId = request.getParameter("paymentconfigId");
        	BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        	
        	paymentconfig = userpaymentconfigDAO.findById(paymentconfigId);
        		
        	paymentconfig.setPaymentconfigId(paymentconfigId);
            paymentconfig.setAmount(amount);
            paymentconfig.setUserUpdate(logonUser);
            paymentconfig.setTimeUpdate(DateUtil.getCurrentTime());
            	
            userpaymentconfigDAO.update(paymentconfig);
        	
            List<UserPaymentConfig> paymentconfigList = userpaymentconfigDAO.findAll();
            List<UserPaymentConfig> incomeList = userpaymentconfigDAO.findIncome();
            List<UserPaymentConfig> expendList = userpaymentconfigDAO.findExpend();
            request.setAttribute(PaymentConfig, paymentconfigList);
            request.setAttribute(IncomeList, incomeList);
            request.setAttribute(ExpendList, expendList);
        	
            return SUCCESS;
         } catch (Exception e) {

            return ERROR;
        }
    }

}