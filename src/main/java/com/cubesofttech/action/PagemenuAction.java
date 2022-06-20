package com.cubesofttech.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.cubesofttech.dao.PageDAO;
import com.cubesofttech.dao.PagemenuDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.cubesofttech.model.Page;
import com.cubesofttech.model.Pagemenu;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class PagemenuAction extends ActionSupport{
    private static final Logger log = Logger.getLogger(PagemenuAction.class);
    private static final long serialVersionUID = 1L;

    @Autowired
    public PagemenuDAO pagemenuDAO;
    @Autowired
    public PageDAO pageDAO;
    
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    
    public static final String Pagemenu = "pagemenuList";
    public static final String Page = "pageList";
    
    public String list() {
        try {
        			List<Pagemenu> pagemenuList = pagemenuDAO.findAll();
                    request.setAttribute("pagemenuList", pagemenuList);
                    
                    List<Map<String, Object>> pageList = pageDAO.findAllList();
                    request.setAttribute("pageList", pageList);

                    return SUCCESS;
                } catch (Exception e) {
                    log.error(e);

                    return ERROR;
                }
           }
    
   public String updatecheckbox() {
        try {
        			Pagemenu pagemenu = new Pagemenu();
                    String page_groupID = request.getParameter("id");
                    pagemenu = pagemenuDAO.findById(page_groupID);
                    log.debug(page_groupID);
                    String activepage_group = request.getParameter("active");
                    log.debug(activepage_group);
                    pagemenu.setIs_active(activepage_group);
                    pagemenuDAO.update(pagemenu);
                    
                    Gson gson = new GsonBuilder().setPrettyPrinting().create();
                    String json = gson.toJson(pagemenu);
                    request.setAttribute("json", json);

                    //return null;
                    return SUCCESS;
                } catch (Exception e) {
                	
                    return ERROR;
                }
           }
   	
   public String updatecheckbox1() {
       try {
   
                   Page page = new Page();
                   String pageID = request.getParameter("pageid");
                   page = pageDAO.findById(pageID);
                   log.debug(pageID);
                   String activepage = request.getParameter("pageactive");
                   page.setIs_active(activepage);  
                   pageDAO.update(page);
                   
                   Gson gson = new GsonBuilder().setPrettyPrinting().create();
                   String json = gson.toJson(page);
                   request.setAttribute("json", json);		 

                   return SUCCESS;
                   //return null;
               } catch (Exception e) {
               	
                   return ERROR;
               }
          } 
   
}
