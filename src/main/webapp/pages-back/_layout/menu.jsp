<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<ul class="page-sidebar-menu" data-keep-expanded="false"
	data-auto-scroll="true" data-slide-speed="200">
	<perm:permission object="dashboard.view">
		<li class="nav-item start"><a href="Dashboard"
			class="nav-link nav-toggle"> <i class="icon-home"></i> <span
				class="title">Dashboard</span></a></li>
	</perm:permission>
	<perm:permission object="news.view">
		<li class="heading">
			<h3 class="uppercase">Event</h3>
		</li>
		<li class="nav-item"><a href="new_s" class="nav-link"> <i
				class="fa fa-newspaper-o"></i> <span class="title">News</span></a></li>

	</perm:permission>
	<li class="nav-item"><a href="feedList_open" class="nav-link">
			<i class="fa fa-rss"></i> <span class="title">Social Feed</span>
	</a></li>

	<li class="nav-item"><a href="javascript:;"
		class="nav-link nav-toggle"> <i class="fa fa-calendar"></i> <span
			class="title">Calendar</span> <span class="arrow"></span>
	</a>
		<ul class="sub-menu">
			<!-- 20/03/19 -->
			<li class="nav-item"><a href="check_allCalendar"
				class="nav-link"> <i class="fa fa-calendar-check-o"></i> <span
					class="title">Check All Calendar</span></a></li>
			<perm:permission object="calendar.view">
				<li class="nav-item"><a href="leavecalendar" class="nav-link">
						<i class="fa fa-medkit"></i> <span class="title">Leave
							calendar</span>
				</a></li>

				<li class="nav-item"><a href="holiday_calendar?flag=1"
					class="nav-link"> <i class="fa fa-photo"></i> <span
						class="title">Holiday calendar</span></a></li>

				<li class="nav-item"><a href="checklist_calendar"
					class="nav-link"> <i class="fa fa-clock-o"></i> <span
						class="title">Check list calendar</span></a></li>

				<li class="nav-item"><a
					href="travelexp_calendar?userId=${onlineUser.id}" class="nav-link">
						<i class="fa fa-taxi"></i> <span class="title">Expense
							calendar</span>
				</a></li>

				<li class="nav-item"><a
					href="timesheet_calendar?userId=${onlineUser.id}" class="nav-link">
						<i class="fa fa-list-alt"></i> <span class="title">TimeSheet
							calendar</span>
				</a></li>
			</perm:permission>
		</ul></li>

	<li class="heading">
		<h3 class="uppercase">Cube Management</h3>
	</li>

	<li class="nav-item"><a href="javascript:;"
		class="nav-link nav-toggle"> <i class="fa fa-book"></i> <span
			class="title">Project</span> <span class="arrow"></span>
	</a>
		<ul class="sub-menu">
			<li class="nav-item"><a href="projectList" class="nav-link">
					<i class="fa fa-book"></i> <span class="title">Project List</span>
			</a></li>
		</ul>
	<li class="nav-item"><a href="check_in?userId=${onlineUser.id}"
		class="nav-link"> <i class="fa fa-mail-forward"></i> <span
			class="title">Check in/Check out</span></a></li>

	<%-- <li class="nav-item"><a href="check_in2?userId=${onlineUser.id}"
		class="nav-link"> <i class="fa fa-mail-forward"></i> <span
			class="title">Check in/Check out2</span></a></li> --%>


	<li class="nav-item"><a href="check_list?userId=${onlineUser.id}"
		class="nav-link"> <i class="fa fa-clock-o"></i> <span
			class="title">Check list</span></a></li>
	<perm:permission object="checklist.edit">
		<li class="nav-item"><a href="approve_list" class="nav-link">
				<i class="fa fa-check-square-o"></i> <span class="title">Check
					list approve</span>
		</a></li>
	</perm:permission>
	<li class="nav-item"><a
		href="check_history?userId=${onlineUser.id}" class="nav-link"> <i
			class="fa fa-history"></i> <span class="title">Work history</span></a></li>
	<li class="nav-item"><a
		href="timesheet_list?userseq=${onlineUser.id}" class="nav-link"> <i
			class="fa fa-edit"></i> <span class="title">TimeSheet list</span></a></li>
	<perm:permission object="timesheet.edit">
		<li class="nav-item"><a href="openTimesheetEdit" class="nav-link">
				<i class="fa fa-edit"></i> <span class="title">TimeSheet HR</span>
		</a></li>
	</perm:permission>
	<li class="nav-item"><a href="mytimesheet" class="nav-link"> <i
			class="fa fa-edit"></i> <span class="title">My TimeSheet</span></a></li>
	<li class="nav-item"><a href="ot_list?userseq=${onlineUser.id}"
		class="nav-link"> <i class="fa fa-edit"></i> <span class="title">OT
				list</span></a></li>

	<!-- Leave-->
	<perm:permission object="leave.viewall">
		<li class="nav-item"><a href="leave_list" class="nav-link"> <i
				class="fa fa-medkit"></i> <span class="title">Leave List</span></a></li>
	</perm:permission>

	<perm:permission object="leave.viewall">
		<li class="nav-item"><a href="leave_approved" class="nav-link">
				<i class="fa fa-gavel"></i> <span class="title">Leave Approve</span>
		</a></li>
	</perm:permission>

	<li class="nav-item"><a href="myleave_list?Id=${onlineUser.id}"
		class="nav-link"> <i class="fa fa-hospital-o"></i> <span
			class="title">My leave</span></a></li>

	<li class="nav-item"><a href="Training_list?Id=${onlineUser.id}" class="nav-link">
			<!-- link to "My Training" page --> <i class="fa fa-edit"></i> <!-- add icon -->
			<span class="title">My Training</span>
	</a></li>
	<li class="nav-item"><a href="Meeting_Calendar?role=member" class="nav-link">
			<!-- link to "My Training" page --> <i class="fa fa-users"></i> <!-- add icon -->
			<span class="title">My Meeting</span>
	</a></li>
	
	<!-- travel -->
	<perm:permission object="travel.view">
		<li class="nav-item"><a href="javascript:;" id="travelMenu"
			class="nav-link nav-toggle"> <i class="fa fa-taxi"></i> <span
				class="title">Travel</span> <span class="arrow"></span>
		</a>
			<ul class="sub-menu">
				<li class="nav-item"><a
					href="travelexp_form?userId=${onlineUser.id}"
					id="travel_expense_submenu" class="nav-link"> <i
						class="fa fa-sticky-note-o"></i> <span class="title">Travel
							expense form</span></a></li>

				<li class="nav-item"><a href="requesttravel_list"
					id="requesttravel_listSubmenu" class="nav-link"> <i
						class="fa fa-list"></i> <span class="title">Travel request
							list</span></a></li>
			</ul></li>
	</perm:permission>
	<perm:permission object="borrow.view">
		<li class="nav-item"><a href="javascript:;" id="borrowMenu"
			class="nav-link nav-toggle"> <i class="icon-arrow-left"></i> <span
				class="title">Borrow</span> <span class="arrow"></span>
		</a> <!-- borrow -->
			<ul class="sub-menu">
				<perm:permission object="equipment.edit">
					<li class="nav-item"><a href="eAdd" class="nav-link"> <i
							class="fa fa-plus-square-o"></i> <span class="title">Add
								new equipment</span></a></li>
				</perm:permission>

				<perm:permission object="equipmentlist.view">
					<li class="nav-item"><a href="tableE" class="nav-link"> <i
							class="fa fa-laptop"></i> <span class="title">Equipment
								list</span></a></li>
				</perm:permission>

				<%-- <perm:permission object="equipmentlist.view">
					<li class="nav-item"><a href="tableE3" class="nav-link"> <i
							class="fa fa-laptop"></i> <span class="title">Equipment
								list3</span></a></li>
				</perm:permission> --%>

				<li class="nav-item"><a href="eBorrow" id="equipment_open"
					class="nav-link"> <i class="icon-wrench"></i> <span
						class="title">Borrow equipment</span></a></li>
				<li class="nav-item"><a href="myBorrow" id="equipment_open"
					class="nav-link"> <i class="fa fa-list"></i> <span
						class="title">My Borrow</span></a></li>
				<perm:permission object="borrowlist.searchall">
					<li class="nav-item"><a href="eBorrowList" class="nav-link">
							<i class="fa fa-list"></i> <span class="title">Borrow list</span>
					</a></li>
				</perm:permission>
				<perm:permission object="borrow.approved">
					<li class="nav-item"><a href="eBorrowApprove" id="borrow_app"
						class="nav-link"> <i class="fa fa-check-square-o"></i> <span
							class="title">Borrow approve</span></a></li>
				</perm:permission>
			</ul></li>
	</perm:permission>
	<perm:permission object="master.view">
		<li class="nav-item"><a href="javascript:;"
			class="nav-link nav-toggle" id="masterMenu"> <i
				class="fa fa-pencil-square"></i> <span class="title">Master</span> <span
				class="arrow"></span>
		</a>
			<ul class="sub-menu">
				<li class="nav-item"><a href="travel_list" class="nav-link">
						<i class="fa fa-plane"></i> <span class="title">Travel
							expense List</span>
				</a></li>

				<!-- Menu to list leave type -->
				<li class="nav-item"><a href="leaveType_list" class="nav-link">
						<i class="fa fa-suitcase"></i> <span class="title">Leave
							Type</span>
				</a></li>
				<li class="nav-item"><a href="eStatusList" class="nav-link">
						<i class="fa fa-suitcase"></i> <span class="title">Equipment
							Status</span>
				</a></li>
				<li class="nav-item"><a href="EquipmentType" class="nav-link">
						<i class="fa fa-list"></i> <span class="title">Equipment
							Type</span>
				</a></li>
				<li class="nav-item"><a href="department_list" class="nav-link">
						<i class="fa fa-user-md"></i> <span class="title">Department</span>
				</a></li>
				<li class="nav-item"><a href="timesheet_list_approve"
					class="nav-link"> <i class="fa fa-check-square"></i> <span
						class="title">TimeSheet list approve</span></a></li>
				<li class="nav-item"><a href="holiday_list" class="nav-link">
						<i class="fa fa-photo"></i> <span class="title">Holiday
							list</span>
				</a></li>
				<li class="nav-item"><a href="position_list" class="nav-link">



						<i class="fa fa-user"></i> <span class="title">Position
							list</span>
				</a></li>
				<li class="nav-item"><a href="Duplicate_Workhour"
					class="nav-link"> <i class="fa fa-clock-o"></i> <span
						class="title">Duplicate WorkHour</span></a></li>

				<li class="nav-item"><a href="job_site_list" class="nav-link">
						<i class="fa fa-edit"></i> <span class="title">Job Site</span>
				</a></li>

				<li class="nav-item"><a href="Training_list_Admin" class="nav-link">
						<!-- link to "My Training" page --> <i class="fa fa-edit"></i> <!-- add icon -->
						<span class="title">Training Manager</span>
				</a></li>
				
				<li class="nav-item"><a href="Meeting_Manager?role=admin" class="nav-link">
						<!-- link to "My Training" page --> <i class="fa fa-edit"></i> <!-- add icon -->
						<span class="title">Meeting Manager</span>
				</a></li>

				<!-- <li class="nav-item"><a href="Training_Add" class="nav-link">
						<i class="fa fa-edit"></i> <span class="title">Training Add</span>
				</a></li> -->

				<li class="nav-item"><a href="openFeedCRUD" class="nav-link">
						<i class="fa fa-rss"></i> <span class="title">Feed Manage</span>
				</a></li>

			</ul></li>


	</perm:permission>

	<perm:permission object="user.view">
		<li class="heading">
			<h3 class="uppercase">Authority</h3>
		</li>

		<li class="nav-item"><a href="user-list" class="nav-link"> <i
				class="fa fa-user"></i> <span class="title">User management</span></a></li>
	</perm:permission>

	<perm:permission object="role.view">
		<li class="nav-item"><a href="role-list" class="nav-link"> <i
				class="fa fa-users"></i> <span class="title">Role management</span></a></li>
	</perm:permission>

	<!-- 	<li class="nav-item"><a href="user-salary" class="nav-link"> <i
				class="fa fa-money"></i> <span class="title">User Salary</span></a></li> -->
	<perm:permission object="role.view">
		<li class="nav-item"><a href="user-salary" class="nav-link">
				<i class="fa fa-user"></i> <span class="title">User salary</span>
		</a></li>
	</perm:permission>

	<perm:permission object="article.view">
		<li class="heading">
			<h3 class="uppercase">Article</h3>
		</li>

		<li class="nav-item"><a href="article-new" class="nav-link">
				<i class="fa fa-edit"></i> <span class="title">New Article </span>
		</a></li>
		<li class="nav-item"><a href="article-feed" class="nav-link">
				<i class="fa fa-file"></i> <span class="title">Article Feed </span>
		</a></li>
	</perm:permission>
	<perm:permission object="support.view">
		<li class="heading">
			<h3 class="uppercase">Support</h3>
		</li>
		<li class="nav-item"><a href="javascript:;" class="nav-link">
				<i class="fa fa-rss"></i> <span class="title">FeedBack</span> <span
				class="arrow"></span>
		</a>
			<ul class="sub-menu">
				<li class="nav-item"><a href="feedback" class="nav-link"> <i
						class="fa fa-commenting-o"></i> <span class="title">Send
							FeedBack</span></a></li>
				<li class="nav-item"><a href="feedback_req" class="nav-link">
						<i class="fa fa-list"></i> <span class="title">FeedBack
							list</span>
				</a></li>
				<perm:permission object="feedback.manage">
					<li class="nav-item"><a href="feedbacklist_mm"
						class="nav-link"> <i class="fa fa-list-alt"></i> <span
							class="title">FeedBack Management</span>
					</a></li>
				</perm:permission>
			</ul>
		<li class="nav-item"><a href="FAQ" id="faq" class="nav-link">
				<i class="icon-wrench"></i> <span class="title">FAQ</span>
		</a></li>
		<li class="nav-item"><a href="Ticket" id="ticket"
			class="nav-link"> <i class="icon-wrench"></i> <span class="title">Ticket</span>
		</a></li>
	</perm:permission>

	<li class="heading">
		<h3 class="uppercase">File</h3>
	</li>
	<li class="nav-item"><a
		href="perfrom_upload2?userId=${onlineUser.id}" class="nav-link"> <i
			class="fa fa-file-text-o"></i> <span class="title">My file</span></a></li>
	<perm:permission object="file.view">
		<li class="nav-item"><a href="perfrom_upload" class="nav-link">
				<i class="fa fa-file-text-o"></i> <span class="title">All
					file</span>
		</a></li>
	</perm:permission>
	<li class="heading">
		<h3 class="uppercase">Reports</h3>
	</li>
	<li class="nav-item"><a href="redirectToReportMenu"
		id="report_page" class="nav-link"> <i class="fa fa-file-text-o"></i>
			<span class="title">Reports</span>
	</a></li>
	<li class="heading">
		<h3 class="uppercase">Exit</h3>
	</li>
	<li class="nav-item"><a href="logout" id="logout" class="nav-link">
			<i class="icon-logout"></i> <span class="title">Logout</span>
	</a></li>
</ul>