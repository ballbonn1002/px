<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

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

</style>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> ประเภทพนักงาน</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">ประเภทพนักงาน</li>
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
							 <span style="font-weight: bold; font-size: 20px" class="caption-subject font-red sbold uppercase" >ประเภทพนักงาน</span> 
							 <a href="/employeeType_add" class="btn btn-info" style="margin-bottom: 30px; float:right; ">&nbsp;เพิ่มประเภทพนักงาน</a>
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
										<th style="text-align: left; width: 10%">ลำดับ</th>
										<th style="text-align: left; width: 20% ">ประเภทพนักงาน</th>
										<th style="text-align: left; width: 20% ">ประเภทการจ่ายเงิน</th>
										<th style="text-align: left; width: 20% ">งวดการจ่ายเงิน</th>
										<th style="text-align: left; width: 20% ">จำนวนวันต่องวด</th>
										<th style="text-align: center;width: 10% "> </th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="test" items="${emptypeList}">
									<c:set var="counter" value="${counter + 1}" />
										<tr>
											<td style= "text-align: left; padding-left: 20px ">${counter}</td>
											<td style="text-align: left; padding-top: 10px;">${test.name}</td>
											<td style="text-align: left; padding-top: 10px;">
											<c:choose>
												<c:when test="${test.payment == 1}">รายวัน</c:when>
												<c:when test="${test.payment == 0}">รายเดือน</c:when>
											</c:choose></td>
											<td style="text-align: left; padding-top: 10px;">${test.term} งวด</td>
											<td style="text-align: left; padding-top: 10px;">${test.term_day}</td>
											<td style="text-align:right;">                                            
                                        		<a class="btn btn-outline-success" title="Edit" href="EditEmployeeType?emp=${test.employee_type_id}">
                                        		<i class="fa fa-pencil"></i></a>
                                        		<a class="btn btn-outline-danger sred-intense" title="Delete"
                                        			onclick="del('${test.employee_type_id}')">
                                        		<i class="fa fa-trash-o"></i></a>
                                       		</td>
										</tr>
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
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	</script>
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
<script>
function del(id){
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
        document.location = "employeeType_delete?employee_type_id="+id;   //?id คือ parameter
      });
};
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