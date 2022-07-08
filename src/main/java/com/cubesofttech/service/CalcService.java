package com.cubesofttech.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cubesofttech.dao.UserSalaryDAO;

@Service
public class CalcService {
	private static final Logger log = Logger.getLogger(CalcService.class);
	//@Autowired Phase
	@Autowired
	private UserSalaryDAO userSalaryDAO;
	
	//Code in here
	public List<List<Double>> calculateTax(Double money,Double paid,Double self,Double aia) throws Exception {
		List<Double> taxList = new ArrayList<Double>();      //list ของการคำนวนภาษี
		List<Double> resultList = new ArrayList<Double>();     //list ของผลลัพท์ (ต่อปี,ต่อเดือน)
		double year = money * 12;
		double sum = year - paid - self - aia;      //ยอดคงเหลือสุทธิ
		double tax = 0,tax1 = 0,tax2 = 0,tax3 = 0,tax4 = 0,tax5 = 0,tax6 = 0,tax7 = 0;  
		double percent1 = 0, percent2 = 5, percent3 = 10, percent4 = 15, percent5 = 20,      // % คำนวนภาษี
			   percent6 = 25, percent7 = 30, percent8 = 35;
		
		taxList.add(sum);
		if(sum<=150000) {                //ยอดคุงเหลือสุทธิ 0-150,000
			if(sum<=150000) {            //จำนวนเงินตามช่วง  0-150,000
					tax = (sum * percent1)/100;
					 taxList.add(sum);
					 taxList.add(tax);
					 
					//return s;
				}
		}
		
		else if(sum <=300000){            //ยอดคุงเหลือสุทธิ 150,001-300,000
			if(sum > 150000) {            //จำนวนเงินตามช่วง  0-150,000
				double w1 = 150000;        
				double z1 = sum - w1;     //ยอดยกมา
			    tax = (w1 * 0)/100;       //คำนวนภาษี
				if(z1 <= 150000){           //จำนวนเงินตามช่วง  150,001-300,000
					tax1 = (z1 * percent2)/100;
					taxList.add(w1);
					taxList.add(tax);
					taxList.add(z1);
					taxList.add(tax1);
				}
		      
			}
		}
		else if(sum<=500000) {     //300001-500000
			if(sum > 150000) {
				double w1 = 150000;        
				double z1 = sum - w1; 
			    tax = (w1 * percent1)/100;
				if(z1 > 150000){          
					double w2 = 150000;
					double z2 = z1 - w2;  
				    tax1 = (150000 * percent2)/100;   
					if(z2 <= 200000) {         
						tax2 = (z2 * percent3)/100;
						taxList.add(w1);
						taxList.add(tax);
						taxList.add(w2);
						taxList.add(tax1);
						taxList.add(z2);
						taxList.add(tax2);
						
					}
				}
			}
		}
		else if(sum<=750000) {
			if(sum > 150000) {
				double w1 = 150000;       
				double z1 = sum - 150000;   
				tax = (w1 * percent1)/100;    
				if(z1 > 150000){           
					double w2 = 150000;
					double z2 = z1 - w2;  
					tax1 = (150000 * percent2)/100;
					if(z2 > 200000) {        
						double w3 = 200000;
						double z3 = z2 - w3;
						tax2 = (200000 * percent3)/100;
						if(z3 <= 250000){ 
							 tax3 = (z3 * percent4)/100;
							    taxList.add(w1);
								taxList.add(tax);
								taxList.add(w2);
								taxList.add(tax1);
								taxList.add(w3);
								taxList.add(tax2);
								taxList.add(z3);
								taxList.add(tax3);
						}
					}
				}
			}
		}
		else if(sum<=1000000) {
			if(sum > 150000) {
				double w1 = 150000;        
				double z1 = sum - 150000;   
				tax = (w1 * percent1)/100; 
				if(z1 > 150000){          
					double w2 = 150000;
					double z2 = z1 - w2;  
					tax1 = (150000 * percent2)/100;
					if(z2 > 200000) {       
						double w3 = 200000;
						double z3 = z2 - w3;    
						
						tax2 = (200000 * percent3)/100;
						if(z3 > 250000){         
							double w4 = 250000;
							double z4 = z3 - w4;
							tax3 = (250000 * percent4)/100;
							if(z4 <= 250000){
								tax4 = (z4 * percent5)/100;
								
								taxList.add(w1);
								taxList.add(tax);
								taxList.add(w2);
								taxList.add(tax1);
								taxList.add(w3);
								taxList.add(tax2);
								taxList.add(w4);
								taxList.add(tax3);
								taxList.add(z4);
								taxList.add(tax4);
							}
						}
					}
				}
				}
		}
		
		else if(sum<=2000000) {
			if(sum > 150000) {
				double w1 = 150000;       
				double z1 = sum - w1;
				tax = (w1 * percent1)/100;
				if(z1 > 150000){           
					double w2 = 150000;
					double z2 = z1 - w2;  
					tax1 = (w2 * percent2)/100;
					if(z2 > 200000) {       
						double w3 = 200000;
						double z3 = z2 - w3;    
						tax2 = (w3 * percent3)/100;
						if(z3 > 250000){        
							double w4 = 250000;
							double z4 = z3 - w4;
							tax3 = (w4 * percent4)/100;
							if(z4 > 250000){
								double w5 = 250000;
								double z5 = z4 - w5;
								tax4 = (w5 * percent5)/100;
								if(z5 <= 1000000) {
									tax5 = (z5 * percent6)/100;
									taxList.add(w1);
									taxList.add(tax);
									taxList.add(w2);
									taxList.add(tax1);
									taxList.add(w3);
									taxList.add(tax2);
									taxList.add(w4);
									taxList.add(tax3);
									taxList.add(w5);
									taxList.add(tax4);
									taxList.add(z5);
									taxList.add(tax5);
								}
							}
						}
					}
				}
			}
		}
		
		else if(sum<=5000000) {
			if(sum > 150000) {
				double w1 = 150000;      
				double z1 = sum - w1; 
				tax = (w1 * percent1)/100; 
				if(z1 > 150000){          
					double w2 = 150000;
					double z2 = z1 - w2; 
					tax1 = (w2 * percent2)/100;
					if(z2 > 200000) {        
						double w3 = 200000;
						double z3 = z2 - w3;   
						tax2 = (w3 * percent3)/100;;
						if(z3 > 250000){         
							double w4 = 250000;
							double z4 = z3 - w4;
							tax3 = (w4 * percent4)/100;
							if(z4 > 250000){
								double w5 = 250000;
								double z5 = z4 - w5;
								tax4 = (w5 * percent5)/100;
								if(z5 > 1000000) {
									double w6 = 1000000;
									double z6 = z5 - w6;
									tax5 = (w6 * percent6)/100;
									if(z6 <= 3000000) {
										tax6 = (z6 * 30)/100;
										taxList.add(w1);
										taxList.add(tax);
										taxList.add(w2);
										taxList.add(tax1);
										taxList.add(w3);
										taxList.add(tax2);
										taxList.add(w4);
										taxList.add(tax3);
										taxList.add(w5);
										taxList.add(tax4);
										taxList.add(w6);
										taxList.add(tax5);
										taxList.add(z6);
										taxList.add(tax6);
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
				double w1 = 150000;        
				double z1 = sum - w1;
				tax = (w1 * percent1)/100; 
				if(z1 > 150000){           
					double w2 = 150000;
					double z2 = z1 - w2;  
					tax1 = (w2 * percent2)/100;
					if(z2 > 200000) {       
						double w3 = 200000;
						double z3 = z2 - w3;    
						tax2 = (w3 * percent3)/100;
						if(z3 > 250000){ 
							double w4 = 250000;
							double z4 = z3 - w4;
							tax3 = (w4 * percent4)/100;
							if(z4 > 250000){
								double w5 = 250000;
								double z5 = z4 - w5;
								tax4 = (w5 * percent5)/100;
								if(z5 > 1000000) {
									double w6 = 1000000;
									double z6 = z5 - w6;
									tax5 = (w6 * percent6)/100;
									if(z6 > 3000000) {
										double w7 = 3000000;
										double z7 = z6 - w7;
										tax6 = (w7 * percent7)/100;
										tax7 = (z7 * percent8)/100;
										taxList.add(w1);
										taxList.add(tax);
										taxList.add(w2);
										taxList.add(tax1);
										taxList.add(w3);
										taxList.add(tax2);
										taxList.add(w4);
										taxList.add(tax3);
										taxList.add(w5);
										taxList.add(tax4);
										taxList.add(w6);
										taxList.add(tax5);
										taxList.add(w7);
										taxList.add(tax6);
										taxList.add(z7);
										taxList.add(tax7);
										
									}
								}
							}
						}
					}
				}
			}
		}
		double total = tax+tax1+tax2+tax3+tax4+tax5+tax6+tax7;
		resultList.add(total);
		double perMonth = total/12;
		resultList.add(perMonth);
		
		return  Arrays.asList(taxList, resultList);
		
		
	}

	public double calSsi(double percent, String uId) throws Exception {
		double calSocialSecurity = 0;
		//List<UserSalary> userSocialSecurityById = userSalaryDAO.findByUserId(uId);
		Map<String, Object> cubesoftUserSalariesById = userSalaryDAO.findSsiById(uId);
		
		BigDecimal bd = (BigDecimal) cubesoftUserSalariesById.get("amount");
		double salary = bd.doubleValue();
		
		if(salary >15000) {
			calSocialSecurity = (15000*percent/100);
		} else {
			calSocialSecurity = (salary*percent/100);
		}
		//calSocialSecurity = String.valueOf(s);
		//log.debug(salary);
		return calSocialSecurity;
	}
	
	public Double calculateSalaryPerDay(double salaryAmount,double salaryTerm,double salaryTermDay) throws Exception {
		Double SalaryPerDay = null;
		try {
			SalaryPerDay = salaryAmount / (salaryTerm*salaryTermDay);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SalaryPerDay;
	}
	
	public Double calculateSalaryPerHour(double SalaryDay) throws Exception{
		Double SalaryPerHour = null;
		try {
			SalaryPerHour = SalaryDay/8;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SalaryPerHour;
	}
	
	public Double calculateOT(double SalaryPerHour,double Otcount,double otMulitple) throws Exception{
		Double SalaryOT = null;
		try {
			SalaryOT = SalaryPerHour * otMulitple * Otcount;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SalaryOT;
	}
	

	
}
