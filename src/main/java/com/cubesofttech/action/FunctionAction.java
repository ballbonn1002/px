package com.cubesofttech.action;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserSalaryDAO;
//import com.cubesofttech.model.User;

//import com.google.gson.GsonBuilder;
import com.cubesofttech.model.UserSalary;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class FunctionAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(FunctionAction.class);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private static final long serialVersionUID = 1L;

	
	
	//@Autowired
	//private UserDAO userDAO;
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserSalaryDAO userSalaryDAO;
	//@Autowired
	//private TaxMS taxMS;

	@Autowired
	public FunctionDAO funtionDAO;
	
	public String salaryAction() {
		try {
		
			List<Map<String, Object>> cubesoftUserSalaries = userSalaryDAO.findAllUserSalary();
			request.setAttribute("cubesoftUserSalaries", cubesoftUserSalaries);
			
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}
	
	public String ssiAction() {
		
		/*try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}*/
		
		String uId = request.getParameter("user_ssi_id");
		//log.debug(uId);
		request.setAttribute("uId", uId);
		
		try {
			
			List<Map<String, Object>> userSocialSecurity = userSalaryDAO.findSsi(uId);
			request.setAttribute("UserSocialSecurity", userSocialSecurity);
			
			//List<Map<String, Object>> userSocialSecurityById = userSalaryDAO.findSsiById(uId);
			//request.setAttribute("socialSecurity", userSocialSecurityById);
			//System.out.println(socialSecurity);
			
			
			// request.setAttribute("userList", userDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String findSalaryDataById() {
		try {
			String userId = request.getParameter("user_id");
			List<Map<String, Object>> cubesoftUserSalariesById = userSalaryDAO.findUserSalaryByID(userId);
						
            Gson gson = new Gson(); 
            String json = gson.toJson(cubesoftUserSalariesById.get(0)); 
            request.setAttribute("json", json);	
            
            return SUCCESS;
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String findSsiAction() {
		/*try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}*/
		
		try {
			String uId = request.getParameter("user_id_ssi");
			//log.debug(uId);
			//request.setAttribute("uId", uId);
			
			//List<Map<String, Object>> userSocialSecurity = userSalaryDAO.findSsi(uId);
			//request.setAttribute("UserSocialSecurity", userSocialSecurity);
			
			List<Map<String, Object>> userSocialSecurityById = userSalaryDAO.findSsiById(uId);
			//log.debug(userSocialSecurityById);
			Gson gson = new Gson(); 
			String json = gson.toJson(userSocialSecurityById.get(0));
			request.setAttribute("json", json);
			//request.setAttribute("socialSecurity", userSocialSecurityById);
			//System.out.println(socialSecurity);
			
			
			// request.setAttribute("userList", userDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
		
	public String listSalary() {
		try {
			List<UserSalary> salaryList = userSalaryDAO.findAllList();
			//log.debug(salaryList);
			request.setAttribute("salaryList", salaryList);
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String autoFill() {
		try {
			String userSalary = request.getParameter("userid");
			List<UserSalary> user = userSalaryDAO.findSalary(userSalary);
			log.debug(user);
			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
             String json = gson.toJson(user);
             request.setAttribute("json", json);	
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String calTax() {
		try {
			String val = request.getParameter("salary");
			String pay = request.getParameter("pay");
			String mny = request.getParameter("money");
			String ssi = request.getParameter("social");
			String flag = request.getParameter("flag");
			log.debug("flag: " + flag);
			Double money = Double.parseDouble(val);
			Double paid = Double.parseDouble(pay);
			Double self = Double.parseDouble(mny);
			Double aia = Double.parseDouble(ssi);
			
		    if(flag.equals("1")) {
		    	double year = money * 12;
				//log.debug(money);
				double sum = year - paid - self - aia;
				request.setAttribute("sum",sum);
				log.debug("year: "+sum);    
				double tax = 0,tax1 = 0,tax2 = 0,tax3 = 0,tax4 = 0,tax5 = 0,tax6 = 0,tax7 = 0; 
				double percent1 = 0, percent2 = 5, percent3 = 10, percent4 = 15, percent5 = 20,
					   percent6 = 25, percent7 = 30, percent8 = 35;
				//double 
				
				
				
				//log.debug(year);
				if(sum<=150000) {                //�Թ���ط�Թ��¡��� 150000
					if(sum<=150000) {
							tax = (sum * percent1)/100;
							request.setAttribute("w1",sum);
							request.setAttribute("tax",tax);
						}
				}
				
				else if(sum <=300000){            //�Թ���ط�������ҧ 150001-300000
					if(sum > 150000) {
						double w1 = 150000;        
						double z1 = sum - w1;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);   //�ӹǹ�Թ�����ǧ 0-150000
					    tax = (w1 * 0)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 <= 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							tax1 = (z1 * percent2)/100;
							request.setAttribute("tax1",tax1);
							request.setAttribute("w2",z1);
						}
				      
					}
				}
				else if(sum<=500000) {     //300001-500000
					if(sum > 150000) {
						double w1 = 150000;        //�ӹǹ�Թ�����ǧ 0-150000
						double z1 = sum - w1;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);
					    tax = (w1 * percent1)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 > 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							double w2 = 150000;
							double z2 = z1 - w2;  // �ʹ¡��
							log.debug("z2="+z2);
						    tax1 = (150000 * percent2)/100;
							log.debug(tax1);
							request.setAttribute("w2",w2);       //�ʹ���
							request.setAttribute("tax1",tax1);    //�ӹǹ��
							if(z2 <= 200000) {        //�ӹǹ�Թ�����ǧ 300001-500000
								request.setAttribute("w3",z2);
								tax2 = (z2 * percent3)/100;
								log.debug(tax2);
								request.setAttribute("tax2",tax2);
							}
						}
					}
				}
				else if(sum<=750000) {
					if(sum > 150000) {
						double w1 = 150000;        //�ӹǹ�Թ�����ǧ 0-150000
						double z1 = sum - 150000;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);
						tax = (w1 * percent1)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 > 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							double w2 = 150000;
							double z2 = z1 - w2;  // �ʹ¡��
							log.debug("z2="+z2);
							tax1 = (150000 * percent2)/100;
							log.debug(tax1);
							request.setAttribute("w2",w2);
							request.setAttribute("tax1",tax1);    //�ӹǹ��
							if(z2 > 200000) {        //�ӹǹ�Թ�����ǧ 300001-500000
								double w3 = 200000;
								double z3 = z2 - w3;    //�ʹ¡��
								log.debug("z3="+z3);
								tax2 = (200000 * percent3)/100;
								log.debug("tax2="+tax2);
								request.setAttribute("w3",w3);
								request.setAttribute("tax2",tax2);
								if(z3 <= 250000){         //�ӹǹ�Թ�����ǧ  500001-750000
									log.debug("z3="+z3);
									 request.setAttribute("w4",z3);
									 tax3 = (z3 * percent4)/100;
									 request.setAttribute("tax3",tax3);
								}
							}
						}
					}
				}
				else if(sum<=1000000) {
					if(sum > 150000) {
						double w1 = 150000;        //�ӹǹ�Թ�����ǧ 0-150000
						double z1 = sum - 150000;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);
						tax = (w1 * percent1)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 > 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							double w2 = 150000;
							double z2 = z1 - w2;  // �ʹ¡��
							log.debug("z2="+z2);
							tax1 = (150000 * percent2)/100;
							log.debug(tax1);
							request.setAttribute("w2",w2);
							request.setAttribute("tax1",tax1);    //�ӹǹ��
							if(z2 > 200000) {        //�ӹǹ�Թ�����ǧ 300001-500000
								double w3 = 200000;
								double z3 = z2 - w3;    //�ʹ¡��
								log.debug("z3="+z3);
								tax2 = (200000 * percent3)/100;
								log.debug("tax2="+tax2);
								request.setAttribute("w3",w3);
								request.setAttribute("tax2",tax2);
								if(z3 > 250000){         //�ӹǹ�Թ�����ǧ  500001-750000
									double w4 = 250000;
									double z4 = z3 - w4;
									log.debug("z4="+z4);
									tax3 = (250000 * percent4)/100;
									log.debug("tax3="+tax3);
									request.setAttribute("w4",w4);
									request.setAttribute("tax3",tax3);
									if(z4 <= 250000){
										log.debug("z4="+z4);
										request.setAttribute("w5",z4);
										tax4 = (z4 * percent5)/100;
										log.debug("tax4="+tax4);
										request.setAttribute("tax4",tax4);
									}
								}
							}
						}
						}
				}
				
				else if(sum<=2000000) {
					if(sum > 150000) {
						double w1 = 150000;        //�ӹǹ�Թ�����ǧ 0-150000
						double z1 = sum - w1;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);
						tax = (w1 * percent1)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 > 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							double w2 = 150000;
							double z2 = z1 - w2;  // �ʹ¡��
							log.debug("z2="+z2);
							tax1 = (w2 * percent2)/100;
							log.debug(tax1);
							request.setAttribute("w2",w2);
							request.setAttribute("tax1",tax1);    //�ӹǹ��
							if(z2 > 200000) {        //�ӹǹ�Թ�����ǧ 300001-500000
								double w3 = 200000;
								double z3 = z2 - w3;    //�ʹ¡��
								log.debug("z3="+z3);
								tax2 = (w3 * percent3)/100;
								log.debug("tax2="+tax2);
								request.setAttribute("w3",w3);
								request.setAttribute("tax2",tax2);
								if(z3 > 250000){         //�ӹǹ�Թ�����ǧ  500001-750000
									double w4 = 250000;
									double z4 = z3 - w4;
									log.debug("z4="+z4);
									tax3 = (w4 * percent4)/100;
									log.debug("tax3="+tax3);
									request.setAttribute("w4",w4);
									request.setAttribute("tax3",tax3);
									if(z4 > 250000){
										double w5 = 250000;
										double z5 = z4 - w5;
										log.debug("z5="+z5);
										tax4 = (w5 * percent5)/100;
										log.debug("tax4="+tax4);
										request.setAttribute("w5",w5);
										request.setAttribute("tax4",tax4);
										if(z5 <= 1000000) {
											log.debug("z5="+z5);
											request.setAttribute("w6",z5);
											tax5 = (z5 * percent6)/100;
											log.debug("tax5"+tax5);
											request.setAttribute("tax5",tax5);
										}
									}
								}
							}
						}
					}
				}
				
				else if(sum<=5000000) {
					if(sum > 150000) {
						double w1 = 150000;        //�ӹǹ�Թ�����ǧ 0-150000
						double z1 = sum - w1;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);
						tax = (w1 * percent1)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 > 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							double w2 = 150000;
							double z2 = z1 - w2;  // �ʹ¡��
							log.debug("z2="+z2);
							tax1 = (w2 * percent2)/100;
							log.debug(tax1);
							request.setAttribute("w2",w2);
							request.setAttribute("tax1",tax1);    //�ӹǹ��
							if(z2 > 200000) {        //�ӹǹ�Թ�����ǧ 300001-500000
								double w3 = 200000;
								double z3 = z2 - w3;    //�ʹ¡��
								log.debug("z3="+z3);
								tax2 = (w3 * percent3)/100;
								log.debug("tax2="+tax2);
								request.setAttribute("w3",w3);
								request.setAttribute("tax2",tax2);
								if(z3 > 250000){         //�ӹǹ�Թ�����ǧ  500001-750000
									double w4 = 250000;
									double z4 = z3 - w4;
									log.debug("z4="+z4);
									tax3 = (w4 * percent4)/100;
									log.debug("tax3="+tax3);
									request.setAttribute("w4",w4);
									request.setAttribute("tax3",tax3);
									if(z4 > 250000){
										double w5 = 250000;
										double z5 = z4 - w5;
										log.debug("z5="+z5);
										tax4 = (w5 * percent5)/100;
										log.debug("tax4="+tax4);
										request.setAttribute("w5",w5);
										request.setAttribute("tax4",tax4);
										if(z5 > 1000000) {
											double w6 = 1000000;
											double z6 = z5 - w6;
											log.debug("z6"+z6);
											tax5 = (w6 * percent6)/100;
											log.debug("tax5"+tax5);
											request.setAttribute("w6",w6);
											request.setAttribute("tax5",tax5);
											if(z6 <= 3000000) {
												request.setAttribute("w7",z6);
												tax6 = (z6 * 30)/100;
												log.debug("tax6"+tax6);
												request.setAttribute("tax6",tax6);
											}
										}
									}
								}
							}
						}
					}
				}
				else if(sum>5000000) {
					if(sum > 150000) {
						double w1 = 150000;        //�ӹǹ�Թ�����ǧ 0-150000
						double z1 = sum - w1;   //�ʹ¡��
						log.debug(z1);
						request.setAttribute("w1",w1);
						tax = (w1 * percent1)/100;    //�ӹǹ��
						log.debug(tax);
						request.setAttribute("tax",tax);
						if(z1 > 150000){           //�ӹǹ�Թ�����ǧ 150001-300000
							double w2 = 150000;
							double z2 = z1 - w2;  // �ʹ¡��
							log.debug("z2="+z2);
							tax1 = (w2 * percent2)/100;
							log.debug(tax1);
							request.setAttribute("w2",w2);
							request.setAttribute("tax1",tax1);    //�ӹǹ��
							if(z2 > 200000) {        //�ӹǹ�Թ�����ǧ 300001-500000
								double w3 = 200000;
								double z3 = z2 - w3;    //�ʹ¡��
								log.debug("z3="+z3);
								tax2 = (w3 * percent3)/100;
								log.debug("tax2="+tax2);
								request.setAttribute("w3",w3);
								request.setAttribute("tax2",tax2);
								if(z3 > 250000){         //�ӹǹ�Թ�����ǧ  500001-750000
									double w4 = 250000;
									double z4 = z3 - w4;
									log.debug("z4="+z4);
									tax3 = (w4 * percent4)/100;
									log.debug("tax3="+tax3);
									request.setAttribute("w4",w4);
									request.setAttribute("tax3",tax3);
									if(z4 > 250000){
										double w5 = 250000;
										double z5 = z4 - w5;
										log.debug("z5="+z5);
										tax4 = (w5 * percent5)/100;
										log.debug("tax4="+tax4);
										request.setAttribute("w5",w5);
										request.setAttribute("tax4",tax4);
										if(z5 > 1000000) {
											double w6 = 1000000;
											double z6 = z5 - w6;
											log.debug("z6="+z6);
											tax5 = (w6 * percent6)/100;
											log.debug("tax5"+tax5);
											request.setAttribute("w6",w6);
											request.setAttribute("tax5",tax5);
											if(z6 > 3000000) {
												double w7 = 3000000;
												double z7 = z6 - w7;
												log.debug("z7="+z7);
												tax6 = (w7 * percent7)/100;
												log.debug("tax6"+tax6);
												request.setAttribute("w7",w7);
												request.setAttribute("tax6",tax6);
												
												request.setAttribute("w8",z7);
												tax7 = (z7 * percent8)/100;
												log.debug("tax7="+tax7);
												request.setAttribute("tax7",tax7);
												
											}/*else {
												log.debug("z6="+z6);
												request.setAttribute("w7",z6);
												tax6 = (z6 * 30)/100;
												log.debug("tax6"+tax6);
												request.setAttribute("tax6",tax6);
												
											}*/
										}
									}
								}
							}
						}
					}
				}
				
			
				double total = tax+tax1+tax2+tax3+tax4+tax5+tax6+tax7;
				log.debug("total = "+total);
				request.setAttribute("total",total);
				double perMonth = total/12;
				request.setAttribute("perMonth",perMonth);
		    }else {
		    	char p = '0';
		    	request.setAttribute("flag",p);
		    	log.debug("this");
		    }
			
			
			
			List<UserSalary> salaryList = userSalaryDAO.findAllList();
			//log.debug(salaryList);
			request.setAttribute("salaryList", salaryList);
			
			String userSalary = request.getParameter("user_name");
			log.debug(userSalary);
			List<UserSalary> user = userSalaryDAO.findSalary(userSalary);
			
			request.setAttribute("test", user);
			log.debug(user);
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			log.debug(e);
			return ERROR;
		}
	}

	public String getWorkingList() {
		try {
			String userId = request.getParameter("userId") == null ? "test.data1" : request.getParameter("userId") ;
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			//Set default if startDate,endDate null value
			Date date = new Date();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();		
			LocalDate lastDayOfMonth = localDate.with(TemporalAdjusters.lastDayOfMonth());
			LocalDate firstDayOfMonth = localDate.with(TemporalAdjusters.firstDayOfMonth());
			
			if(startDate == null) {
				startDate = firstDayOfMonth.toString();
			}
			if(endDate == null) {
				endDate = lastDayOfMonth.toString();
			}
						
			List<Map<String, Object>> workingList = funtionDAO.findWorkingList(userId, startDate, endDate);	//List for display on table detail
			List<Map<String, Object>> workingSummary = funtionDAO.findWorkingSummary(userId, startDate, endDate); //Summary (record 0) : count_working,actual_working,absent,sum_hours
					
			request.setAttribute("WorkingList", workingList);
			request.setAttribute("WorkingSummary", workingSummary);
			
			return SUCCESS;

		} catch (Exception e) {

			return ERROR;
		}
	}
	
	
}