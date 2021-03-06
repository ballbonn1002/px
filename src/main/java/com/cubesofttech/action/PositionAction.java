package com.cubesofttech.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Position;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PositionAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(PositionAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public PositionDAO positionDAO;
	@Autowired
	public DepartmentDAO departmentDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Position = "positionList";

	public String list() {
		try {
					List<Position> positionList = positionDAO.findAllPosition();
					request.setAttribute(Position, positionList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	public String addPosition(){
		try{
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			return SUCCESS;
			
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	public String CheckPositionID() {
		try {
			String id = request.getParameter("position_id");
			Map<String, String> obj = new HashMap<>();
			List<Map<String, Object>> positionId = positionDAO.findPositionId(id);
			//log.debug(positionId);
			String s = positionId.toString();
			if (s.equals("[]")) {
				String x = "0";
				obj.put("flag", x);
			} else {
				String a = "1";
				obj.put("flag", a);
			} 
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String json = gson.toJson(obj);
	        PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close(); 
			
	        //return null;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	 }
	
	public String savePosition() {
		try{
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login 

			Position position = new Position();
			String positionId = request.getParameter("positionId");
			String departmentId = request.getParameter("user.departmentId");
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String prefix = request.getParameter("prefix");
		
			
			String date = request.getParameter("date");
			//String time = request.getParameter("time");
			log.debug(date);
			//log.debug(time);
			
			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			//log.debug(ts);
			
			Position positionCheck =  positionDAO.findById(positionId); // ????????????????????? ID
			if(positionCheck == null){ // Check ????????? Id ????????????????????????????????? ??????????????????????????? Save
				
				position.setPositionId(positionId);
				position.setDepartmentId(departmentId);
				position.setName(name);
				position.setDescription(description);
				position.setPrefixId(prefix);
				position.setUserCreate(logonUser);
				position.setUserUpdate(logonUser);
				position.setTimeCreate(DateUtil.getCurrentTime());
				position.setTimeUpdate(DateUtil.getCurrentTime());
				//log.debug(position);
				
			positionDAO.save(position);
			}else{ // ?????????????????? ??????????????? Alert ???????????????????????? Flag ??????????????????????????? department_add
				//String posiCheck = positionCheck.toString();
				//log.debug(posiCheck);
				request.setAttribute("flag", "1");
			}
			//List<Position> positionList = positionDAO.findAllPosition();
			//request.setAttribute(Position, positionList);
			//return SUCCESS;
			
			log.debug(positionCheck);
			Gson gson = new Gson(); 
            String json = gson.toJson(positionCheck); 
            request.setAttribute("json", json);	
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	
	public String PositionEdit(){
		try{
			String positionId = request.getParameter("position_id");
			Position positionList = new Position();
			positionList = positionDAO.findById(positionId);
			request.setAttribute(Position, positionList);  //?????????????????????????????????????????????????????????
			
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
		//	String departmentId = request.getParameter("department_id");
		//	Department departmentList = new Department();
		//	departmentList = departmentDAO.findById(departmentId);
			request.setAttribute("departmentList", departmentList);
		//	request.setAttribute("departmentList", departmentList);
			
			
			
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	public String PositionUpdate(){
		try{
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login 
			
			Position position = new Position();
			String positionId = request.getParameter("positionId");
			position = positionDAO.findById(positionId);
			
//			????????????????????? GET PARAMETER
			String departmentId = request.getParameter("departmentId");
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String date = request.getParameter("date");
			//String time = request.getParameter("time");

			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			
			
			
			position.setName(name);
			position.setDepartmentId(departmentId);
			position.setDescription(description);
			position.setTimeUpdate(DateUtil.getCurrentTime());
			position.setUserUpdate(logonUser);
			
			positionDAO.update(position);
			
			
			//List<Position> positionList = positionDAO.findAll();
			//request.setAttribute(Position, positionList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	public String deletePosition(){
		try{
			String positionId = request.getParameter("position_id");
			Position position = new Position();
			position = positionDAO.findById(positionId);
			log.debug(position);
			positionDAO.delete(position);
			List<Position> positionList = positionDAO.findAllPosition();
			request.setAttribute(Position, positionList);
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
		
	}
	
	public String getPositionbyDId() {
		try {
			String departmentId = request.getParameter("departmentId");
			List<Position> position = positionDAO.searchByDepartment(departmentId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String json = gson.toJson(position);
	        PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close(); 
			
	        //return null;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
		
		

}