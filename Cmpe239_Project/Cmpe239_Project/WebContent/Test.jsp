<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!--<script src="http://code.jquery.com/jquery-latest.min.js"></script>  -->
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<title>Restuarant Prediction</title>
<script>
$(document).ready(function(){
	$('#sbutton').click(

			function() {
				init();
			});

			
});
		

		var init = function() {
			$.ajax({
			type: "GET",
		    contentType: "application/json; charset=utf-8",
			url: "http://localhost:8080/Cmpe239_Project/RestuarantRatingPrediction",
			data: "input=" + $('#business_name').val(),
				success: function (response) {
					//alert("i am here to drw graph")
					drawGraph(response);
					//alert("i am here");
					setTimeout(function(){
			               window.location.reload();
			        }, 100000); 
	            },
	            error: function (result) {
	                alert("Error");
	            }
				});
		
			var drawGraph = function(response) {
				var json_ratingdata = response;//rating{ratings:[11,12,11.1,....]}
				alert(json_ratingdata);
				var result = [];

				for ( var i in json_ratingdata)
					result.push( json_ratingdata[i] );

       $('#container2').highcharts({
        title: {
            text: 'Restuarant Prediction',
            x: -20 //center
        },
        subtitle: {
            text: 'Yelp data Set',
            x: -20
        },
        xAxis: {
            categories: ['2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016'],
        },
        yAxis: {
            title: {
                text: 'Rating'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
           
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Resturant Ratings',//remove name
            //data: [4.0,4.5, 3.5, 2.5, 2.8, 1.5, 2, 1, 3, 4, 2.9,2,1]
            data:result
        }]
    });
    }}
			
			

</script>
</head>
<body>
<input type="text" id="business_name" size="30"/>
<button  id="sbutton" type="button">clickme</button>
<h1> i m here</h1>
<div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>