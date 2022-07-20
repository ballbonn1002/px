<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" type="text/css" />
<!-- VENDOR CSS -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<style>
input[type="checkbox"] {
	accent-color: #0275d8;
}

.select2-container .select2-selection--single {
        height: 36px;
        border-color: #C2CAD8 !important;
    }
</style>

<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>เพิ่มผู้ใช้งานระบบ</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Authority</li>
                    <li class="breadcrumb-item active">ผูู้ใช้งานระบบ</li>
                    <li class="breadcrumb-item active">เพิ่มผู้ใช้งานระบบ</li>
                </ul>
        </div>            
    </div>
</div>

<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">   
            
				<div class="portlet light bordered">
					<div class="portlet-title" style = "padding-bottom: 40px;">
						<div class="caption" style="padding-left: 13px;" >
							<h5>เพิ่มผู้ใช้งานระบบ</h5>
						</div>
					</div>
				
	<div class="portlet-body">
				<!-- BEGIN FORM-->
		<div class="panel-body">
				<!-- Action Form -->
		<form action="save_sysuser" method="POST" autocomplete="off"> 
			<div class="container">
				<div class="row">
					<div class="col-6 ">
						<div class="form-group">
								<label for="recipient-name" class="control-label">User ID<span style="color:red;"> *</span></label> 
								<div class="input-group mb-3">
									<input type="text" id="sysuserID" name="IDuser" class="form-control" pattern="[A-Za-z0-9.]{1,}" value="${sysuserList.sys_user_id}">  
                                </div>  
                              </div>
                          </div>
                          <div class="col-6">
						<div class="form-group">
								<label for="recipient-name" class="control-label">Role<span style="color:red;"> *</span></label> 
								<select id="userRole" class="js-example-basic-multiple-limit" style="width: 100%;" name="user_role">
												<option disabled selected hidden selected = "selected"> </option>
												<c:forEach var="sysrole" items="${sysroleList}">	
													<option value="${sysrole.name}"
														<c:if test="${sysuserList.sys_role_id eq sysrole.name }"> selected </c:if>>${sysrole.name}</option>
												</c:forEach>
									</select>
						</div>
						</div>    
                           <div class="col-12">  
								<div id="canuse" style="color: #28A745; text-color:#28A745; display:none; width:100%;">
									<i class="icon-check"></i>&nbsp;&nbsp;You can use this id
								</div>
								<div id="cannotuse" style="color: #FAAD14; text-color:#FAAD14; display:none;">
									<i class="icon-check"></i>&nbsp;&nbsp;You can not use this id
								</div>
								<div id="nofill" style="color: #FAAD14; text-color:#FAAD14; display:none;">
									<i class="icon-check"></i>&nbsp;&nbsp;Please, Enter userID
								</div>
							</div> 
						
							<div class="col-6">
							<div class="form-group">		
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">Employee</label>
								<div class="input-group mb-3">	
									<select id="username"  name="user_name" class="js-example-basic-multiple-limit1" style="width: 100%;">
											 	<option disabled hidden selected = "selected" > </option>  
												 <c:forEach var="user" items="${userList}">	
													<option value="${user.id}"
														<c:if test="${sysuserList.user_id eq user.id }"> selected </c:if>>${user.id}</option>
												</c:forEach>
									</select>
									</div>
							</div>
							</div>
							<div class="col-6">
						<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">ชื่อ ภาษาไทย</label> 
								<input id="name" type="text" name="user_nameth" class="form-control" value="${sysuserList.name_th}">
						</div>
					</div>
							<div class="col-6">
							<div class="form-group" >
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">Email</label> 
								 <input id="email" type="email" name="user_email"  class="form-control email" placeholder="example@example.com"  
								 pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" value="${sysuserList.email}">
							</div>
							
							  <input type="checkbox"  id="userIsactive" name="user_isactive"  value="${sysuserList.is_active}" 
							  style="margin-top: 15px; margin-left: 5px; "
							  	<c:if test="${fn:contains(sysuserList.is_active, '1')}">checked</c:if>>
							  <input id='checkboxHidden'  type='hidden' value='0' name='user_isactive'>
  							 <label for="vehicle1" style="margin-left: 10px; margin-top: 12px;"> Is Active </label>
  						</div>
					
					<div class="col-6">
						<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">Phone</label> 
								<input id="tel" type="text" name="user_tel" class="form-control mobile-phone-number" 
								pattern="[0-9]{10}" maxlength="10" value="${sysuserList.phone}">
						</div>
					</div>
				</div>
				<div id="bt" style="text-align: right; margin-top: 1.5rem; margin-bottom: 1.5rem; display:none;">
									<a id="edit1" type="reset" class="btn btn-secondary" href="SystemUser_list" style="width: 8%;">ยกเลิก</a>
									<button id="submit1" type="submit" class="btn btn-success" style="width: 8%;" value="update_sysuser">บันทึก</button>
								</div> 
			</div>
			<hr>
		<div class="portlet-title" style = "padding-bottom: 30px; padding-top: 15px; padding-left: 13px;">
			<div class="caption">
				<h5>ตั้งรหัสผ่าน</h5>
			</div>
		</div>
	<div class="container">
		<div class="portlet-body">
		<div class="panel-body">
				<div class="row">
			<div id="resetpass" style="display:none; padding-left: 13px;">
				<button type="button" class="btn btn-info">Reset password</button>
			</div>
					<div class="col-6">
			<div id="pass">
				   	<div class="form-group">
                        	<label for="" class="control-label">Password</label>
                             	<input type="password" class="form-control"  id="password" name="password" placeholder="Password" value="${sysuserList.password}">
                      </div>
 				
				   <div class="form-group">
                        <label for="" class="control-label">Confirm Password</label>
                             <input type="password" class="form-control" id="password_c" name="password_confirm" placeholder="Password" value="${sysuserList.password}">
                   </div>
                   
                   <div id="notsame" style="color:#E7505A; text-color::#E7505A; display:none;">
                   		<i class="fa fa-exclamation-circle" ></i>&nbsp;&nbsp;Not Matching
                   </div>
                   <div id="same" style="color:#28A745; text-color:#28A745; display:none;">
                   		<i class="fa fa-exclamation-circle" ></i>&nbsp;&nbsp;Matching
                   </div>
               </div>
           </div> 
                <div class="col-6">
                <div id="chkpass">
                		<div style="padding : 25px; border: 1px solid #CED4DA; border-radius: 4px;">
                      			<i id="aaa" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร <br><br>
                      			<i id="up" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;ตัวอักษรพิมพ์ใหญ่ (A-Z) อย่างน้อย 1 ตัวอักษร <br><br>
                      			<i id="low" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;ตัวอักษรพิมพ์เล็ก (a-z) อย่างน้อย 1 ตัวอักษร <br><br>
                      			<i id="num" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;ตัวเลข (0-9) อย่างน้อย 1 ตัวอักษร 
                      	</div>
                </div>
				</div>
								    </div>
								   </div>
							    <div  style="text-align: right; margin-top: 3rem; margin-bottom: 1.5rem;">
									<a id="edit" type="reset" class="btn btn-secondary" href="SystemUser_list" style="width: 8%;">ยกเลิก</a>
									<button id="sub" type="submit" class="btn btn-success" style="width: 8%;" disabled>บันทึก</button>
								</div>
							</div>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>	
			</div>
		</div>	
	</div>
<script>
$(document).ready(function() {
	$(".js-example-basic-multiple-limit1").select2({
		dropdownAutoWidth : true,
	    placeholder: "เลือก",
	    allowClear: true
	});
	
	$(".js-example-basic-multiple-limit").select2({
		dropdownAutoWidth : true,
	    placeholder: "เลือก",
	    allowClear: false
	});
});
</script>
<script>
 $(document).ready(function(){
	 var sysuserID = $('#sysuserID').val();
	 var userRole = $('#userRole').val();
	 var userID = $('#username').val();
	 var name = $('#name').val();
	 var email = $('#email').val();
	 var tel = $('#tel').val();
	 var isactive = $('#userIsactive').val();
	 
	 if(sysuserID != null && userRole != null){
		 $('#sysuserID').prop('readonly', true);
		 $('#checkID').hide();
		 $('#save2').show();
		 $('#pass').hide();
		 $('#chkpass').hide();
		 $('#resetpass').show();
		 $('#sub').hide();
		 $('#edit').hide();
		 $('#userRole , #username , #name , #email , #tel , #userIsactive').on('change', function() {
			 $('#bt').fadeIn();
			 $('#resetpass').show();
			 $('#pass').hide();
			 $('#chkpass').hide();
			 $('#sub').hide();
			 $('#edit').hide();
		 }); 
	 }	
	 $('#resetpass').on('click', function() {
		 $('#resetpass').hide();
		 $('#pass').fadeIn();
		 $('#chkpass').fadeIn();
		 $('#sub').fadeIn();
		 $('#edit').fadeIn();
		 $('#bt').hide();
	 });
	 
	 $("#reset").on("click", function () {
		 $('#username')[0].selectedIndex = 0; 
			if(sysuserID != null && userRole != null ){
			$('#bt').fadeIn();
			 $('#resetpass').show();
			 $('#pass').hide();
			 $('#chkpass').hide();
			 $('#sub').hide();
			 $('#edit').hide();
			}
		});
 });
</script>

<script>
$('#userIsactive').on('change', function(){
	   this.value = this.checked ? 1 : 0;
	   console.log(this.value);
	});
	
$("#submit").click(function () {
	if(document.getElementById("user_isactive").checked){
	document.getElementById('checkboxHidden').disabled = true;
	}
	});
	
	$(document).ready(function () {
		$('#username').on('change', function() {
			var value = $('#username').val();
			//var role = $('#userRole').val();
			//console.log(role);
			//console.log(value);
			
			if(value == null){
				$('#email').empty();
				$('#name').empty();
				$('#tel').empty();
			} 
			
			$.ajax({
				url: "CheckID"	,
				method: "POST" ,
				type: "JSON" ,
				data: {
						"userid" : value ,
					},
					success:function(data){
						console.log(data);
						   $('#email').val(data.email);
						   $('#name').val(data.name);
						   $('#tel').val(data.phoneNum);
					}
			})
		});
			return false;
	});

</script>
<script>
$(document).ready(function () {
	$('#sysuserID').on('keyup', function() {
		var id = $('#sysuserID').val();
		if(id != ""){
			$.ajax({
				url: "CheckUserID",
				method: "POST" ,
				type: "JSON" ,
				data: {
					"sysuserCheckID" : id
				},
				success:function(data){
					console.log(data);
					if (data.toString().indexOf("1") != -1) {
						$("#canuse").hide();
						$("#cannotuse").show();
						$("#nofill").hide();
					} else {
						$("#canuse").show();
						$("#cannotuse").hide();
						$("#nofill").hide();					
				} 
				}
			})
			}else{
				$("#canuse").hide();
				$("#cannotuse").hide();
				$("#nofill").show();
	}
		})
	});
</script>
<script>
	$(document).ready(function(){
		$('#password , #password_c').keyup(function(){
			var pw = $('#password').val();
			var pwc = $('#password_c').val();
			
			if(pw == pwc && pw.length >= 8 && pwc.search(/[a-z]/) != -1 && pwc.search(/[A-Z]/) != -1 && pwc.search(/[0-9]/) != -1 ){
				document.getElementById("sub").disabled = false;
			}
			
				if(pw.length >= 8){
					$("#aaa").css({"color":"#28A745","opacity":"1"});
				}if(pw.length < 8){
					$("#aaa").css({"color":"none","opacity":"0.3"});
				}if(pw.search(/[a-z]/) != -1){
					$("#low").css({"color":"#28A745","opacity":"1"});
				}if(pw.search(/[a-z]/) == -1){
					$("#low").css({"color":"#none","opacity":"0.3"});
				}if(pw.search(/[A-Z]/) != -1){
					$("#up").css({"color":"#28A745","opacity":"1"});
				}if(pw.search(/[A-Z]/) == -1){
					$("#up").css({"color":"#none","opacity":"0.3"});
				}if(pw.search(/[0-9]/) != -1){
					$("#num").css({"color":"#28A745","opacity":"1"});
				}if(pw.search(/[0-9]/) == -1){
					$("#num").css({"color":"#none","opacity":"0.3"});
				}
				if(pw == pwc){
					$("#same").show();
					$("#notsame").hide();
				
				}else{
					$("#same").hide();
					$("#notsame").show();
			}
			$.ajax({
				url : "password" ,
				method: "POST" ,
				type: "JSON" ,
				data: { "password" : pwc 
				},
				success:function(data){
				//console.log(data);
				}
			})
		})	
	});
</script>