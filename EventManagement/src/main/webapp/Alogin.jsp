<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body class="bg-light">
	<jsp:include page="Menu.jsp" />
	<hr class="bg-primary"/>
	<form class="col-lg-4 offset-lg-4" action="Login" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label>UserName</label> <input class="form-control" type="text"
				placeholder="Enter User Name" required="required" name="userName">
		</div>
		<div class="form-group">
			<label>Password</label> <input class="form-control" type="text"
				placeholder="Enter Password" required="required" name="password">
		</div>
		<button class="btn btn-primary" type="submit" data-toggle="collapse"
			data-target="#multiCollapseExample2" aria-expanded="false"
			aria-controls="multiCollapseExample2">Login</button>
	</form>
</body>
</html>