<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style type="text/css">
/* class สำหรับแถวแรกของรายละเอียด */
.tr_odd {
	background-color: #F8F8F8;
}
/* class สำหรับแถวสองของรายละเอียด */
.tr_even {
	background-color: #F2F2F2;
}
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

input[type="checkbox"] {
	accent-color: #0275d8;
}

</style>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>ผู้ใช้งานระบบ</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Authority</li>
                    <li class="breadcrumb-item active">ผู้ใช้งานระบบ</li>
                </ul>
        </div>            
    </div>
</div>

<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">    
				
				<div class="portlet light bordered">
					<div class="portlet-title" >
						<div class="caption">
							 <span style="font-weight: bold; font-size: 20px"
								   class="caption-subject font-red sbold uppercase" >ผู้ใช้งานระบบ</span> 
							 <span class="caption-helper font-red"> <%-- ${role.name} --%> </span>
						</div>
		
						<div class="actions right" style="text-align: right; ">
							<a href="SystemUser_add" class="btn btn-info" style="margin-bottom: 30px;"  >&nbsp;เพิ่มพนักงาน</a>
						</div>
					</div>
		
			<div class="portlet-body">
				<!-- BEGIN FORM-->
				<div class="portlet box white">
					<!-- <div class="portlet-title"> -->
					<div class="caption"></div>
						<div class="tools">
							<a href="javascript:;" class="collapse" data-original-title=""
							   title=""> </a> <a href="#portlet-config" data-toggle="modal"
						       class="config" data-original-title="" title=""> </a> <a
							   href="javascript:;" class="reload" data-original-title="" title="">
							</a> 
							<a href="javascript:;" class="remove" data-original-title="" title=""> </a>
						</div>
						<!-- </div> -->
						<div class="table-responsive">
							<table  class="table table-hover js-basic-example table-custom m-b-0 no-footer ">
								<thead>
									<tr>
										<th style="text-align: left; width: 10%">#</th>
										<th style="text-align: left; width: 20%">UserID</th>
										<th style="text-align: left; width: 20% ">Role</th>
										<th style="text-align: left; width: 20% ">Name</th>
										<th style="text-align: center; width: 20% ">Is Active</th>
										<th style="text-align: left; width: 10% "> </th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sysuser" items="${sysuserList}">
									<c:set var="counter" value="${counter + 1}" />
										<tr>
											<td style="text-align: left; padding-left: 20px ">${counter}</td>
											<td style="text-align: left; padding-top: 10px;">${sysuser.sys_user_id}</td>
											<td style="text-align: left; padding-top: 10px;">${sysuser.sys_role_id}</td>
											<td style="text-align: left; padding-top: 10px;">${sysuser.user_id}</td>
											<td style="align-item: center;" data-order="${sysuser.is_active}">
													<div class="md-checkbox" style="margin-left: 45%;">
															<input id="chk${sysuser.sys_user_id}" type="checkbox" class="md-check status" onchange = "Change('${sysuser.sys_user_id}')"
															<c:if test ="${fn:contains(sysuser.is_active, '1')}">checked</c:if>>
													</div>
												
											</td>
											<td style="text-align:right;">                                            
                                        		<a id="edit" class="btn btn-outline-success" title="Edit" href="sysuser_edit?sysuser_id=${sysuser.sys_user_id}">
                                        		<i class="fa fa-pencil"></i></a>
                                        		<a class="btn btn-outline-danger sred-intense sweet-${sysuser.sys_user_id}" title="Delete"
                                        			onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);">
                                        		<i class="fa fa-trash-o"></i></a>
                                       		</td>
										</tr>
<script>
document.querySelector('.sweet-${sysuser.sys_user_id}').onclick = function(){
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "info",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-primary',
	      confirmButtonText: 'OK'
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
          return false
        }
        document.location = "sysuser_delete?sys_user_id=${sysuser.sys_user_id}";   //?id คือ parameter
      });
};
</script>


								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- END FORM-->
		</div>
	</div>
	</div>
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function Change(userId){
	//console.log(userId);
	const x = document.querySelector('#chk'+userId);
	//console.log(x.checked);
	var Isactive;
	if(x.checked){
		Isactive = 1; 
	}
	else{
		Isactive = 0;	
	}
	//console.log(Isactive);
	 $.ajax({
     	url: "Changecheckbox",
     	method : "POST",
		type : "JSON",
         data: {		
         			"Isactive" : Isactive,
         			"userId" : userId
         		},
         success: function(data){
             //console.log(data); 
 	}
  }) 
}
</script>
	<link
		href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
		rel="stylesheet" type="text/css" />
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
	<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />