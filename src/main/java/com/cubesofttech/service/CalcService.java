package com.cubesofttech.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cubesofttech.dao.*;
import com.cubesofttech.model.*;
import com.ibm.icu.text.DecimalFormat;

@Service
public class CalcService {
	//@Autowired Phase
	
	//Code in here
	public String calSsi(String percent, String salary) throws Exception {
		String calSocialSecurity = null;
		double s = 0;
		double pc = Integer.parseInt(percent);
		double slr = Integer.parseInt(salary);
		
		DecimalFormat df = new DecimalFormat();
		df.setMaximumFractionDigits(2);
		
		if(slr >15000) {
			s = (15000*pc/100);
		} else {
			s = (slr*pc/100);
			
		}
		calSocialSecurity = String.valueOf(s);
		return calSocialSecurity;
	}
	

}
