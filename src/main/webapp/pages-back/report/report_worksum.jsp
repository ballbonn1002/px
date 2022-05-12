<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<!-- <meta charset="UTF-8"> -->

<link rel="stylesheet" href="/pages-back/assets/vendor/fullcalendar/fullcalendar.css"/>
<script src="/pages-back/assets/vendor/jquery/jquery.min.js"></script>
<script src="/pages-back/assets/vendor/fullcalendar/moment.min.js"></script>
<script src="/pages-back/assets/vendor/fullcalendar/fullcalendar.js"></script>

</head>
<!-- <body> -->
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
			<h2>รายงานข้อมูลการทำงาน</h2>
		</div>
		<!-- END header -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet light portlet-fit bordered calendar">
						<div class="portlet-title">
							<div class="caption">
								<!-- <i class="icon-layers font-green"></i> <span
									class="caption-subject font-green sbold uppercase"> CHECK
									CALENDAR </span> -->
							</div>
						</div>
						
						<div class="portlet-body">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div id="calendar" class="has-toolbar"></div>
								</div>
								<%-- <div class="col-lg-12 col-md-12 col-sm-12">
									<div id="calendar" class="has-toolbar"></div>
									<input type="hidden" name="monthcalendar" value="${month}">
								</div> --%>
								<!-- END calendar -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet-body flip-scroll" style="text-align: center;">
						<table class="table">
						<thead><tr style="background-color:#E1E5EC;">
							<th>วันทำงาน</th>
							<th>ชั่วโมงทำงาน</th>
							<th>สาย/ออกก่อนเวลา<br>หัก 60 นาที (ชม.)</th>
							<th>ขาดงาน (วัน)</th>
							<th>ลางาน (วัน)</th>
							<th>ล่วงเวลา x1.5 (ชม.)</th>
							<th>ล่วงเวลา x2 (ชม.)</th>
							<th>ล่วงเวลา x3 (ชม.)</th>
						</tr></thead>
						<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<h2>Leave</h2>
					<table class="table">
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
						<c:forEach var="leave" items="${userleave}" varStatus="status">
						<tr>
							<td style="color:#3598dc;">${leave.leave_id}</td>
							<td>${leave.user_id}</td>
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
						</tr>
						</c:forEach>
					</table>
				</div>
				
			</div>
		</div>
	</div>
	<!-- END card -->
</div>

<!-- </body> -->
<script>
$(document).ready(function() {
	$('#calendar').fullCalendar();
	console.log("test");
});

</script>
<script type="text/javascript">
	var AppCalendar = function() {
		return {
			//main function to initiate the module
			init : function() {
				this.initCalendar();
			},
			initCalendar : function() {
				if (!jQuery().fullCalendar) {
					return;
				}
				var date_time  = '${flag12}';
				if (date_time != "") {
					var noTime = $.fullCalendar.moment(date_time, "YYYY-MM-DD");
				} else {
					var noTime = moment();
				}
				// CheckIn,CheckOut,totaltimework,Status
				var start_date = [];
				var end_date   = [];
				var TimeIO     = [];
				var TimeIn     = [];
				var workhour   = [];
				var workmin    = [];
				var events1    = [];
				var desCheckin = [];
				var desTotalin = [];
				var destimeIn  = [];
				var destimeOut = [];				
				var StartTimeUser = '${stime}'; // Start time work of user
				var mycolor = [ 'red-intense', 'grey', 'red', 'yellow', 'green', 'purple','LightSeaGreen '];

				<c:forEach var="work" items="${work}">
				var IN 	  = '${work.mycheckins}';
				var text2 = IN.substring(0,16);
				var Tin   = '${work.mycheckin}';
				var Tout  = '${work.checkouttime}';
				var hour  = '${work.hour}';
				var min   = '${work.min}';

				var TcheckIn = Tin.substring(11, 16);
				var timetime = Tin.substring(6,10)
				var TcheckOut= Tout.substring(0, 5);
				var timefull = TcheckIn + " - " + TcheckOut;
				var timework = hour +":"+ min;

				var date1 = new Date(Tin);
				var date2 = new Date(text2);
				start_date.push(date1);
				end_date.push(date2);
				TimeIO.push(timefull);
				TimeIn.push(TcheckIn);
				workhour.push(hour);
				workmin.push(min);
				desCheckin.push(TcheckIn);
				destimeIn.push(TcheckIn);
				destimeOut.push(TcheckOut);
				desTotalin.push(timework);
				</c:forEach>
				
				//check status of check in
				for (usertime in end_date) {
					var checkin_time = TimeIn[usertime].split(":");
					var start = StartTimeUser.split(":");
					/*for(i = 0; i < checkin_time.length; i++){
							document.write("<br /> Element " + i + " = " + checkin_time[i]);
						}*/
					var checkin = parseInt(checkin_time[0]);
					var startTimeuser = parseInt(start[0]);
					if (checkin < startTimeuser) {
						Status = "On Time" ,
						color  = "LightSeaGreen ";
					}else if(checkin > startTimeuser){
						Status = "Late",
						color  = "red";
					}else{
						var checkin = parseInt(checkin_time[1]);
						var startTimeuser = parseInt(start[1]);
						if (checkin <= startTimeuser) {
							Status = "On Time" ,
							color  = "LightSeaGreen ";
						}else {
							Status = "Late",
							color  = "red";
						}
					}
					events1.push({
								title : Status,
								start : new Date(end_date[usertime].getFullYear(), 
										end_date[usertime].getMonth(), 
										end_date[usertime].getDate()),
										
								end   : new Date(end_date[usertime].getFullYear(),
										end_date[usertime].getMonth(),
										end_date[usertime].getDate() + 1),
								backgroundColor : App.getBrandColor(color),
								allDay: true,
								description:'<b>'+'User check-in : '+'</b>' + desCheckin[usertime] +'<br/><b>&nbsp;'+'User time work start  : '+'</b>' +'${stime}',
								className: 'status'
							});
				}
				
				//CheckIn and CheckOut
				var x;
				for (x in end_date) {
					events1.push({
						title : TimeIO[x],
						start : new Date(end_date[x].getFullYear(), 
								end_date[x].getMonth(), 
								end_date[x].getDate()),
								
						end   : new Date(end_date[x].getFullYear(),
								end_date[x].getMonth(),
								end_date[x].getDate() + 1),
						backgroundColor : App.getBrandColor('yellow'),
						description:'<b>'+'Check-in : '+'</b>' + destimeIn[x] +'<br/><b>&nbsp;'+'Check-out : '+'</b>' + destimeOut[x],
						allDay : true,
					});
				}
				
				//Total time work
				for (y in end_date) {
					var z = parseInt(workhour[y]);
					if (z >= 8) {
						myary = "blue";
					} else {
						myary = "grey";
					}
					events1.push({
								title : workhour[y] + ":" + workmin[y] + " " + " hrs. ",
								start : new Date(end_date[y].getFullYear(), 
										end_date[y].getMonth(), 
										end_date[y].getDate()),
										
								end   : new Date(end_date[y].getFullYear(),
										end_date[y].getMonth(),
										end_date[y].getDate() + 1),
								backgroundColor : App.getBrandColor(myary),
								allDay: true,
								description: '<b>'+'Total work : '+'</b>'+desTotalin[y]  + " hrs. ",
								className: 'totalwork'
							});
				}
				
				//leave in calendar
				var BeginDate= [];
	            var EndDate  = [];
	            var leave    =[];
	            var EventLeave =[];
	            var userLeave  =[];
	            var des =[];
	            var id_leave = [];
	            var mycolor  = ['red','grey','blue','yellow','green','purple'];
	            
	            <c:forEach var="leave" items="${leave}">
	            var leaveStart = '${leave.start_date}';
	            	leaveStart = leaveStart.substring(0,10);
	            var leaveEnd   = '${leave.end_date}';
	            	leaveEnd   = leaveEnd.substring(0,10);
	            
	            <c:if test="${leave.leave_type_id.toString() == 1 }">
	            	var leaveType = 'ลากิจ/พักร้อน';
	            </c:if>
	            
	            <c:if test="${leave.leave_type_id.toString() == 2 }">
	            	var leaveType = 'ลาอื่นๆ';
	            </c:if>
	            
	            <c:if test="${leave.leave_type_id.toString() == 3 }">
	            	var leaveType = 'ลาป่วย';
	            </c:if>
	            
	            <c:if test="${leave.leave_type_id.toString() == 4 }">
	            	var leaveType = 'ขาดงาน';
	            </c:if>
	            
	            <c:if test="${leave.leave_type_id.toString() == 5 }">
	           		var leaveType = 'ลาโดยไม่รับค่าจ้าง';
	            </c:if>
	            
	            <c:if test="${leave.leave_type_id.toString() == 6 }">
	            	var leaveType = 'ลาพักร้อนที่เหลือจากปีก่อน';
	            </c:if>
	            
	            <c:if test="${leave.leave_type_id.toString() == 9 }">
	            	var leaveType = 'อื่นๆ';
	            </c:if>
	     
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
	            
	            var dayLeave;  
	            var type_color ;
	            for(dayLeave in BeginDate){
	            	 switch (leave[dayLeave]) {
	            	 case "ลากิจ/พักร้อน": type_color ="#4B77BE"; break;
	            	 case "ลาป่วย":  type_color ="#E26A6A"; break;
	            	 case "ลาอื่นๆ": type_color ="#33CC66"; break;
	            	 case "ลาพักร้อนที่เหลือจากปีก่อน": type_color = "#E87E04"; break;
	            	 default: type_color ="#525E64";
	            	 }
	            	 
	            	
	            	 
	            	 
	            EventLeave.push({
	            	id	 : id_leave[dayLeave],   
	            	title: leave[dayLeave],				   
					start: new Date(BeginDate[dayLeave].getFullYear(),
							   BeginDate[dayLeave].getMonth(),
							   BeginDate[dayLeave].getDate(),0,0),
					
					end	 : new Date(EndDate[dayLeave].getFullYear(),
							   EndDate[dayLeave].getMonth(),
							   EndDate[dayLeave].getDate() + 1,0,0 ),
				   description: des[dayLeave] ,
				   backgroundColor: type_color,
	               allDay: true,
	               className: 'leave'//userLeave[dayLeave]
	            
				   });  
	            
	            
	            }
				
				//Holiday 
				var start_dateHo= [];
				var end_dateHo  = [];
				var holiday     = [];
				var EventsHo    = [];
				var desHoliday  = [];
				var id13 = [];
				var mycolor13   = [ 'red', 'grey', 'blue', 'yellow', 'green', 'purple' ];
				
				<c:forEach var="holiday" items="${holidayList}">
				var HoStart = '${holiday.start_date}';
				var HoEnd   = '${holiday.end_date}';
				var HoTitle = '${holiday.head}';
				var Hodes   = '${holiday.description}';
				var Ho_ID   = '${holiday.id_date}';
				
				var dateHoSt  = new Date(HoStart);
				var dateHoEnd = new Date(HoEnd);

				start_dateHo.push(dateHoSt);
				end_dateHo.push(dateHoEnd);
				holiday.push(HoTitle);
				desHoliday.push(Hodes);
				id13.push(Ho_ID);
				</c:forEach>

				var a;
				for (a in start_dateHo) {
					EventsHo.push({
						id    : id13[a],
						title : holiday[a],
						start : new Date(start_dateHo[a].getFullYear(), 
									start_dateHo[a].getMonth(), 
									start_dateHo[a].getDate()),
									
						end   : new Date(end_dateHo[a].getFullYear(),
									end_dateHo[a].getMonth(),
									end_dateHo[a].getDate() + 1),
						backgroundColor : '#E9EDEF',
						allDay    : true,
						className : 'holiday',
						description: desHoliday[a] ,
						editable  : false
					});
				}

				//header
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				var h = {};

				if (App.isRTL()) {
					if ($('#calendar').parents(".portlet").width() <= 720) {
						$('#calendar').addClass("mobile");
						  h = {
							right : 'title, prev, next',
							center: '',
							left  : 'agendaDay, agendaWeek, month, today'
						};
					} else {
						$('#calendar').removeClass("mobile");
						h = {
							right : 'title',
							center: '',
							left  : 'agendaDay, agendaWeek, month, today, prev,next'
						};
					}
				} else {
					if ($('#calendar').parents(".portlet").width() <= 720) {
						$('#calendar').addClass("mobile");
						h = {
							left  : 'title, prev, next',
							center: '',
							right : 'today,month,agendaWeek,agendaDay'
						};
					} else {
						$('#calendar').removeClass("mobile");
						h = {
							left  : 'title',
							center: '',
							right : 'prev,next,today,month,agendaWeek,agendaDay'
						};
					}
				}

				var initDrag = function(el) {
					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim(el.text())
					// use the element's text as the event title
					};
					// store the Event Object in the DOM element so we can get to it later
					el.data('eventObject', eventObject);
					// make the event draggable using jQuery UI
					el.draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});
				};

				var addEvent = function(title) {
					title = title.length === 0 ? "Untitled Event" : title;
					var html = $('<div class="external-event label label-default">' + title + '</div>');
					jQuery('#event_box').append(html);
					initDrag(html);
				};

				$('#external-events div.external-event').each(function() {
					initDrag($(this));
				});

				$('#event_add').unbind('click').click(function() {
					var title = $('#event_title').val();
					addEvent(title);
				});

				//predefined events
				$('#event_box').html("");
				addEvent("My Event 1");
				addEvent("My Event 2");
				addEvent("My Event 3");
				addEvent("My Event 4");
				addEvent("My Event 5");
				addEvent("My Event 6");

				$('#calendar').fullCalendar('destroy'); // destroy the calendar
				$('#calendar').fullCalendar(
								
						{ //re-initialize the calendar
									header : h,
									defaultView : 'month', // change default view with available options from http://arshaw.com/fullcalendar/docs/views/Available_Views/ 
									defaultDate : moment(noTime),
									slotMinutes : 15,
									editable    : false, //edit event
									droppable   : true, // this allows things to be dropped onto the calendar !!!

									drop : function(date, allDay) { // this function is called when something is dropped
										var check = '${checktimecalendar}'.trim();
										// retrieve the dropped element's stored Event Object
										var originalEventObject = $(this).data('eventObject');
										// we need to copy it, so that multiple events don't have a reference to the same object
										var copiedEventObject = $.extend({}, originalEventObject);

										// assign it the date that was reported
										copiedEventObject.start = date;
										copiedEventObject.allDay = allDay;
										copiedEventObject.className = $(this).attr("data-class");

										// render the event on the calendar
										// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
										$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

										// is the "remove after drop" checkbox checked?
										if ($('#drop-remove').is(':checked')) {
											// if so, remove the element from the "Draggable Events" list
											$(this).remove();
										}
									},
									
									selectable   : true,
									selectHelper : true,
									eventRender  : function(calEvent, element) {
										var start = moment(calEvent.start).get('date');
										var end = moment(calEvent.end).get('date');
										var moment1 = moment(calEvent.start);
					                	var moment2 = moment(calEvent.end);             	
					                    element.popover({
					                        animation:  true,
					                        placement: 'bottom',
					                        container: "body",
					                        html : true,
					                        delay: 100,
					                        title: '<b>'+calEvent.title +'</b>',
					                        content: '<b>' +$.fullCalendar.formatRange(moment1, moment2 -1 , 'D MMMM YYYY') + "</b><br/>"
					                        + "<p style=\"max-width:500px;word-wrap:break-word;margin-bottom:50px;\">&nbsp;"+ calEvent.description + " <br/>"  + "</p>",   
					                        trigger: 'hover'
					                    });
					                    
										if (calEvent.className == "holiday") {
											var for_i = end - start;
											for (var i = 0; i < for_i; i++) {
													var dataToFind = moment(calEvent.start).format('YYYY-MM-DD');
													var date_new   = new Date(dataToFind);
												date_new.setDate(start + i);
												dataToFind = moment(date_new).format('YYYY-MM-DD');
												$("td[data-date='"+dataToFind+ "']").addClass('fully_colored_holiday');
											}
										}
										
										//icon of event
										if (calEvent.className == "holiday" ) {
											element.find(".fc-title").prepend("<i class='fa fa-home'> </i>&nbsp;");
											element.find(".fc-title").css('color', 'black');
										} else if (calEvent.className =="leave"){
											element.find(".fc-title").prepend("<i class='fa fa-thumb-tack searchon'></i>&nbsp;")
/* 											element.find("div.fc-content").append( "<span> <i class='fa fa-trash closeon' style='float:right;position:absolute;right:0;top:0position:absolute;right:0;top:0'></i> </span>" );
 */										} else if (calEvent.className =="status"){
											element.find(".fc-title").prepend("<i class='fa fa-hourglass-start'></i>&nbsp;")
										} else if (calEvent.className =="totalwork"){
											element.find(".fc-title").prepend("<i class='fa fa-hourglass'></i>&nbsp;")
										} else {
											element.find(".fc-title").prepend("<i class='fa fa-hourglass-half'> </i>&nbsp;");
										}
 										 element.find(".closeon").on('click',function() {                //Delete Function 
						                	  if (confirm("Are you sure Delete ?")) {                 		
						                		     document.location = "delete_leave_calecdar?leave_id="+ calEvent.id ;
						                  	  }
						                });
										 element.find(".searchon").on('click',function() { //Search Function
							                  
					                     	  document.location = "myleave_edit?flag=1&Id="+calEvent.id+"&date="+moment(calEvent.start).format('DD-MM-YYYY')+"&thisuser=" +calEvent.className ;                     
					                	                  });
									},
									
									/* 	viewRender: function (view , element){
												var b = $('#calendar').fullCalendar('getDate');
												alert(b.format('L'));
												document.getElementById("test").value = b ;
											},   */
									eventLimit : true,
									events : events1 
								});
				$('#calendar').fullCalendar('addEventSource', EventsHo);
				$('#calendar').fullCalendar('addEventSource', EventLeave);
			}
		};
	}();
	
	//Search month
/* 		jQuery(document).ready(
				function() {
					AppCalendar.init();
					$('.fc-next-button').click(function() {
	                            var usercalendar  = '${logonUser}'.trim();
								var test = '${datenowcalendar}'.trim();
								var monthcalendar = '${month}'.trim();
								var b = $('#calendar').fullCalendar('getDate');
								var x = b.format('L');
								document.location = 'searchAllmonth?timecalendar='
													+ test + "&datecalendar=" 
													+ x + "&usercalendar=" + usercalendar;
							});
					
					var events2 = [];
					$('.fc-prev-button').click(function() { // 	refresh หน้า
								var usercalendar  = '${logonUser}'.trim();
								var test = '${datenowcalendar}'.trim();
								var monthcalendar = '${month}'.trim();
								var b = $('#calendar').fullCalendar('getDate');
								var x = b.format('L');
								document.location = 'searchAllmonth?timecalendar='
													+ test + "&datecalendar=" + x + 
													"&usercalendar=" + usercalendar;
							});
				}); */
</script>