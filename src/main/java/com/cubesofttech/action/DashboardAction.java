package com.cubesofttech.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_detailDAO;
import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.Position;
import com.opensymphony.xwork2.ActionSupport;

public class DashboardAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(DashboardAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	public Employee_typeDAO employee_typeDAO;

	@Autowired
	public DepartmentDAO departmentDAO;

	@Autowired
	public Payment_typeDAO payment_typeDAO;

	@Autowired
	public Payment_detailDAO payment_detailDAO;

	@Autowired
	public PaymentDAO paymentDAO;
	
	@Autowired
	public PositionDAO positionDAO;

	@Autowired
	public UserDAO userDAO;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String list() {
		try {

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getTable() {
		try {
			String item = request.getParameter("item");
			String type = request.getParameter("type");
			String time = request.getParameter("time");

			String[] parts = time.split(" ");

			List<List> table = new ArrayList<List>();
			JSONArray ja = new JSONArray();

			switch (item) {
			case "Employee":
				List<Employee_type> allEtype = employee_typeDAO.findAll();
				long allEmp = 0;
				for (int i = 0; i < allEtype.size(); i++) {
					long empCount = 0;
					if (type.equals("Month")) {
						empCount = userDAO.rowCountByEmpIdDateInterval(allEtype.get(i).getEmployee_type_id().toString(),
								parts[0], parts[1]);
					} else if (type.equals("Year")) {
						empCount = userDAO.rowCountByEmpIdFilterYear(allEtype.get(i).getEmployee_type_id().toString(),
								time);
					}
					allEmp = allEmp + empCount;
					table.add(Arrays.asList(allEtype.get(i).getName(), empCount));
				}
				table.add(0, Arrays.asList("All", allEmp));
				break;
			case "Employee type":
				List<Employee_type> allETtype = employee_typeDAO.findAll();
				long allETmp = 0;
				for (int i = 0; i < allETtype.size(); i++) {
					long empTCount = 0;
					if (type.equals("Month")) {
						empTCount = paymentDAO.dashboardEmpTypeMonth(allETtype.get(i).getEmployee_type_id().toString(),
								parts[0], parts[1]);
					} else if (type.equals("Year")) {
						empTCount = paymentDAO.dashboardEmpTypeYear(allETtype.get(i).getEmployee_type_id().toString(),
								time);
					}
					allETmp = allETmp + empTCount;
					table.add(Arrays.asList(allETtype.get(i).getName(), empTCount));
				}
				table.add(0, Arrays.asList("All", allETmp));
				break;
			case "Position":
				List<Position> allPtype = positionDAO.findAll();
				long allPmp = 0;
				for (int i = 0; i < allPtype.size(); i++) {
					long posCount = 0;
					if (type.equals("Month")) {
						posCount = userDAO.dashboarPositionMonth(allPtype.get(i).getPositionId().toString(),
								parts[0], parts[1]);
					} else if (type.equals("Year")) {
						posCount = userDAO.dashboardPositionYear(allPtype.get(i).getPositionId().toString(),
								time);
					}
					allPmp = allPmp + posCount;
					table.add(Arrays.asList(allPtype.get(i).getName(), posCount));
				}
				table.add(0, Arrays.asList("All", allPmp));
				break;
			case "Department":
				List<Department> allDtype = departmentDAO.findAll();
				long allDepart = 0;
				for (int i = 0; i < allDtype.size(); i++) {
					long departCount = 0;
					if (type.equals("Month")) {
						departCount = userDAO.dashboardDepartmentMonth(allDtype.get(i).getDepartment_id().toString(),
								parts[0], parts[1]);
					} else if (type.equals("Year")) {
						departCount = userDAO.dashboardDepartmentYear(allDtype.get(i).getDepartment_id().toString(),
								time);
					}
					allDepart = allDepart + departCount;
					table.add(Arrays.asList(allDtype.get(i).getName(), departCount));
				}
				table.add(0, Arrays.asList("All", allDepart));
				break;
			case "Payment type":
				List<Payment_type> allPayment = payment_typeDAO.findAll();
				long allPaytype = 0;
				for (int i = 0; i < allPayment.size(); i++) {
					long paymentCount = 0;
					if (type.equals("Month")) {
						paymentCount = payment_detailDAO.dashboardPaymentMonth(
								allPayment.get(i).getPayment_type_id().toString(), parts[0], parts[1]);
					} else if (type.equals("Year")) {
						paymentCount = payment_detailDAO
								.dashboardPaymentYear(allPayment.get(i).getPayment_type_id().toString(), time);
					}
					allPaytype = allPaytype + paymentCount;
					table.add(Arrays.asList(allPayment.get(i).getPayment_type_name(), paymentCount));
				}
				table.add(0, Arrays.asList("All", allPaytype));
				break;
			}

			for (int i = 0; i < table.size(); i++) {
				JSONObject jo = new JSONObject();
				jo.put("percentage", (Math.round(((long) table.get(i).get(1)) * 100.0 / (long) (table.get(0).get(1)))));
				jo.put("group", table.get(i).get(0));
				jo.put("value", table.get(i).get(1));
				ja.put(jo);
			}

			JSONObject mainObj = new JSONObject();
			mainObj.put("table", ja);

			PrintWriter out = response.getWriter();
			out.print(mainObj);
			out.flush();
			out.close();

			// return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
