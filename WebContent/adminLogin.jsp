<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cosmo/bootstrap.min.css">
<link href="css/style.css" rel="stylesheet"/>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Admin login </h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                <form action="AdminLoginServlet" method="post" class="form-signin">
	                <input name="username" type="text" class="form-control" placeholder="Username" required autofocus >
	                <input name="password" type="password" class="form-control" placeholder="Password" required >
	                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>                                 
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>