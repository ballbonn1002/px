<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!-- <!-- <script src="/pages-back/assets/vendor/jquery/jquery-3.3.1.min.js" type="text/javascript"></script> -->
<!-- <script src="/pages-back/assets/vendor/fullcalendar/moment.min.js" type="text/javascript"></script> -->
<!-- <script src="/pages-back/assets/vendor/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>  -->
<!-- <link href="/pages-back/assets/vendor/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/> -->
<!-- v3.9 -->

<style>
.theme-orange .fc .fc-view-container .fc-view.fc-basic-view>table>thead tr th.fc-widget-header {
	background: transparent;
	color: black;
	border-color: #eeeeee;
}
.red{
	background: #dc3545;
}
.changemonth{
	justify-content:center;
	float:rigth;
	margin-top:5px;
	margin-bottom:10px;
}
.changemonth select{
	border: 1px solid #ced4da;
	background-color: #ffffff;
	font-size: 14px;
	padding: 0.3rem 2rem 0.3rem 0.75rem;
}

.changemonth-btn{

}
</style>

<body id="myBody">
<div class="block-header">
	<div class="row">
		<div class="col-lg-6 col-md-8 col-sm-12">
			<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> รายงานข้อมูลการทำงาน</h2>
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
			<div class="col-md-4">
				<h2>รายงานข้อมูลการทำงาน</h2>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-3">
				<form action="leaveSearch" method="post" id="leaveSearch">
				<%-- <select class="form-control">
					<optgroup label="Enable">
						<c:forEach var="seq" items="${userseq}">
							<c:if test="${seq.enable == 1 }">
							</c:if>
						</c:forEach>
					</optgroup>
					<optgroup label="Disable">
						<option></option>
					</optgroup>
				</select> --%>
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
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div id="calendar" class="has-toolbar"></div>
									<input type="hidden" name="monthcalendar" value="${month}">
								</div>
								<!-- END calendar -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-top:15px;"></div>

			<div class="row">
				<div class="col-lg-12">
				<!-- <form action="leaveSearch" method="post" id="leaveSearch"> -->
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-4"><h2>Leave</h2></div>
							<div class="col-lg-4"></div>
							<div class="col-lg-4 input-group input-medium changemonth">
								<input name="userid" value="${userid}" hidden/>
 								<select class="form-select" id="mselect" name="month" ></select> <%-- value="${now_month}" --%>
								<select class="form-select" id="yselect" name="year"></select>
								<button class="btn btn-primary" id="btnsearch"><i class="fa fa-search"></i></button>
							</div>
						</div>
					</div>
					</form>
					<table class="table" id="table_leave">
						<thead><tr>
							<th>#</th>
							<th>พนักงาน</th>
							<th>Leave type</th>
							<th>Start Date</th>
							<th>End Date</th>
							<th>Request Date</th>
							<th>Day</th>
							<th>Status</th>
						</tr></thead>
						<tbody id="tbody">
							<c:forEach var="leave" items="${userleave}" varStatus="status"><tr>
									<td id="leaveId" style="color:#3598dc;">${leave.leave_id}</td>
									<td id="leaveUserId">${leave.user_id}</td>
									<c:choose>
										<c:when test="${leave.leave_type_id.toString() == '1'}">
											<td>${type_1}</td>
										</c:when>
										<c:when test="${leave.leave_type_id.toString() == '2'}">
											<td>${type_2}</td>
										</c:when>
										<c:when test="${leave.leave_type_id.toString() == '3'}">
											<td>${type_3}</td>
										</c:when>
										<c:when test="${leave.leave_type_id.toString() == '5'}">
											<td>${type_5}</td>
										</c:when>
										<c:when test="${leave.leave_type_id.toString() == '6'}">
											<td>${type_6}</td>
										</c:when>
									</c:choose>
									<td><fmt:formatDate value="${leave.start_date}"
										type="date" pattern="d MMM yyyy"/>, ${leave.start_time}</td>
									<td><fmt:formatDate value="${leave.end_date}"
										type="date" pattern="d MMM yyyy"/>, ${leave.end_time}</td>
									<td><fmt:formatDate value="${leave.time_create}"
										type="date" pattern="d MMM yyyy"/>, 
										<fmt:formatDate value="${leave.time_create}"
										type="time" pattern="HH:mm"/></td>
									<td style="vertical-align: middle;">
										<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave.no_day,'.')}" /> 
										<c:set var="amoutLeaveHour" value="${(leave.no_day % 1) * 8}" />
										
										<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
											<span style="color:white;width:80px;display:inline-block;border:2px solid #3598dc;background-color:#3598dc;text-align:center;">
												<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
												<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
											</span>
										</c:if>	<!-- show day and hours -->
										<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
											<span style="color:#3598dc;width:80px;display:inline-block;border:2px solid #3598dc;background-color:#f2f6f9;text-align: center;">
												<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/> day
											</span>
										</c:if>	<!-- show day only -->
										<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
											<span style="color:white;width:80px;display:inline-block;border:2px solid #3598dc;background-color:#3598dc;text-align: center;">
												<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/> hours
											</span>
										</c:if> <!-- show hours -->	
									</td>
									<td><c:choose>
										<c:when test="${leave.leave_status_id.toString() == '0'}">
											<span class="btn" style="background-color:#F3C200;color:#FFFFFF;">
											Waiting for Approving</span></c:when>
										<c:when test="${leave.leave_status_id.toString() == '1'}">
											<span class="btn" style="background-color:#1BBC9B;color:#FFFFFF;">
											Approved</span></c:when>
										<c:when test="${leave.leave_status_id.toString() == '2'}">
											<span class="btn" style="background-color:#E43A45;color:#FFFFFF;">
											Reject</span></c:when>
									</c:choose></td>
								</tr></c:forEach>
						</tbody>
					</table>
					
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

<script>

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
console.log(a+"/"+b);
console.log(id);
document.addEventListener('DOMContentLoaded', function() {
var calendarEl = document.getElementById('calendar');
var calendar = new FullCalendar.Calendar(calendarEl, {
	initialView: 'dayGridMonth',
	headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: ''
	},
	eventSources: [events1, eventsHol, eventsLeave],
});
calendar.render();

	$(".fc-next-button").click(function() {
		b++;
		console.log("year/month click: "+a+"/"+b);
		//leaveSearch(id, a, b);
		if(b == 12){
			alert("Next year : "+ (a+1) );
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
	$(".fc-prev-button").click(function() {
		b--;
		console.log("year/month click: "+a+"/"+b);
		//leaveSearch(id, a, b);
		if(b == -1){
			alert("Previous year : "+ (a-1) );
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
	
function neweventsCheckLeave(id, a){
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
creatSelect();
var selectmonth = sessionStorage.getItem("selectmonth");
var selectyear = sessionStorage.getItem("selectyear");
console.log("test1 "+selectmonth+"/"+selectyear);

if(selectmonth && selectyear){
  	checkSelect();
} else {
	var date = new Date();
	document.getElementById("mselect").selectedIndex = date.getMonth(); //5
	document.getElementById("yselect").value = date.getFullYear(); //2022
}
sessionStorage.removeItem("selectmonth");
sessionStorage.removeItem("selectyear");
document.getElementById("btnsearch").onclick = function() {leaveSearch(id)};

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
	/* console.log("leaveSearch");
	var mselect = document.getElementById("mselect");
	var yselect = document.getElementById("yselect"); */
	/*$.ajax({
		url : "leaveSearch",
		method : "POST",
		type : "JSON",
		data : {
			"userid" : id,
			"month" : mselect,
			"year" : yselect
		},
		success : function(data) {
			 var data = JSON.parse(data);
			console.log(data);
			var tbody = document.getElementById("tbody");
			
			for(var i=0; i<data.leave_id.length; i++){
				var tr = document.createElement('tr');
				var leaveId = document.createElement('td');
				var leaveUser = document.createElement('td');
				var leaveTypeId = document.createElement('td');
						
				leaveId.innerHTML = data.leave_id[i];
				leaveUser.innerHTML = data.user_id[i];
				leaveTypeId.innerHTML = data.leave_type_id[i];
						
				tr.appendChild(leaveId);
				tr.appendChild(leaveUser);
				tr.appendChild(leaveTypeId);
			}
			tbody.appendChild(tr); 
		}
	}); */
}


});	

</script>
