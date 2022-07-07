<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
		
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>

<script src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"type="text/javascript"></script>
			
<script src="../assets/pages/scripts/ui-sweetalert.min.js"type="text/javascript"></script>

<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  
  to {
    opacity: 1;
  }
}

</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>Role</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item" style="font-size:14px;">ระบบรักษาความปลอดภัย</li>
                    <li class="breadcrumb-item active" style="font-weight:Semibold;font-size:14px">Role</li>
      
                </ul>
        </div>            
    </div>
</div>
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
        	<div class="header">
        		<h6 class="card-title">Role</h6>
                 <ul class="header-dropdown">
                                    <li>
                                        <button data-toggle="modal" data-target="#addSys_role" class="btn btn-info" style="margin-bottom: 30px;">&nbsp;เพิ่ม Role</button>
                                    </li>
                                </ul>            
                                    
        	</div>
            <div class="body">
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        
						
						<!-- Modal -->
						<div class="modal fade"  id="addSys_role" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content" >
								<form  method="POST" action="saveSys_role" id="form">
								<div class="modal-header">
									<span>
										<h4 class="title">&nbsp;เพิ่ม ROLE</h4>
									</span>
									<span>
										<div class="col-md-3 col-sm-4 " data-dismiss="modal" ><i class="fa fa-times" style="color:#CED4DA;"></i></div>
									</span>
								</div>	
									<div class="modal-body">
									
									<div class="col-md-12 ">
                        		
                               	 	<label for="recipient-name" class="control-label" >Name<span style="color:red;font-"> *</span></label> 
                               		 <div class="input-group mb-12">
                                    	<input class="form-control"  type="text"  name="Name"  placeholder="Name" id="nameChk" onkeyup="myFunction()" required>
                                   
                                    
                                	</div>
                             	 
                        		 	 <div  style="display:none;" id="error">
										<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; You can not use this name</i>
									</div>
									<div  style="display:none;" id="pass">
										<i class="fa fa-check-circle-o" style="color:#28A745; ">&nbsp; You can  use this name</i>
									</div>
									<div  style="display:none;" id="empty">
										<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; Please enter your name</i>
									</div>
									
									<div class="form-group" style="padding-top:20px">
                               	 	<label for="recipient-name" class="control-label" >Description</label> 
                               		 <div class="input-group mb-12">
                                    	<input  class="form-control"  type="text"  name="Description" placeholder="Descripttion" >
                                    
                                	</div>
                             	 </div>
									</div>
									</div>
									 <div class="modal-footer" >
							                <button type="reset" class="btn btn-secondary" data-dismiss="modal" style="width:96px;">ยกเลิก</button>
							                <button type="submit" class="btn btn-success" id="btn1" style="width:96px;" >บันทึก</button>
							             
    
							         </div>
								</form>
								</div>
							</div>
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

 
                                <table  class="table table-hover js-basic-example table-custom m-b-0 no-footer ">
                                    <thead>
                                        <tr>
                                        
                                            <th style="text-align: left; width: 20%">ลำดับ</th>
                                            <th style="text-align: left; width: 30% ">Name</th>
                                            <th style="text-align: left; width: 30% ">Discription</th>
                                            <th style="width: 20% "></th>
                                            
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="test" items="${sys_roleList }">  
                                    	<c:set var="counter" value="${counter + 1}" />
                                    		<tr>
                                    			<td style= "text-align: left; padding-left: 20px ">${counter}</td>
												<td style="text-align: left; padding-top: 10px;">${test.name}</td>
												<td style="text-align: left; padding-top: 10px;">${test.description}</td>
												
											    <td style="text-align:right;">                                            
				                                        <a style="text-align: center;" class="btn btn-outline-success" title="" href="edit_SysRole?sys_role_id=${test.sys_role_id}">
				                                        	<i class="fa fa-pencil"></i>
				                                        </a>
				                                         <a class="btn btn-outline-danger sred-intense " title="Delete"
                                        					onclick="del('${test.sys_role_id}')" >
                                        					<i class="fa fa-trash-o"></i></a>
				                                </td>                                        		
                                    		</tr>

                                    	
                                    	
										
                                   </c:forEach>

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

 <script >
function del(id){
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-primary',
	      confirmButtonText: 'OK'
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
          return false
        }
        document.location = "delete_SysRole?sys_role_id="+id;   //?id คือ parameter
      });
};
</script>
<script>
function myFunction() {
	  var x = $("#nameChk").val();
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