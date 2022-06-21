
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	type="text/javascript"></script>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
	type="text/javascript"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />


<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> เเผนก</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">เเผนก</li>
                     <li class="breadcrumb-item active">เเก้ไขเเผนก</li>
                </ul>
        </div>            
    </div>
</div>

<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">  
            	
            	<div class="portlet light bordered">
					<div class="portlet-title" style = "padding-bottom: 40px;">
						<div class="caption">
						<!--  <i class="fa fa-paperclip font-red"></i>-->
						 	<span class="caption-subject font-red sbold uppercase" style="font-weight: bold; font-size: 18px" >เเก้ไขเเผนก</span>
						</div>
						<!--  <div class="actions">
						<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>-->
					</div>
				</div>
				<div class="portlet-body">
					<div class="panel-body">
						<form action="updateDepart" method="POST">
		
						<!-- Start Hidden ID เอาไว้ไม่ใช้โชว์ใน view -->
						<div class="form-group form-lg-line-input col-md-12">
								<label class="control-label col-md-3" id="idlabel">ID : </label>
							<div class="col-md-12">
								<input type="text" name="ID" class="form-control" value="${departmentList.department_id}" disabled>
								<input type="hidden" name="ID" value="${departmentList.department_id}">
							</div>
						</div>
						<!-- End Hidden -->
		
							<div class="form-group form-lg-line-input col-md-12">
								<label class="control-label col-md-3" id="namelabel">Name : </label>
							<div class="col-md-12">
								<input type="text" name="name" class="form-control" id="deptname"
								maxlength="240" value="${departmentList.name}" required> <input
								type="hidden" name="id_date" class="form-control" required>
							<div class="form-control-focus"></div>
								<!-- <span class="help-block">Please fill the information</span> -->
							</div>
							</div>
							<div class="form-group form-lg-line-input col-md-12">
								<label class="col-md-3 control-label" for="form_control_1">Description : </label>
								<div class="col-md-12">
									<input type="text" name="deptdes" class="form-control" id="deptdes"
									maxlength="240" value="${departmentList.description}" required>
								<div class="form-control-focus"></div>
								<!-- <span class="help-block">Please fill the information</span> -->
								</div>
							</div>
							<div class="form-group form-lg-line-input col-md-12">
								<label class="col-md-3 control-label" for="form_control_1">Prefix ID :</label>
								<div class="col-md-12">
									<input type="text" name="testnaja" class="form-control"
									value="${departmentList.prefixId}" id="prefixId">
								<div class="form-control-focus"></div>
									<!-- 	<span class="help-block">Please fill the information</span> -->
								</div>
							</div>
			
							<div class="form-group form-lg-line-input col-md-12">
								<label class="col-md-3 control-label" for="form_control_1"></label>
								<div class="col-md-12">
									<div  style="text-align: right">
										<button type="reset" class="btn btn-outline-secondary"> ยกเลิก</button>
										<button type="submit" class="btn btn-success"> บันทึก</button>
									</div>
								</div>
							</div>
							<input type="hidden" name="logonUser" value="${logonUser}">
			
			
						<!-- กำหนดวันที่ Time Create -->
							<div>
								<input type="hidden" name="time" id="time"
								class="form-control input-lg timepicker timepicker-24 test"
								value="${time}" data-time-format=" HH:mm" style="width: 200px;"
								onclick="timechenge()" onkeypress='return false'>
							</div>
						<div class="form-group form-md-line-input">
							<div class="col-md-2">
								<input name="date" id="date"
								value="<fmt:formatDate value="${now}"  type = "both" 
        						timeStyle = "medium" pattern="dd-MM-yyyy "  />"
								onchange="datechenge()"
								class="form-control input-lg form-control-inline input-medium date-picker test"
								size="9" type="hidden" onkeypress='return false'>
							</div>
						<!-- End Time Create -->
						</div>
						</div>

						<div class="row ">
							<div class="col-md-12"></div>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<script>
	function datechenge() {
		var fulldate = "${fulldate}".trim();//??????????????
		var Userdate = $("#mydate").val();//???????????
		if (fulldate != Userdate) {
			$("#detail").show();
			$("#labeldetail").show();
		} else {
			$("#detail").hide();
			$("#labeldetail").hide();
		}
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
<script src="https://code.jquery.com/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
