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
				<div class="portlet light bordered">
					<div class="portlet-title" >
						<div class="caption">
							 <span style="font-weight: bold; font-size: 20px"
								   class="caption-subject font-red sbold uppercase" >รายการเงินเดือน</span> 
							 <span class="caption-helper font-red"> <%-- ${role.name} --%> </span>
						</div>
		<form action="saveDepart" method="POST">
							<div class="actions right" id="hidebutton"style="text-align: right; margin-bottom: 30px; ">
								<button type="reset" class="btn btn-outline-secondary"> ยกเลิก</button>
								<button type="submit" class="btn btn-primary"> บันทึก</button>
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
													<label for="recipient-name" class="control-label" 
													style="font-weight: lighter; font-size: 14px;">รหัสพนักงาน</label> 
													<input type="text" name="" required class="form-control">
												</div>
									
												<div class="form-group">
													<label for="recipient-name" class="control-label" 
													style="font-weight: lighter; font-size: 14px;">ชื่อพนักงาน</label> 
										 			<div class="form-inline">
														<select id="" name="" size="1" class="form-control" 
														style="width: 30%; height: 35px;">
    														<option value="">นาย</option>
    														<option value="">นาง</option>
    														<option value="">นางสาว</option>
 														</select>
														<input type="text" name="name" required class="form-control" style="width: 70%;">
													</div>
											 	</div>
									
												<div class="form-group" >
													<label for="recipient-name" class="control-label"
													style="font-weight: lighter; font-size: 14px;" >ชื่อพนักงาน EN</label>
													<div class="form-inline">
														<select id="" name="" size="1" class="form-control" 
															style="width: 30%; height: 35px;">
    														<option value="">Mr.</option>
    														<option value="">Mrs.</option>
    														<option value="">Ms.</option>
 										 				</select>
														<input type="text" name="" required class="form-control" style="width: 70%;">
													</div>
												</div>
										<p> เพศ</p>
										<input type="radio" id="contactChoice1" name="gender" value="M">
    									<label for="contactChoice1" style="font-weight: lighter; font-size: 14px;">ชาย</label>&nbsp;&nbsp;&nbsp;
							
    									<input type="radio" id="contactChoice2" name="gender" value="F">
    									<label for="contactChoice2" style="font-weight: lighter; font-size: 14px;">หญิง</label>
    								
									<div class="form-group" style="margin-top: 15px">
										<label for="recipient-name" class="control-label"
										 style="font-weight: lighter; font-size: 14px;">เลขบัตรประชาชน</label> 
										 <input type="text" name="" required class="form-control">
									</div>
							
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">อีเมล</label> 
										<input type="text" name="" required class="form-control">
									</div>				
							
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">ชื่อผู้ติดต่อฉุกเฉิน</label> 
										<input type="text" name="" required class="form-control">
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
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px; ">Username</label> 
										<input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
									
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">ชื่อเล่น</label> 
										<input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
									
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">ชื่อเล่น EN</label> 
										<input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
									
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">วันเกิด</label>
										<input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
									
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">เลขหนังสือเดินทาง</label> 
										<input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
									
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">เบอร์โทร</label> 
										<input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
									
									<div class="form-group">
										<label for="recipient-name" class="control-label" 
										style="font-weight: lighter; font-size: 14px;">เบอร์ผู้ติดต่อฉุกเฉิน</label>
										 <input type="text" name="" required class="form-control" style="width: 95%;">
									</div>
						</div>
						</div>
				</div>	
                                </div>
                                
                             <!--  Data Employment-->   
                              <div class="tab-pane" id="dataemployment">
                                 	<div class="container" style="margin-top: 20px;">
                                  		 <div class="row">
                                  		   	 	<div class="col-6">
                                  		   	 		
                                  		   	 		<div class="form-group">
														<label for="recipient-name" class="control-label"
														style="font-weight: lighter; font-size: 14px;">เเผนก</label> <input
														type="text" name="" required class="form-control">
													</div>
													
													<div class="form-group">
														<label for="recipient-name" class="control-label"
														style="font-weight: lighter; font-size: 14px;">วันที่จ้างงาน</label> <input
														type="text" name="" required class="form-control">
													</div>
													
													<div class="form-group">
														<label for="recipient-name" class="control-label" 
														style="font-weight: lighter; font-size: 14px;">วันทำงาน</label> 
										 				<div class="form-inline">
															<select id="" name="" size="1" class="form-control" 
															style="width: 47%; height: 35px;">
																<option disabled selected>เลือกวัน</option>
    															<option value="">จันทร์</option>
    															<option value="">อังคาร</option>
    															<option value="">พุธ</option>
    															<option value="">พฤหัสบดี</option>
    															<option value="">ศุกร์</option>
    															<option value="">เสาร์</option>
    															<option value="">อาทิตย์</option>
 															</select>
 															&nbsp;&nbsp;ถึง&nbsp;&nbsp;
															<select id="" name="" size="1" class="form-control" 
															style="width: 47%; height: 35px;">
																<option disabled selected>เลือกวัน</option>
    								    						<option value="">จันทร์</option>
    															<option value="">อังคาร</option>
    															<option value="">พุธ</option>
    															<option value="">พฤหัสบดี</option>
    															<option value="">ศุกร์</option>
    															<option value="">เสาร์</option>
    															<option value="">อาทิตย์</option>
 															</select>
														</div>
													 </div>
                                  		   	 	</div>
                                  		   	 	<div class="col-6">
                                  		   	 	
                                  		   	 		<div class="form-group">
														<label for="recipient-name" class="control-label"
														style="font-weight: lighter; font-size: 14px;">ตำเเหน่ง</label> <input
														type="text" name="" required class="form-control" style="width: 95%;">
													</div>
													
													<div class="form-group">
														<label for="recipient-name" class="control-label"
														style="font-weight: lighter; font-size: 14px;">วันที่สิ้นสุดการจ้าง</label> <input
														type="text" name="" required class="form-control" style="width: 95%;">
													</div>
													
													<div class="form-group">
														<label for="recipient-name" class="control-label" 
														style="font-weight: lighter; font-size: 14px;">เวลาทำงาน</label> 
										 				<div class="form-inline">
															<input type="text" name="" required class="form-control" style="width: 45%;">
 															&nbsp;&nbsp;ถึง&nbsp;&nbsp;
															<input type="text" name="" required class="form-control" style="width: 45%;">
														</div>
							  						 </div>
                                  		   	 	</div>
                                  		 </div>
                                  	</div>
                               </div>
                               
                                <div class="tab-pane" id="datasalary">
                                <div class="col-sm-12">
				<div class="form-group">
					<div class="row clearfix" style="padding-top:20px;">
						<div class="col-md-6 col-sm-12">
							<label for="recipient-name" class="control-label"
								style="font-weight: lighter; font-size: 14px;">ประเภทพนักงาน</label> 
						    <select class="form-control show-tick">
								<option>พนักงานประจำ</option>
								<option>พนักงานอัตราจ้าง</option>
						   	</select>
						</div>
						<div class="col-md-6 col-sm-12">
							<label for="recipient-name" class="control-label"
								style="font-weight: lighter; font-size: 14px;">เงินเดือน</label> 
						    <div class="input-group mb-3">
								<input type="text" name="" required class="form-control" aria-describedby="basic-addon2" value="20000">
								<div class="input-group-append">
									<button href="#defaultModal" data-toggle="modal" data-target="#defaultModal" class="btn btn-outline-secondary" type="button">แก้ไข</button>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12" style="padding-top: 16px;">
							<p> สิทธิ์ประกันสังคม</p>
						    
                            	<input type="radio" name="chkright" id="yes" onclick="EnableDisableTxtright()" checked style="accent-color: #0275d8;">
                                <span><i></i>ยื่นสิทธิ์ประกันสังคม</span>
                             
                             
                             	<input type="radio" name="chkright" id="no" onclick="EnableDisableTxtright()" style="accent-color: #0275d8;">
                                <span><i></i>ไม่ยื่นสิทธิ์ประกันสังคม</span>
                             
						</div>
						<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
							<label for="recipient-name" class="control-label"
								style="font-weight: lighter; font-size: 14px;">ประกันสังคม</label> 
						    <input type="text" id="txtright" class="form-control" value="750" disabled="disabled">
						</div>
						<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
							<label class="control-label"
								style="font-weight: lighter; font-size: 14px;">หัก ณ ที่จ่าย</label> 
						    <input type="text" id="txttax" class="form-control" disabled="disabled">
						</div>
						<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
							<br><br>
							<label>
                            	<input type="checkbox" id="chktax" name="tax" onclick="EnableDisnableTxttax(this)" checked>
                            	<span>คำนวนภาษีหัก ณ ที่จ่ายอัตโนมัติ</span>
                            </label>
						</div>
						<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
							<label for="recipient-name" class="control-label"
								style="font-weight: lighter; font-size: 14px;">เงื่อนไขการหักภาษี</label> 
						    <select class="form-control show-tick">
								<option>หัก ณ ที่จ่าย</option>
								<option>2</option>
								<option>3</option>
						   	</select>
						</div>
					</div>
				</div>
			</div>
					<!-- Modal --> 
			<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h4 class="title" id="defaultModalLabel">เงินเดือน</h4>
			            </div>
			            <div class="col-md-12" style="padding-top: 10px;">
							<label for="recipient-name" class="control-label"
								style="font-weight: lighter; font-size: 14px;">จำนวนเงินเดือน</label> 
						    <input type="text" name="" required class="form-control" value="20000">
						</div>
						<div class="col-md-12" style="padding-top: 10px;padding-bottom: 20px;">
							<label for="recipient-name" class="control-label"
								style="font-weight: lighter; font-size: 14px;">หมายเหตุ</label> 
						    <input type="text" name="" required class="form-control">
						</div>
			            <div class="modal-footer">
			            	<button type="submit" class="btn btn-outline-secondary" data-dismiss="modal">ยกเลิก</button>
			                <button type="button" class="btn btn-success">บันทึก</button>         
			            </div>
			        </div>
			    </div>
			</div>
                                </div>
                                
                                
                                <div class="tab-pane" id="dataincome">
                                    <div class="container" style=" margin-top: 20px;">
                                    	<div class="row">
                                    		<div class="col-6">
                                    			<div class="checkbox-card">
                                    				<div class="form-group">
                                    					<label for="recipient-name" class="control-label"
                                    					style=" font-size: 16px; color: #5C9BD1;">รายได้</label> 
                                    					<div class="form-inline">
															<input type="checkbox" id=""  class="checkme">
 															<label for="recipient-name" class="control-label"
															style=" font-size: 14px; font-weight: lighter; margin-left: 10px ">เบิกค่าเสื่อมอุปกรณ์</label>
																<div class="expenses-box">
																	<input type="text" name="" required class="form-control" placeholder="1,000.00"
																	style="width: 100%; margin-left: 40px">
																</div>
														</div>
                                    				</div>
                                    			</div>
                                    		</div>
                                    		<div class="col-6">
                                    			<div class="checkbox-card">
                                    				<div class="form-group">
                                    					<label for="recipient-name" class="control-label"
														style=" font-size: 16px; color: #5C9BD1;">รายจ่าย</label>
														<div class="form-inline">
															<input type="checkbox" id="cb1" class="checkme">
 															<label for="recipient-name" class="control-label"
															style=" font-size: 14px; font-weight: lighter; margin-left: 10px ">รายจ่าย 01</label>
																<div class="expenses-box">
																	<input type="text" name="" required class="form-control" placeholder="1,000.00"
																	style="width: 92%; margin-left: 40px">
																</div>
														</div>
                                    				</div>
                                    			</div>
                                    			
                                    			<div class="checkbox-card">
                                    				<div class="form-group">
                                    					<div class="form-inline">
                                    						<input type="checkbox" id="" class="checkme">
 															<label for="recipient-name" class="control-label"
 															 style=" font-size: 14px; font-weight: lighter; margin-left: 10px ">รายจ่าย 02
 															</label>
 																<div class="expenses-box">
 																	<input  type="text" name="" required class="form-control" placeholder="1,000.00"
																	style="width: 92%; margin-left: 40px">
 																</div>
                                    					</div>
                                    				</div>
                                    			</div>
                                    			
                                    			<div class="checkbox-card">
                                    				<div class="form-group">
                                    					<div class="form-inline">
                                    						<input type="checkbox" id="" class="checkme">
 															<label for="recipient-name" class="control-label"
 															 style=" font-size: 14px; font-weight: lighter; margin-left: 10px ">รายจ่าย 03
 															</label>
 																<div class="expenses-box">
 																	<input  type="text" name="" required class="form-control" placeholder="1,000.00"
																	style="width: 92%; margin-left: 40px">
 																</div>
                                    					</div>
                                    				</div>
                                    			</div>
                                    		</div>
                                    	</div>
                                    </div>
                            	</div>
                            	
                            	 <div class="tab-pane" id="datapayment">
                            	 	<div class="col-sm-12">
										<div class="form-group">
											<div class="row clearfix" style="margin-top:20px;">
												<div class="col-md-6 col-sm-12">
													<label for="recipient-name" class="control-label"
													style="font-weight: lighter; font-size: 14px;">ประเภทการจ่ายเงิน</label> 
						    						<select class="form-control show-tick">
														<option>โอนเงิน</option>
														<option>เงินสด</option>
						   							</select>
												</div>
											
											<div class="col-md-6 col-sm-12"></div>
												<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
													<label for="recipient-name" class="control-label"
													style="font-weight: lighter; font-size: 14px;">ธนาคาร</label> 
						    						<select class="form-control show-tick">
						    							<option disabled selected>เลือกธนาคาร</option>
														<option>กสิกร</option>
														<option>ไทยพานิช</option>
						   							</select>
												</div>
											
											<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
												<label for="recipient-name" class="control-label"
												style="font-weight: lighter; font-size: 14px;">เลขที่บัญชี</label> 
						   						<input type="text" name="" required class="form-control">
											</div>
											
										<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
										<p> สิทธิประกันสังคม</p>
						    				<input type="radio" id="Choice1" name="right" value="yes" checked>
    										<label for="Choice1" style="font-weight: lighter; font-size: 14px;">บัญชีออมทรัพย์</label>&nbsp;&nbsp;&nbsp;
							
    										<input type="radio" id="Choice2" name="right" value="no">
    										<label for="Choice2" style="font-weight: lighter; font-size: 14px;">บัญชีกระแสรายวัน</label>
										</div>
										
										<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
											<label for="recipient-name" class="control-label"
											style="font-weight: lighter; font-size: 14px;">สาขาธนาคาร</label> 
						    				<input type="text" name="" required class="form-control">
										</div>
										</div>
									 </div>
									</div>
                           		</div>
                           		
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
           </div>
		</form>
		
				</div>
		</div>	
	
<script src="/pages-back/assets/js/jquery-latest.min.js"></script>
<script src="/pages-back/assets/bundles/libscripts.bundle.js"></script> 
<script src="/pages-back/assets/bundles/vendorscripts.bundle.js"></script> 
<script src="/pages-back/assets/bundles//mainscripts.bundle.js"></script> 
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

function EnableDisableTxtright() {
    var no = document.getElementById("no");
    var txtright = document.getElementById("txtright");
    txtright.disabled = no.checked ? false : true;
    txtright.value="";
    if (!txtright.disabled) {
    	txtright.focus();
    }else{
    	txtright.value="750";
    }
}
	
function EnableDisnableTxttax(chktax)
{
	var txttax = document.getElementById("txttax");
	txttax.disabled = chktax.checked?true:false;
	if(!txttax.disabled){
		txttax.focus();
	}
	}

</script>
</html>

