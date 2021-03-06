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
						class="fa fa-arrow-left"></i></a> Employee yearly statistics
				</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item">??????????????????</li>
					<li class="breadcrumb-item active">Employee yearly statistics</li>
				</ul>
			</div>
		</div>
	</div>
	
			
<div class="container">
	
	<div class="card">
		<div class="row clearfix">
			<div class="col-lg">
				<div class="header ml-4 mt-3">
					<h2>Employee yearly - LineChart Statistics</h2>
				</div>
			</div>
			
			<div class="col-lg ">
				<div class="header">
				
					<div class="col-sm-10 float-right">
				
						<!-- 
						<div class="input-group ml-2">
							<input type="text" data-provide="datepicker"
								data-date-format = "yyyy" data-date-start-view = "years" 
								data-date-min-view-mode= "years" data-date-max-view-mode = "years" 
								class="form-control" data-date-orientation="bottom"
								id="line_yearpicker" data-date-autoclose="true"
								onchange="generateLineChart()"
								value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value = "${now}"  type = "both" timeStyle = "medium" pattern="yyyy" />">
							<div class="input-group-append">
								<span class="input-group-text" style="font-size: 12px"><i class="fa fa-calendar-o" aria-hidden="true"></i></span>
							</div>
						</div>-->
						<span>
						<select id="year_selection" class="form-control"  multiple>	
							<option selected = "selected" ><%=new java.util.Date().getYear() + 1900%></option>
							<option selected = "selected" ><%=new java.util.Date().getYear() + 1900-1%></option>	
							<option selected = "selected" ><%=new java.util.Date().getYear() + 1900-2%></option>	
							<option selected = "selected" ><%=new java.util.Date().getYear() + 1900-3%></option>	
							<option selected = "selected" ><%=new java.util.Date().getYear() + 1900-4%></option>									 
							 <% for(int i = new java.util.Date().getYear() + 1900 - 5 ; i > 2000; i-=1) { %>
							<option><%=i%></option>
	            			<% } %>
						</select>
						</span>
											
					</div>
					
				</div>
			</div>
			
		</div>

		
		<div class="row clearfix">
			<div class="col-lg">
				<div class="body ml-5 mr-5 mb-5">
					<canvas id="LineChart" style="width:100%"></canvas>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!---------------------------------------------------- multiselect lib ----------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
<!---------------------------------------------------- multiselect lib ----------------------------------------------->


<script>
const department_color = {  "AE":"#dc3545",
							"GP":"#9360f7",
							"HR":"#ff9ca5",
							"IN":"#28a745",
							"IT":"#ff66bf",
							"MA":"#e7d2ac",
							"MM":"#b38805",
							"MS":"#77a7ff",
							"OP":"#ffc107", }
				
var department_id = [];
var lineChart = null;
var barChart = null;
var labels = [];

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
				
				//linechart
				createLineGraph()
				generateLineChart()

			}
	})
}


function generateLineChart(){
	var year = $('#year_selection').val();
	//console.log(year)
	
	$.ajax({
		url: "get_report_year_data",
		method: "POST",
		type: "JSON",
		data: {
				"year_list" : year.join(',') ,
				"allDepartmentId" : department_id.join(',') ,
			},
			success:function(data){
				//console.log(data);
				
				labels = ((['']).concat(year.sort())).concat([''])
				//labels = year.sort()
				
				dataset = createGraphDataset(data,year.sort());
				lineChart.data.datasets = dataset;
				lineChart.data.labels = labels;
			
				/*
				for (let kk = 0 ; kk < department_id.length ; kk++){

					Chart.plugins.register({
					    afterUpdate: function(chart) {
					        var dataset = chart.config.data.datasets[kk];
					        var offset = 100;//100-5*(year.length); //set that suits the best
					        
					        for (var i = 0; i < dataset.data.length; i++) {
					            var model = dataset._meta[0].data[i]._model;
					            console.log(i+" "+model.x)
					            model.x += offset;
					            model.controlPointNextX += offset;
					            model.controlPointPreviousX += offset;

					        }
					    }
					});
				}*/
			
				lineChart.update();
				
			}
		})
}

//////////////////////////////////////////
//form data

function createGraphDataset(data,year){
	var dataset = [];
	for(let i = 0 ; i < department_id.length ; i++){
		let current_depart = department_id[i]
		let current_data = []
		
		for(let y = 0 ; y < year.length ; y++){
			let lst = data[year[y]][current_depart]
			current_data = current_data.concat(lst)
		}
		
		dataset.push({
					   label : current_depart,
					   //data: current_data,
					   data: (([null]).concat(current_data)).concat([null]),
					   borderColor: department_color[current_depart],
					   backgroundColor: department_color[current_depart],
					   fill: false,
					   
					 })
	}
	
	return dataset;
}

/////////////////////////////////////////
//create graph

function createLineGraph(){
	

	lineChart = new Chart("LineChart", {
	  type: "line",
	  
	  data: {
		    labels: labels,
		    datasets: [], 
		 	},
	  options: {
	    legend: {display: true},
	    scales: {
	        xAxes: [{
	        	gridLines: {
	                offsetGridLines: false,
	                display: true,
	              }
	        }],
            yAxes: [{
                    display: true,
                    ticks: {
                        beginAtZero: true,
                    },
		            afterDataLimits(scale) {
		                scale.max = scale.max*1.2;
		            }
            
                }]
        	},
	  	}
	});
	
}

////////////



/////////////////////////////////////////////
/////// ready function

$(document).ready(function() {
	
	var multipleButton = new Choices('#year_selection', {
		   removeItemButton: true,
		   maxItemCount:10,
		   searchResultLimit:10,
		   //renderChoiceLimit:30
		 });
	
	getdepartment_id()
	
	$('#year_selection').on('change',function(){
		generateLineChart()
			
	});
	
	

	
});
</script>

</html>