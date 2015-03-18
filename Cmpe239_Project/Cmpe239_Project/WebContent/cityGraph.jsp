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
		<script src="http://d3js.org/d3.v3.min.js"></script>
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
          
          
              <h1>Popular In this city</h1>
          <!--/stories-->
          <div class="row">    
            <br>
            <div class="col-md-2 col-sm-3 text-center">
              <script>
var width=800, height=600;
console.log("i am here");
var canvas=d3.select("body").append("svg")
				.attr("width",width)
				.attr("height",height)
				.append("g")
				.attr("transform","translate (50,50)");
				
var pack=d3.layout.pack()
.size([width,height-50])
.padding(10);

d3.json("topics.json",function(data){
	var colour = d3.scale.category10();
	console.log(colour);
	var nodes=pack.nodes(data);
	console.log(nodes);
	
	var node=canvas.selectAll(".node")
	.data(nodes)
	.enter()
	.append("g")
	.attr("class","node")
	.attr("transform",function(d){return "translate ("+d.x+","+d.y+")";});
	
	node.append("circle")
	.attr("r",function(d){ return d.r;})
	.attr("fill",function(d){ return d.children ? "#fff":"steelblue";})
	.attr("opacity",0.25)
	.attr("stroke",function(d){return d.children ? "#fff":"#ADADAD";})
	.attr("stroke-width","2");
	
	node.append("text") 
	 .style("text-anchor", "middle")
	.text(function(d){return d.children? " " : d.name;});
	
	
	

});

</script>

              
            </div>
          </div>
          <hr>
          

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
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
	</body>
</html>