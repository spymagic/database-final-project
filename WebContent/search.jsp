<%@ page language="java" import="java.util.*,edu.neu.cs5200.model.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cosmo/bootstrap.min.css">

<%    User user = (User)session.getAttribute("currentUser");
%>
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Movie Share</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="profile.jsp">Profile</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <%if (user!=null){ %>
        <li><a href="profile.jsp"><%=user.getUsername() %></a></li>
        <%} %>
		<li ><a href= "logout.jsp" >logout</a></li>

      </ul>
    </div>
  </div>
</nav>
  <head>
    
    <title>search</title>
    
  </head>
  
  <body>

<div class="container">

	<h1>Search Results:</h1>

<%  
	String input= request.getParameter("input");
	MovieClient client = new MovieClient();
	Movie[] movies = client.findMoviesByTitle(input);
	MovieDao movieDao = new MovieDao();
	if(movies!=null){   
		for (Movie movie: movies){
		%>
		<div class="row">
            <div class="col-md-7 ">
                <a href="#">
                    <img class="img-responsive" src="<%=movie.getUrlPoster() %>" alt="">
                </a>
            </div>    
            <div class="col-md-5">
            	<h3><%=movie.getTitle()%></h3>
                <h4><%=movie.getYear() %></h4>
                <p><%=movie.getSimplePlot() %></p>
                <%                               	
            	Movie movie1 = movieDao.findMovieByTitle(movie.getTitle());
                if(movie1==null) {%>
                <a class="btn btn-primary" href="AddMovieServlet?title=<%=movie.getTitle()%>&input=<%=input%>">Add to database<span class="glyphicon glyphicon-chevron-right"></span></a>
                <%} 
                else{%>
                <a class="btn btn-primary" href="detail.jsp?movieId=<%=movie1.getId()%>&userId=<%=user.getId()%>&title=<%=movie.getTitle()%>">Detail <span class="glyphicon glyphicon-chevron-right"></span></a>
                <%}%>
                
            </div>
        </div>

        <!-- /.row -->
        <hr>
  <%}%>      
     <%}
	 else {%>				
		<%="Movie not found." %>
		<%} %>
</div>
</body>
</html>
