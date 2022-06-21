<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="js/app-ajax.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.title{
		font-size: 16px; 
		font-family:'Open Sans';
        font-weight: bold;
	}
	 input{
        border: none;
    } 
</style>
<div class="container-fluid">
<div class="block-header">
	<div class="row">
		<div class="col lg-6 col-md-8 col-sm-12">
		<h3 class="title"><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>ข้อมูลส่วนตัว</h3>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item">ข้อมูลส่วนตัว</li>
			</ul>
		</div>
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-6 col-md-12">
		<div class="card" >
						<div class="header" >
							<h6 class="title">ข้อมูลส่วนตัว</h6>
						</div>
						<div class="body">
            				<div class="form-group row">
    							<label  class="col-md-3 ">User Name</label>
    							<div class="col-md-5">
      								<!-- <label></label> -->
    							</div>
  							</div>
            				<div class="form-group row">
    							<label  class="col-md-3 ">Role</label>
    							<div class="col-md-5">
    							</div>
  							</div>
            				<div class="form-group row">
    							<label  class="col-md-3 ">Employee</label>
    							<div class="col-md-5">
    							</div>
  							</div>
            				<div class="form-group row">
    							<label  class="col-md-3 ">ชื่อภาษาไทย</label>
    							<div class="col-md-5">
    							</div>
  							</div>
            				<div class="form-group row">
    							<label  class="col-md-3 ">Email</label>
    							<div class="col-md-5">
    							</div>
  							</div>
            				<div class="form-group row">
    							<label  class="col-md-3 col-form-label">Phone</label>
    							<div class="col-md-5">
    							</div>
  							</div>
            				<div class="form-check">
      							<input type="checkbox" class="form-check-input" checked >
      							<label class="form-check-label">Is Active</label>
    						</div>
    				</div>
		</div>
		</div>
            <!-- เปลี่ยนรหัสผ่าน -->
			<div class="col-lg-6 col-md-12"> 
			<div class="card">
						<div class="header">
							<h6 class="title">เปลี่ยนรหัสผ่าน</h6>
						</div>
						<div id="word" class="body">
							<p>It's a good idea to use a strong password</p>
							<button type="button" class="btn btn-info">change password</button>
						</div>
						
			<!-- Change password -->
						<div id="change" style="display:none;">
                                <div class="body">
                                    <p style="color:red ;">รหัสผ่านต้องมีความยาวอย่างน้อย 8ตัวอักษร ประกอบไปด้วยตัวอักษรพิมพ์ใหญ่(A-Z)อย่างน้อย 1 ตัว,</p>
                                    <p style="color:red ;">ตัวอักษรพิมพ์เล็ก (a-z) อย่างน้อย 1 ตัวและตัวเลข (0-9) อย่างน้อย1ตัว</p>  
                                            <div class="form-group">
                                                	<p style="font-size:16px">current password<span style="color: red;"> *</span></p>                                            
                                                	<input type="password" class="form-control">
                                                	<br>
                                             <div class="form-group">
                                                	<p style="font-size:16px">password<span style="color: red;"> *</span></p>                                            
                                                	<input type="password" class="form-control">
                                                	<br>
                                             <div class="form-group">
                                                	<p style="font-size:16px">confirm password<span style="color: red;"> *</span></p>                                            
                                                	<input type="password" class="form-control">
                                             <br>
                                					<div class="pull-right" style="margin-bottom:20px">
                                    						<button id="hide" type="button" class="btn btn-default">ยกเลิก</button>
                                    						<button type="button" class="btn btn-success">บันทึก</button>
                                					</div>

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
	$(document).ready(function(){
		$("button").click(function(){
			$("#change").fadeIn();
		});
		$("button").click(function(){
	    	$("#word").hide();
		});
	});
</script>
<script>
	$(document).ready(function(){
  		$("#hide").click(function(){
    		$("#change").hide();
  		});
  		$("#hide").click(function(){
    		$("#word").show();
		});
	});
</script>
