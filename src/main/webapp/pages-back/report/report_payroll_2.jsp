<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
		
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>

<script src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"type="text/javascript"></script>



<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"type="text/javascript"></script>
			
<script src="../assets/pages/scripts/ui-sweetalert.min.js"type="text/javascript"></script>

<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />
		
		
<script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/fixedcolumns/4.1.0/js/dataTables.fixedColumns.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/4.1.0/css/fixedColumns.dataTables.min.css">




		
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
table{
text-align:center;
}
 .view {
  margin: auto;
  width: 1230px;
}

.wrapper {
  position: relative;
  overflow: auto;
  border: 1px solid black;
  white-space: nowrap;
}

.sticky-col {
  position: -webkit-sticky;
  position: sticky;
  background-color: white;
}

.first-col {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  left: 0px;
}

.second-col {
  width: 150px;
  min-width: 150px;
  max-width: 150px;
  left: 100px;
}
.last-first-col {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  right: 0px;
}
.last-second-col {
  width: 150px;
  min-width: 150px;
  max-width: 150px;
  right: 100px;
}
.last-third-col {
  width: 150px;
  min-width: 150px;
  max-width: 150px;
  right: 250px;
}
</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-12 col-md-8 col-sm-12">
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>รายงาน รายการจ่ายเงินเดือน
              <span style="float:right;"> <button class="btn btn-outline-secondary"  data-toggle="dropdown"><i class="fa fa-print"></i></button></span></h2>
              
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item" style="font-size:14px;">รายงาน</li>
                    <li class="breadcrumb-item active" style="font-weight:Semibold;font-size:14px">รายงาน รายการจ่ายเงินเดือน</li>
      
                </ul>
                
        </div> 
                   
    </div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="header">
				<div style="color:#449CFF">
					<h6 class="card-title" >${payment_groupList.name}<span style="float:right;">#${payment_groupList.payment_group_id}</span></h6>
					<hr style="border-top: 2px solid #449CFF;">
				</div>
			</div>
			<div class="body">
				<div class="portlet light bordered">
					<div class="portlet-body">
						<div class="portlet box white">
							<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ช่วงวันที่</label>
												<input type="text" name="between_date" class="form-control"  value="${payment_groupList.start_date} - ${payment_groupList.end_date}" style="border:none; background-color:transparent;" readonly />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">วันที่ชำระ</label>
												<input type="text" name="payment_date" class="form-control"  value="${payment_groupList.payment_date }" style="border:none; background-color:transparent;" readonly />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ประกันสังคม</label>
												<input type="text" name="social" class="form-control"  value="${payment_groupList.social_security }" style="border:none; background-color:transparent;" readonly />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">พนักงาน</label>
												<input type="text" name="employee" class="form-control"  value="${payment_groupList.status }" style="border:none; background-color:transparent;" readonly />
											</div>
										</div>
									</div>
									<div class="">
										
											<div class="view">
  <div class="wrapper">
    <table class="table">
      <thead>
        <tr>
          <th class="sticky-col first-col">Number</th>
          <th class="sticky-col second-col">Employer</th>
          <th>Salary</th>
          <th>OTx1.5</th>
          <th>OTx2</th>
          <th>OTx3</th>
          <th>เบิกค่าเดินทาง</th>
          <th>ค่าอุปกรณ์</th>
          <th>ประกันสังคม</th>
          <th>กองทุนสำรองเลี้ยงชีพ</th>
          <th>ภาษีหัก ณ ที่จ่าย</th>
          <th>สถานะ</th>
          <th class="sticky-col last-third-col">สรุปรายได้ เพิ่มเติม</th>
          <th class="sticky-col last-second-col">สรุปรายการหัก</th>
          <th class="sticky-col last-first-col">รายได้สุทธิ</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
       <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
       <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
        
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
        </tr>
        <tr>
          <td class="sticky-col first-col">1</td>
          <td class="sticky-col second-col">Mark</td>
          <td>Ham</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td>Micro</td>
          <td class="sticky-col last-third-col">Micro</td>
          <td class="sticky-col last-second-col">Micro</td>
          <td class="sticky-col last-first-col">Micro</td>
                    
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
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
    var table = $('#example').DataTable( {
        scrollY:        "300px",
        scrollX:        true,
        scrollCollapse: true,
        paging:         false,
        fixedColumns:   {
            left: 2
        }
    } );
} );
</script>