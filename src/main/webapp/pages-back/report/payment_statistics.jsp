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
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>Payment Statistics</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item" style="font-size:14px;">chart</li>
                    <li class="breadcrumb-item active" style="font-weight:Semibold;font-size:14px">Payment Statistics</li>
      
                </ul>
        </div>            
    </div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card container">
			<div class="header">
					<h6>Payment Statistics
					<span class="col-sm-4 pull-right ">
									   <select class="js-example-basic-multiple form-control" name="states[]" multiple="multiple" id="yearpicker" >
										 
										</select>
					</span>   
					          	
		            </h6>
				</div><br><br>
				
			<div class="body col-lg " >
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
 var currentYear = new Date().getFullYear()
 max = currentYear - 10
 var option = "";
 for (var year = currentYear; year > max; year--) {
   
     var option = document.createElement("option");
     option.text = year;
     option.value = year;
     
     document.getElementById("yearpicker").appendChild(option)
     
 }
 document.getElementById("yearpicker").value = currentYear;
 </script>
<script>
$('#yearpicker').datepicker({
		orientation: 'bottom'
	});


</script>
<script>
/*$(document).ready(function() {
	$(".js-example-basic-multiple").select2({
	    placeholder: "  Select Year"
	    
	});
});	*/
$(document).ready(function() {
	var multipleButton = new Choices('#yearpicker', {
		   removeItemButton: true,
		   maxItemCount:10,
		   searchResultLimit:10,
		   //renderChoiceLimit:30
		 }); 
});
	
	
</script>
<script>
function setChart(data){
	console.log(data);
	Highcharts.chart('container', {
		  chart: {
		    type: 'line',
		    ignoreHiddenSeries: false
		  },
		  navigation: {
		        buttonOptions: {
		            enabled: false
		        }
		    },

		  title: {
		    text: '',
		    	 style: {
                     color: '#333333',
                     fontFamily: 'Ubuntu,sans-serif',
                     fontSize: '20px',
                     fontWeight: 'bold',
                     
                 }
		  },
		  lang: {
		        noData: "Please Select Year"
		    },
		    noData: {
		        style: {
		            fontWeight: 'bold',
		            fontSize: '15px',
		            color: '#303030'
		        }
		    },
		  xAxis: {
		    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			labels: {
		        style: {
		        	fontFamily: 'Ubuntu,sans-serif',
		            fontSize:'16px',
		            color: '#333333'
		          }
		      }
		  },
		  yAxis: {
			  min: 0,
              title: {
            	  margin: 20,
                  text: '',
                  style: {
                      color: '#333333',
                      fontFamily: ' Ubuntu,sans-serif',
                      fontSize: '16px',
                      
                      
                      
                  }
              },
              labels: {
            	  style: {
                      color: '#333333',
                      fontFamily: ' Ubuntu,sans-serif',
                      fontSize: '16px',
                      
                      
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
		  series:data
		});
}
</script>
   <script>
function test(){
	    let year = [];
		year = $('#yearpicker').val();
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
					console.log(JSON.stringify(data));
					setChart(data);
					/*for(let i = 0; i < data.length; i++){
						//text += data[i].totol_pay + ",";
						//text += Object.values(data[i]);
						//text.push(Object.values(data[i]));
						//console.log(Object.values(data[i]));
						//console.log(data[i].totol_pay);
						text.push(data[i].total_pay);
					}*/
					//console.log(text);
					//createChart(text);
					 /*if (chart.series.length) {
        				chart.series[0].remove();
  						  }*/
							 /*chart.addSeries({
					        data: data
					    });*/
				}
				
			})
	
}

$(document).ready(function() {
	test();
	
	//console.log($('#select').val());
	$('#yearpicker').on('change',function(){
		test();
			
	});
});
</script>  
 <!--   <script>
$(document).ready(function() {
	$('#button').on('click',function(){
		 let year = [];
			year = $('#yearpicker').val();
			console.log(year);
			 $.ajax({
					url: "paymentStatistics2",
					method: "POST",
					type: "JSON",
					data: {
							"year" : year.join(',')
						},
						success:function(data){
							console.log(data);
							//console.log(data[0].year1);
							let text = [];
							//console.log(Object.keys(data[0]).length);
							for(let i = 0; i < data.length; i++){
								//text += data[i].totol_pay + ",";
								//text += Object.values(data[i]);
								//text.push(Object.values(data[i]));
								//console.log(Object.values(data[i]));
								//console.log(data[i].totol_pay);
								text.push(data[i].year2022);
								//console.log((data[i].year2022).length);
							}
							console.log(text);
							/*chart.addSeries({
						        data: text
						    });*/
						}
			 })
	});
});

</script>-->

<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/no-data-to-display.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
	
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
		
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" type="text/css" />