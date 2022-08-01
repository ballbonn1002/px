<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="../assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
<script
		src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
		type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
		src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
		type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
		type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
<script>
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>	
<style>
td{
	font-family:Open Sans;
}
tr{
	font-family:Open Sans;
	font-weight:Semibold;
}
</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>Role</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">ระบบรักษาความปลอดภัย</li>
                    <li class="breadcrumb-item active">Role</li>
                    <li class="breadcrumb-item active">Role permission</li>
                </ul>
        </div>            
    </div>
</div>
<div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                    
                        <div class="header">
                        <h6 class="card-title">Role permission</h6>
                        <div>
                        	
                        </div>
                        </div>
                        <div class="body">
                        <form action="updateSys_role">
                           
                               <!--   <span class="pull-right"  style="text-align: right; ">
								   		
								   </span>
								   <span class="pull-right"  style="text-align: right;margin-right:8px;">
								   		
								   </span><br><br>  -->
								   
								  
								  
                            <div class="row clearfix col-md-12" style="align-items:flex-end ;">
                                <div class="col-md-4"> 
                                		<label for="name" >Name<span style="color:red;"> *</span></label>        
                                        <input type="text" name="Name" id="nem" class="form-control" value="${sys_roleList.name}" onkeyup="myFunction()" >
                                        
                                   	 
                                </div>
                                <div class="col-md-4"> 
                                    <label for="discription">Discription</label>
                                        <input type="text" class="form-control" id="des" value="${sys_roleList.description}" name="Description"  >
                                </div>
                                <div class="col-md-4" style="display:none;"> 
                                    <label for="id">ID</label>
                                        <input type="text" class="form-control" value="${sys_roleList.sys_role_id}" name="id"  >
                                </div>
                                <div class="col-md-4"  >
                                
                               		 
                                <a href="role_management" class="btn btn-secondary" type="reset" style="width:96px;margin: 0px 4px; ">&nbsp;ยกเลิก</a>
                                <button type="submit" class="btn btn-success" style="width:96px;margin: 0px 4px;" id="btn1">บันทึก</button>
                                </div>
                            </div>
                            
                            <div  style="display:none;padding-left: 15px;" id="error">
											<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; You can not use this name</i>
							</div>
							<div  style="display:none;padding-left: 15px;" id="pass">
											<i class="fa fa-check-circle-o" style="color:#28A745; ">&nbsp; You can  use this name</i>
							</div>
							<div  style="display:none;padding-left: 15px;" id="empty">
											<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; Please enter your name</i>
							</div>
                         
                         
                            
                           			 
                            
                            
                            
                        </form><br><br>
                        
                        
                        
                        
                        
                        
                            <div class="table-responsive">
                                <table class="table  table-custom m-b-0 no-footer" style="bordercolor:#CED4DA" id="table1">
                                    <thead style="text-align:center;">
                                        <tr>
                                            <th style="width:30%;">Page</th>
                                            <th style="width:14%;">Is Active</th>
                                            <th style="width:14%;">View</th>
                                            <th style="width:14%;">Create & Update</th>
                                            <th style="width:14%;">Delete</th>
                                            <th style="width:14%;">Approve</th>
                                        </tr>
                                    </thead>
                                  
                                    
                                    <tbody>
                                    	<c:forEach var="page" items="${perList}">
                                    	
                                        <c:set var="count" value="${count+1}"></c:set>
                                    	<tr id="${count }" class="only" style="background-color:#F1F1F1;font-weight:bold;font-family:open sans;">
                                    	
                                    		<td class="" style="color:#2898CB;" >${page.group_name}
                                    		
                                    		<span id="${count }" class="custom-control custom-switch" style="float:right;">
                                    			<input type="checkbox" class="custom-control-input check-box" role="switch" id="customSwitch${page.page_group_id }" 
                                    			 onclick="tgSwitch('${page.page_group_id}','${page.sys_role_id }'); customSwitch('${page.page_group_id }');" 
                                    			<c:if test="${fn:contains(page.PG_is_active, '0')}">disabled</c:if>
                                    			<c:if test="${fn:contains(page.page_group_active, '1')}">checked</c:if>
                                    			>
  												<label class="custom-control-label" for="customSwitch${page.page_group_id }"></label>
   <script>
 $(document).ready(function () {
	 const js = document.querySelector('#customSwitch${page.page_group_id}');
	 const pt = document.querySelector('#customSwitch${page.page_group_id}');
	// console.log(js.disabled);
	 if(js.disabled==true && (pt.checked==true || pt.checked==false)){
		$("tr#${count}").hide();
 		$("tr.MITH${page.page_group_id}").hide();
 	}if(js.disabled==false){
 		if(pt.checked==true){
 			$("tr#${count}").show();
 		    $("tr.MITH${page.page_group_id}").show();
 		}else{
 			$("tr#${count}").show();
 		    $("tr.MITH${page.page_group_id}").hide();
 		}
 		
 	}
	});
 </script> 		
 <!--   <script>
 $(document).ready(function(){
	 const pt = document.querySelector('#customSwitch${page.page_group_id}');
	 console.log(pt.checked);
	 if(pt.checked==true){
		 $("tr.MITH${page.page_group_id}").show();
	 }else{
		 $("tr.MITH${page.page_group_id}").hide();
	 }
 });
 </script>			--> 			
 			
  											</span>
  											</td>	
                                    		<td></td>
                                    		<td></td>
                                    		<td></td>
                                    		<td></td>	
                                    		<td ></td>	
											 
                                    	
                                    			
                                    		
                                    		
                                    		
                                    		
                                    		
                                    	</tr>
                                    	<c:forEach var="txt" items="${permissionList }">
                                    	
                                    	<c:set var="counter" value="${counter+1}"></c:set>
                                    	<tr class="MITH${txt.page_group_id}">
                                    		<td class="ggg">
                                    		
                                    		<c:choose>
                                    			<c:when test="${(page.page_group_id == txt.page_group_id )&& txt.page_name!=null}">
                                    				<c:out value="${txt.page_name }" />
                                    				<c:if test="${txt.page_name == 'เงินเดือน' }">
                                    			<span class="badge badge-default m-l-10 hidden-sm-down" style="float:right;">Function</span>
                                    				</c:if>
                                    				<c:if test="${txt.page_name == 'ประวัติเงินเดือน' }">
                                    			<span class="badge badge-default m-l-10 hidden-sm-down" style="float:right;">Function</span>
                                    				</c:if>
                                    			</c:when>
                                    			
                                    		</c:choose>
                                    		
                                    		</td>
                                    		 <td style="text-align: center; " data-order="${txt.page_active}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div >
																<div class="md-checkbox md-checkbox-outline" style="align:center;">
																	<input type="checkbox" id="isActive${txt.permission_id }" class="CheckBox"  onchange="changeActive('${txt.permission_id}')" 
																	 
																		<c:if test="${fn:contains(txt.is_active, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.page_active, '1')}">checked</c:if>
																		
																		> 
																		
																</div>
															</div>
														</div>
											</td>
											 <td style="text-align: center; " data-order="${txt.view}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="view${txt.permission_id}" class="md-check" onchange="changeView('${txt.permission_id}')"
																		<c:if test="${fn:contains(txt.check_view, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.view, '1')}">checked</c:if>
																	
																		> 
																		
																		
																</div>
															</div>
														</div>
												</td>
												<td style="text-align: center; " data-order="${txt.create_update}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="CreateUpdate${txt.permission_id}" class="md-check" 
																	 onchange="changeCreateUpdate('${txt.permission_id}')"
																		<c:if test="${fn:contains(txt.check_create_update, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.create_update, '1')}">checked</c:if>
																		
																		> 
																		
																</div>
															</div>
														</div>
												</td>
												<td style="text-align: center; " data-order="${txt.delete_role}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="Delete${txt.permission_id}" class="md-check" 
																	onchange="changeDelete('${txt.permission_id}')"
																		<c:if test="${fn:contains(txt.check_delete, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.delete_role, '1')}">checked</c:if>
																		> 
																		
																</div>
															</div>
														</div>
												</td>
												<td style="text-align: center; " data-order="${txt.approve}" class="${txt.page_group_id }">
													<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="Approve${txt.permission_id}" class="md-check" 
																	onchange="changeApprove('${txt.permission_id}')"
																		 
																		<c:if test="${fn:contains(txt.check_approve, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.approve, '1')}">checked</c:if>
																		
																		> 
																</div>
															</div>
														</div>
												</td>
												
                                    	</tr>
                                    	</c:forEach>
                                         </c:forEach>
                                    		
                                    				
                                    		
                                    		
                                    	

                                    		                                    	
                                    		
                                      
                                   
                                        
                                    </tbody>
                                    
                                    </table>
                             </div>
                          </div>
                      
                    
     			</div>
			</div>
</div>




<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span style="font-weight:bold; font-size: 20px;" 
                                  class="caption-subject font-red sbold uppercase">USER</span>   
                            <span class="pull-right"  style="text-align: right; ">
                            <a href="#" class="btn btn-info" style="margin-bottom: 30px;">&nbsp;Link</a>
                            </span>
                        </div>
                        
                    </div>
                    <div class="portlet-body">
                        <div class="portlet box white">
                            <div class="caption"></div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse" data-original-title=""
							   title=""> </a> <a href="#portlet-config" data-toggle="modal"
						       class="config" data-original-title="" title=""> </a> <a
							   href="javascript:;" class="reload" data-original-title="" title="">
							</a> 
							<a href="javascript:;" class="remove" data-original-title="" title=""> </a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover dataTable js-exportable table-custom m-b-0 no-footer ">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>User Name</th>
                                            <th>User</th>
                                            <th>ชื่อ ภาษาไทย</th>
                                            <th>Is Active</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                   
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
</div>
 </div>

   <script>
document.querySelectorAll('table tr').forEach(function(e, i) {
    if (e.textContent.trim().length == 0) { // if row is empty
        e.parentNode.removeChild(e);
    }
})
</script>
 <script>
function customSwitch(group_id){
	 const js = document.querySelector('#customSwitch'+group_id);
	 console.log(js.checked);
	 if(js.checked==true){
		 $("tr.MITH"+group_id).fadeIn();
 	}else{
 		$("tr.MITH"+group_id).fadeOut();
 	}
}
</script>
 <script>
function changeActive(permissionId){
	const x = document.querySelector('#isActive'+permissionId);
	console.log(x.checked);
	console.log(x);
	var pageActive;
	
	if(x.checked){
		pageActive=1;
	}else{
		pageActive=0;
	}
	//console.log(pageActive);
	//console.log(pageId);
	
	console.log(permissionId);
	console.log(pageActive);
     
    	   $.ajax({
  			   url: "changeActive",
  			   method:"POST",
          	   type: "text",
          	   data: {  "permission_Id": permissionId,
          		 		"Active":pageActive
          		  	  },
          	 
          	   success: function(data){
          		// alert(data);
          		 console.log(data);
          		 
          	   }
          	}); 
       return false;
        
}
 </script>    
 
 <script>
 function changeView(permissionId){
	 const x = document.querySelector('#view'+permissionId);
		console.log(x.checked);
		var pageView;
		if(x.checked){
			pageView=1;
		}else{
			pageView=0;
		}
		console.log(pageView);
		console.log(permissionId);
		
		
	
	    	   $.ajax({
	  			   url: "changeView",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
	          		 		// "Active":pageActive,
	          				"View":pageView
	          				/*"pageCreateUpdate":pageCreateUpdate,
	          				"pageDelete":pageDelete,*/
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function changeCreateUpdate(permissionId){
	 const x = document.querySelector('#CreateUpdate'+permissionId);
		console.log(x.checked);
		var pageCreateUpdate;
		if(x.checked){
			pageCreateUpdate = 1;
		}else{
			pageCreateUpdate = 0;
		}
		console.log(pageCreateUpdate);
		
		
	
	    	   $.ajax({
	  			   url: "changeCreateUpdate",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
	          		 		
	          				"CreateUpdate":pageCreateUpdate,
	          			//	"pageDelete":pageDelete,
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	});
	       return false;
	        
	}
 </script>
 <script>
 function changeDelete(permissionId){
	 const x = document.querySelector('#Delete'+permissionId);
		console.log(x.checked);
		var pageDelete;
		if(x.checked){
			pageDelete = 1;
		}else{
			pageDelete = 0;
		}
		console.log(pageDelete);
		
	
	    	   $.ajax({
	  			   url: "changeDelete",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
	          				"Delete":pageDelete,
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function changeApprove(permissionId){
	 const x = document.querySelector('#Approve'+permissionId);
		console.log(x.checked);
		var pageApprove;
		if(x.checked){
			pageApprove = 1;
		}else{
			pageApprove = 0;
		}
		console.log(pageApprove);
	
	    	   $.ajax({
	  			   url: "changeApprove",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
	          				"Approve":pageApprove,
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function tgSwitch(page_group_id,sys_role_id){
	 const x = document.querySelector('#customSwitch'+page_group_id);
		console.log(x.checked);
		console.log(page_group_id);
		console.log(sys_role_id);
		var tg_status;
		if(x.checked){
			tg_status = 1;
		}else{
			tg_status = 0;
		}
		console.log(tg_status);
	
	    	   $.ajax({
	  			   url: "changeStatus",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "page_group_id": page_group_id,
	          				"sys_role_id":sys_role_id,
	          				"status":tg_status
	          		  	  },
	          	 
	          	   success: function(data){
	                    //  alert(data);
	                      console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function myFunction() {
	  var x = $("#nem").val();
	  console.log(x);
	  if(x != ""){
	    	$.ajax({
				url : "findName",
				method : "POST",
				type : "JSON",
				data : {
					"value" : x
				},
				success : function(data) {
					console.log(data);
					if (data.toString().indexOf("1") != -1) {
						$("#pass").hide();
						$("#error").show();
						$("#empty").hide();
						$(':input[type="submit"]').prop('disabled', true);
					}
					 else {
						$("#pass").show();
						$("#error").hide();
						$("#empty").hide();
						$(':input[type="submit"]').prop('disabled', false);
					}

				}
			})
	    }else{
	    	$("#pass").hide();
			$("#error").hide();
			$("#empty").show();
			$(':input[type="submit"]').prop('disabled', false);
		}
	}
 </script>

 