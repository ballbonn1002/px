
package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.RoleAuthorizedObjectDAO;
import com.cubesofttech.dao.SysuserDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserRoleDAO;
import com.cubesofttech.dao.UserRpwDAO;
import com.cubesofttech.model.RoleAuthorizedObject;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserRole;
import com.cubesofttech.model.UserRpw;
import com.cubesofttech.service.LoginService;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;



public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public static final String NODAY = "no_day";
	public static final String EMAIL = "email";

	@Autowired
	private SysuserDAO sysUserDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserRpwDAO userRpwDAO;

	@Autowired
	private RoleAuthorizedObjectDAO roleAuthorizedObjectDAO;

	@Autowired
	private UserRoleDAO userRoleDAO;

	@Autowired
	private LoginService loginService;

	String username;
	String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String FBbooklogin() throws Exception{
		try {
			String id = request.getParameter("id");
			//log.debug(id);
			HttpSession session = request.getSession();
			if(id != null) {
				User userFblogin = userDAO.findByFbId(id);
				String xxxx = userFblogin.toString();
				String[] vx = xxxx.split("=");
				String[] userloginDB = vx[1].split("}]");
				if(userFblogin != null) {
					log.debug(userloginDB[0]);
					User user = userDAO.findById(userloginDB[0]);
					session.setAttribute("onlineUser", user);
					
				}
			}
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String unlinkFace() {  
		try {
			String userId = request.getParameter("userId");
			userDAO.linkFacebook(userId, null);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String autologin() {
		try {
			String userlogin = request.getParameter("username");
			String md5Password = loginService.generateMD5(password);
			if(request.getParameter("remember-me") != null) {
				String remember = request.getParameter("remember-me");
				Cookie cUserlogin = new Cookie("cookuser", userlogin);
				Cookie cMd5Password = new Cookie("cookmd5", md5Password);
				Cookie cRemember = new Cookie("cookrem", remember);
				cUserlogin.setMaxAge(60 * 60 * 24 * 15);
				cMd5Password.setMaxAge(60 * 60 * 24 * 15);
				cRemember.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cUserlogin);
				response.addCookie(cRemember);
				response.addCookie(cMd5Password);
			} else {
				Cookie cUserlogin = new Cookie("cookuser", null);				
				Cookie cMd5Password = new Cookie("cookmd5", null);
				Cookie cRemember = new Cookie("cookrem", null);
				cUserlogin.setMaxAge(0);				
				cMd5Password.setMaxAge(0);
				cRemember.setMaxAge(0);
				response.addCookie(cUserlogin);				
				response.addCookie(cMd5Password);
				response.addCookie(cRemember);
			}
			login();
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}		
	}
	
	public String login() {
		try {
			String userlogin = request.getParameter("username");
			request.setAttribute("userlogin", userlogin);
			HttpSession session = request.getSession();
			Sysuser user = sysUserDAO.findById(userlogin);
			String md5Password = loginService.generateMD5(password);
			List<Map<String, Object>> userActive = sysUserDAO.sysUserEnable(userlogin);
			
			if (user != null && md5Password.equals(user.getPassword()) && !userActive.isEmpty()) {
				String chkLogin = "sc";
				Cookie cSuccess = new Cookie("cooksc", chkLogin);
				cSuccess.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cSuccess);
				//Set<String> userAuthority = new HashSet<>();
				Constant.onlineUserList.add(user.getSys_user_id());

				/*List<RoleAuthorizedObject> roleAuthorizedObjectList = roleAuthorizedObjectDAO
						.findByRoleId(user.getRoleId());

				userAuthority = loginService.addRoleByUserTable(roleAuthorizedObjectList, userAuthority);

				List<UserRole> userRoleList = userRoleDAO.findByUserId(user.getId());

				userAuthority = loginService.addRoleByUserRoleTabel(userRoleList, userAuthority);*/

				session.setAttribute("user", user);
				session.setAttribute("onlineUser", user);
				//session.setAttribute("userAuthority", userAuthority);

				Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser");
				String logonUser = ur.getSys_user_id();

				
				log.debug(Constant.onlineUserList);
				log.debug(logonUser);
				
				
				return SUCCESS;
			} else {
				Cookie cSuccess = new Cookie("cooksc", null);
				cSuccess.setMaxAge(0);
				response.addCookie(cSuccess);
				return ERROR;
			}

		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}


	
	public String forgetPassword() {

		try {
			String email = request.getParameter(EMAIL);
			List<Map<String, Object>> findEmail = userDAO.findByemail(email);
			
			Map<String, String> obj = new HashMap<>();
			if (!findEmail.isEmpty()) {
				String userEmail = (String) findEmail.get(0).get("email");
				String userId = (String) findEmail.get(0).get("id");
				String userKey = (String) loginService.generateMD5(DateUtil.getTimeNow());
				Timestamp initTime = DateUtil.getCurrentTime();
				Timestamp expired = new Timestamp(initTime.getTime() + (1000 * 60 * 60 * 24));
				
				UserRpw find = userRpwDAO.findByUserId(userId);
				
				if(find == null) {
					UserRpw u = new UserRpw();
					u.setUserId(userId);
					u.setUserKey(userKey);
					u.setExpried(expired);
					userRpwDAO.save(u); 
				} else {
					find.setUserKey(userKey);
					find.setExpried(expired);
					userRpwDAO.update(find);;
				}
				
				// Function RandomPassword 6 number
				/*String ranpassword =loginService.randomPassword(6);
				
				User find = userDAO.findById(userId);
				find.setPassword(loginService.generateMD5(ranpassword));
				userDAO.update(find);*/
				
				loginService.sendmail(userKey, userEmail);
				request.setAttribute("result", "<div class=\"alert alert-success\" style=\"color:green \"><button class=\"close\" data-close=\"alert\"></button>&#x1F6C8; Please check your e-mail and click on the provided link to reset your password.</div>");
		
				/*obj.put("flag", SUCCESS);
				Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
				String jsonObjStr = gson.toJson(obj);
				PrintWriter out = response.getWriter();
				out.print(jsonObjStr);
				out.flush();
				out.close();*/
				return SUCCESS;
			} else {
				/*obj.put("flag", ERROR);
				Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
				String jsonObjStr = gson.toJson(obj);
				PrintWriter out = response.getWriter();
				out.print(jsonObjStr);
				out.flush();
				out.close();*/
				request.setAttribute("result", "<div class=\"alert alert-danger\" style=\"color:red \"><button class=\"close\" data-close=\"alert\"></button>&#x1F6C8; Unable to reset password due to an unknown error. Please try again.</div>");
				return ERROR;
			}

		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}

	public String resetPassword() {
		try {
			Timestamp current_time = DateUtil.getCurrentTime();
			String newpass = request.getParameter("newpassword");
			String repass = request.getParameter("repassword");
			String userkey = request.getParameter("key");
			UserRpw userrpw = userRpwDAO.findByUserKey(userkey);
			
			Map<String, String> obj = new HashMap<>();
			if (userrpw != null && userkey.equals(userrpw.getUserKey()) && newpass.equals(repass) && current_time.before(userrpw.getExpried())) {
				String user_id = userrpw.getUserId();
				
				User find = userDAO.findById(user_id);
				find.setPassword(loginService.generateMD5(newpass));
				userDAO.update(find);
				return SUCCESS;
			} else {
				
				return ERROR;
			}
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
	
	public String logout() {
		try {
			Cookie cUserlogin = new Cookie("cookuser", null);
			Cookie cMd5Password = new Cookie("cookmd5", null);
			Cookie cRemember = new Cookie("cookrem", null);
			Cookie cSuccess = new Cookie("cooksc", null);
			cUserlogin.setMaxAge(0);
			cMd5Password.setMaxAge(0);
			cRemember.setMaxAge(0);
			cSuccess.setMaxAge(0);
			response.addCookie(cUserlogin);
			response.addCookie(cMd5Password);
			response.addCookie(cRemember);
			response.addCookie(cSuccess);
			request.getSession().invalidate();
			System.out.println(Constant.onlineUserList);
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
	
	/* Test */
	
	public String onlineUser() {
		try {
			String s1 = "";  
			int i = 0 ;
			for (String temp2 : Constant.onlineUserList) {
				if ( i > 0) {
					s1 = s1+" , ";
				}
				i++;
				s1 =s1+ "'"+temp2+"'";
			}
			log.info(s1);  
			List<Map<String, Object>> sessionOnlineUser  = userDAO.findRoleNameById(s1);
			request.setAttribute("sessionOnlineUser", sessionOnlineUser);
			log.info(sessionOnlineUser); 
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
}