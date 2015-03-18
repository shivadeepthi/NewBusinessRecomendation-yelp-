<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Servlets.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Yelp</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="http://code.highcharts.com/highcharts.js"></script>
		<script src="http://code.highcharts.com/modules/exporting.js"></script>
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
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
				data: "input=" + $('#business_name1').val(),
					success: function (response) {
						//alert("i am here to drw graph")
						drawGraph(response);
						//alert("i am here");
						setTimeout(function(){
				               window.location.reload();
				        }, 100000); 
		            },
		            error: function (result) {
		                //alert("Error");
		            }
					});
			
				var drawGraph = function(response) {
					var json_ratingdata = response;//rating{ratings:[11,12,11.1,....]}
					//alert(json_ratingdata);
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
	
<header class="navbar navbar-bright navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="index.jsp" class="navbar-brand">Home</a>
    </div>
    <nav class="collapse navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li>
          <a href="NewBusinessServlet">New Business</a>
        </li>
        <li>
          <a href="GetCitiesServlet">Check Restaurant Ratings</a>
        </li>   
        <li>
          <a href="ResturantPrediction.jsp">Restaurant's Prediction</a>
        </li>     
      </ul>
      <ul class="nav navbar-right navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
          <ul class="dropdown-menu" style="padding:12px;">
            <form class="form-inline" action="RatingDistributionBusinessServlet" method="post">
              <button type="submit" class="btn btn-default pull-right"><i class="glyphicon glyphicon-search"></i></button><input type="text" class="form-control pull-left" placeholder="Search" name="business_name" id="business_name">
            </form>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>

<div id="masthead">  
  <div class="container">
    <div class="row">
      <div class="col-md-7" style="width:30%">
      <img style="display: block;margin-right:auto;margin-top:10px;height:100px;" src="images/food-4.jpg" class="img-responsive img-circle" alt="Cinque Terre">
        <h1>Yelp
          <p class="lead"></p>
        </h1>
      </div>
      <div class="col-md-5" style="width:70%">
        
          <div id="carousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img style="width:800px;height:300px;" src="images/LasVegasStrip.jpg" alt="...">
      <div class="carousel-caption">
          <h3>Las Vegas</h3>
      </div>
    </div>
    <div class="item">
      <img style="width:800px;height:300px;" src="images/phoenix-downtown.jpg" alt="...">
      <div class="carousel-caption">
          <h3>Phoenix</h3>
      </div>
    </div>
    <div class="item">
      <img style="width:800px;height:300px;" src="images/madison.jpg" alt="...">
      <div class="carousel-caption">
          <h3>Madison</h3>
      </div>
    </div>
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> <!-- Carousel -->
        </div>
      </div>
    </div> 
  </div><!-- /cont -->
  
  <div class="container">
    <div class="row">
      <div class="col-md-12">
      
        <div class="top-spacer"> </div>
      </div>
    </div> 
  </div><!-- /cont -->
  



<div class="container">
  <div class="row">

    <div class="col-md-12"> 
      
      <div class="panel">
        <div class="panel-body">
          
          
              
          <!--/stories-->
          <div class="row">    
            <br>
            <div class="col-md-2 col-sm-3 text-center">
              

            
            </div>
          </div>
          <hr>
       <h1>Restaurants Predection</h1>   
	<input type="text" id="business_name1" size="30" class="form-control" style="width:120px;float:left""/><br><br>
	<button  id="sbutton" type="button" class="btn btn-primary" style="float:left">Predict</button>
	
	<div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
          <!--/stories-->
          
          
         <!-- <a href="/" class="btn btn-primary pull-right btnNext">More <i class="glyphicon glyphicon-chevron-right"></i></a>-->
        
          
        </div>
      </div>
                                                                                       
	                                                
                                                      
   	</div><!--/col-12-->
  </div>
</div>
                                                
                                                                                
<hr>

<div class="container" id="footer">
  <div class="row">
    <div class="col col-sm-12">
      
      <h1>Follow Us</h1>
      <div class="btn-group">
       <a class="btn btn-twitter btn-lg" href="#"><i class="icon-twitter icon-large"></i> Twitter</a>
	   <a class="btn btn-facebook btn-lg" href="#"><i class="icon-facebook icon-large"></i> Facebook</a>
	   <a class="btn btn-google-plus btn-lg" href="#"><i class="icon-google-plus icon-large"></i> Google+</a>
      </div>
      
    </div>
  </div>
</div>

<hr>

<hr>

<footer>
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <ul class="list-inline">
          <li><i class="icon-facebook icon-2x"></i></li>
          <li><i class="icon-twitter icon-2x"></i></li>
          <li><i class="icon-google-plus icon-2x"></i></li>
          <li><i class="icon-pinterest icon-2x"></i></li>
        </ul>
        
      </div>
      <div class="col-sm-6">
          <p class="pull-right">Built with <i class="icon-heart-empty"></i> at <a href="http://www.bootply.com">Bootply</a></p>      
      </div>
    </div>
  </div>
</footer>
	<!-- script references -->
		
		<script src="js/bootstrap.min.js"></script>
		
	
	</body>
</html>