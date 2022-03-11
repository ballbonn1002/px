<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
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

</style>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
${description}


<div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a><tiles:insertAttribute name="title" ignore="true" /></h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="icon-home"></i></a></li> 
                            <li class="breadcrumb-item"><a href="#"><tiles:insertAttribute name="title" ignore="true" /></a></li>                         
                        </ul>
                    </div>            
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                        
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="header">
        	<h2 style="font-size: 20px;">Position</h2>
        	<ul class="header-dropdown">
            	<li><a href="position_add" class="btn btn-info">Add Position</a></li>
            </ul>
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
					</a> <a href="javascript:;" class="remove" data-original-title=""
						title=""> </a>
				</div>
				<!-- </div> -->
				<div class="body">
					<div class="table-responsive">
						<table class="table table-hover js-basic-example dataTable table-custom m-b-0 no-footer">
							<thead>
                            	<tr>
                            		<th height="41" style="width: 10%;">No</th>
									<th height="41" style="width: 10%;">ID</th>
									<th height="41" style="width: 10%;">Department ID</th>
									<th height="41" style="width: 10%;">Name</th>
									<th height="41" style="width: 10%;">Description</th>
									<th height="41" style="width: 5%;"></th>
                                </tr>
                            </thead>
							<tbody>
	 							<c:forEach var="test" items="${positionList}">
									<c:set var="counter" value="${counter + 1}" />
									<tr> 
										<td>${counter}</td>
										<td style="padding-top: 10px;">${test.position_id}</td>
										<td style="padding-top: 10px;">${test.department_id}</td>
										<td style="padding-top: 10px;">${test.name}</td>
										<td style="padding-top: 10px;text-align:left;">${test.description}</td>
										<%--
										<td style="padding-top: 10px;">${test.user_create}</td>
										<td style="padding-top: 10px;">${test.user_update}</td>
										<td style="padding-top: 10px;"><fmt:formatDate
												value="${test.time_create}" pattern=" dd-MM-yyyy" /></td>
										<td style="padding-top: 10px;"><fmt:formatDate
												value="${test.time_update}" pattern=" dd-MM-yyyy" /></td>
										--%>
										<td style="text-align:right;">                                            
                                        	<a class="btn btn-outline-success" title="Edit" href="editPosition?position_id=${test.position_id}">
                                        	<i class="fa fa-pencil"></i></a>
                                        	<a class="btn btn-outline-danger sweet-${test.position_id}" title="Delete"
                                        		onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);">
                                        	<i class="fa fa-trash-o"></i></a>
                                        </td>
										
										<!-- <td style="text-align:center; padding-top: 10px;">
												<a class="btn btn-outline btn-circle btn-sm sbold blue editsweet-${test.position_id}" title="Edit"
												href="editPosition?position_id=${test.position_id}">
												<i class="fa fa-pencil"></i></a></td>
										<td style="text-align:center; padding-top: 10px;">
												<a class="btn btn-outline btn-circle btn-sm sbold red-mint sweet-${test.position_id}" 
												onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);" title="Delete">
												<i class="fa fa-trash"></i></a></td> -->
												
										
									</tr>
									<script>
document.querySelector('.sweet-${test.position_id}').onclick = function(){
	swal({
	      title: "Are you sure!",
	      text: "You will deleting this id!",
	      type: "info",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-primary',
	      confirmButtonText: 'OK'
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
          return false
        }
        document.location = "position_delete?position_id=${test.position_id}";   //?id คือ parameter
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
            </div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
$(document).ready(function(){	

	var value="${myselect}" ; 
	var d = new Date();
	if(value == 0 ){
		document.getElementById(d.getFullYear()).selected = "true";	
	}else if(value == 2 ){  
		document.getElementById("all").selected = "true";
	}else{
	document.getElementById(value).selected = "true";
   }
});
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