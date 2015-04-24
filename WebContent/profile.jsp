<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.model.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    User user = (User)session.getAttribute("currentUser");
%>
<head>
<title>Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="css/profile.css" rel="stylesheet"/>


</head>
<body>
  <nav class="navbar navbar-inverse">
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
<div class="container">

<%	    String userid1= request.getParameter("userId1");
		User user1;
		if(userid1!=null){
	    int userID = Integer.parseInt(userid1);
				
		UserDao dao1= new UserDao();
	    user1 = dao1.findUserById(userID);
		}
		else{
			user1=user;
		}
 %>


		<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
			<div class="row panel">
				<div class="col-md-4 bg_blur ">
				</div>
		        <div class="col-md-8  col-xs-12">
		           <img src="assets/img/userpic.png" class="img-thumbnail picture hidden-xs" />
		           <img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg" class="img-thumbnail visible-xs picture_mob" />
		           <div class="header">
		                <h1><%=user1.getUsername() %></h1>
		                <h4></h4>
		                <span>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
		"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</span>
		           </div>
		        </div>
		    </div>   
		    
		
		</div>

 
 			<% UserDao userdao = new UserDao();
               boolean statue = userdao.VerifyFollowerStatue(user.getId(), user1.getId());				
			if(user.getId()!=user1.getId()){
               if(statue){%>
 	<!-- follow button -->
 		<form action="followServlet" style="float:left;">
			<input type ="submit" value="Follow" class="btn btn-primary" style="display:block;width:100px;">
    		<input type="hidden" name="followerId" value="<%=user.getId()%>">	
    		<input type="hidden" name="userId1" value="<%=userid1%>">   	   
		</form>
				<%} 
				
				else{%>
	<!-- unfollow button -->
		<form action="unFollowServlet" style="float:left;">
			<input type ="submit" value="UnFollow" class="btn btn-primary"style="display:block;width:100px;">
    		<input type="hidden" name="followerId" value="<%=user.getId()%>">	
    		<input type="hidden" name="userId1" value="<%=userid1%>">   	   
		</form>
		      <%} %>
		<%} %>
<div class="clearfix" style="clear:both;"></div>
	<!-- edit button -->
	
	<%if(user.getId()==user1.getId()){ %>	
		<form action="profileEdit.jsp" >
			<input type = "submit" value="Change Password" class="btn btn-danger" style="margin-top:10px">
    	  	   
		</form>
	<%} %>	

<style type="text/css">
span{
color:black;
font-size:20px
}
</style>
		<div style="width:100%; ">
		 <table class="table" style="float:left; display:inline-block; width:400px; margin:50px" >
		 <thead>
		  <tr>
		   <th><span>Movie Liked:</span></th>
		  </tr>
		 </thead> 
		   <%
		 		MovieDao dao = new MovieDao();  
		     	List<Movie> movies = dao.MovielikedByUser(user1); 
		 	 	for(Movie movie:movies){
			%>
		    <tr>
		      <td>
		         <a href="detail.jsp?movieId=<%=movie.getId()%>&userId=<%=user.getId()%>&title=<%=movie.getTitle()%>"><%= movie.getTitle() %></a>
		      </td>
			</tr>
			<%}%>
		 </table>
		 
		
		
		 <table class="table" style="width:400px; float:right; display:inline-block; margin:50px">
		  <thead>
		    <tr>
		  		<th><span>Followers:</span></th>
		    </tr>
		  </thead>
			<%	
			UserDao userDao= new UserDao();
			List<User> users = userDao.listFollowers(user1);
			for(User user2: users){
			%>
			<tr>
				<td>
					<a href="profile.jsp?userId1=<%=user2.getId()%>"><%=user2.getUsername()%></a>
				</td>
			</tr>
			<%}%>
			
		</table>
		
	  </div>


</div>


</body>
</html>
