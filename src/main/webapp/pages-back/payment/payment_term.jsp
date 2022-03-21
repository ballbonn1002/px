<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

<!-- MAIN CSS -->
<link rel="stylesheet" href="/pages-back/assets/css/main.css">
<link rel="stylesheet" href="/pages-back/assets/css/color_skins.css">
<link rel="stylesheet" href="/pages-back/assets/css/inbox.css">
</head>
<body>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<div class="block-header">
	<div class="row">
    	<div class="col-lg-6 col-md-8 col-sm-12">
      		<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Payment Term</h2>
            	<ul class="breadcrumb">
                	<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">Payment Term</li>
        		</ul>
		</div>            
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-12">
    	<div class="card">
    		<!-- menu mobile size -->
    		<div class="mobile-left">
            	<a class="btn btn-primary toggle-email-nav collapsed" data-toggle="collapse" href="#email-nav" role="button" aria-expanded="false" aria-controls="email-nav">
               	<span class="btn-label">
                	<i class="la la-bars"></i>
                </span>Menu</a>
        	</div>
        	<div class="mail-inbox">
        		<!-- left menu -->
        		<div class="mail-left collapse" id="email-nav">
        			<div class="mail-compose m-b-20" style="padding-bottom:20px">
                    	<h2 style="font-size: 20px;">Payment Term</h2>
                    </div>
                    <div class="mail-side">
                    	<ul class="nav li-type">
                    		<!-- ${emptypeList} -->
                    		<c:forEach var="test" items="${emptypeList}">
                    			<li><a href="javascript:void(0);">${test.name}</a></li>
                    		</c:forEach>
                        </ul>
                    </div>
        		</div>
        		<!-- right -->
        		<div class="mail-right">
        			<form>
        				<div class="header">
				        	<h2>พนักงานประจำ</h2>
				        	<ul class="header-dropdown">
				            	<button type="reset" class="btn btn-outline-secondary">Cancel</button> 
								<button type="submit" class="btn btn-success">Save</button>
				            </ul>
				        </div>
				        
				        <div class="col-sm-12" style="padding-top:20px">
                    		<div class="form-group">
	                    		 <select class="form-control show-tick list-terms">
	                                <option value="one">จ่ายเงิน 1 งวด</option>
	                                <option value="two">จ่ายเงิน 2 งวด</option>
	                                <option value="three">จ่ายเงิน 3 งวด</option>
	                                <option value="four">จ่ายเงิน 4 งวด</option>
	                             </select>
                    		</div>
                    	</div>
                    	
                    	<div class="col-sm-12 one-term">
                    		<div class="form-group" style="padding:10px 10px;background-color: #f4f7f6; border-radius: 5px;">
                    			<h6 style="color: #4a9ffe;">งวดการจ่ายเงิน 1</h6>
	                    		<div class="row clearfix" style="padding-top:20px;">
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>Start Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>End Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>จำนวนวัน/เดือน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>วันที่จ่ายเงิน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
	                    		</div>
                    		</div>
                    	</div>
                    	
                    	<div class="col-sm-12 two-term">
                    		<div class="form-group" style="padding:10px 10px;background-color: #f4f7f6; border-radius: 5px;">
                    			<h6 style="color: #4a9ffe;">งวดการจ่ายเงิน 2</h6>
	                    		<div class="row clearfix" style="padding-top:20px;">
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>Start Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>End Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>จำนวนวัน/เดือน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>วันที่จ่ายเงิน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
	                    		</div>
                    		</div>
                    	</div>
                    	
                    	<div class="col-sm-12 three-term">
                    		<div class="form-group" style="padding:10px 10px;background-color: #f4f7f6; border-radius: 5px;">
                    			<h6 style="color: #4a9ffe;">งวดการจ่ายเงิน 3</h6>
	                    		<div class="row clearfix" style="padding-top:20px;">
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>Start Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>End Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>จำนวนวัน/เดือน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>วันที่จ่ายเงิน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
	                    		</div>
                    		</div>
                    	</div>
                    	
                    	<div class="col-sm-12 four-term">
                    		<div class="form-group" style="padding:10px 10px;background-color: #f4f7f6; border-radius: 5px;">
                    			<h6 style="color: #4a9ffe;">งวดการจ่ายเงิน 4</h6>
	                    		<div class="row clearfix" style="padding-top:20px;">
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>Start Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>End Date</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>จำนวนวัน/เดือน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick 1-31"></select>
		                    			</div>
		                    		</div>
		                    		<div class="col-md-6 col-sm-12">
		                    			<label>วันที่จ่ายเงิน</label>
		                    			<div class="form-group">
		                    				<select class="form-control show-tick">
		                    					<option>สิ้นเดือน</option>
	                                			<option>กลางเดือน</option>
		                    				</select>
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
</div>

<script> 
	<!-- date 1-31 -->
    $(function(){
        var $select = $(".1-31");
        for (i=1;i<=31;i++){
            $select.append($('<option></option>').val(i).html(i))
        }
    });  

    <!-- show/hide terms -->
	$(document).ready(function(){
	    $(".list-terms").change(function(){
	        $( "select option:selected").each(function(){
	            if($(this).attr("value")=="one"){
	                $(".one-term").show();
	                $(".two-term").hide();
	                $(".three-term").hide();
	                $(".four-term").hide();
	            }
	            if($(this).attr("value")=="two"){
	            	$(".one-term").show();
	                $(".two-term").show();
	                $(".three-term").hide();
	                $(".four-term").hide();
	            }
	            if($(this).attr("value")=="three"){
	            	$(".one-term").show();
	                $(".two-term").show();
	                $(".three-term").show();
	                $(".four-term").hide();
	            }
	            if($(this).attr("value")=="four"){
	            	$(".one-term").show();
	                $(".two-term").show();
	                $(".three-term").show();
	                $(".four-term").show();
	            }
	        });
	    }).change();
	});
	
</script>
</body>
</html>
