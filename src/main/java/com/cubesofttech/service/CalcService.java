package com.cubesofttech.service;

import java.util.*;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cubesofttech.dao.*;
import com.cubesofttech.model.*;
import com.ibm.icu.text.DecimalFormat;

@Service
public class CalcService {
	private static final Logger log = Logger.getLogger(CalcService.class);
	//@Autowired Phase
	
	//Code in here
	public List<List<Double>> calculateTax(Double money,Double paid,Double self,Double aia) throws Exception {
		List<Double> List = new ArrayList<Double>();
		List<Double> List2 = new ArrayList<Double>();
		double year = money * 12;
		//log.debug(money);
		double sum = year - paid - self - aia;
		//request.setAttribute("sum",sum);
		double tax = 0,tax1 = 0,tax2 = 0,tax3 = 0,tax4 = 0,tax5 = 0,tax6 = 0,tax7 = 0; 
		double percent1 = 0, percent2 = 5, percent3 = 10, percent4 = 15, percent5 = 20,
			   percent6 = 25, percent7 = 30, percent8 = 35;
		
		List.add(sum);
		//log.debug(year);
		if(sum<=150000) {                //�Թ���ط�Թ��¡��� 150000
			if(sum<=150000) {
					tax = (sum * percent1)/100;
					//request.setAttribute("w1",sum);
					//request.setAttribute("tax",tax);
					// s = String.valueOf(tax);
					 List.add(sum);
					 List.add(tax);
					 
					//return s;
				}
		}
		
		else if(sum <=300000){            
			if(sum > 150000) {
				double w1 = 150000;        
				double z1 = sum - w1;   
			    tax = (w1 * 0)/100;    
				if(z1 <= 150000){           
					tax1 = (z1 * percent2)/100;
					List.add(w1);
					List.add(tax);
					List.add(z1);
					List.add(tax1);
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
						List.add(w1);
						List.add(tax);
						List.add(w2);
						List.add(tax1);
						List.add(z2);
						List.add(tax2);
						
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
							    List.add(w1);
								List.add(tax);
								List.add(w2);
								List.add(tax1);
								List.add(w3);
								List.add(tax2);
								List.add(z3);
								List.add(tax3);
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
								
								List.add(w1);
								List.add(tax);
								List.add(w2);
								List.add(tax1);
								List.add(w3);
								List.add(tax2);
								List.add(w4);
								List.add(tax3);
								List.add(z4);
								List.add(tax4);
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
									List.add(w1);
									List.add(tax);
									List.add(w2);
									List.add(tax1);
									List.add(w3);
									List.add(tax2);
									List.add(w4);
									List.add(tax3);
									List.add(w5);
									List.add(tax4);
									List.add(z5);
									List.add(tax5);
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
										List.add(w1);
										List.add(tax);
										List.add(w2);
										List.add(tax1);
										List.add(w3);
										List.add(tax2);
										List.add(w4);
										List.add(tax3);
										List.add(w5);
										List.add(tax4);
										List.add(w6);
										List.add(tax5);
										List.add(z6);
										List.add(tax6);
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
										List.add(w1);
										List.add(tax);
										List.add(w2);
										List.add(tax1);
										List.add(w3);
										List.add(tax2);
										List.add(w4);
										List.add(tax3);
										List.add(w5);
										List.add(tax4);
										List.add(w6);
										List.add(tax5);
										List.add(w7);
										List.add(tax6);
										List.add(z7);
										List.add(tax7);
										
									}
								}
							}
						}
					}
				}
			}
		}
		double total = tax+tax1+tax2+tax3+tax4+tax5+tax6+tax7;
		List2.add(total);
		double perMonth = total/12;
		List2.add(perMonth);
		
		return  Arrays.asList(List, List2);
		
		
	}

	public double calSsi(double percent, double salary) throws Exception {
		double calSocialSecurity = 0;
		//DecimalFormat df = new DecimalFormat();
		//df.setMaximumFractionDigits(2);
		
		if(salary >15000) {
			calSocialSecurity = (15000*percent/100);
		} else {
			calSocialSecurity = (salary*percent/100);
		}
		//calSocialSecurity = String.valueOf(s);
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
