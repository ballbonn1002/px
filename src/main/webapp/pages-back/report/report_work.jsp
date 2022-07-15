<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script> -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/css/main.css">

<script src="/pages-back/assets/vendor/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.css">

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- <script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script> -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"  /> -->



<style>
#main-div {
	display: inline;
	justify-content: center;
}

#mdiv {
	display: inline;
}

#ydiv {
	display: inline;
}

#mselect {
	padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	font-size: 14.5px;
	border: 1px solid #ced4da;
	background-color: #ffffff;
	border-top-left-radius: 0.23rem;
	border-bottom-left-radius: 0.23rem;
}

#yselect {
	padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	font-size: 14.5px;
	border: 1px solid #ced4da;
	background-color: #ffffff;
	border-top-right-radius: 0.23rem;
	border-bottom-right-radius: 0.23rem;
}
/* select{
	
	padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	font-size: 14px;
	border: 1px solid #ced4da;
	background-color: #ffffff;
	border-top-right-radius: 0.23rem;
	border-bottom-right-radius: 0.23rem;
} */
</style>

<div class="block-header">
	<div class="row1">
		<div class="col-lg-6 col-md-8 col-sm-12">
			<h2>
				<a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> รายงานข้อมูลการทำงาน
			</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item">รายงาน</li>
				<li class="breadcrumb-item active">รายงานข้อมูลการทำงาน</li>
			</ul>
		</div>
	</div>
</div>
<div class="col-sm-12">
	<div class="card">
		<div class="header">
			<div style="margin-bottom: 20px;">
				<h2>รายงานการทำงานของพนักงาน</h2>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<form class="form-inline float-sm-right">
						<div class="form-group">
						<div class="input-group">
							<input type="text" data-provide="datepicker" data-date-format="MM yyyy" data-date-start-view="months"
								data-date-min-view-mode="months" class="form-control" id="month_select" style="width: auto" size="8" data-date-autoclose="true"
								onchange="">
							<div class="input-group-append">
								<span class="input-group-text" style="font-size: 12px"><i class="fa fa-calendar-o" aria-hidden="true"></i> </span>
							</div>
						</div>
						</div>
						<div class="form-group mx-sm-3">
							<div class="input-group ">
								<input class="form-control py-2 border-right-0 border" type="search" placeholder="ค้นหา..." id="mySearchText"> <span
									class="input-group-append">
									<button class="btn btn-outline-secondary border-left-0 border" onclick="searchTable()" type="button">
										<i class="fa fa-search"></i> 
									</button>
								</span>
							</div>
						</div>

					</form>
				</div>
			</div>
			<div class="row" style="margin-bottom: 20px;margin-top: 20px;">
				<div class="col-sm-12" >
					<div class="table-responsive">
						<table class="table table-hover table-striped" id="table">
							<thead>
								<tr>
									<th class="text-center">ลำดับ</th>
									<th class="text-center">พนักงาน</th>
									<th class="text-center">วันทำงาน</th>
									<th class="text-center">ชั่วโมงการทำงาน</th>
									<th class="text-center">ลางาน (วัน)</th>
									<th class="text-center">ขาดงาน (วัน)</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%-- 			<form action="searchMonthYear" method="post" id="report_work">
				<table class="table table-striped table-hover js-basic-example table-custom m-b-0 no-footer" id="myTable" data-toggle="table"
					data-search="true">
					<thead>
						<tr>
							<th height="41">ลำดับ</th>
							<th height="41">พนักงาน</th>
							<th height="41">วันทำงาน</th>
							<th height="41">ชั่วโมงการทำงานจริง</th>
							<th height="41">ลางาน (วัน)</th>
							<th height="41">ขาดงาน (วัน)</th>
							<th height="41">มาสาย (นาที)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userwork}" varStatus="status">
							<tr data-html="true">
								<c:set var="counter" value="${counter + 1}" />
								<td>${counter}</td>
								<td><a href="reportWorkSum?id=${user.id}">${user.department_id} - ${user.name}</a></td>
								<td>${user.term_day}</td>
								<td><c:forEach var="work" items="${worklist}">
										<c:set var="time" value="${work.workinghours}" />
										<c:set var="h" value="${time/60}" />
										<c:set var="m" value="${time%60}" />
										<c:if test="${user.id == work.user_create}">${h+m}</c:if>
									</c:forEach></td>
								<td>${user.no_day}</td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form> --%>
	</div>
</div>
</div>

<script>
	var table;
	$(document).ready(function() {
		//Initial
		var dateNow = new Date();
		getWorkingReport(dateNow.getMonth()+1,dateNow.getFullYear());
		$('#month_select').datepicker("setDate",dateNow );
	});
	
	
	function getWorkingReport(month,year){		
		table = $('#table').DataTable();
		table.destroy();
		table = $('#table').DataTable({
			responsive : true,
			serverSide: true,
			ajax: {
		        url: 'getWorkingReport',
		        type: 'POST',
				data : {
					"month" : month,
					"year" : year,
					"search" : $('#mySearchText').val()
				},
		    },
			processing: true,
			paging : true,
			lengthChange : false,
			pageLength : 10,
			searching : false,
			info : true,
// 			dom: '<"top"i>rt<"bottom"><"clear">',
			language : {
				search : "",
				searchPlaceholder : "ค้นหา",
				processing: "<i class='fa fa-refresh fa-spin text-primary'></i><br>กำลังโหลด..",
			},
	        columns: [
	            	{data : "id",className: "text-center"},
	            	{data : "name" },
	            	{data : "emp_working_day",className: "text-right" },
	            	{data : "emp_working_hr" ,className: "text-right"},
	            	{data : "emp_leave",className: "text-right" },
	            	{data : "emp_absent",className: "text-right" }
	                ],
	    columnDefs:
	 	            [
	 	            	{
	 	                     "targets": 0,
	 	                     "render": function (data, type, row, meta) {
	 	                    	 var pageNumber = table.page.info().page + 1;
	 	                    	 var pageSize = table.page.len();
	 	                    	 var index = meta.row;

	 	                    	 var rowNumber = (index + 1) + pageSize * (pageNumber - 1);
	 	                         return rowNumber;
	 	                       }
	 	                   },
	 	            	{
	 	                     "targets": 1,
	 	                     "render": function (data, type, row, meta) {
	 	                             return '<a style="color:#3598dc;" href="reportWorkSum?id='+row.id+'">'+data+'</a>';
	 	                       }
	 	                  },
		 	            {
		 	                     "targets": 2,
		 	                     "render": function (data, type, row, meta) {
		 	                             return data + '/' + row.working_day;
		 	                       }
		 	                  },
			 	            	{
			 	                     "targets": [3,4,5],
			 	                     "render": function (data, type, row, meta) {
			 	                             return data.toFixed(2);
			 	                       }
			 	                  }
	 	              ],
		});
	}
	
	function searchTable(){
		var date = $('#month_select').datepicker("getDate");
		var selectMonth = new Date(date).getMonth() + 1;;
		var selectYear = String(date).split(" ")[3];
		getWorkingReport(selectMonth,selectYear);
	}
	
	$(function() {
		$('#month_select').datepicker().on('changeDate', function (e) {
			var selectMonth = new Date(e.date).getMonth() + 1;
			var selectYear = String(e.date).split(" ")[3];
			getWorkingReport(selectMonth,selectYear);
		});
		
		$('input[type=search]').on('search', function () {
			var date = $('#month_select').datepicker("getDate");
			var selectMonth = new Date(date).getMonth() + 1;;
			var selectYear = String(date).split(" ")[3];
			getWorkingReport(selectMonth,selectYear);
		});
		
		$('input[type=search]').on('enter', function () {
			var date = $('#month_select').datepicker("getDate");
			var selectMonth = new Date(date).getMonth() + 1;;
			var selectYear = String(date).split(" ")[3];
			getWorkingReport(selectMonth,selectYear);
		});
	});
</script>

<!-- <script>
	$(document).ready(function() {
		$('#myTable').DataTable({
			"lengthChange" : false,
			"pageLength" : 20,
			language : {
				search : "",
				searchPlaceholder : "ค้นหา"
			},
			dom : '<"top"f>rt<"bottom"lp><"clear">'
		});

		var div = document.createElement("div");
		div.setAttribute("id", "main-div");
		var main = document.getElementById("myTable_filter");
		main.insertBefore(div, main.children[0]);

		// month-div
		var mdiv = document.createElement("div");
		mdiv.setAttribute("id", "mdiv");
		mdiv.setAttribute("class", "input-group input-medium");
		var el_main = document.getElementById("main-div");
		el_main.insertBefore(mdiv, el_main.children[0]);

		// year-div
		var ydiv = document.createElement("div");
		ydiv.setAttribute("id", "ydiv");
		ydiv.setAttribute("class", "input-group input-medium");
		el_main.insertBefore(ydiv, el_main.children[1]);

		var btn = document.createElement("button");
		btn.setAttribute("id", "search_btn");
		btn.setAttribute("class", "btn btn-primary");
		el_main.insertBefore(btn, el_main.children[2]);

		var icon = document.createElement("i");
		icon.setAttribute("class", "fa fa-search");
		var el_btn = document.getElementById("search_btn");
		el_btn.insertBefore(icon, el_btn.children[0]);

		// month-select
		var mselect = document.createElement("select");
		mselect.setAttribute("id", "mselect");
		mselect.setAttribute("name", "month");
		mselect.setAttribute("class", "form-select");
		var el_m = document.getElementById("mdiv");
		el_m.insertBefore(mselect, el_m.children[0]);

		// year-select
		var yselect = document.createElement("select");
		yselect.setAttribute("id", "yselect");
		yselect.setAttribute("name", "year");
		yselect.setAttribute("class", "form-select");
		var el_y = document.getElementById("ydiv");
		el_y.insertBefore(yselect, el_y.children[0]);

		creatSelect();
		var selectmonth = sessionStorage.getItem("selectmonth");
		var selectyear = sessionStorage.getItem("selectyear");
		console.log("test1 " + selectmonth + "/" + selectyear);
		if (selectmonth && selectyear) {
			checkSelect();
		} else {
			var date = new Date();
			document.getElementById("mselect").selectedIndex = date.getMonth(); //5
			document.getElementById("yselect").value = date.getFullYear(); //2022
		}
		sessionStorage.removeItem("selectmonth");
		sessionStorage.removeItem("selectyear");
		document.getElementById("search_btn").onclick = function() {
			searchMonthYear()
		};

	});

	function creatSelect() {
		var date = new Date();
		var mselect = document.getElementById("mselect");
		var monthsopt = [ "January", "February", "March", "April", "May",
				"June", "July", "August", "September", "Octorber", "November",
				"December" ];
		for (var i = 0; i < monthsopt.length; i++) {
			var month = monthsopt[i];
			var m = document.createElement("option");
			m.textContent = month;
			m.value = [ i ];
			mselect.appendChild(m);
		}

		var yselect = document.getElementById("yselect");
		var years = date.getFullYear();
		var yearsopt = []; //2022
		for (var i = 0; i <= 10; i++) {
			yearsopt.push(years);
			years--;
		}
		for (var j = 0; j < yearsopt.length; j++) {
			var year = yearsopt[j];
			var y = document.createElement("option");
			y.textContent = year;
			y.value = year; //[2022:2022]
			yselect.appendChild(y);
		}
	}

	function checkSelect() {
		s_month = (parseInt(sessionStorage.getItem("selectmonth")));
		s_year = (parseInt(sessionStorage.getItem("selectyear")));
		document.getElementById("mselect").selectedIndex = s_month;
		document.getElementById("yselect").value = s_year;
		console.log("s_month " + s_month);
		console.log("s_year " + s_year);
	}

	function searchMonthYear() {
		selectmonth = $("#mselect").val();
		selectyear = $("#yselect").val();
		console.log(selectyear + "/" + selectmonth);
		sessionStorage.setItem("selectmonth", selectmonth);
		sessionStorage.setItem("selectyear", selectyear);
		$("#report_work").submit();

	}
</script>
 -->