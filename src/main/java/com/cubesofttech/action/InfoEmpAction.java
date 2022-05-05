package com.cubesofttech.action;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserPaymentConfig;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Position;
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
    
    @Autowired
	private DepartmentDAO departmentDAO;
    
    @Autowired
	private PositionDAO positionDAO;
    
    @Autowired
	private Employee_typeDAO employeetypeDAO;
    
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
    public static final String DepartmentList = "departmentList";
    public static final String PositionList = "positionList";
    public static final String EmptypeList = "emptypeList";

    public String openInfoEmp() {
        try {
        	User selectUser = userDAO.findById(userId);
        	request.setAttribute("selectUser", selectUser);
        	request.setAttribute("userList", userDAO.sequense());
        	
        	List<Map<String, Object>> departmentList = departmentDAO.sequense();
			List<Map<String, Object>> positionList = positionDAO.sequense();
			request.setAttribute("departmentList", departmentList);
			request.setAttribute("positionList", positionList);
			
			List<Employee_type> emptypeList = employeetypeDAO.findAll();
			request.setAttribute(EmptypeList , emptypeList);
        	
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
        	user = userDAO.findById(userId);
        	
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
        	String bd = request.getParameter("bday");
        	Date birthDate = Convert.parseDate(bd);
        	String passportID = request.getParameter("passportID");
        	String phoneNum = request.getParameter("phoneNum");
        	String phoneEmer = request.getParameter("phoneEmer");
        	
        	//Tab2
        	String department = request.getParameter("depart");
        	String positsion = request.getParameter("positsion");
        	String std = request.getParameter("startday");
        	Date startDay = Convert.parseDate(std);
        	String ed = request.getParameter("endday");
        	Date endDay = Convert.parseDate(ed);
        	String startWorkDay = request.getParameter("startworkday");
        	String endWorkDay = request.getParameter("endworkday");
        	String startTime = request.getParameter("starttimework");
        	String endTime = request.getParameter("endtimework");
        	
        	//Tab3
        	String empType = request.getParameter("emp_type");
        	String Salary = request.getParameter("salary");
        	String SocialSecurity = request.getParameter("chkright");
        	String tax = request.getParameter("tax");
        	String tax_deduction = request.getParameter("tax_deduction");
        	//BigDecimal withholding = new BigDecimal(request.getParameter("withholding"));
        	
        	log.debug(tax);
        	//log.debug(withholding);
        	
        	//Tab5
        	String transfer = request.getParameter("transfer");
        	String bank = request.getParameter("bank");
        	String banktype = request.getParameter("banktype");
        	String banknum = request.getParameter("banknum");
        	String branch = request.getParameter("branch");
        	
        	//update tab1
        	user.setId(userId);
        	user.setEmployeeId(employeeId);
        	user.setTitle_name_th(prefixTH);
        	user.setName(name);
        	user.setTitle_name_en(prefixEN);
        	user.setNameEN(nameEN);
        	user.setGender(gender);
        	user.setCitizen_id(IDcard);
        	user.setEmail(email);
        	user.setNameEmer(nameEmer);
        	user.setNickName(nickname);
        	user.setNicknameEN(nicknameEN);
			user.setBirthDate(birthDate);
			user.setPassport_id(passportID);
        	user.setPhoneNum(phoneNum);
        	user.setPhoneEmer(phoneEmer);
        	
        	//update tab2
        	user.setDepartmentId(department);
        	user.setPositionId(positsion);
        	user.setStartDate(startDay);
        	user.setEndDate(endDay);
        	user.setWorkDayStart(startWorkDay);
        	user.setWorkDayEnd(endWorkDay);
        	user.setWorkTimeStart(startTime);
        	user.setWorkTimeEnd(endTime);
        	
        	//update tab3
        	user.setEmployee_type_id(empType);
        		//ยังไม่ได้อัพเดตเงินเดือน
        	user.setSocial_security(SocialSecurity);
        	if (tax != null ) {
        		user.setWithholding_auto("1");
        		user.setWithholding(null);
			}else {
        		BigDecimal withholding = new BigDecimal(request.getParameter("withholding"));
        		user.setWithholding_auto("0");
    			user.setWithholding(withholding);
			}
        	user.setTax_deduction(tax_deduction);
        	
        	//update tab5
        	user.setTransfer_type(transfer);
        	user.setBank(bank);
        	user.setBank_type(banktype);
        	user.setBank_number(banknum);
        	user.setBank_branch(branch);
        	
            user.setTimeUpdate(DateUtil.getCurrentTime());
        	
        	userDAO.update(user);
        	
        	User selectUser = userDAO.findById(userId);
        	List<Map<String, Object>> userList = userDAO.sequense();
			request.setAttribute("userList", userList);
			request.setAttribute("selectUser", selectUser);
			
			List<Map<String, Object>> departmentList = departmentDAO.sequense();
			List<Map<String, Object>> positionList = positionDAO.sequense();
			request.setAttribute("departmentList", departmentList);
			request.setAttribute("positionList", positionList);
			
			List<Employee_type> emptypeList = employeetypeDAO.findAll();
			request.setAttribute(EmptypeList , emptypeList);

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