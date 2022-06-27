package com.cubesofttech.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cubesofttech.dao.*;
import com.cubesofttech.model.*;

@Service
public class CalcService {
	//@Autowired Phase
	
	
	//Code in here
	
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
