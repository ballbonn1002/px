<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

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
            <div id="income"class="body">
            <p id="demo"></p>
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
					<tbody id="tbl_income" class="row_position">
						<c:forEach var="test" items="${ paymentTypeList1}">
								<c:set var="counter" value="${counter +1}" />
									
									<tr>
									<td><i class="table-dragger-handle sindu_handle"></i></td>
									<td  id="Sequence" style= "text-align: left; padding-left: 20px ">${test.sequence}						
									</td>
											<td id="${test.Payment_type_id}" style="text-align: left; padding-top: 10px;">${test.Payment_type_id}</td>
											<td style="text-align: left; padding-top: 10px;">${test.Payment_type_name}</td>
																						<td style="text-align:right;" >       
			                                  <c:if test = "${test.system == 1 }">                                         		
                                        		<a class="btn btn-outline-danger sred-intense sweet-${test.Payment_type_id}" title="Delete"
                                        			onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);">

                                        		<i class="fa fa-trash-o"></i></a>                                  		
                     <script>
                 
                    	 

document.querySelector('.sweet-${test.Payment_type_id}').onclick = function(){
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
       var Payment_type_id = "${test.Payment_type_id}";
     
        $.ajax({

      	   type: "POST",
      	   data: { Payment_type_id: Payment_type_id
      		  	   
      		  	  },
      	   url: "${pageContext.request.contextPath}/deleteIncome",
      	   success: function(msg){
      		  	location.reload();
      	   }
      	});

      	
   	 //$("td#Sequence").empty();
      });/*.done(function() {
  	location.reload();
  //document.location = "paymenttype_delete?Payment_type_id=${test.Payment_type_id}";
      });*/
	 //$("td#Sequence").empty();
};
$("td#Sequence").empty();
var income = document.getElementById('income'),
table = income.getElementsByTagName('table')[0],
rows = table.getElementsByTagName('tr'),
text = 'textContent' in document ? 'textContent' : 'innerText';

var Position = [];
var PaymentTypeID = [];
var LastSeq = "";

	for (var i = 1, len = rows.length; i < len; i++) {
		Position.push(rows[i].children[1][text] = i  + rows[i].children[1][text]);
	}

	for (var i = 1, len = rows.length; i < len; i++) {
		PaymentTypeID.push(rows[i].children[2][text] = rows[i].children[2][text]);
	}

	LastSeq = rows.length-1;

	$.ajax({

	   type: "POST",
	   data: { Position: Position,
		  	   PaymentTypeID:PaymentTypeID,
		  	   LastSeq:LastSeq,
		  	   
		  	  },
	   url: "${pageContext.request.contextPath}/updateIncome",
	   success: function(msg){
	     $('.answer').html(msg);
	   }
	});


$(".row_position").sortable({
    delay: 150,
    stop: function() {
        var selectedData = new Array();
        $('.row_position>tr').each(function() {
            selectedData.push($(this).attr("${test.Payment_type_id}"));
            
        });
    	
        $("td#Sequence").empty();
        var income = document.getElementById('income'),
    	table = income.getElementsByTagName('table')[0],
        rows = table.getElementsByTagName('tr'),
        text = 'textContent' in document ? 'textContent' : 'innerText';

    	var Position = [];
    	var PaymentTypeID = [];
    	var LastSeq = "";
    	
      	for (var i = 1, len = rows.length; i < len; i++) {
      		Position.push(rows[i].children[1][text] = i  + rows[i].children[1][text]);
      	}
    
      	for (var i = 1, len = rows.length; i < len; i++) {
      		PaymentTypeID.push(rows[i].children[2][text] = rows[i].children[2][text]);
      	}

      	LastSeq = rows.length-1;
    	
      	$.ajax({

     	   type: "POST",
     	   data: { Position: Position,
     		  	   PaymentTypeID:PaymentTypeID,
     		  	   LastSeq:LastSeq,
     		  	   
     		  	  },
     	   url: "${pageContext.request.contextPath}/updateIncome",
     	   success: function(msg){
     	     $('.answer').html(msg);
     	   }
     	});
   }    

});


</script>
                                        		</c:if>
                                        		<c:if test = "${test.system == 0 }" >  
                                        		
                                        		</c:if>
                                       
                                       		</td>
                        
									</tr>

							</c:forEach> 
						
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
            <div id="expenses" class="body">
            	<table id="expenses-table" class="table">
					<thead>
				    	<tr id="tr2"style="text-align: left;">
					    	<th height="41" style="width: 5%;"></th>
					        <th height="41" style="width: 5%;">ลำดับ</th>
					        <th height="41" >ID</th>
							<th height="41" >รายหัก</th>
							<th height="41" style="width: 5%;"></th>
				        </tr>
					</thead>
					<tbody id="tbl_ep" class="row_position1">
							<c:forEach var="test" items="${ paymentTypeList0}">
								<c:set var="counter1" value="${counter1 + 1}" />
									<tr>
									<td><i class="table-dragger-handle sindu_handle"></i></td>
									<td id="Sequence1" style= "text-align: left; padding-left: 20px ">${test.sequence}</td>
											<td style="text-align: left; padding-top: 10px;">${test.Payment_type_id}</td>
											<td style="text-align: left; padding-top: 10px;">${test.Payment_type_name}</td>
											
											
											<td style="text-align:right;" >       
			                                  <c:if test = "${test.system == 1 }">                                         		
                                        		<a class="btn btn-outline-danger sred-intense sweet-${test.Payment_type_id}" title="Delete"
                                        			onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);">

                                        		<i class="fa fa-trash-o"></i></a>                                  		
                     <script>
document.querySelector('.sweet-${test.Payment_type_id}').onclick = function(){
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
        var Payment_type_id = "${test.Payment_type_id}";
        
        $.ajax({

      	   type: "POST",
      	   data: { Payment_type_id: Payment_type_id
      		  	   
      		  	  },
      	   url: "${pageContext.request.contextPath}/deleteIncome",
      	   success: function(msg){
      		  	location.reload();
      	   }
      	});
    		
      });
};

$("td#Sequence1").empty();
var expen = document.getElementById('expenses'),
table1 = expen.getElementsByTagName('table')[0],
rows = table1.getElementsByTagName('tr'),
text = 'textContent' in document ? 'textContent' : 'innerText';

var Position1 = [];
var PaymentTypeID1 = [];
var LastSeq1 = "";

	for (var i = 1, len = rows.length; i < len; i++) {
		Position1.push(rows[i].children[1][text] = i  + rows[i].children[1][text]);
	}

	for (var i = 1, len = rows.length; i < len; i++) {
		PaymentTypeID1.push(rows[i].children[2][text] = rows[i].children[2][text]);
	}

	LastSeq1 = rows.length-1;
console.log(LastSeq1)

	$.ajax({

	   type: "POST",
	   data: { Position1: Position1,
		  	   PaymentTypeID1:PaymentTypeID1,
		  	   LastSeq1:LastSeq1,
		  	
		   	},
	   url: "${pageContext.request.contextPath}/updateExpenses",
	   success: function(msg){
	     $('.answer').html(msg);
	   }
	});
	
	
$(".row_position1").sortable({
    delay: 150,
    stop: function() {
        var selectedData1 = new Array();
        $('.row_position1>tr').each(function() {
            selectedData1.push($(this).attr("${test.Payment_type_id}"));
            
        });
    	
        $("td#Sequence1").empty();
        var expen = document.getElementById('expenses'),
    	table1 = expen.getElementsByTagName('table')[0],
        rows = table1.getElementsByTagName('tr'),
        text = 'textContent' in document ? 'textContent' : 'innerText';

    	var Position1 = [];
    	var PaymentTypeID1 = [];
    	var LastSeq1 = "";
    	
      	for (var i = 1, len = rows.length; i < len; i++) {
      		Position1.push(rows[i].children[1][text] = i  + rows[i].children[1][text]);
      	}
    
      	for (var i = 1, len = rows.length; i < len; i++) {
      		PaymentTypeID1.push(rows[i].children[2][text] = rows[i].children[2][text]);
      	}

      	LastSeq1 = rows.length-1;
      console.log(LastSeq1)
    	
      	$.ajax({

     	   type: "POST",
     	   data: { Position1: Position1,
     		  	   PaymentTypeID1:PaymentTypeID1,
     		  	   LastSeq1:LastSeq1,
     		  	
     		   	},
     	   url: "${pageContext.request.contextPath}/updateExpenses",
     	   success: function(msg){
     	     $('.answer').html(msg);
     	   }
     	});
   }    

});

</script>
                                        		</c:if>
                                        		<c:if test = "${test.system == 0 }" >  
                                        		
                                        		</c:if>
                                       		</td>
									</tr>

							</c:forEach> 
					</tbody>
				</table>
				<c:forEach var="test" items="${ paymentTypeList1}" >
						<c:set var="count1" value="${test.sequence}" />
							
	 			</c:forEach>
	 			<c:forEach var="test" items="${ paymentTypeList0}" >
						<c:set var="count0" value="${test.sequence}" />
					
	 			</c:forEach>
				<c:forEach var="test" items="${ paymentTypeList1}" >
						
					
	 			</c:forEach>
	 				<p id="demo"> </p>
        	</div>
     	</div>
     </div>       
</div>

<!-- Javascript --> 

<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script src="pages-back/assets/vendor/table-dragger/table-dragger.min.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    <!--income add and remove-->
    function add_income()
    {
    	
    	var counter=${counter};
    	
    	counter++;
    	
     	var Payment_type_id = $('#payment_type_id').val();
    	var Payment_type_name = $('#payment_type_name').val();
    	
    	if (Payment_type_id == '') { 
    		alert("กรุณากรอกเสร็จก่อนจะสร้างรายการต่อไป!!");
    		return false;
    	}
    	if (Payment_type_name == ''){
    		alert("กรุณากรอกรายได้");
    		return false;
    	}
    
    	
     else{

      	var tr=document.createElement("tr");
      	tr.innerHTML="<td><i class='table-dragger-handle sindu_handle'></i></td><td class='counter'>"+counter +"</td> <td><input type='text'class='form-control' id='payment_type_id'></td> <td><input type='text'class='form-control' id='payment_type_name'></td>  <td><a class='btn btn-outline-secondary' onclick='cancle_income(this)'><i class='fa fa-times'></i></a> <a class='btn btn-outline-success' onclick='add_new_income(this)'><i class='fa fa-save'></i></a></td>";
      	document.getElementById("tbl_income").appendChild(tr);
    	}

    }
    function cancle_income(e)
    {
      	var n=document.querySelector("#tbl_income").querySelectorAll("tr").length;
    	var ele=e.parentNode.parentNode;
    	ele.remove();
    
      
    }

    function add_new_income(e)
    {
    	
     	var Payment_type_id = $('#payment_type_id').val();
    	var Payment_type_name = $('#payment_type_name').val();
    	var type = "1";
    	var system = "1";
    	var sequence1 = ${count1};
    	sequence1++;

    	if (Payment_type_id == ''){ 
    		alert("กรุณากรอก ID");
    		return false;
    	}
    	
    	if (Payment_type_name == ''){
    		alert("กรุณากรอกรายได้");
    		return false;
    	}
    
    	 else{
    	
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/savePaymentTypetest",
			dataType: "json",
			data : {
				"Payment_type_id" : Payment_type_id,
				"Payment_type_name" : Payment_type_name,
				"type": type,
				"system": system,
				"sequence": sequence1
				
				
			},
		}).done(function(json) {
			console.log(json);
			Alert(Payment_type_id, Payment_type_name,type);
			
		
		}).fail(function() {
			document.location = "payment_type"; 
			
		});
    	}
    
    }
    //document.location = "payment_type"; 
 

    <!--expenses add and remove-->
   
    
    
    function add_ep()
    {
    
    	var counter1=${counter1};
    	counter1++;
    	var Payment_type_id = $('#payment_type_id').val();
    	var Payment_type_name = $('#payment_type_name').val();
    	
    	if (Payment_type_id == '') { 
    		alert("กรุณากรอกเสร็จก่อนจะสร้างรายการต่อไป!!");
    		return false;
    	}
       	if (Payment_type_name == '') { 
    		alert("กรุณากรอกเสร็จก่อนจะสร้างรายการต่อไป!!");
    		return false;
    	}
    	else{
      	var tr=document.createElement("tr");
      	tr.innerHTML="<td><i class='table-dragger-handle sindu_handle'></i></td><td class='counter1'>"+counter1+"</td> <td><input type='text'class='form-control' id='payment_type_id'></td> <td><input type='text'class='form-control' id='payment_type_name'></td> <td><a class='btn btn-outline-secondary' onclick='cancle_ep(this)'><i class='fa fa-times'></i></a> <a class='btn btn-outline-success' onclick='add_new_ep(this)'><i class='fa fa-save'></i></a></td>";
      	document.getElementById("tbl_ep").appendChild(tr);
    
    	}
    }
    function cancle_ep(e)
    {
      	var n=document.querySelector("#tbl_ep").querySelectorAll("tr").length;
    	var ele=e.parentNode.parentNode;
    	ele.remove();
    	
    }
   
    function add_new_ep(e)
    {
    	var Payment_type_id = $('#payment_type_id').val();
    	var Payment_type_name = $('#payment_type_name').val();
    	var type = "0";
    	var system = "1";
    	var sequence0 = ${count0};
    	sequence0++;

    	if (Payment_type_id == ''){ 
    		alert("กรุณากรอก ID");
    		return false;
    	}
    	
    	if (Payment_type_name == ''){
    		alert("กรุณากรอกรายหัก");
    		return false;
    	}
    	else{
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/savePaymentTypetest",
			dataType: "json",
			data : {
				"Payment_type_id" : Payment_type_id,
				"Payment_type_name" : Payment_type_name,
				"type": type,
				"system": system,
				"sequence": sequence0

			},
		}).done(function(json) {
			console.log(json);
			Alert(Payment_type_id, Payment_type_name,type);
			
			
		}).fail(function() {
			document.location = "payment_type"; 
			
		});
    	}
    }

</script>
</body>
</html>
