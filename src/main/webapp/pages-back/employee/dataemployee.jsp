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
		input[name="gender"] {
			accent-color: #0275d8;
			
		}
		input[type=radio] {
    	border: 0px;
   		width: 5%;
    	height: 1.2em;
		}
		
	</style>
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
							<div class="actions right" style="text-align: right; margin-bottom: 30px; ">
								<button type="reset" class="btn btn-outline-secondary"> ยกเลิก</button>
								<button type="submit" class="btn btn-primary"> บันทึก</button>
								<!--  class="btn btn-circle btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a> -->  <!--  class="btn green-meadow"-->  <!-- <i
								class="fa fa-plus"></i> -->
							</div>
					</div>
			<jsp:include page="layoutemployee.jsp" />

					<div class="container" style="margin-left: 20px; margin-top: 5px;">
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
						</form>
				</div>
			</div>	
		</div>
	</div>
</div>


