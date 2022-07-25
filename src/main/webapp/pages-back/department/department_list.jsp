<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />


<style type="text/css">
/* class สำหรับแถวแรกของรายละเอียด */
.tr_odd {
	background-color: #F8F8F8;
}
/* class สำหรับแถวสองของรายละเอียด */
.tr_even {
	background-color: #F2F2F2;
}
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  
  to {
    opacity: 1;
  }
}

</style>
<script>
				
$("tr:not(:first)").each(function (index ) {
$(this).css('animation-delay',index *0.01 +'s');
}); 
								
</script>

<script	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script	src="https://cdn.jsdelivr.net/gh/mgalante/jquery.redirect@master/jquery.redirect.js"></script>


<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> เเผนก</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">เเผนก</li>
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
						<div class="row">
							<div class="col">
								 <span style="font-weight: bold; font-size: 20px" class="caption-subject font-red sbold uppercase" >เเผนก</span> 
								 <span class="caption-helper font-red"> <%-- ${role.name} --%> </span>					
							</div>
							<div class="col">
								<a href="department_add" class="btn btn-info  float-right" style="margin-bottom: 30px;"  >&nbsp;เพิ่มเเผนก</a>
							</div>
						</div>
					
					</div>
		
			<div class="portlet-body">
				<!-- BEGIN FORM-->
				<div class="portlet box white">
					<!-- <div class="portlet-title"> -->
					<div class="caption"></div>
						<div class="tools">
							<a href="javascript:;" class="collapse" data-original-title=""
							   title=""> </a> <a href="#portlet-config" data-toggle="modal"
						       class="config" data-original-title="" title=""> </a> <a
							   href="javascript:;" class="reload" data-original-title="" title="">
							</a> 
							<a href="javascript:;" class="remove" data-original-title="" title=""> </a>
						</div>
						<!-- </div> -->
						<div class="table-responsive">
							<table id="department_datatable" class="table js-basic-example table-hover table-custom m-b-0 no-footer ">
								<thead>
									<tr>
										<th style="text-align: left; width: 10%">ลำดับ</th>
										<th style="text-align: left; width: 15%">ID</th>
										<th style="text-align: left; width: 20% ">ชื่อเเผนก</th>
										<th style="text-align: left; width: 20% ">รายละเอียด</th>
										<th style="text-align: left; width: 20% ">Prefix ID</th>
										<th style="text-align: center;width: 5% "></th>
									</tr>
								</thead>
					
								<tbody>
									<c:forEach var="test" items="${departmentList}">
									<c:set var="counter" value="${counter + 1}" />
										<tr>
											<td style= "text-align: left; padding-left: 20px ">${counter}</td>
											<td style="text-align: left; padding-top: 10px;">${test.department_id}</td>
											<td style="text-align: left; padding-top: 10px;">${test.name}</td>
											<td style="text-align: left; padding-top: 10px; text-align: left;">${test.description}</td>
											<td style="text-align: left; padding-top: 10px;">${test.prefixId}</td>
																							
											<td style="text-align:right;">    
                                   
                                        		<a id="Edit_btn_${test.department_id}" class="btn btn-outline-success" title="Edit" href="Department_edit?id=${test.department_id}">
                                        		<!-- <a id="Edit_btn_${test.department_id}" class="btn btn-outline-success" title="Edit">-->
                                      
                                      
                                        		<i class="fa fa-pencil"></i></a>
                                        		<a class="btn btn-outline-danger sred-intense sweet-${test.department_id}" title="Delete"
                                        			onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);">
                                        		<i class="fa fa-trash-o"></i></a>
                                       		</td>
										</tr>
											<script>
											/*
											$('#Edit_btn_${test.department_id}').on('click',function(){
												//console.log('${test.department_id}');
												//document.location = "Department_edit?id=${test.department_id}";
														$.ajax({url: "Department_edit",method: "GET",
																data: {"id" : "${test.department_id}" ,},
																	success:function(){
																		//document.location = "Department_edit";
																}})
											})*/
											
											
											document.querySelector('.sweet-${test.department_id}').onclick = function(){
												swal({
												      title: "Are you sure!",
												      text: "You will be deleting this id!",
												      type: "info",
												      showCancelButton: true,
												      confirmButtonClass: 'btn-primary',
												      confirmButtonText: 'OK'
											    }, function (inputValue) {
											        if (inputValue === false) return false;
											        if (inputValue === "") {
											          return false
											        }
											        
											        $.ajax({url: "Department_delete",method: "POST",
														data: {"id" : "${test.department_id}" ,},
															success:function(){
																document.location = "department_list";
														}})
											        //document.location = "Department_delete?id=${test.department_id}";   //?id คือ parameter
											      });
											};
											</script>
									</c:forEach>
								</tbody>
							
						</table>
					</div>
				</div>
			</div>
			<!-- END FORM-->
		</div>
	</div>
	</div>
	</div>
</div>


<link rel="stylesheet"	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>

$(document).ready(function(){	

	var datatb = $("#department_datatable").DataTable({
		"bPaginate": false,
	  	"bLengthChange": false,
	  	"bFilter": true,
	  	"bInfo": false,
	  	"bAutoWidth": false,
		language: {
				search: " ",
        	searchPlaceholder: "Search" 
   		} ,
   	 	columnDefs: [
            {
                searchable: false,
                orderable: false,
                targets: 0,
            },
        ],
        order: [[1, 'asc']],
	});
	
	
	datatb.on('order.dt search.dt', function () {
        let i = 1;
 
        datatb.cells(null, 0, { search: 'applied', order: 'applied' }).every(function (cell) {
            this.data(i++);
        });
    }).draw();
	/*
	var value="${myselect}" ; 
	var d = new Date();
	if(value == 0 ){
		document.getElementById(d.getFullYear()).selected = "true";	
	}else if(value == 2 ){  
		document.getElementById("all").selected = "true";
	}else{
	document.getElementById(value).selected = "true";
   }*/
	
});
</script>

<!-- 
	<link
		href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
		rel="stylesheet" type="text/css" />
	<script src="../assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
		type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script
		src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
		type="text/javascript"></script>
	<script src="../assets/pages/scripts/ui-sweetalert.min.js"
		type="text/javascript"></script>
	<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />
-->