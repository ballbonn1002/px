<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">

<div class="block-header">
    <div class="row">
        <div class="col-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>รายงาน เงินเดือน/ค่าจ้างสะสม</h2>
           <div class="dropdown" style="float:right;">
  				<button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-printer" data-toggle="dropdown"></i></button>
  					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    					<a class="dropdown-item" href="#">Print</a>
    					<a class="dropdown-item" href="#">Export to XLS</a>
    					<a class="dropdown-item" href="#">Export to CSV</a>
    					<a class="dropdown-item" href="#">Export to XML</a>
  					</div>
			</div>     
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">รายงาน</li>
                    <li class="breadcrumb-item active">รายงาน เงินเดือน/ค่าจ้างสะสม</li>
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
							<h6>รายงาน เงินเดือน/ค่าจ้างสะสม</h6>
						</div>
					</div>
					</div>
		<div class="container">
			<div class="row">			
				<div class="col-md-4">
                           <div class="input-group input-large date-picker input-daterange"  data-date-format="dd-mm-yyyy">
                           <input type="date" class="form-control " name="Date-Start" id="F-date" value="">
                           <span class="" style="margin-right:5px;margin-left:5px;font-size:25px"> - </span>
                           <input type="date" class="form-control " name="Date-End" id="E-date" value="">
                        </div>
                    </div>
				<div class="col-md-3">	
					<div class="form-group">
					<div class="input-group">
						<select id="user" class="form-control show-tick ms search-select" name="">
							<option disabled selected hidden >เลือก</option>
							<c:forEach var="user" items="${userList}">
							<option value="${user.id}">${user.department_id} - ${user.name_en}</option>
							</c:forEach>
						</select> 
					</div>
					</div>
				</div>
				</div>
				</div>
				<div class="portlet-body">
				<div class="panel-body">
				<div class="table-responsive">
                    <table class="table m-b-0" style="margin-top:30px;">
                       <thead class="thead-light">
                            <tr>
                                 <th height="41" style="width: 16%;">รายได้</th>
                                 <th height="41" style="width: 20%;">รายการหัก</th>
                                 <th height="41" style="width: 17%;">Date Payment</th>
                                 <th height="41" style="width: 17%;">Date Payment</th>
                                 <th height="41" style="width: 17%;">Date Payment</th>
                                 <th height="41" style="width: 13%;">สรุปยอดรวม</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:forEach var="test" items="${paymentTypeList}">
                         	<tr>
                         			<td>${test.payment_type_id}</td>
                         			<td>${test.payment_type_name}</td>  
                         			<td class="test"></td>
                         			<td>#</td>
                         			<td>#</td>
                         			<td style="color:#449CFF;">#</td>	
                         	<tr>
                         	</c:forEach>
                         	<tr style="background-color:#F7FBFF; color:#449CFF;">
                         			<td>สรุปยอดรวม</td>
                         			<td>#</td>
                         			<td>#</td>
                         			<td>#</td>
                         			<td>#</td>
                         			<td>#</td>
                         	</tr>
                         </tbody>
                        
                     </table>
                     </div>
				</div>
                </div>
      		</div>
   		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$("#user , #F-date , #E-date").on('change', function() {
		var user = $("#user").val();
		var fdate = $("#F-date").val();
		var edate = $("#E-date").val();
		console.log(user);
		console.log(fdate);
		console.log(edate);

		$.ajax({
			url: "checkIdDate",
			method: "POST",
			type: "JSON",
			data: { "userId" : user,
					"f_date" : fdate,
					"e_date" : edate
			},
			success:function(data){
				console.log(data);
		/*	for(var i = 0; i <= data.length; i++){
				$(".test").text(data[i].amount);
				console.log(i); 
			} */
			}
		})
		});
		return false;
	});
</script>