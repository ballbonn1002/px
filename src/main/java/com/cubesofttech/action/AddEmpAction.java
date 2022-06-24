package com.cubesofttech.action;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.dao.RoleDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserSalaryDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserSalary;
import com.opensymphony.xwork2.ActionSupport;
import com.cubesofttech.util.Convert;
import com.cubesofttech.util.DateUtil;

public class AddEmpAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(AddEmpAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private DepartmentDAO departmentDAO;

	@Autowired
	private PositionDAO positionDAO;


	@Autowired
	private Employee_typeDAO employeetypeDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private UserSalaryDAO userSalaryDAO;


	public static final String EmptypeList = "emptypeList";

	HttpServletRequest request = ServletActionContext.getRequest();

	public String addEmployee() {

		try {

			List<Map<String, Object>> departmentList = departmentDAO.sequense2();
			//List<Map<String, Object>> roleList = roleDAO.sequense2();
			request.setAttribute("departmentList", departmentList);
			//request.setAttribute("roleList", roleList);



			List<Employee_type> emptypeList = employeetypeDAO.findAll();
			request.setAttribute(EmptypeList , emptypeList);


			return SUCCESS;
		} catch (Exception e) {

			return ERROR;
		}
	}

	public String addEmployeeInfo() {
		try {


        	User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
        	String logonUser = ur.getId(); // Username login

        	User user = new User();

        	//tab1
        	String userId = request.getParameter("username");
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

        	//log.debug(tax);
        	//log.debug(withholding);

        	//Tab5
        	String transfer = request.getParameter("transfer");
        	String bank = request.getParameter("bank");
        	String banktype = request.getParameter("banktype");
        	String banknum = request.getParameter("banknum");
        	String branch = request.getParameter("branch");

        	//Modal
        	String sd = request.getParameter("salaryDate");
        	Date salaryDate = Convert.parseDate(sd);
        	String amountsalary = request.getParameter("amountsalary");
        	String note = request.getParameter("note");

        	//update เธ�เน�เธญเธกเธนเธฅเธ�เธ�เธฑเธ�เธ�เธฒเธ�
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

        	//update เธ�เน�เธญเธกเธนเธฅเธ�เน�เธฒเธ�เธ�เธฒเธ�
        	user.setDepartmentId(department);
        	user.setPositionId(positsion);
        	user.setStartDate(startDay);
        	user.setEndDate(endDay);
        	user.setWorkDayStart(startWorkDay);
        	user.setWorkDayEnd(endWorkDay);
        	user.setWorkTimeStart(startTime);
        	user.setWorkTimeEnd(endTime);

        	//update เธ�เน�เธญเธกเธนเธฅเน€เธ”เธทเธญเธ� / เธ�เน�เธฒเธ�เน�เธฒเธ�
        	user.setEmployee_type_id(empType);
        		//เธขเธฑเธ�เน�เธกเน�เน�เธ”เน�เธญเธฑเธ�เน€เธ”เธ•เน€เธ�เธดเธ�เน€เธ”เธทเธญเธ�
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

        	//update เธ�เธฃเธฐเน€เธ เธ—เธ�เธฒเธฃเธ�เน�เธฒเธขเน€เธ�เธดเธ�
        	user.setTransfer_type(transfer);
        	user.setBank(bank);
        	user.setBank_type(banktype);
        	user.setBank_number(banknum);
        	user.setBank_branch(branch);





            user.setTimeUpdate(DateUtil.getCurrentTime());
            user.setTimeCreate(DateUtil.getCurrentTime());


            //เธ�เน�เธฒเธ—เธตเน�เธ•เน�เธญเธ�เธ•เธฑเน�เธ�เธ�เน�เธฒเน�เธซเธกเน�
        	user.setEnable("1"); //เธ�เธฅเน�เธฒเธข เน� Config Flag
        	user.setRoleId("Null");
        	user.setUsername(userId);
        	user.setFlagSearch("1");


        	userDAO.save(user);


        	//update Modal
        	UserSalary userSalary = new UserSalary();
			userSalary.setUser_salary_id(16);
			userSalary.setUser_id(userId);
			userSalary.setPayment_type_id("SL");
			userSalary.setAmount(new BigDecimal(amountsalary));
			userSalary.setDate(salaryDate);
			userSalary.setDescription(note);
			userSalary.setUser_create(logonUser);
			userSalary.setUser_update(logonUser);
			userSalary.setTime_create(Timestamp.from(Instant.now()));
			userSalary.setTime_update(Timestamp.from(Instant.now()));
			userSalaryDAO.save(userSalary);


    		List<Map<String, Object>> cubesoftUsers = userDAO.Query_Userlist();
    		request.setAttribute("cubesoftUsers", cubesoftUsers);

            return SUCCESS;
         } catch (Exception e) {
        	 e.printStackTrace();

            return ERROR;
        }
	}

}
