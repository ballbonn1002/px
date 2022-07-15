<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!-- <!-- <script src="/pages-back/assets/vendor/jquery/jquery-3.3.1.min.js" type="text/javascript"></script> -->
<!-- <script src="/pages-back/assets/vendor/fullcalendar/moment.min.js" type="text/javascript"></script> -->
<!-- <script src="/pages-back/assets/vendor/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>  -->
<!-- <link href="/pages-back/assets/vendor/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/> -->
<!-- v3.9 -->

<style>
.theme-orange .fc .fc-view-container .fc-view.fc-basic-view>table>thead tr th.fc-widget-header
	{
	background: transparent;
	color: black;
	border-color: #eeeeee;
}

.red {
	background: #dc3545;
}

.changemonth {
	justify-content: center;
	float: rigth;
	margin-top: 5px;
	margin-bottom: 10px;
}

.changemonth select {
	border: 1px solid #ced4da;
	background-color: #ffffff;
	font-size: 14px;
	padding: 0.3rem 2rem 0.3rem 0.75rem;
}

.changemonth-btn {
	
}
.table-sum td {
   text-align: center;   
}
</style>

<body id="myBody">
	<div class="block-header">
		<div class="row">
			<div class="col-lg-6 col-md-8 col-sm-12">
				<h2>
					<a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>
					รายงานข้อมูลการทำงาน
				</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>
					<li class="breadcrumb-item">รายงาน</li>
					<li class="breadcrumb-item active">รายงานข้อมูลการทำงาน</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="card">
			<div class="header">
				<div class="row">
					<div class="col-md-4">
						<h2>รายงานข้อมูลการทำงาน</h2>
					</div>
					<div class="col-md-5"></div>
					<div class="col-md-3">
						<select class="select2 form-control" style="width: 100%" id="user" name="user">
							<c:forEach var="user" items="${UsersList}" varStatus="status">
								<option value="${user.id }">${user.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>

			</div>
			<!-- END header -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light portlet-fit bordered calendar">

							<div class="portlet-body">
								<div class="row">
									<!-- Calendar-->
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div id="calendar" class="has-toolbar"></div>
									</div>
								</div>
								<div class="row" style="margin-top:20px;">
									<div class="col-sm-12">
									<div class="table-responsive">
										<table class="table table-bordered table-sum">
											<thead style="background-color: #F1F1F1">
												<tr>
													<td style="width: 10%">วันทำงาน</td>
													<td style="width: 10%">ชั่วโมงทำงาน</td>
													<td style="width: 10%">สาย/ออกก่อนเวลา (ชม.)</td>
													<td style="width: 10%">ขาดงาน (วัน)</td>
													<td style="width: 10%">ลางาน (วัน)</td>
													<td style="width: 10%">ล่วงเวลา X1.5 (ชม.)</td>
													<td style="width: 10%">ล่วงเวลา X2 (ชม.)</td>
													<td style="width: 10%">ล่วงเวลา X3 (ชม.)</td>
													
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><a id="txt_working_day">0/0</a></td>
													<td><a id="txt_working_hr">0.00</a></td>
													<td><a>0.00</a></td>
													<td><a id="txt_absent">0.00</a></td>
													<td><a id="txt_leave">0.00</a></td>
													<td><a>0.00</a></td>
													<td><a>0.00</a></td>
													<td><a>0.00</a></td>
												</tr>
											</tbody>
										</table>
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin-top: 15px;"></div>

				<div class="row">
					<div class="col-lg-12">
						<!-- <form action="leaveSearch" method="post" id="leaveSearch"> -->
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-4">
									<h2>Leave</h2>
								</div>
								<div class="col-lg-4"></div>
							</div>
						</div>
						</form>
						<div class="table-responsive">
							<table class="table" id="table_leave">
								<thead>
									<tr>
										<th>#</th>
										<th>พนักงาน</th>
										<th>Leave type</th>
										<th>Start Date</th>
										<th>End Date</th>
										<th>Request Date</th>
										<th>Day</th>
										<th>Status</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- END card -->
	</div>
</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.css" />
<!-- <script src="/pages-back/assets/vendor/fullcalendar/moment.min.js"></script> -->
<script src="/pages-back/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>


<script>
//=========== PREPARE DATA =============//
//LEAVE
var BeginDate= [];
var EndDate  = [];
var leave    =[];
var userLeave  =[];
var des =[];
var id_leave = [];
var eventsLeave = [];
<c:forEach var="leave" items="${leave}">
	var leaveStart = '${leave.start_date}';
		leaveStart = leaveStart.substring(0,10);
	var leaveEnd   = '${leave.end_date}';
		leaveEnd   = leaveEnd.substring(0,10);
	<c:if test="${leave.leave_type_id.toString() == 1 }">
		var leaveType = 'ลากิจ/พักร้อน';</c:if>
	<c:if test="${leave.leave_type_id.toString() == 2 }">
		var leaveType = 'ลาอื่นๆ';</c:if>
	<c:if test="${leave.leave_type_id.toString() == 3 }">
		var leaveType = 'ลาป่วย';</c:if>
	<c:if test="${leave.leave_type_id.toString() == 4 }">
		var leaveType = 'ขาดงาน';</c:if>
	<c:if test="${leave.leave_type_id.toString() == 5 }">
		var leaveType = 'ลาโดยไม่รับค่าจ้าง';</c:if>
	<c:if test="${leave.leave_type_id.toString() == 6 }">
		var leaveType = 'ลาพักร้อนที่เหลือจากปีก่อน';</c:if>
	<c:if test="${leave.leave_type_id.toString() == 9 }">
		var leaveType = 'อื่นๆ';</c:if>
	var dateLeave = new Date(leaveStart);
	var dateLeaveE = new Date(leaveEnd);
	<c:set var = "string1" value = "${leave.description}"/>
		<%pageContext.setAttribute("newline", "\r\n");%>
	<c:set var = "string2" value = "${fn:replace(string1,newline,'')}" />
	var desLeave = '${string2}';
	var leaveID  = '${leave.leave_id}';
	var user     = "${userId}";
	BeginDate.push(dateLeave);
	EndDate.push(dateLeaveE);
	leave.push(leaveType);
	des.push(desLeave);
	id_leave.push(leaveID);
	userLeave.push(user.toString());
</c:forEach>
for(let i=0; i < id_leave.length; i++){
	eventsLeave.push({
		id : id_leave[i],
		title : leave[i],
		start : BeginDate[i],
		end : EndDate[i],
		color : 'black',
		allDay : true,
		className : 'leave'
	});
}

//HOLIDAY
var start_dateHo= [];
var end_dateHo  = [];
var holiday     = [];
var desHoliday  = [];
var id13 = [];
var eventsHol = [];
<c:forEach var="holiday" items="${holidayList}">
	var HoStart = '${holiday.start_date}';
	var HoEnd   = '${holiday.end_date}';
	var HoTitle = '${holiday.head}';
	var Ho_ID   = '${holiday.id_date}';
	var dateHoSt  = new Date(HoStart);
	var dateHoEnd = new Date(HoEnd);
		
	start_dateHo.push(dateHoSt);
	end_dateHo.push(dateHoEnd);
	holiday.push(HoTitle);
	id13.push(Ho_ID);
</c:forEach>
for(let i=0; i < id13.length; i++){
	eventsHol.push({
		id : id13[i],
		title : holiday[i],
		start : start_dateHo[i],
		end : end_dateHo[i],
		color : 'gray',
		allDay : true,
		className : 'holiday'
	});
}

//CHECK	
var end_date   = [];
var TimeIO     = [];
var events1    = [];
var StartTimeUser = '${stime}'; // Start time work of user
var mycolor = [ 'red-intense', 'grey', 'red', 'green'];
<c:forEach var="check" items="${listcheck}">
	var Tin   = '${check.checkin}';
	var Tout  = '${check.checkout}';
	var text  = '${check.datecheck}';
		
	var timefull = Tin + " - " + Tout;
	var date1 = new Date(text);
	end_date.push(date1);
	TimeIO.push(timefull);
</c:forEach>
for(var i=0; i < end_date.length; i++){
	events1.push({
		//id : 'check',
		title : TimeIO[i],
		start : end_date[i],
		end : end_date[i],
		color : 'green',
		allDay : true,
		className : 'check'
	});
}

var id = '${userid}'; 
var count_month = '${now_month}';
var count_year = '${now_year}';
var flag = '${check_flag}';
var a = parseInt(count_year);
var b = parseInt(count_month);

//=========== END PREPARE DATA =============//
</script>

<script>
	var table;
	var calendar;
	$(document).ready(function() {
	//Set defualt user selected
	$('.select2').select2();
	$('#user').val('${userid}'); 
	$('#user').trigger('change');
	 	
	
	//initial leave table
	table =	$('#table_leave').DataTable({
	         responsive: true,
 	         paging: false,
 	         searching:false,
 	         info: false,
	         columns: [
 	            	{data : "leave_id"},
 	            	{data : "user_id" },
 	            	{data : "leave_name" },
 	            	{data : "start_date" },
 	            	{data : "end_date" },
 	            	{data : "time_create" },
 	            	{data : "no_day" },
 	            	{data : "leave_status_id" }
 	                ],
 	         columnDefs:
 	                 [{
 	                     "targets": 0,
 	                     "data": 'leave_id',
 	                     "render": function (data, type, row, meta) {
 	                             return '<a style="color:#3598dc;">'+data+'</a>';
 	                       }
 	                   },
 	                   {
 	                       "targets": [3,4],
 	                       "render": function (data, type, row) {
 	 									return formatDate(data);
 	                         }
 	                   },
	                   {
 	                       "targets": 5,
 	                       "render": function (data, type, row) {
 	 									return formatDateTime(data);
 	                         }
 	                   },
 	                   {
 	                       "targets": 6,
 	                       "render": function (data, type, row) {
 	 									return '<span class="badge badge-primary">'+data+'&nbsp;day</span>';
 	                         }
 	                   },
 	                   {
 	                       "targets": 7,
 	                       "render": function (data, type, row) {
 	                    	   if(data == '0'){
 	                    		  return '<button class="btn btn-sm btn-warning">Waiting for Approving</button>'; 
 	                    	   }
 	                    	   if(data == '1'){
  	                    		  return '<button class="btn btn-sm btn-success">Approved</button>'; 
  	                    	   }
 	                    	   if(data == '2'){
   	                    		  return '<button class="btn btn-sm btn-danger">Reject</button>'; 
   	                    	   }
 	 									
 	                         }
 	                   }],
		});
	
	//Set Leave table
	var userId = '${userid}';
	var date = new Date();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();	
	getLeaveData(userId,month,year);
	});
	
	function seachByID(userId){
		//Set new id on url param and reload page
		var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?id='+userId;
    	window.location.href = newurl;

	}
	
	$(function () {
		//On user id selection change
	    $('.select2').on('select2:select', function (e) {
	    	var userId = $("#user").select2("val")
	    	seachByID(userId)
	    });
		
		//Create Calendar
		var calendarEl = document.getElementById('calendar');
		calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: ''
			},
			eventSources: [events1, eventsHol, eventsLeave],
		});
		calendar.render();
			//On calendar next button click
			$(".fc-next-button").click(function() {
				b++;
				var userId = '${userid}';
				var date = calendar.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();				
				getLeaveData(userId,month,year);
				
				if(b == 12){
					console.log(flag);
					if(flag == '0'){
						neweventsCheckLeave(id, a+1);
						neweventsHol(a+1);
					}
					flag = '1';
					b = 0;
					a = a+1;
				}
			});
			//On calendar prev button click
			$(".fc-prev-button").click(function() {
				b--;
				var userId = '${userid}';
				var date = calendar.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();			
				getLeaveData(userId,month,year);
				
				if(b == -1){
					console.log(flag);
					if(flag == '0'){
						neweventsCheckLeave(id, a-1);
						neweventsHol(a-1);
					}
					flag = '1';
					b = 11;
					a = a-1;
				}
			});
			//On calendar today button click
			$(".fc-today-button").click(function() {
				var userId = '${userid}';
				var date = calendar.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();	
				
				getLeaveData(userId,month,year);
			});
	});

	function getLeaveData(userId,month,year){
		table.clear().draw(); //Clear Leave table
		$.ajax({
		url : "getLeaveData",
		method : "POST",
		type : "JSON",
		data : {
			"userId" : userId,
			"month" : month,
			"year" : year
		},
		success : function(data) {
			var leaveData = JSON.parse(data.leave_data);
			var workingData = JSON.parse(data.working_data);
			//Set new data for Leave table
			if(leaveData.length > 0){
				table.clear().rows.add(leaveData).draw(); 
			}
			//Set working summary
			if(workingData.length > 0){
				var payment = workingData[0].payment;
				var term_day = workingData[0].term_day;
				var actual_working = workingData[0].actual_working_day;
				var working_day = workingData[0].actual_working_per_month;
				var emp_working_day = workingData[0].sum_emp_working;
				var emp_working_hr = workingData[0].sum_emp_working_hr;
				var emp_absent = workingData[0].sum_emp_absent;
				var emp_leave = workingData[0].sum_emp_leave;
				
				$("#txt_working_day").text(payment == '0' ? actual_working + "/" + term_day : actual_working + "/" + working_day);
				$("#txt_working_hr").text(emp_working_hr.toFixed(2));
				$("#txt_absent").text(emp_absent.toFixed(2));
				$("#txt_leave").text(emp_leave.toFixed(2));		
			}
		}
	}); 
	}
	
	//Code
	function neweventsCheckLeave(id, a){
		console.log("id " + id + " " +a)
	$.ajax({	
		url : "work_searchCalendar",
		method : "POST",
		type : "JSON",
		data : {
			"userid" : id,
			"year" : a
		},
		success : function(data) {
			var obj = JSON.parse(data);
			var events2    = [];
			var eventsLeave2 = [];
			var end_date   = [];
			var TimeIO     = [];
			
			var BeginDate = [];
			var EndDate  = [];
			var LeaveName    =[];
			var Id_leave = [];
			for(var i=0; i < obj.datecheck.length; i++){
				var Tin   = obj.checkin[i];
				var Tout  = obj.checkout[i];
				var text  = obj.datecheck[i];
						
				var timefull = Tin + " - " + Tout;
				var date1 = new Date(text);
				end_date.push(date1);
				TimeIO.push(timefull);
			}
			for(var i=0; i < obj.leave_id.length; i++){
				var leaveStart = obj.leave_start[i];
					leaveStart = leaveStart.toString().substring(0,10);
				var leaveEnd   = obj.leave_end[i];
					leaveEnd   = leaveEnd.toString().substring(0,10);
				var leaveID  = obj.leave_id[i];
				var dateLeave = new Date(leaveStart);
				var dateLeaveE = new Date(leaveEnd);
				if(obj.leave_typeid[i].toString() == '1'){
					var leaveType = 'ลากิจ/พักร้อน';}
				if(obj.leave_typeid[i].toString() == '2'){
					var leaveType = 'ลาอื่นๆ';}
				if(obj.leave_typeid[i].toString() == '3'){
					var leaveType = 'ลาป่วย';}
				if(obj.leave_typeid[i].toString() == '4'){
					var leaveType = 'ขาดงาน';}
				if(obj.leave_typeid[i].toString() == '5'){
					var leaveType = 'ลาโดยไม่รับค่าจ้าง';}
				if(obj.leave_typeid[i].toString() == '6'){
					var leaveType = 'ลาพักร้อนที่เหลือจากปีก่อน';}
				if(obj.leave_typeid[i].toString() == '9'){
					var leaveType = 'อื่นๆ';}
				BeginDate.push(dateLeave);
				EndDate.push(dateLeaveE);
				LeaveName.push(leaveType);
				Id_leave.push(leaveID);
			}
			for(var i=0; i < end_date.length; i++){
				events2.push({
					id : 'check',
					title : TimeIO[i],
					start : end_date[i],
					end : end_date[i],
					overlap: false,
					color : 'green',
					allDay : true,
					className : 'check'
				});
			}
			
			calendar.addEventSource(events2);
			
			for(var i=0; i < Id_leave.length; i++){
				eventsLeave2.push({
					id : 'leave',
					title : LeaveName[i],
					start : BeginDate[i],
					end : EndDate[i],
					color : 'black',
					allDay : true,
					className : 'leave'
				});
			}
			calendar.addEventSource(eventsLeave2);
		}
	});
}	
function neweventsHol(a){
	$.ajax({
		url : "holiday_findnextYear",
		method : "POST",
		type : "JSON",
		data : {
			"year_next" : a
		},
		success : function(data) {
			var hol = JSON.parse(data);
			var eventsHol2 = [];
			var start_dateHo= [];
			var end_dateHo  = [];
			var holiday     = [];
			var id13 = [];
			for(var i=0; i<hol.id.length; i++){
				var HoStart = hol.start[i];
				var HoEnd   = hol.end[i];
				var HoTitle = hol.title[i];
				var Ho_ID   = hol.id[i];
				var dateHoSt  = new Date(HoStart);
				var dateHoEnd = new Date(HoEnd);
				start_dateHo.push(dateHoSt);
				end_dateHo.push(dateHoEnd);
				holiday.push(HoTitle);
				id13.push(Ho_ID);
			}
 			for(var i=0; i<id13.length; i++){
				eventsHol2.push({
					id : 'holiday',
					title : holiday[i],
					start : start_dateHo[i],
					end : end_dateHo[i],
					color : 'gray',
					allDay : true,
					className : 'holiday'
				});
			}
			calendar.addEventSource(eventsHol2); 
		}
	});
}
// // creatSelect();
// var selectmonth = sessionStorage.getItem("selectmonth");
// var selectyear = sessionStorage.getItem("selectyear");

// if(selectmonth && selectyear){
//   	checkSelect();
// } else {
// 	var date = new Date();
// 	document.getElementById("mselect").selectedIndex = date.getMonth(); //5
// 	document.getElementById("yselect").value = date.getFullYear(); //2022
// }
// sessionStorage.removeItem("selectmonth");
// sessionStorage.removeItem("selectyear");
// document.getElementById("btnsearch").onclick = function() {leaveSearch(id)};

function creatSelect(){
	var date = new Date();
	var mselect = document.getElementById("mselect");
	var monthsopt = ["January", "February", "March", "April", "May", "June", "July", "August", 
		"September", "Octorber", "November", "December"];
	for(var i = 0; i < monthsopt.length; i++) {
		var month = monthsopt[i];
		var m = document.createElement("option");
		m.textContent = month;
		m.value = [i];
		mselect.appendChild(m);
	}
	
	var yselect = document.getElementById("yselect");
    var years = date.getFullYear();
    var yearsopt = [];	//2022
	for(var i = 0; i <= 10; i++) {
		yearsopt.push(years);
		years--;
	}
	for(var j = 0; j < yearsopt.length; j++){
		var year = yearsopt[j];
		var y = document.createElement("option");
		y.textContent = year;
		y.value = year; //[2022:2022]
		yselect.appendChild(y);
	}
}

function checkSelect(){
	s_month = (parseInt(sessionStorage.getItem("selectmonth")));
	s_year = (parseInt(sessionStorage.getItem("selectyear")));
	document.getElementById("mselect").selectedIndex = s_month;
	document.getElementById("yselect").value = s_year;
	console.log("s_month "+s_month);
	console.log("s_year "+s_year);
}

function leaveSearch(id){
	/* var id = '${userid}'; */
	console.log(id); 
	selectmonth = $("#mselect").val();
	selectyear = $("#yselect").val();
	console.log(selectyear+"/"+selectmonth);
	sessionStorage.setItem("userid", id);
	sessionStorage.setItem("selectmonth", selectmonth);
	sessionStorage.setItem("selectyear", selectyear);
	$("#leaveSearch").submit();

}

function formatDate(date) {
	monthNames =["Jan","Feb","Mar","Apr",
        "May","Jun","Jul","Aug",
        "Sep", "Oct","Nov","Dec"];
	
    var d = new Date(date),
        month = '' + (d.getMonth() ),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (day.length < 2) 
        day = '0' + day;

    return day+' ' + monthNames[month] +' '+ year;
}

function formatDateTime(date) {
	monthNames =["Jan","Feb","Mar","Apr",
        "May","Jun","Jul","Aug",
        "Sep", "Oct","Nov","Dec"];
	
    var d = new Date(date),
        month = '' + (d.getMonth() ),
        day = '' + d.getDate(),
        year = d.getFullYear();
    	hoursAndMinutes = d.getHours() + ':' + d.getMinutes()

    if (day.length < 2) 
        day = '0' + day;

    return day+' ' + monthNames[month] +' '+ year + ' ' + hoursAndMinutes;
}
</script>
