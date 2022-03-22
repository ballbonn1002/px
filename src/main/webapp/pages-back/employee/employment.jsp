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
						<form action="" method="POST">
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
						</form>
				</div>
			</div>	
		</div>
	</div>


