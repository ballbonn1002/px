<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> เพิ่มประเภทพนักงาน</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">เพิ่มประเภทพนักงาน</li>
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
        					<div class="portlet-title" style = "padding-bottom: 40px;">
							<div class="caption" style="padding-left: 13px;">
								<h5>เพิ่มประเภทพนักงาน</h5>
							</div>
							</div>
					</div>		
        		</div>
       <div class="portlet-body">
		<div class="panel-body">
        	<form action="update_empType" method="POST" autocomplete="off">
        	<div class="container">
        		<div class="row">
        		<div class="col-12" style="display:none;">
        				<div class="form-group">
        						<input type="text" id="i" name="id" class="form-control" value="${emptype.employee_type_id}">
        					</div>
        			</div>
        			<div class="col-12">
        				<div class="form-group">
        					<label for="recipient-name" class="control-label">ชื่อประเภทพนักงาน<span style="color:red;"> *</span></label>
        					<div class="input-group">
        						<input type="text" id="" name="name" class="form-control" value="${emptype.name}">
        					</div>
        				</div>
        			</div>
        			<div class="col-12">
        				<label for="recipient-name" class="control-label">ประเภทการจ่ายเงิน<span style="color:red;"> *</span></label><br><br>
        						<div class="form-group">
        							<label class="fancy-radio custom-color-green">
                                        <input type="radio" name="payment" value="0"
                                        	<c:if test="${emptype.payment == 0}">checked</c:if>><span><i></i>&nbsp;รายเดือน</span>
                                     </label>
                                     <label class="fancy-radio custom-color-green">
                                        <input type="radio" name="payment" value="1"
                                        	<c:if test="${emptype.payment == 1}">checked</c:if>><span><i></i>&nbsp;รายวัน</span>
                                    </label>
                                 </div>
        			</div>
        			<div class="col-6">
        				<div class="form-group">
        					<label for="recipient-name" class="control-label">งวดการจ่ายเงิน<span style="color:red;"> *</span></label>
        					<select id="" class="form-control show-tick ms search-select" name="term">
        					<c:forEach var="s" begin="1" end="4">
        							<option value='${s}' <c:if test="${emptype.term == s}">selected</c:if>><c:out value="${s}"/>&nbsp;งวด</option>
        						</c:forEach>
        					</select>
        				</div>	
        			</div>
        			<div class="col-6">
        				<div class="form-group">
        					<label for="recipient-name" class="control-label">จำนวนวันต่องวด<span style="color:red;"> *</span></label>
        					<select id="" class="form-control show-tick ms search-select" name="term_day">
        							<option value="0">วันทำงานจริง</option>
        						<c:forEach var="i" begin="1" end="31">
        							<option value='${i}'><c:out value="${i}"/></option>
        						</c:forEach>
        					</select>
        				</div>
        			</div>
        			<div class="col-12">
        				<div class="form-group">
        					<label for="recipient-name" class="control-label">คำอธิบาย</label>
        					<div class="input-group">
        						<input type="text" id="" name="description" class="form-control" value="${emptype.description}">
        					</div>
        				</div>
        			</div>
        		</div>	
        		<div  style="float: right; margin-top: 3rem; margin-bottom: 1.5rem;">
									<a id="edit" type="reset" class="btn btn-default" href="/employeeType_list" style="width: 96px;">ยกเลิก</a>
									<button id="sub" type="submit" class="btn btn-success" style="width: 96px;">บันทึก</button>
					</div>
        	</div>	
        	</form>
        </div>
      </div>
      </div>
    </div>
   </div>
</div>