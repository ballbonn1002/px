<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<!-- VENDOR CSS -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">
</head>
<body>

<div class="block-header">
	<div class="row">
    	<div class="col-lg-6 col-md-8 col-sm-12">
      		<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Payment Term</h2>
            	<ul class="breadcrumb">
                	<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">รายการ รายได้/รายการหัก</li>
        		</ul>
		</div>            
	</div>
</div>
<div class="row clearfix">
	<div class="col-lg-6 col-md-12 col-sm-12">
    	<div class="card">
        	<div class="header">
            	<h2>รายการ รายได้</h2>
                <ul class="header-dropdown">
					<li><button class="btn btn-info" onclick='add_income()'>เพิ่มรายได้</button></li>
				</ul>
            </div>
            <div class="body">
            	<table id="income-table" class="table">
					<thead>
				    	<tr style="text-align: left;">
					    	<th height="41" style="width: 5%;"></th>
					        <th height="41" style="width: 5%;">ลำดับ</th>
					        <th height="41" >ID</th>
							<th height="41" >รายได้</th>
							<th height="41" style="width: 5%;"></th>
				        </tr>
					</thead>
					<tbody id="tbl_income">
						<tr>
							<td><i class="table-dragger-handle sindu_handle"></i></td>
                            <td class='sno_income'>1</td>
                            <td>SL</td>
                            <td>เงินเดือน</td>
                            <td></td>
                        </tr>
                        <tr>
							<td><i class="table-dragger-handle sindu_handle"></i></td>
                            <td class='sno_income'>2</td>
                            <td>OT1</td>
                            <td>ล่วงเวลา x 1.5</td>
                            <td></td>
                        </tr>
                        <tr>
							<td><i class="table-dragger-handle sindu_handle"></i></td>
                            <td class='sno_income'>3</td>
                            <td>OT2</td>
                            <td>ล่วงเวลา x 2</td>
                            <td></td>
                        </tr>
                                
					</tbody>
				</table>
        	</div>
     	</div>
     </div>
     
     <div class="col-lg-6 col-md-12 col-sm-12">
    	<div class="card">
        	<div class="header">
            	<h2>รายการ รายการหัก</h2>
                <ul class="header-dropdown">
					<li><a class="btn btn-info" onclick='add_ep()'>เพิ่มรายจ่าย</a>
				</ul>
            </div>
            <div class="body">
            	<table id="expenses-table" class="table">
					<thead>
				    	<tr style="text-align: left;">
					    	<th height="41" style="width: 5%;"></th>
					        <th height="41" style="width: 5%;">ลำดับ</th>
					        <th height="41" >ID</th>
							<th height="41" >รายหัก</th>
							<th height="41" style="width: 5%;"></th>
				        </tr>
					</thead>
					<tbody id="tbl_ep">
						<tr>
							<td><i class="table-dragger-handle sindu_handle"></i></td>
                            <td class='sno_ep'>1</td>
                            <td>SSI</td>
                            <td>ประกันสังคม</td>
                            <td></td>
                        </tr>
					</tbody>
				</table>
        	</div>
     	</div>
     </div>       
</div>

<!-- Javascript --> 
<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script src="pages-back/assets/vendor/table-dragger/table-dragger.min.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>

<script>
	<!--Dragger rows-->
    tableDragger(document.querySelector("#income-table"), { mode: "row", onlyBody: true });
    tableDragger(document.querySelector("#expenses-table"), { mode: "row", onlyBody: true });
    
    <!--income add and remove-->
    function add_income()
    {
    	var sno_income=document.querySelectorAll(".sno_income").length;
      	sno_income++;
      	var tr=document.createElement("tr");
      	tr.innerHTML="<td><i class='table-dragger-handle sindu_handle'></i></td><td class='sno_income'>"+sno_income+"</td> <td><input type='text'class='form-control' id='id_income'></td> <td><input type='text'class='form-control' id='name_income'></td> <td><a class='btn btn-outline-secondary' onclick='cancle_income(this)'><i class='fa fa-times'></i></a> <a class='btn btn-outline-success' onclick='add_new_income(this)'><i class='fa fa-save'></i></a></td>";
      	document.getElementById("tbl_income").appendChild(tr);
    }
    function cancle_income(e)
    {
      	var n=document.querySelector("#tbl_income").querySelectorAll("tr").length;
    	var ele=e.parentNode.parentNode;
    	ele.remove();
    	serial_no_income();
      
    }
    function add_new_income(e)
    {
    	var sno_income=document.querySelectorAll(".sno_income").length;
      	var id_income=document.getElementById("id_income").value;
     	var name_income=document.getElementById("name_income").value;
		
     	var table=document.getElementById("income-table");
     	var table_len=(table.rows.length)-1;
     	var row = table.insertRow(table_len).outerHTML="<tr><td><i class='table-dragger-handle sindu_handle'></i></td><td class='sno_income'>"+sno_income+"</td><td>"+id_income+"</td><td>"+name_income+"</td><td><a class='btn btn-outline-danger' onclick='delete_income(this)'><i class='fa  fa-trash-o'></i></a> </td></tr>";

     	document.querySelectorAll(".sno_income").length;
     	document.getElementById("id_income").value;
     	document.getElementById("name_income").value;
     	
     	var ele=e.parentNode.parentNode;
    	ele.remove();
    	serial_no_income();
    }
    function delete_income(e) {
    	var n=document.querySelectorAll("tr").length;
    	if(n>1&&confirm("Are You Sure")==true){
        	var ele=e.parentNode.parentNode;
        	ele.remove();
        	serial_no_income();
          }
    }
    function serial_no_income(){
      	var cls=document.querySelectorAll(".sno_income");
      	for(var i=0;i<cls.length;i++)
      	{
    		cls[i].innerHTML=i+1;
      	}
    }

    <!--expenses add and remove-->
    function add_ep()
    {
    	var sno_ep=document.querySelectorAll(".sno_ep").length;
      	sno_ep++;
      	var tr=document.createElement("tr");
      	tr.innerHTML="<td><i class='table-dragger-handle sindu_handle'></i></td><td class='sno_ep'>"+sno_ep+"</td> <td><input type='text'class='form-control' id='id_ep'></td> <td><input type='text'class='form-control' id='name_ep'></td> <td><a class='btn btn-outline-secondary' onclick='cancle_ep(this)'><i class='fa fa-times'></i></a> <a class='btn btn-outline-success' onclick='add_new_ep(this)'><i class='fa fa-save'></i></a></td>";
      	document.getElementById("tbl_ep").appendChild(tr);
    }
    function cancle_ep(e)
    {
      	var n=document.querySelector("#tbl_ep").querySelectorAll("tr").length;
    	var ele=e.parentNode.parentNode;
    	ele.remove();
    	serial_no_ep();
    }
    function add_new_ep(e)
    {
    	var sno_ep=document.querySelectorAll(".sno_ep").length;
      	var id_ep=document.getElementById("id_ep").value;
     	var name_ep=document.getElementById("name_ep").value;
		
     	var table=document.getElementById("expenses-table");
     	var table_len=(table.rows.length)-1;
     	var row = table.insertRow(table_len).outerHTML="<tr><td><i class='table-dragger-handle sindu_handle'></i></td><td class='sno_ep'>"+sno_ep+"</td><td>"+id_ep+"</td><td>"+name_ep+"</td><td><a class='btn btn-outline-danger' onclick='delete_ep(this)'><i class='fa  fa-trash-o'></i></a> </td></tr>";

     	document.querySelectorAll(".sno_ep").length;
     	document.getElementById("id_ep").value;
     	document.getElementById("name_ep").value;
     	
     	var ele=e.parentNode.parentNode;
    	ele.remove();
    	serial_no_income();
    }
    function delete_ep(e) {
    	var n=document.querySelectorAll("tr").length;
    	if(n>1&&confirm("Are You Sure")==true){
        	var ele=e.parentNode.parentNode;
        	ele.remove();
        	serial_no_ep();
          }
    }
    function serial_no_ep(){
      	var cls=document.querySelectorAll(".sno_ep");
      	for(var i=0;i<cls.length;i++)
      	{
    		cls[i].innerHTML=i+1;
      	}
    }
    
</script>
</body>
</html>