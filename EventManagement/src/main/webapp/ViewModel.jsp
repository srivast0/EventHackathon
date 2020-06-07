<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.app.model.RegisterModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% RegisterModel rmodel = (RegisterModel)session.getAttribute("viewModel"); 
		if(rmodel==null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	%>
 <%
 	
 InputStream inputStream = new ByteArrayInputStream(rmodel.getIcardimg());
	ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
 byte[] buffer = new byte[4096];
 int bytesRead = -1;
  
 while ((bytesRead = inputStream.read(buffer)) != -1) {
     outputStream.write(buffer, 0, bytesRead);                  
 }
  
 byte[] imageBytes = outputStream.toByteArray();
 String base64Image = Base64.getEncoder().encodeToString(imageBytes);
 rmodel.setBase64Image(base64Image);
  
 inputStream.close();
 outputStream.close();
 	
 	
 %>
 <jsp:include page="Menu.jsp"/>
<div class="card col-lg-4 offset-lg-4" style="width: 23rem;">
  <img src="data:image/jpg;base64,${RegisterModel.base64Image}" class="card-img-top" alt="..."height="300px" width="400px">
  <div class="card-body">
    <h5 class="card-title">Your Details</h5>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">
    <b>Name:</b> <%out.println(" "+rmodel.getFullname());%>
	</li>
    <li class="list-group-item">
    <b>Email:</b> <%out.println(" "+rmodel.getEmail()); %>
    </li>
    <li class="list-group-item">
   <b>Mobile:</b> <%out.println(" "+rmodel.getMobile()); %>
    </li>
    <li class="list-group-item">
    <b>Registration Type:</b><%out.println(" "+rmodel.getRtype()); %>
    </li>
    <li class="list-group-item">
    <b>Number Of Tickets:</b> <% out.println(" "+rmodel.getTktNo());%>
    </li>
   
  </ul>
  <div class="card-body">
    <a href="/index.jsp" class="card-link">Edit</a>
    <a href="regfinal" class="card-link">Confirm</a>
  </div>

</div>
</body>
</html>