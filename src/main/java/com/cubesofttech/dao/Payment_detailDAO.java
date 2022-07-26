
package com.cubesofttech.dao;

import java.math.BigInteger;
import java.util.List;

import com.cubesofttech.model.Payment_detail;


public interface Payment_detailDAO {
	public void save(Payment_detail payment_detail) throws Exception;

    public List<Payment_detail> findAll() throws Exception;

    public void update(Payment_detail payment_detail) throws Exception;

    public void delete(Payment_detail payment_detail) throws Exception;
    
    public long dashboardPaymentMonth(String paymentType,String month,String year) throws Exception;
    
    public long dashboardPaymentYear(String paymentType,String year)throws Exception;
    
    public List<Payment_detail> searchPaymentDetailByPidnUid(String pId,String uId) throws Exception;

}
