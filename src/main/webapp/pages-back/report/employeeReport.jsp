<!DOCTYPE html>
<html>
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

<link rel="stylesheet"	href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"	href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

<link rel="stylesheet"	href="pages-back/assets/vendor/chartist/css/chartist.min.css">
<link rel="stylesheet"	href="pages-back/assets/vendor/chartist-plugin-tooltip/chartist-plugin-tooltip.css">

<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta charset="UTF-8">
</head>

<style>

</style>

<body>
				
	<div class="block-header">
		<div class="row">
			<div class="col-lg-6 col-md-8 col-sm-12">
				<h2 class="font-weight-bold">
					<a href="javascript:void(0);"
						class="btn btn-xs btn-link btn-toggle-fullwidth"> <i
						class="fa fa-arrow-left"></i></a> Employee Statistics
				</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item">รายงาน</li>
					<li class="breadcrumb-item active">Employee Statistics</li>
				</ul>
			</div>
		</div>
	</div>
	
			
<div class="container">
	<div class="card">
		<div class="row clearfix">
			<div class="col-lg">
				<div class="header">
					<h2>Employee Statistics</h2>
				</div>
			</div>
			
			<div class="col-lg ">
				<div class="header">
					
					<div class="col-5 float-right">
						<div id="divyearpicker" class="input-group ml-2">
							<input type="text" data-provide="datepicker"
								data-date-format = "yyyy" data-date-start-view = "years" 
								data-date-min-view-mode= "years" data-date-max-view-mode = "years" 
								class="form-control"
								id="yearpicker"	data-date-autoclose="true"
								onchange="generateBarChart()"
								value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value = "${now}"  type = "both" timeStyle = "medium" pattern="yyyy" />">
							<div class="input-group-append">
								<span class="input-group-text" style="font-size: 12px"><i class="fa fa-calendar-o" aria-hidden="true"></i></span>
							</div>
						</div>
					</div>
		
				</div>
			</div>
		</div>

		<div class="row clearfix">
			<div class="col-lg">
				<div class="body">
					<div id="testbar" class="chartist"></div>
				</div>
			</div>
		</div>
	</div>
</div>
	

</body>

<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script	src="pages-back/assets/vendor/table-dragger/table-dragger.min.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script src="pages-back/assets/bundles/chartist.bundle.js"></script>

<script>
var department_id = [];

$('#yearpicker').datepicker({
	orientation: 'bottom'
});

function getdepartment_id(){
	$.ajax({
		url: "getAllDeparmentId",
		method: "POST",
		type: "JSON",
		data: {},
			success:function(data){
				
				data.forEach(function(dp_name,index){
					department_id.push(dp_name["department_id"])
				})
				department_id.sort()
				//console.log(department_id);
				
				generateBarChart()

			}
	})
}

function generateBarChart(){
	var year = $('#yearpicker').val();
	console.log(year);
	console.log(department_id.join(','))
	
	$.ajax({
		url: "getGraphData",
		method: "POST",
		type: "JSON",
		data: {
				"year" : year ,
				"allDepartmentId" : department_id.join(',') ,
			},
			success:function(data){
				console.log(data);
				
				datalist = createGraphData(data);
				createGraph(datalist);
			}
		})
}

function createGraphData(data){
	let lst = []
	department_id.forEach(function(dp_name,index){
		lst.push(data[dp_name])
	})
	return lst
}

function createGraph(DataList){
	var dataStackedBar = {
		    labels: ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'],
		    series: DataList
		};
	new Chartist.Bar('#testbar', dataStackedBar, {
	    height: "230px",
	    stackBars: true,
	    axisX: {
	        showGrid: true
	    },
	    axisY: {
	        labelInterpolationFnc: function(value) {
	            return value%1==0? value:"";
	        }
	    },
	    plugins: [
	        Chartist.plugins.tooltip({
	            appendToBody: true
	        }),
	        Chartist.plugins.legend({
	            legendNames: department_id
	        })
	    ]
	}).on('draw', function(data) {
	        if (data.type === 'bar') {
	            data.element.attr({
	                style: 'stroke-width: 30px'
	            });
	        }
	});
}


$(document).ready(function() {
	
	getdepartment_id()
	//
	
});
</script>

</html>