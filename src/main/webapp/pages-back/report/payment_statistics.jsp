<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>




<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>





		


<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.highcharts-figure,
.highcharts-data-table table {
  min-width: 360px;
  max-width: 800px;
  margin: 1em auto;
}

.highcharts-data-table table {
  font-family: Verdana, sans-serif;
  border-collapse: collapse;
  border: 1px solid #ebebeb;
  margin: 10px auto;
  text-align: center;
  width: 100%;
  max-width: 500px;
}

.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}

.highcharts-data-table th {
  font-weight: 600;
  padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
  padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}

.highcharts-data-table tr:hover {
  background: #f1f7ff;
}

</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>payment_statistics</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item" style="font-size:14px;">chart</li>
                    <li class="breadcrumb-item active" style="font-weight:Semibold;font-size:14px">payment_statistics</li>
      
                </ul>
        </div>            
    </div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="header">
					<h6>Chart
					<span class="col-md-3 pull-right">
									   <select class="js-example-basic-multiple form-control" name="states[]" multiple="multiple" id="select">
										  <option selected = "selected" ><%=new java.util.Date().getYear() + 1900%></option>									 
							            <% for(int i = new java.util.Date().getYear() + 1900 - 1 ; i > 2000; i-=1) { %>
										  <option><%=i%></option>
	            						<% } %>
										</select>
					            	</span>  
		            </h6>
				</div>
			<div class="body" >
				<div class="portlet light bordered">
					<div class="portlet-body">
						<div class="portlet box white">
							<div id="container"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




  
 
<script>
$('#yearpicker').datepicker({
		orientation: 'bottom'
	});
function createChart(data){
Highcharts.chart('container', {
	  chart: {
	    type: 'line'
	  },
	  navigation: {
	        buttonOptions: {
	            enabled: false
	        }
	    },

	  title: {
	    text: 'Monthly Average Temperature'
	  },
	  
	  subtitle: {
	    text: 'Source: WorldClimate.com'
	  },
	  xAxis: {
	    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		labels: {
	        style: {
	            
	            fontSize:'16px'
	          }
	      }
	  },
	  yAxis: {
	    title: {
	      text: 'Temperature (°C)'
	    },
	    labels: {
	        style: {
	            
	            fontSize:'16px'
	          }
	      }
	    
	  },
	   tooltip: {
		    shared: true,
		    crosshairs: true
		  },
	 
	  plotOptions: {
	    series:{
	      cursor: 'pointer'
	    },
	    line: {
	      dataLabels: {
	        enabled: false
	      },
	      enableMouseTracking: true
	    }
	  },
	  series: [{
	    name: 'Tokyo',
	    data: data
	  }]
	});
}
createChart();
</script>
<script>
$(document).ready(function() {
	$(".js-example-basic-multiple").select2({
	    placeholder: "  Select Year"
	    	
	});
});
</script>
<script>
function test(){
	    let year = [];
		year = $('#select').val();
	    console.log(year);
	   
	    $.ajax({
			url: "paymentStatistics2",
			method: "POST",
			type: "JSON",
			data: {
					"year" : year.join(',')
				},
				success:function(data){
					let text = [];
					console.log(data);
					for(let i = 0; i < data.length; i++){
						//text += data[i].totol_pay + ",";
						//text += Object.values(data[i]);
						//text.push(Object.values(data[i]));
						//console.log(Object.values(data[i]));
						//console.log(data[i].totol_pay);
						text.push(data[i].totol_pay);
					}
					console.log(text);
					createChart(text);
					
				}
				
			})
	
}

$(document).ready(function() {
	test();
	//console.log($('#select').val());
	$('#select').on('change',function(){
		test();
			
	});
});
</script>

<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" type="text/css" />