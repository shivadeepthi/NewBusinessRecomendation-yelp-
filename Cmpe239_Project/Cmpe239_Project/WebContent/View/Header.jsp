<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tech Trends</title>
 <style type="text/css">
<!--
body {
	background-image: url(images/bg.png);
	
}
-->
 </style>
 <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--facebook share button -->
<div id="fb-root"></div>
<script></script>

<!--tweet button-->
<script type="text/javascript">!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

<!--start container -->
<div id="container">
<header>
    <nav>   
      <div id="logo"><a href="Home.jsp"><img style="height:100%;width:100%;" src="images/title.png" alt="Logo here" /></a>
      </div>
      
<div id="nav_social">
<!--<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/"  data-layout="standard" data-action="like" data-show-faces="false" data-share="false"></div>-->

<a href="https://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a>

</div>
<!--<a href="#"><img src="images/facebook_32.png" alt="Become a fan" width="32" height="32" /></a><a href="#"><img src="images/twitter_32.png" alt="Follows on Twitter" /></a><a href="#"><img src="images/linkedin_32.png" alt="Linked in" /></a><a href="#"><img src="images/email_32.png" alt="Contact" width="32" height="32" /></a>-->  </div>
  </nav>
  
    </header>
<br/><br/>
<div class="content">

          <ul class="ca-menu">
                    <li>
                    <%String table="programmer"; %>
                        <a href="CategoryOverview?t=<%=table %>">
                            <span class="ca-icon">Programmers</span>              
                        </a> 
                 </li>
                    <li>
                    <%table="dba"; %>
                        <a href="CategoryOverview?t=<%=table %>">
                            <span class="ca-icon">DBAs</span>            
                            
                        </a>                    </li>
                    <li>
                    <%table="stackoverflow"; %>
                        <a href="CategoryOverview?t=<%=table %>">
                            <span class="ca-icon">Stack Overflow</span>
                                                      
                        </a>                    </li>
                    <li>
                    <%table="webapps"; %>
                       <a href="CategoryOverview?t=<%=table %>">
                            <span class="ca-icon">Web Application</span>
                            
                            
                        </a>                    </li>
 						<li>
 						<%table="android"; %>
                        <a href="CategoryOverview?t=<%=table %>">
                            <span class="ca-icon">Android Enthusiasts</span>
                            
                            
                        </a>                    </li>

                </ul>
  <!--star main --> 

     <br/><br/>