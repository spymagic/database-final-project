<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cosmo/bootstrap.min.css">
<link href="css/bootstrap.css" rel="stylesheet"/>

<head>
<title>Register</title>
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
  </div>
</nav>

<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Registration</h3>
				<form action="RegisterServlet" method= "post">
					<div class="form-group col-lg-12">
						<label>Username</label>
						<input type="text" name="username" class="form-control" id="" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label>Password</label>
						<input type="password" name="password" class="form-control" id="" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label>Repeat Password</label>
						<input type="password" name="password" class="form-control" id="" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label>Last Name</label>
						<input type="" name="lastName" class="form-control" id="" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label>First Name</label>
						<input type="" name="firstName" class="form-control" id="" value="">
					</div>
									
					<div class="form-group col-lg-6">
						<label>Email Address</label>
						<input type="" name="email" class="form-control" id="" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label>Phone</label>
						<input type="" name="phone" class="form-control" id="" value="">
					</div>			
				
	
				
				
				
					<div class="col-md-6">
						<h3 class="dark-grey">Terms and Conditions</h3>
						<p>
							By clicking on "Register" you agree to The Company's' Terms and Conditions
						
						
						<button type="submit" class="btn btn-primary" style="margin:20px 0px">Register</button>
						
					</div>
				</form>
			</div>
		</div>
	</section>
</div>
</body>
</html>