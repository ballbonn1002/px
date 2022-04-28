<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<style>
#div_input {
	text-align: right;
	margin-bottom: 1%;
	margin-top: 2%;
	font-family: "Open Sans", sans-serif;
}
input[type="checkbox"] {
	accent-color: #0275d8;
}
</style>
<!-- END THEME LAYOUT SCRIPTS -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MAIN CSS -->
<link rel="stylesheet" href="/pages-back/assets/css/main.css">
<link rel="stylesheet" href="/pages-back/assets/css/color_skins.css">

<div class="block-header">
	<div class="row">
    	<div class="col-lg-6 col-md-8 col-sm-12">
      		<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> รายชื่อพนักงาน</h2>
            	<ul class="breadcrumb">
                	<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">รายชื่อพนักงาน</li>
        		</ul>
		</div>            
	</div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
    	<div class="card">
        	<div class="body">      
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="header">
				        	<h2 style="font-size: 20px;">รายชื่อพนักงาน</h2>
				        	<ul class="header-dropdown">
				            	<li><a href="#" class="btn btn-info">เพิ่มพนักงาน</a></li>
				            </ul>
				        </div>
				     </div>
				     <div class="portlet-body">
				     	<div class="portlet box white">
				     		<div class="body">
				     			<div class="table-responsive">
				     				<table class="table table-hover js-basic-example dataTable table-custom m-b-0 no-footer">
										<thead>
											<tr>
												<th height="41" style="width: 10%;">รหัสพนักงาน</th>
												<th height="41" style="width: 10%;">ชื่อพนักงาน</th>
												<th height="41" style="width: 10%;">User id</th>
												<th height="41" style="width: 10%;">แผนก</th>
												<th height="41" style="width: 10%;">ตำแหน่ง</th>
												<th height="41" style="width: 5%; text-align: center;">Active</th>
												<th height="41" style="width: 5%;"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="user" items="${cubesoftUsers}" varStatus="status">
											<c:if test="${user.flag_search=='1'}">
												<tr>
													<td>${user.employee_id}</td>
													<td>${user.title_name_th} ${user.name}</td>
													<td>${user.id}&nbsp;</td>
													<td class="visible-lg">${user.department_id}&nbsp;</td>
													<td>${user.position_id}&nbsp;</td>
													<td style="align-item: center;" data-order="${user.enable}">
														<div class="md-checkbox-list test">
															<div>
																<div class="md-checkbox" style="margin-left: 32%;">
																	<input type="checkbox" id="${user.id}" class="md-check" onclick="update('${user.id}','
																		<c:if test="${user.enable == 0}">1</c:if>
																		<c:if test="${user.enable == 1}">0</c:if>')"
																		<c:if test="${user.enable == 1}">checked</c:if>> 
																		<label for="${user.id}"> 
																		<span class="check"></span>
																		<span class="box"></span>
																	</label>
																</div>
															</div>
														</div>
													</td>
													<td>                                            
				                                        <a style="text-align: center;" class="btn btn-outline-success" title="Edit" href="information_emp?userId=${user.id}">
				                                        	<i class="fa fa-pencil"></i>
				                                        </a>
				                                    </td>
												</tr>
											</c:if>
											</c:forEach>
										</tbody>
									</table>
									<!-- End Table -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function add() {
		document.location = "user-add";
	}
</script>

<link href="../assets/global/plugins/bootstrap-toastr/toastr.min.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/bootstrap-toastr/toastr.min.js"
	type="text/javascript"></script>
<link href="../assets/global/css/components.min.css" rel="stylesheet"
	id="style_components" type="text/css" />


<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />