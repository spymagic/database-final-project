<%@ page language="java" import="java.util.*,edu.neu.cs5200.model.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
    User user = (User)session.getAttribute("currentUser");
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Movie Share</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Movie Share</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<%if (user==null){ %>
                    <li>
                        <a class="page-scroll" href="login.jsp">Login</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="register.jsp">Register</a>
                    </li>
			        <li >
			        	<a href= "login.jsp" >Profile </a>
			        </li>
			        <li>
			        	<a href= "adminLogin.jsp" >Admin Login </a>
			        </li>
			        
			        <%}
			        else{ %>
			        <li >
			        	<a href= "profile.jsp" >Profile </a>
			        </li>
			        <%} 
			        if (user!= null){ %>
			        
			      <form action = "search.jsp" method= "post" class= "navbar-form navbar-left" role = "search">
			        <div class = "form-group">
			          <input type = "text" name= "input" class= "form-control" placeholder = "Search">
			        </div >
			        <button type = "submit" class= "btn btn-default"> Submit</button >
			      </form >
			    	<%}
			        else{ %>
			        <li >
			        	<a href= "login.jsp" >Search </a>
			        </li>
			        <%} %>
			        <%if (user!= null){ %>
			        <li ><a href="#" ><%=user.getUsername() %> </a></li>
			        <li ><a href= "logout.jsp" >logout</a></li>
			       
			        <%} %>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>Your Favorite Source of Movies</h1>
                <hr>
                <p>This is a simple movie share website, people could share their favorite movies here!</p>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
            </div>
        </div>
    </header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Find movies here!</h2>
                    <hr class="light">
                    <p class="text-faded">
						<table class="table">
						<%		
							 MovieDao movieDao = new MovieDao();
							 List<Movie> movies = movieDao.findAllMovies();
							 for (Movie movie: movies) {
						%>    	
						<td>
						<% if (user!= null){
						%>
						
						<a href ="detail.jsp?movieId=<%=movie.getId()%>&userId=<%=user.getId()%>&title=<%=movie.getTitle()%>"target="_blank"><font color="#FFFFFF"><%= movie.getTitle() %></font></a>
						<% }
						else { %>
						<a href = "detail.jsp?movieId= <%= movie.getId() %> &title= <%= movie.getTitle() %> "target="_blank"><font color="#FFFFFF"><%= movie.getTitle() %></font></a>
						<% } %>
				
						</td>
						<%} %> 
						
							</tbody>
						</table>	
					</p>
                </div>
            </div>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Users you may interested!</h2>
                    <hr class="primary">
		                    <table class = "table">
		                    <tbody >
		                                   <%        
		                    UserDao userDao = new UserDao();
		                   List<User> users = userDao.findAllUsers();
		              
		                   for (User user1: users) {
		               //        Movie movieObject = movieweb.getMovieforName(movie.getTitle());
		               %>        
		               <td>
		               <% if (user!= null){
		               %>
		               <a href ="profile.jsp?userId1=<%=user1.getId()%>"> <%= user1.getUsername() %> </a>
		               <% }
		               else { %>
		               <a href = "detail.jsp?" ><%= user1.getUsername() %> </a>
		               <% } %>
		                           
		                   
		              
		               </td>
		               <%} %>
		              
		                    </tbody>
		               </table>                                          
                </div>
            </div>
        </div>
  
    </section>



    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="primary">
                    <p>Need more help? Give me a call or send me an email and I will get back to you as soon as possible!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>626-898-1835</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="#">songpengyi@gmail.com</a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

</body>

</html>