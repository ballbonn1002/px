<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%> --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/css/main.css">

<!-- <script src="pages-back/assets/vendor/jquery-datatable/jquery.dataTables.js" type="text/javascript"></script>
<script src="pages-back/assets/vendor/jquery-datatable/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="pages-back/assets/vendor/jquery-datatable/dataTables.bootstrap4.min.js" type="text/javascript"></script>
<link href="pages-back/assets/vendor/jquery-datatable/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/> -->
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">


    
<div class="block-header">
	<div class="row">
    	<div class="col-lg-6 col-md-8 col-sm-12">
      		<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> รายงานข้อมูลการทำงาน</h2>
            	<ul class="breadcrumb">
                	<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">รายงาน</li>
                    <li class="breadcrumb-item active">รายงานข้อมูลการทำงาน</li>
        		</ul>
		</div>            
	</div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12">
	<div class="card">
		<div class="header">
			<h2>รายงานการทำงานของพนักงาน</h2>
			<table class="table-hover" id="myTable">
				<thead>
					<tr>
						<th height="41">ลำดับ</th>
						<th height="41">พนักงาน</th>
						<th height="41">วันทำงาน</th>
						<th height="41">ชั่วโมงการทำงานจริง</th>
						<th height="41">ลางาน (วัน)</th>
						<th height="41">ขาดงาน (วัน)</th>
						<th height="41">มาสาย (นาที)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userlist}" varStatus="status">
						<tr data-html="true">
						<c:set var="counter" value="${counter + 1}" />
							<td>${counter}</td>
							<td><a href="reportWorkSum?id=${user.id}">${user.department_id} - ${user.name}</a></td>
							<td>${user.id}</td>
						</tr>
					</c:forEach>
					<!-- <tr>
						<td>2</td>
						<td>Sirorat</td>
					</tr> -->
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
$(document).ready( function () {
    $('#myTable').DataTable({
    	"aLengthMenu": [[20, 40, 60, -1], [20, 40, 60, "All"]],
        "iDisplayLength": 20,
    });
    
});
</script>
