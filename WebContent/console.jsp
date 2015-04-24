<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
   
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="logout.jsp">Admin</a> 
            </div>
<div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> Last access : 30 April 2015 &nbsp; <a href="logout.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
                    <li>
                        <a class="active-menu"  href="table.html"><i class="fa fa-table fa-3x"></i> DashBoard</a>
                    </li>                  
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>DashBoard</h2>   
                        <h5>Welcome Admin , Love to see you back. </h5>                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
				 
				 <%
					User user1 = (User)session.getAttribute("currentUser");

					UserDao dao = new UserDao();
					MovieDao movieDao = new MovieDao();
					CommentDao commentDao = new CommentDao();
					ActorDao actorDao = new ActorDao();
					String action = request.getParameter("action");
					String id = request.getParameter("id");
					String username  = request.getParameter("username");
					String password = request.getParameter("password");
					String title  = request.getParameter("title");
					
					if("createUser".equals(action))
					{
						User user = new User();
						user.setUsername(username);
						user.setPassword(password);
						dao.createUser(user);
					}
					else if("deleteUser".equals(action))
					{
						int idInt = Integer.parseInt(id);
						dao.removeUserById(idInt);   
					}
					
					else if("createMovie".equals(action))
					{
						Movie movie = new Movie();
						movie.setTitle(title);
						movieDao.createMovie(movie);
					}
					
					else if("deleteMovie".equals(action))
					{
						int idInt = Integer.parseInt(id);
						movieDao.removeMovieById(idInt);   
					}
					
					else if("deleteComment".equals(action))
					{
						int idInt = Integer.parseInt(id);
						commentDao.removeCommentById(idInt);   
					}
					
					else if("deleteActor".equals(action))
					{
						int idInt = Integer.parseInt(id);
						actorDao.removeActorById(idInt);   
					}
				/*    else if("updateActor".equals(action))
					{
						int idInt = Integer.parseInt(id);
						User user = new User();
						user.setUsername(username);
						user.setPassword(password);
						dao.updateUser(idInt, user);
					}
				*/    
					
					List<User> users = dao.findAllUsers();
					List<Movie> movies = movieDao.findAllMovies();
					List<Comment> comments = commentDao.listAllComments();
					List<Actor> actors = actorDao.findAllActors();
					%>
				 
               
            <div class="row">
                <div class="col-md-12">
                    <!-- User Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             User Information Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
							    <!-- user control table -->
								<form action="console.jsp">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
											<th>Username</th>
											<th>Email</th>
											<th>FirstName</th>
											<th>LastName</th>
											<th>Phone</th>
                                        </tr>
                                    </thead>
									<tbody>
								<%
								for(User user : users)
								{
								%>
										<tr>
											<td><%=user.getId() %></td>
											<td><a href="profile.jsp?userId1=<%=user.getId()%>"><%=user.getUsername() %></a></td>
											<td><%=user.getEmail() %></td>
											<td><%=user.getFirstName() %></td>
											<td><%=user.getLastName() %></td>
											<td><%=user.getPhoneNumber() %></td>
											
											
											<td>
												<a class="btn btn-danger" href="console.jsp?action=deleteUser&id=<%=user.getId() %>">Delete</a>

											</td>
										</tr>
									<%
								}
								%>
									</tbody>
                                </table>
								</form>
                            </div>
                            
                        </div>
                    </div>
                    <!--End User Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-6">
                  <!--   Movie Table -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Movie Information
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
							    <form action="console.jsp">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Actors</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<%
									for(Movie movie : movies)
									{
										%>
											<tr>
												<td><%=movie.getId() %></td>
												<td><a href="detail.jsp?movieId=<%=movie.getId()%>&userId=<%=user1.getId()%>&title=<%=movie.getTitle()%>"><%=movie.getTitle() %></a></td>												
												<td>
													<a class="btn btn-danger" href="console.jsp?action=deleteMovie&id=<%=movie.getId() %>">Delete</a>
												</td>
											</tr>
									<%
									}
									%>
										</tbody>
											<tr>
												<th><input class="form-control" name="title" placeholder="Enter Movie Title"/></th>
												<th>
													<button class="btn btn-success" name="action" value="createMovie">Add</button>
												</th>
											</tr>
                                </table>
								</form>
                            </div>
                        </div>
                    </div>
                     <!-- End  Movie Table -->
                </div>
                <div class="col-md-6">
                     <!--   Comment Table  -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Comment Information
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
							    <form action="console.jsp" >
                                <table class="table">
                                    <thead>
                                        <tr>
											<th>ID</th>
											<th>Title</th>
											<th>Date Of Comment</th>
											<th>Username</th>
											<th>Comment</th>
                                        </tr>
                                    </thead>
                                           <tbody>
											<%for (Comment comment: comments){ %>
												<tr>
													<td><%=comment.getId()%></td>
													<td><%=comment.getMovie().getTitle()%></td>
													<td><%=comment.getDateOfComment() %></td>
													<td><%=comment.getUser().getUsername() %></td>
													<td><%=comment.getContent() %></td>
													<td>
														<a class="btn btn-danger" href="console.jsp?action=deleteComment&id=<%=comment.getId() %>">Delete</a>
													</td>
												</tr>
												<%} %>
										   </tbody> 
								 </table>  
								 </form>
                            </div>
                        </div>
                    </div>
                      <!-- End  Comment Table  -->
            
                </div>
            </div>
                <!-- /. ROW  -->
                
              <div class="row">
                <div class="col-md-12">
                    <!-- User Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Actor Information Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
							    <!-- user control table -->
								<form action="console.jsp">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
											<th>Actor name</th>
											<th>Movies</th>
                                        </tr>
                                    </thead>
									<tbody>
								<%
								for(Actor actor : actors)
								{
								%>
										<tr>
											<td><%=actor.getId() %></td>
											<td><%=actor.getName() %></td>
											<td><%=actor.getMovie().getTitle() %></td>

											
											
											<td>
												<a class="btn btn-danger" href="console.jsp?action=deleteActor&id=<%=actor.getId() %>">Delete</a>

											</td>
										</tr>
									<%
								}
								%>
									</tbody>
                                </table>
								</form>
                            </div>
                            
                        </div>
                    </div>
                    <!--End User Tables -->
                </div>
            </div>
            
            
        </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
