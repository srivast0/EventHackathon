<%@page import="com.app.model.RegisterModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="ISO-8859-1">
<title>Event Management</title>
</head>
<body class="bg-light">
<jsp:include page="Menu.jsp"/>
<hr class="bg-primary" />
<div class="tab-content">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	
	
  	<form class="col-lg-4 offset-lg-4" action="register" method="post" enctype="multipart/form-data">
  	<div class="form-group">
    <label>Full Name</label>
  	<input class="form-control" type="text" placeholder="Enter Full Name" required="required" name="fname">
  	</div>
  	<div class="form-group">
    <label>Mobile</label>
  	<input class="form-control" type="number" placeholder="Enter Mobile Number" required="required" name="mobile">
  	</div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email Address" required="required" name="mail">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label>Upload ID Card</label>
  	<input type="file" required="required" name="icard">
  	</div>
   <div class="form-group">
    <label for="exampleFormControlSelect1">Registration Type</label>
    <select class="form-control" id="exampleFormControlSelect1" required="required" name="Rtype">
      <option value="">Choose..</option>
      <option value="Self">Self</option>
      <option value="Group">Group</option>
      <option value="Corporate">Corporate</option>
      <option value="Others">Others</option>
    </select>
  </div>
  <div class="form-group">
    <label>Number Of Tickets</label>
    <input type="number" class="form-control" name="ticketNo" min="1" required="required" >
  </div>
 
 <button class="btn btn-primary" type="submit" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Submit</button>
  <div class="col">
    
    </div>

</form>
</div>
</div>
</body>
</html>