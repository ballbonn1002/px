<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
	<style>

	input[type=radio] {
		
		accent-color: #0275d8;
    	border: 0px;
   		width: 5%;
    	height: 1.2em;
		}
		
#div_input {
	text-align: right;
	margin-bottom: 1%;
	margin-top: 2%;
	font-family: "Open Sans", sans-serif;
}
input[type="checkbox"] {
	accent-color: #0275d8;

}
.expenses-box {
	display: none;
}


</style>
</head>
	
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> รายละเอียดพนักงาน</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">รายชื่อพนักงาน</li>
                     <li class="breadcrumb-item active">รายละเอียดพนักงาน</li>
                </ul>
        </div>            
    </div>
</div>

<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">
            <form action="updateInfoEmp" method="POST">    
				<div class="portlet light bordered">
					<div class="portlet-title" >
						<div class="caption">
							 <span style="font-weight: bold; font-size: 20px"
								   class="caption-subject font-red sbold uppercase" >รายการเงินเดือน</span>
						</div>
							<div class="actions right" id="hidebutton"style="text-align: right; margin-bottom: 30px; ">
								<button type="reset" class="btn btn-outline-secondary"> ยกเลิก</button>
								<button type="submit" class="btn btn-info"> บันทึก</button>
								<!--  class="btn btn-circle btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a> -->  <!--  class="btn green-meadow"-->  <!-- <i
								class="fa fa-plus"></i> -->
							</div>
					</div>
				</div >           
                <div class="body">
                	<ul class="nav nav-tabs-new2">
                    	<li class="nav-item"><a id="showbutton"  class="nav-link active show" data-toggle="tab" href="#dataemp">ข้อมูลพนักงาน</a></li>
                        <li class="nav-item"><a id="showbutton1" class="nav-link" data-toggle="tab" href="#dataemployment">ข้อมูลการจ้างงาน</a></li>
                        <li class="nav-item"><a id="showbutton2" class="nav-link" data-toggle="tab" href="#datasalary">ข้อมูลเงินเดือน/ค่าจ้าง</a></li>
                        <li class="nav-item"><a id="showbutton3" class="nav-link" data-toggle="tab" href="#dataincome">ข้อมูลรายได้/รายจ่าย เพิ่มเติม </a></li>
                        <li class="nav-item"><a id="showbutton4" class="nav-link" data-toggle="tab" href="#datapayment">ข้อมูลการชำระเงินเดือน/ค่าจ้าง</a></li>
                        <li class="nav-item"><a id="History"class="nav-link" data-toggle="tab" href="#historypayment">ประวัติการปรับเงินเดือน</a></li>
                    </ul>
                    <div class="tab-content">
                    	<!--  Data Employee Page-->
                        <div class="tab-pane show active" id="dataemp">
                      		<div class="container" style=" margin-top: 20px;">
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">รหัสพนักงาน</label> 
											<input type="text" name="empId" value="${selectUser.employeeId}" class="form-control">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ชื่อพนักงาน</label> 
										 	<div class="form-inline">
												<select value="${selectUser.title_name_th}" name="prefixTH" size="1" class="form-control" 
													style="width: 30%; height: 35px;" >
    												<option value="นาย"
    													<c:if test="${selectUser.title_name_th eq 'นาย'}"> selected </c:if>>นาย</option>
    												<option value="นาง"
    													<c:if test="${selectUser.title_name_th eq 'นาง'}"> selected </c:if>>นาง</option>
    												<option value="นางสาว"
    													<c:if test="${selectUser.title_name_th eq 'นางสาว'}"> selected </c:if>>นางสาว</option>
 												</select>
												<input type="text" name="name" value="${selectUser.name}" class="form-control" style="width: 70%;">
											</div>
										</div>
									
												<div class="form-group" >
													<label for="recipient-name" class="control-label"
													style="font-weight: lighter; font-size: 14px;" >ชื่อพนักงาน EN</label>
													<div class="form-inline">
														<select value="${selectUser.title_name_en}" name="prefixEN" size="1" class="form-control" 
															style="width: 30%; height: 35px;">
															<option value="Mr."
		    													<c:if test="${selectUser.title_name_en eq 'Mr.'}"> selected </c:if>>Mr.</option>
		    												<option value="Mrs."
		    													<c:if test="${selectUser.title_name_en eq 'Mrs.'}"> selected </c:if>>Mrs.</option>
		    												<option value="Ms."
		    													<c:if test="${selectUser.title_name_en eq 'Ms.'}"> selected </c:if>>Ms.</option>
 										 				</select>
														<input type="text" name="nameEN" value="${selectUser.nameEN}" class="form-control" style="width: 70%;">
													</div>
												</div>
										<p> เพศ</p>
										<input type="radio" id="contactChoice1" name="gender" 
											<c:if test="${selectUser.gender eq 'M' }">
                                          		checked
                                     		</c:if>
											value="M">
    									<label for="contactChoice1" style="font-weight: lighter; font-size: 14px;">ชาย</label>&nbsp;&nbsp;&nbsp;
							
    									<input type="radio" id="contactChoice2" name="gender" 
    										<c:if test="${selectUser.gender eq 'F' }">
                                          		checked
                                     		</c:if>
											value="F">
    									<label for="contactChoice2" style="font-weight: lighter; font-size: 14px;">หญิง</label>
    								
									<div class="form-group" style="margin-top: 15px">
										<label for="recipient-name" class="control-label"
										 style="font-weight: lighter; font-size: 14px;">เลขบัตรประชาชน</label> 
										 <input type="text" name="IDcard" value="${selectUser.citizen_id}" class="form-control">
									</div>
							
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">อีเมล</label> 
										<input type="text" name="email" value="${selectUser.email}" class="form-control">
									</div>				
							
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">ชื่อผู้ติดต่อฉุกเฉิน</label> 
										<input type="text" name="nameEmer" value="${selectUser.nameEmer}" class="form-control">
									</div>				
							
							<input type="hidden" name="logonUser" value="${logonUser}">
							<!-- กำหนดวันที่ Time Create -->
							<div>
								<input type="hidden" name="time" id="time"
								class="form-control input-lg timepicker timepicker-24 test"
								value="${time}" data-time-format=" HH:mm" style="width: 200px;"
								onclick="timechenge()" onkeypress='return false'>
							</div>

							<div class="form-group form-md-line-input">
								<div class="col-md-2">
									<input name="date" id="date"
									value="<fmt:formatDate value="${now}"  type = "both" 
       								timeStyle = "medium" pattern="dd-MM-yyyy "  />"
									onchange="datechenge()"
									class="form-control input-lg form-control-inline input-medium date-picker test"
									size="9" type="hidden" onkeypress='return false'>
								</div>
							<!-- End Time Create -->
							</div>
									</div>
						
									<div class="col-6">
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px; ">Username</label> 
											<input type="text" name="username" value="${selectUser.id}" class="form-control" style="width: 95%;">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ชื่อเล่น</label> 
											<input type="text" name="nickname" value="${selectUser.nickName}" class="form-control" style="width: 95%;">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ชื่อเล่น EN</label> 
											<input type="text" name="nicknameEN" value="${selectUser.nicknameEN}" class="form-control" style="width: 95%;">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">วันเกิด</label>
											<input  data-provide="datepicker" data-date-autoclose="true" data-date-format="dd-mm-yyyy" name="bday" 
													value="<fmt:formatDate value="${selectUser.birthDate}" pattern=" dd-MM-yyyy" />" class="form-control" style="width: 95%;">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">เลขหนังสือเดินทาง</label> 
											<input type="text" name="passportID" value="${selectUser.passport_id}" class="form-control" style="width: 95%;">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">เบอร์โทร</label> 
											<input type="text" name="phoneNum" value="${selectUser.phoneNum}" class="form-control" style="width: 95%;">
										</div>
									
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">เบอร์ผู้ติดต่อฉุกเฉิน</label>
											 <input type="text" name="phoneEmer" value="${selectUser.phoneEmer}" class="form-control" style="width: 95%;">
										</div>
									</div>
								</div>
							</div>	
                		</div>
                                
                        <!--  Data Employment -->
                        <div class="tab-pane" id="dataemployment">
                        	<div class="container" style="margin-top: 20px;">
                            	<div class="row">
                                	<div class="col-6">
                                  		   	 		
                                  		<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">เเผนก</label>
											<select class="form-control" name="depart">
												<c:forEach var="department" items="${departmentList}">
													<option value="${department.id}"
														<c:if test="${selectUser.departmentId eq department.id }"> selected </c:if>>${department.id}</option>
												</c:forEach>
											</select>
										</div>
													
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">วันที่จ้างงาน</label>
											<input  data-provide="datepicker" data-date-autoclose="true" data-date-format="dd-mm-yyyy" name="startday" 
													value="<fmt:formatDate value="${selectUser.startDate}" pattern=" dd-MM-yyyy" />" class="form-control">
										</div>
													
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">วันทำงาน</label> 
										 	<div class="form-inline">
										 		<select value="${selectUser.title_name_th}" name="startworkday" size="1" class="form-control" 
													style="width: 47%; height: 35px;" >
    												<option value="0"
    													<c:if test="${selectUser.workDayStart eq '0'}"> selected </c:if>>อาทิตย์</option>
    												<option value="1"
    													<c:if test="${selectUser.workDayStart eq '1'}"> selected </c:if>>จันทร์</option>
    												<option value="2"
    													<c:if test="${selectUser.workDayStart eq '2'}"> selected </c:if>>อังคาร</option>
    												<option value="3"
    													<c:if test="${selectUser.workDayStart eq '3'}"> selected </c:if>>พุธ</option>
    												<option value="4"
    													<c:if test="${selectUser.workDayStart eq '4'}"> selected </c:if>>พฤหัสบดี</option>
    												<option value="5"
    													<c:if test="${selectUser.workDayStart eq '5'}"> selected </c:if>>ศุกร์</option>
    												<option value="6"
    													<c:if test="${selectUser.workDayStart eq '6'}"> selected </c:if>>เสาร์</option>
 												</select>
 												&nbsp;&nbsp;ถึง&nbsp;&nbsp;
												<select value="${selectUser.title_name_th}" name="endworkday" size="1" class="form-control" 
													style="width: 47%; height: 35px;" >
    												<option value="0"
    													<c:if test="${selectUser.workDayEnd	 eq '0'}"> selected </c:if>>อาทิตย์</option>
    												<option value="1"
    													<c:if test="${selectUser.workDayEnd	 eq '1'}"> selected </c:if>>จันทร์</option>
    												<option value="2"
    													<c:if test="${selectUser.workDayEnd	 eq '2'}"> selected </c:if>>อังคาร</option>
    												<option value="3"
    													<c:if test="${selectUser.workDayEnd	 eq '3'}"> selected </c:if>>พุธ</option>
    												<option value="4"
    													<c:if test="${selectUser.workDayEnd	 eq '4'}"> selected </c:if>>พฤหัสบดี</option>
    												<option value="5"
    													<c:if test="${selectUser.workDayEnd	 eq '5'}"> selected </c:if>>ศุกร์</option>
    												<option value="6"
    													<c:if test="${selectUser.workDayEnd	 eq '6'}"> selected </c:if>>เสาร์</option>
 												</select>
											</div>
										</div>
                              		</div>
                                  		   	 	
                                  	<div class="col-6">
                                  		   	 	
                                  		<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ตำเเหน่ง</label>
											<select class="form-control" name="positsion" style="width: 95%;">
												<c:forEach var="position" items="${positionList}">
													<option value="${position.position_id}"
														<c:if test="${selectUser.positionId eq position.position_id }"> selected </c:if>>${position.name}</option>
												</c:forEach>
											</select>
										</div>
													
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">วันที่สิ้นสุดการจ้าง</label>
											<input  data-provide="datepicker" data-date-autoclose="true" data-date-format="dd-mm-yyyy" name="endday" 
													value="<fmt:formatDate value="${selectUser.endDate}" pattern=" dd-MM-yyyy" />" class="form-control" style="width: 95%;">
										</div>
													
										<div class="form-group">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">เวลาทำงาน</label> 
										 	<div class="form-inline">
												<input type="text" name="starttimework" value="${selectUser.workTimeStart}" class="form-control timepicker timepicker-24" style="width: 45%;">
 												&nbsp;&nbsp;ถึง&nbsp;&nbsp;
												<input type="text" name="endtimework" value="${selectUser.workTimeEnd}" class="form-control" style="width: 45%;">
											</div>
							  			</div>
                                	</div>
                            	</div>
                        	</div>
                		</div>
            
                        <!--  Data Salary -->
                        <div class="tab-pane" id="datasalary">
                        	<div class="col-sm-12">
								<div class="form-group">
									<div class="row clearfix" style="padding-top:20px;">
										<div class="col-md-6 col-sm-12">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ประเภทพนักงาน</label> 
										    <select class="form-control show-tick" name="emp_type">
										    	<c:forEach var="employee_type" items="${emptypeList}">
													<option value="${employee_type.employee_type_id}"
														<c:if test="${selectUser.employee_type_id eq employee_type.employee_type_id }"> selected </c:if>>${employee_type.name}</option>
												</c:forEach>
										   	</select>
										</div>
										<div class="col-md-6 col-sm-12">
											<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">เงินเดือน</label> 
										    <div class="input-group mb-3">
												<input type="text" id ="salary" name="salary" class="form-control" aria-describedby="basic-addon2" >
												<div class="input-group-append">
													<button data-toggle="modal" data-target="#defaultModal" class="btn btn-outline-secondary editsalary" type="button">ปรับเงินเดือน</button>
												</div>
											</div>
										</div>
										<div class="col-md-6 col-sm-12" style="padding-top: 16px;">
											<p> สิทธิ์ประกันสังคม</p>
										    
				                            	<input type="radio" name="chkright" 
				                            		<c:if test="${selectUser.social_security eq '1' }">
                                          				checked
                                     				</c:if> value="1" style="accent-color: #0275d8;">
				                                <span><i></i>ยื่นสิทธิ์ประกันสังคม</span>
				                             
				                             
				                             	<input type="radio" name="chkright" 
				                             		<c:if test="${selectUser.social_security eq '0' }">
                                          				checked
                                     				</c:if> value="0" style="accent-color: #0275d8;">
				                                <span><i></i>ไม่ยื่นสิทธิ์ประกันสังคม</span>
				                             
										</div>
										<div class="col-md-6 col-sm-12" style="padding-top: 10px;"></div>
										<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
											<label class="control-label"
												style="font-weight: lighter; font-size: 14px;">หัก ณ ที่จ่าย</label> 
											<c:if test="${selectUser.withholding_auto eq '1'}">
                                          		<input type="text" id="txttax" name="withholding" class="form-control" disabled="disabled">
                                     		</c:if>
                                     		<c:if test="${selectUser.withholding_auto eq '0' || selectUser.withholding_auto == null}">
                                          		<input type="text" id="txttax" name="withholding" value="${selectUser.withholding}" class="form-control" required>
                                     		</c:if>
										</div>
										<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
											<br><br>
											<label>
				                            	<input type="checkbox" id="chktax" name="tax" 
				                            		<c:if test="${selectUser.withholding_auto eq '1' }">
                                          				checked
                                     				</c:if>  onclick="EnableDisnableTxttax(this)">
				                            	<span>คำนวนภาษีหัก ณ ที่จ่ายอัตโนมัติ</span>
				                            </label>
										</div>
										<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
											<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">เงื่อนไขการหักภาษี</label> 
										    <select class="form-control show-tick" name="tax_deduction">
										    	<option value="0"
		    										<c:if test="${selectUser.tax_deduction eq '0'}"> selected </c:if>>หัก ณ ที่จ่าย</option>
		    									<option value="1"
		    										<c:if test="${selectUser.tax_deduction eq '1'}"> selected </c:if>>ออกให้ตลอดไป</option>
		    									<option value="2"
		    										<c:if test="${selectUser.tax_deduction eq '2'}"> selected </c:if>>ออกให้ครั้งเดียว</option>
										   	</select>
										</div>
									</div>
								</div>
							</div>
					
							<!-- Modal  -->
							<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
							    <div class="modal-dialog" role="document">
							        <div class="modal-content">
							            <div class="modal-header">
							                <h4 class="title" id="defaultModalLabel">เงินเดือน</h4>
							            </div>
							            <div class="col-md-12" style="padding-top: 10px;">
											<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">วันที่เงินเดือนปรับใช้</label> 
										    <input type="text" name="salaryDate" class="form-control">
										</div>
							            <div class="col-md-12" style="padding-top: 10px;">
											<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">จำนวนเงินเดือน</label> 
										    <input type="text" name="amountsalary" class="form-control">
										</div>
										<div class="col-md-12" style="padding-top: 10px;padding-bottom: 20px;">
											<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">หมายเหตุ</label> 
										    <input type="text" name="note" class="form-control">
										</div>
							            <div class="modal-footer">
							            	<button type="submit" class="btn btn-outline-secondary" data-dismiss="modal">ยกเลิก</button>
							                <button type="button" class="btn btn-success">บันทึก</button>         
							            </div>
							        </div>
							    </div>
							</div>
                  		</div>
                                
                        <!--  Data income/expend-->
                        <div class="tab-pane" id="dataincome">
		                    <div class="col-sm-12">
		                    	<div class="form-group">
			                    	<div class="row clearfix" style=" margin-top: 20px;">
			                            <div class="col-md-6 col-sm-12">
			                            	<label class="control-label"
													style="font-size: 16px; color: #5C9BD1;">รายการ รายได้</label>
									        <table class="table">
												<thead>
													<tr>
														<th height="41" style="text-align: center; width: 20%;">ตั้งค่า</th>
														<th height="41" >ID</th>
														<th height="41" >รายได้</th>
														<th height="41" ></th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="test" items="${incomeList}">
													<c:set var="counter" value="${counter + 1}" />
														<tr class="checkbox-card">
															<td style="text-align: center;">
																<input type="checkbox" class="checkme"
																<c:if test="${test.config_flag == 1}">checked</c:if>> 
															</td>
												            <td>${test.Payment_type_id}</td>
												            <td>${test.Payment_type_name}</td>
												            <td>
												            	<c:if test="${test.config_flag == 1}">
												            		<input type="hidden" class="form-control" name="paymentconfigId" value="${test.user_payment_config_id}" >
												                	<input style="background-color:#EEEEEE;" type="text" class="form-control" name="amount" value="${test.amount}" >

												            	</c:if>
												            </td>
												    	</tr>
											    </c:forEach>      
												</tbody>
											</table>
		        						</div>
		        						
		        						<div class="col-md-6 col-sm-12">
			                            	<label class="control-label"
													style="font-size: 16px; color: #5C9BD1;">รายการหัก</label>
									        <table class="table">
												<thead>
													<tr>
														<th height="41" style="text-align: center; width: 20%;">ตั้งค่า</th>
														<th height="41" >ID</th>
														<th height="41" >รายได้</th>
														<th height="41" ></th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="test" items="${expendList}">
													<c:set var="counter" value="${counter + 1}" />
														<tr class="checkbox-card">
															<td style="text-align: center;">
																<input type="checkbox" name="paymentconfigId" value="${test.user_payment_config_id}" class="checkme"> 
															</td>
															<td>${test.Payment_type_id}</td>
												            <td>${test.Payment_type_name}</td>
												            <td>
												            	<div class="expenses-box">
												                	<input style="background-color:#EEEEEE;" type="text" class="form-control" name="amount" value="${test.amount}" >
												                 </div>
												            </td>
										                </tr>
									            </c:forEach>         
												</tbody>
											</table>
		        						</div>
			                        </div>
		                        </div>
		                    </div>
	                    </div>
                            	
                        <!--  Data payroll-->
                        <div class="tab-pane" id="datapayment">
                        	<div class="col-sm-12">
								<div class="form-group">
									<div class="row clearfix" style="margin-top:20px;">
										<div class="col-md-6 col-sm-12">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ประเภทการจ่ายเงิน</label> 
						    				<select class="form-control show-tick" name="transfer">
						    					<option value="0"
		    										<c:if test="${selectUser.transfer_type eq '0'}"> selected </c:if>>โอนเงิน</option>
		    									<option value="1"
		    										<c:if test="${selectUser.transfer_type eq '1'}"> selected </c:if>>เงินสด</option>
						   					</select>
										</div>
											
										<div class="col-md-6 col-sm-12"></div>
										
										<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
												<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">ธนาคาร</label> 
						    					<select class="form-control show-tick" name="bank">
						    						<option value="กรุงเทพ"
		    											<c:if test="${selectUser.bank eq 'กรุงเทพ'}"> selected </c:if>>ธนาคารกรุงเทพ</option>
		    										<option value="กรุงไทย"
		    											<c:if test="${selectUser.bank eq 'กรุงไทย'}"> selected </c:if>>ธนาคารกรุงไทย</option>
		    										<option value="กรุงศรีอยุธยา"
		    											<c:if test="${selectUser.bank eq 'กรุงศรีอยุธยา'}"> selected </c:if>>ธนาคารกรุงศรีอยุธยา</option>
		    										<option value="กสิกรไทย"
		    											<c:if test="${selectUser.bank eq 'กสิกรไทย'}"> selected </c:if>>ธนาคารกสิกรไทย</option>
		    										<option value="ทหารไทยธนชาต"
		    											<c:if test="${selectUser.bank eq 'ทหารไทยธนชาต'}"> selected </c:if>>ธนาคารทหารไทยธนชาต</option>
		    										<option value="ซีไอเอ็มบี"
		    											<c:if test="${selectUser.bank eq 'ซีไอเอ็มบี'}"> selected </c:if>>ธนาคารซีไอเอ็มบีไทย</option>
		    										<option value="ไทยพาณิชย์ "
		    											<c:if test="${selectUser.bank eq 'ไทยพาณิชย์ '}"> selected </c:if>>ธนาคารไทยพาณิชย์ </option>
						   						</select>
											</div>
											
										<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
											<p> ประเภทบัญชี</p>
							    				<input type="radio" id="Choice1" name="banktype" 
							    					<c:if test="${selectUser.bank_type eq '0' }">
                                          				checked
                                     				</c:if> value="0">
	    										<label for="Choice1" style="font-weight: lighter; font-size: 14px;">บัญชีออมทรัพย์</label>&nbsp;&nbsp;&nbsp;
								
	    										<input type="radio" id="Choice2" name="banktype" 
	    											<c:if test="${selectUser.bank_type eq '1' }">
                                          				checked
                                     				</c:if> value="1">
	    										<label for="Choice2" style="font-weight: lighter; font-size: 14px;">บัญชีกระแสรายวัน</label>
										</div>
										
										<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
												<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">เลขที่บัญชี</label> 
						   						<input type="text" name="banknum" value="${selectUser.bank_number}" class="form-control">
										</div>
										
										<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
											<label for="recipient-name" class="control-label" style="font-weight: lighter; font-size: 14px;">สาขาธนาคาร</label> 
							    			<input type="text" name="branch" value="${selectUser.bank_branch}" class="form-control">
										</div>
									</div>
								</div>
							</div>
						</div>
                           		
                        <!--  History-->
                        <div class="tab-pane" id="historypayment"> 
                        	<div class="portlet-body">
				     			<div class="portlet box white">
				     				<div class="body" style="margin-left: 20px;">
				     					<div class="timeline-item animated fadeIn slower blue">
				     				 		<span class="date">01 ม.ค 2022 </span>
				     						<h5> 25,000.00</h5>
				     						<p> ปรับเงินเดือนประจำปี</p>
				     					</div>
				     							
				     					<div class="timeline-item animated fadeIn slower blue">
				     				 		<span class="date">01 ม.ค 2022 </span>
				     				 		<h5> 20,000.00</h5>
				     						<p> เข้าทำงานใหม่</p>
				     					</div>
									</div>
								</div>
							</div>                          		
                    	</div>
                	</div>
				</div>
           	</form>
        	</div>
		</div>
	</div>
</div>	
	
<script src="pages-back/assets/js/jquery-latest.min.js"></script> 
<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>  
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script src="pages-back/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="pages-back/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="pages-back/assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>

$(function(){
	$(".checkme").click(function(event) {
		var x = $(this).is(':checked');
		if (x == true) {
			$(this).parents(".checkbox-card").find('.expenses-box').show();
		}
		else{
			$(this).parents(".checkbox-card").find('.expenses-box').hide();
		}
	});
})


$(document).ready(function(){
  $("#History").click(function(){
    $("#hidebutton").hide();
  });
  $("#showbutton").click(function(){
    $("#hidebutton").show();
  });
  $("#showbutton1").click(function(){
	    $("#hidebutton").show();
	  });
  $("#showbutton2").click(function(){
	    $("#hidebutton").show();
	  });
  $("#showbutton3").click(function(){
	    $("#hidebutton").show();
	  });
  $("#showbutton4").click(function(){
	    $("#hidebutton").show();
	  });

});

	
function EnableDisnableTxttax(chktax)
{
	var txttax = document.getElementById("txttax");
	txttax.disabled = chktax.checked?true:false;
	if(!txttax.disabled){
		txttax.focus();
	}else{
		txttax.value=""
	}
}

</script>
</html>

