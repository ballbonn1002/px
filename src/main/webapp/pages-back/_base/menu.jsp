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
                        <li class="nav-item dropdown mega-menu">
                            <a href="dashboard" class="nav-link"><i class="icon-speedometer"></i> <span> Dashboard </span></a>                          
                        </li>
                        
                        <li class="nav-item dropdown mega-menu">
                            <a href="payroll_list" class="nav-link"><i class="icon-docs"></i> <span> Payroll </span></a>
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
                            <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="icon-bar-chart"></i> <span>รายงาน</span></a>
                            <div class="dropdown-menu mega-main padding-0 animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-6 col-md-4 hidden-sm">
                                        <div class="img-box" style="background-image: url(/pages-back/assets/images/menu-img/7.jpg)"></div>
                                    </div>
                                    <div class="col-lg-3 col-lg-auto col-md-5 col-sm-5">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>รายงาน</label></li>
                                                <li><a href="report_work">รายงาน ข้อมูลการทำงาน</a></li>
                                                <li><a href="report_payroll">รายงาน รายการจ่ายเงินเดือน</a> </li>
                                                <li><a href="report_wages">รายงาน เงินเดือน/ค่าจ้างสะสม</a></li>
                                                <li><a href="report_salary_depart">รายงาน เงินเดือนแยกตามแผนก</a> </li>
                                                <li><a href="BonusReport">รายงาน รายได้เพิ่มเติม/รายการหัก</a> </li>
                                                <li><a href="#">รายงาน เงินประกันสังคม</a></li>
                                                <li><a href="#">สลิปเงินเดือน แยกตามรายการจ่าย</a></li>
                                                <li><a href="#">สลิปเงินเดือน แยกตามบุคคล</a></li> 
                                            </ul>
                                        </div>
                                    </div>
                                     <div class="col-lg-2 col-md-4 col-sm-4">
                                        <div class="mega-list">
                                            <ul class="list-unstyled">
                                                <li><label>Chart</label></li>
                                                <li><a href="payment_statistics">Payment Statistics</a> </li>
                                                <li><a href="employeeReport">Employee Statistics</a> </li>
                                                <li><a href="report_department">Department Statistics</a> </li>
                                                <li><a href="Payment_chart">Payment Chart</a></li>
                                                <li><a href="report_year">Employee yearly statistics</a> </li>
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
                                            	<li><a href="/role_management">Role Management</a> </li>
                                                <li><a href="/page_menu">Page Menu</a> </li>
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
                                                <li><a href="actual_work">Actual - วันทำงานจริง</a> </li>
                                                <li><a href="salary">Salary - เงินเดือน</a> </li>
                                                <li><a href="function_ssi">SSI - ประกันสังคม</a> </li>
                                                <li><a href="tax">Tax - ภาษี</a> </li>
                                                <li><a href="jqueryDTs">JqueryDataTables</a></li>
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
    
         