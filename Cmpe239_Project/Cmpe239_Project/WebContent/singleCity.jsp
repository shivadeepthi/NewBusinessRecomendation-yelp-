<%@ page import="Servlets.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

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
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
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
       <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    Cities
    <span class="caret"></span>
  </button>
  	 
  
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
  <%DataBean[] cities = (DataBean[])session.getAttribute("cities");
 
  for (int i=0; i < cities.length; i++){
	  String city = cities[i].getCity();
  
	%> 
    <li role="presentation"><a role="menuitem" tabindex="-1" href="SingleCityServlet?cityName=<%=city%>" id="<%=city%>"><%=city%></a></li>
    <% } %>
  </ul>
</div>
<%int total = (Integer)session.getAttribute("total");
if(total>0){
%>

<div id="hotelList">
 <ul>
  <%List<String> rest = new ArrayList<String>();
  rest = (List<String>)session.getAttribute("restaurants");
 
  for(String restaurants : rest) {

	%> 
    <li><a href="RatingDistributionBusinessServlet?business_name=<%=restaurants%>" id="<%=restaurants%>" style="text-decoration: underline;"><%=restaurants%></a></li>
    <% } %>
  </ul>

</div>
  <% } %>
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
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>