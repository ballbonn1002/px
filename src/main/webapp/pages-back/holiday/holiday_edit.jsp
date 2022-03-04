<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.js"></script>
  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

<div class="portlet light bordered"  >
	<div class="portlet-title">
		
		<div class="caption">
			<i class="fa fa-paperclip font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Holiday
				application form</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<form action="UpdateHoliday" method="POST">
			<div class="portlet-body">
			
				<div class="form-group form-lg-line-input col-md-12">
				<div class="col-md-1"></div>
					<label class="col-md-2 control-label" for="form_control_1">Input Date 
						:</label>
					<div class="col-md-4">
					<div class="input-group input-large date-picker input-daterange"
							data-date-format="dd-mm-yyyy" >
							<input type="text" class="form-control" name="Date-Start" 
									data-date-format="dd-mm-yyyy"  id="date_s" >
					
							 <span class="input-group-addon"> to </span>
								<input type="text" class="form-control" name="Date-End"
									data-date-format="dd-mm-yyyy" id="date_e" >	
					</div>
					</div>
				</div>
													
						<div class="form-group form-lg-line-input col-md-12">
						<div class="col-md-1"></div>
							<label class="control-label col-md-2" id="namelabel">Name : </label>
							<div class="col-md-4">
								<input type="text" name="name" class="form-control" id="nameid"
									maxlength="240" value="${holidayrecord.head}" required onkeyup='check_char(this)'>
									<input type="hidden" name="id_date" class="form-control" 
									maxlength="240" value="${holidayrecord.id_date}" required>
								<div class="form-control-focus"></div>
							</div>
						</div>
				
				<div class="form-group form-lg-line-input col-md-12">
				<div class="col-md-1"></div>
					<label class="col-md-2 control-label" for="form_control_1">Description
						:</label>
					<div class="col-md-4">
						<textarea style="word-break: break-all; white-space: normal;"
						 class="form-control"  rows="5" cols="100"  name="description" id="text1"  onkeyup='check_char(this)'></textarea>
						<div class="form-control-focus"></div>
					</div>
				</div>
			
			<div class="form-group form-lg-line-input col-md-12">
				<div class="col-md-1"></div>
					<label class="col-md-2 control-label" for="form_control_1"></label>
					<div class="col-md-4">
						<center>
							<button type="submit" class="btn blue-soft">
								<i class="fa fa-save"></i> Update
							</button>
							<button type="button" class="btn red-intense" onclick="ss()">
								<i class="fa fa-close"></i> Cancel
							</button>
						</center>
					</div>
			</div>
			</div>
	
		<div class="row ">
			<div class="col-md-12"></div>
		</div>

</form>
		<input type="hidden" value="${holidayrecord.start_date}" id="date1">
		<input type="hidden" value="${holidayrecord.end_date}" id="date2">
		
		</div>
	
</div>
<script>
function check_char(elm){
	
	if(elm.value.match(/['"]/) && elm.value.length>0){
		swal(
				{
					title : "ERROR",
					text : "ห้ามใส่อักขระพิเศษ",
					type : "error"
				},
				function() {
					
				});
	
	}
}
</script>
<script type="text/javascript">
$(document).ready(function() {
	var text_new = '${holidayrecord.description}';
	 document.getElementById("text1").value= text_new;//Set value on Textarear

	 var dd,mm,yy,s,s1;
	 var flag1 = 0 ;
	 s = document.getElementById("date1").value ;
	 s1 = document.getElementById("date2").value ;

	var value = "${flag}";
	if (value == 1) {
		
		swal('Please!', 'Check Start Date Duplicate', 'warning');
	}
    if(flag1 == 0){
    
document.getElementById("date_s").value = covert(s) ;
document.getElementById("date_e").value = covert(s1) ;
    }
	flag1 = 1;
});
function covert(x){
	var dd,mm,yy;
	
	yy = x.substring(0,4);

	mm = x.substring(5,7);

	dd = x.substring(8,10);
	
	
	var date = dd +"-"+ mm+ "-"+ yy ;

	
	
	return date;
}
function ss() {	
	var value = "${flag_form}";
	if (value != 1) {
	document.location = "holiday_calendar?date="+document.getElementById("date_s").value;
	}else{
	document.location = "holiday_list";
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
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
