<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />

<style>
.dashboard-toggle {
	border: 1px solid #CED4DA;
	border-radius: 4px;
	margin: 10px;
	padding: 10px;
	cursor: pointer;
}

.icon-box {
	width: 40px;
	height: 40px;
	background: #F7FBFF 0% 0% no-repeat padding-box;
	border-radius: 8px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.icon-box i {
	font-size: 1.25rem;
	margin: auto;
}

.color-blue {
	color: #449CFF;
}

.normal-font {
	font-size: 14px;
}

.dashboard-active {
	border: 1px solid #449CFF;
	color: #449CFF;
}
</style>


<div class="block-header">
	<div class="row">
		<div class="col-lg-6 col-md-8 col-sm-12">
			<h2>
				<a href="javascript:void(0);"
					class="btn btn-xs btn-link btn-toggle-fullwidth"><i
					class="fa fa-arrow-left"></i></a> Dashboard
			</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i
						class="icon-home"></i></a></li>
				<li class="breadcrumb-item active">Dashboard</li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12 d-flex justify-content-between">
				<div class="d-flex align-items-center">
					<div class="dashboard-toggle dashboard-active ml-0" name="Employee">Employee</div>
					<div class="dashboard-toggle" name="Employee type">Employee
						type</div>
					<div class="dashboard-toggle" name="Position">Position</div>
					<div class="dashboard-toggle" name="Department">Department</div>
					<div class="dashboard-toggle" name="Payment type">Payment
						type</div>
				</div>

				<div class="d-flex align-items-center">
					<select id="filter-option" class="form-control ml-2"
						style="width: auto">
						<option selected>Month</option>
						<option>Year</option>
					</select>
					<div class="input-group ml-2">
						<input type="text" data-provide="datepicker"
							data-date-format="MM yyyy" data-date-start-view="months"
							data-date-min-view-mode="months" class="form-control"
							id="month-year" style="width: auto" size="8"
							data-date-autoclose="true" onchange="addTable()"
							value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value = "${now}"  type = "both" timeStyle = "medium" pattern="MMMM yyyy "  />">
						<div class="input-group-append">
							<span class="input-group-text" style="font-size: 12px"><i
								class="fa fa-calendar-o" aria-hidden="true"></i> </span>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
</div>


<div class="container">
	<div class="row equal" id="dashboard-table"></div>
</div>

<script>
function createTable(percentage,value,group) {
	let mockvalue;
	let icon_table;
	
	switch(group) {
	  case "พนักงานประจำ":
		  icon_table = "fa fa-users color-blue";
	      break;
	  case "พนักงานอัตราจ้าง":
		  icon_table = "fa fa-users color-blue";
	      break;
	  case "trainee":
		  icon_table = "fa fa-users color-blue";
		  break;
	  case "MNG":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "BUM":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "DEVJ":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "DESJ":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "DNET":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "DNES":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "JSA":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "SA":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "TEST":
		  icon_table = "fa fa-address-card-o color-blue";
	  	  break;
	  case "QA":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "AE":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "PM":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "TL":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "INT":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "UXUI":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "Fron":
		  icon_table = "fa fa-address-card-o color-blue";
		  break;
	  case "GP":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "IT":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "MA":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "MM":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "MS":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "OP":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "HR":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "IN":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "AE":
		  icon_table = "fa fa-building color-blue";
		  break;
	  case "A":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "ABA":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "ABSENCE":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "ABSENT":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "ADWDA":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "BONUS":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "DASD":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "DSFP":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "EQUIPMENT":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "LATE":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "OT1":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "OT2":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "OT3":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "PVD":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "SL":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "SSI":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "TAX":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "TRAVEL":
		  icon_table = "fa fa-money color-blue";
		  break;
	  case "VA":
		  icon_table = "fa fa-money color-blue";
		  break;
	  default:
		  icon_table = "fa fa-users color-blue";
	}
	
	
	if($(".dashboard-toggle").parent().find(".dashboard-active").attr('name') == "Employee") {
		mockvalue = (Math.round(parseFloat(value) * 100) / 100).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
	}
	else{
		mockvalue = (Math.round(parseFloat(value) * 100) / 100).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
	}
	return `
	<div class = "col-3 d-flex pb-3">
		<div class = "card" style = "padding : 10px 20px">
			<div class = "header d-flex justify-content-between align-items-center pb-3 px-0">
				<div class="icon-box">
					<i class="`+icon_table+`" aria-hidden="true"></i>
				</div>
				<div class = "normal-font">` + percentage + "%" +`</div>
			</div>
		<div class = "footer d-flex justify-content-between align-items-end">
			<p class = "normal-font">` + group + `</p>
				<h2 class = "color-blue">` + mockvalue + `</h2>
			</div>
		</div>
	</div>`
}

function addTable() {
	$.ajax({
		url: "getTable",
		method: "POST" ,
		type: "JSON" ,
		data: {
			"item" : $(".dashboard-toggle").parent().find(".dashboard-active").attr('name'),
			"type" : $("#filter-option").val(),
			"time"	:$('#filter-option').next().find("#month-year").val(),
			},
		success:function(data){
			data = jQuery.parseJSON(data);
			$("#dashboard-table").empty()
			$.each(data.table,(index, value) => {
				$("#dashboard-table").append(createTable(value.percentage,value.value,value.group))
			})
			
		}
	});
}

	


$( document ).ready(function() {
	addTable();
	$('#filter-option').on("change",() => {
		if ($('#filter-option').val() == "Year") {
			$('#filter-option').next().empty()
			$('#filter-option').next().append(`
					<input type="text" data-provide = "datepicker" data-date-format = "yyyy" data-date-start-view = "years" data-date-min-view-mode= "years" data-date-max-view-mode = "years" class="form-control" id="month-year" style="width: auto" size="8" data-date-autoclose = "true" onchange = "addTable()" value = "<fmt:formatDate value = "${now}"  type = "both" timeStyle = "medium" pattern="yyyy "  />">
						<div class="input-group-append">
							<span class="input-group-text" style="font-size: 12px">
							<i class="fa fa-calendar-o" aria-hidden="true"></i> </span>
						</div>
					`)
				addTable();
		}
		else if($('#filter-option').val() == "Month"){
			$('#filter-option').next().empty()
			$('#filter-option').next().append(`
					<input type="text" data-provide = "datepicker" data-date-format = "MM yyyy" data-date-start-view = "months" data-date-min-view-mode= "months" class="form-control" id="month-year" style="width: auto" size="8" data-date-autoclose = "true" onchange = "addTable()" value = "<fmt:formatDate value = "${now}"  type = "both" timeStyle = "medium" pattern="MMMM yyyy "  />">
						<div class="input-group-append">
							<span class="input-group-text" style="font-size: 12px">
							<i class="fa fa-calendar-o" aria-hidden="true"></i> </span>
						</div>
					`)
				addTable();
			
		}
	})
	
	
	
	
	$(".dashboard-toggle").click(function () {
		$(".dashboard-toggle").removeClass("dashboard-active")
		$(this).addClass("dashboard-active")
		addTable();
		
	})
});
</script>