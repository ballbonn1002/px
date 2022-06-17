<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <div class="main_menu">
        <nav class="navbar navbar-expand-lg">
            <div class="container">

                <div class="navbar-collapse align-items-center collapse" id="navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown mega-menu active">
                            <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="icon-speedometer"></i> <span> PAYROLL </span></a>
                            <div class="dropdown-menu mega-main padding-0 animated fadeIn">
                                <div class="row">
                                  
                                    <div class="col-lg-4 col-md-4 hidden-sm">
                                        <div class="img-box" style="background-image: url(/pages-back/assets/images/menu-img/1.jpg)"></div>
                                    </div>
                                    
                                    <div class="col-lg-3 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                        	<ul class="list-unstyled">
                                                <li><label>Payroll</label></li>
                                                <li class="active"><a href="#">Payroll Management</a></li>
                                                <li ><a href="#">Payroll History</a></li>
                                            </ul>
                                      
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Employees</label></li>
                                                <li><a href="#">All Employees</a></li>
                                                <li><a href="#">Leave Requests</a></li>
                                                <li><a href="#">Attendance</a></li>
                                                <li><a href="#">Departments</a></li>
                                            </ul>
                                            
                                        </div>
                                    </div>
                                
                                </div>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown mega-menu active">
                            <a href="/payroll_list" class="nav-link"><i class="icon-docs"></i> <span> รายการจ่ายเงินเดือน </span></a>
                        </li>
                        
                        <li class="nav-item dropdown mega-menu">
                            <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="icon-grid"></i> 
                            <span>Master Data</span></a>
                            <div class="dropdown-menu mega-main padding-0 animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-2 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Employee</label></li>
                                                <li><a href="employee_list">Employee Profile</a></li>
                                                <li><a href="employeeType_list">Employee Type</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4">
                                        <div class="mega-list">
                                        	<ul class="list-unstyled">
                                                <li><label>Payment</label></li>
                                                <li><a href="payment_type">Payment Type</a></li>
                                                <li><a href="#">Payment Group</a></li>
                                                <li><a href="/payment_term">Payment Term</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-2 col-md-4 col-sm-4">
                                        <div class="mega-list">
                                        	<ul class="list-unstyled">
                                                <li><label>Official</label></li>
                                                <li><a href="/department_list">Department</a></li>
                                                <li><a href="/position_list">Position</a></li>
                                                <li><a href="/holiday_list">Holiday</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                   
                                    <div class="col-lg-6 col-md-4 hidden-sm">
                                        <div class="img-box" style="background-image: url(/pages-back/assets/images/menu-img/1.jpg)"></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown mega-menu">
                            <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="icon-docs"></i> <span>Report</span></a>
                            <div class="dropdown-menu mega-main padding-0 animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-6 col-md-4 hidden-sm">
                                        <div class="img-box" style="background-image: url(/pages-back/assets/images/menu-img/7.jpg)"></div>
                                    </div>
                                    <div class="col-lg-2 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Report</label></li>
                                                <li><a href="page-blank.html">Report 1</a> </li>
                                                <li><a href="page-profile2.html">Report 2</a></li>
                                                <li><a href="page-gallery.html">Report 3</a> </li>
                                                <li><a href="page-gallery2.html">Report 4</a> </li>
                                                <li><a href="page-timeline.html">Report 5</a></li>
                                                <li><a href="page-timeline-h.html">Report 6</a></li>
                                                <li><a href="page-pricing.html">Report 7</a></li>
                                                <li><a href="report_work">รายงานข้อมูลการทำงาน</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                     <div class="col-lg-2 col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Chart</label></li>
                                                <li><a href="chart-morris.html">Morris</a> </li>
                                                <li><a href="chart-flot.html">Flot</a> </li>
                                                <li><a href="chart-chartjs.html">ChartJS</a> </li>                                    
                                                <li><a href="chart-jquery-knob.html">Jquery Knob</a> </li>
                                                <li><a href="chart-sparkline.html">Sparkline Chart</a></li>
                                                <li><a href="chart-peity.html">Peity</a></li>
                                                <li><a href="chart-c3.html">C3 Charts</a></li>
                                                <li><a href="chart-gauges.html">Gauges</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown mega-menu">
                            <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="icon-docs"></i> <span>Authority</span></a>
                            <div class="dropdown-menu mega-main padding-0 animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-6 col-md-4 hidden-sm">
                                        <div class="img-box" style="background-image: url(/pages-back/assets/images/menu-img/7.jpg)"></div>
                                    </div>
                                    <div class="col-lg-2 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>User</label></li>
                                                <li><a href="SystemUser_list">System User</a> </li>
                                                <li><a href="/user-list">User Management</a> </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Role</label></li>
                                                <li><a href="/role-list">Role Management</a> </li>
                                            </ul>
                                        </div>
                                    </div>
                                 </div>
                             </div>
                        </li>
                        <li class="nav-item dropdown mega-menu">
                            <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="icon-docs"></i> <span>Function</span></a>
                            <div class="dropdown-menu mega-main padding-0 animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-6 col-md-4 hidden-sm">
                                        <div class="img-box" style="background-image: url(/pages-back/assets/images/menu-img/7.jpg)"></div>
                                    </div>
                                    <div class="col-lg-2 col-lg-auto col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Function</label></li>
                                                <li><a href="#">Actual - วันทำงานจริง</a> </li>
                                                <li><a href="#">Salary - เงินเดือน</a> </li>
                                                <li><a href="#">SSI - ประกันสังคม</a> </li>
                                                <li><a href="#">Tax - ภาษี</a> </li>
                                            </ul>
                                        </div>
                                    </div>
                                 </div>
                             </div>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>
    
         