<%@page import="com.app.model.RegisterModel"%>
<%@page import="javax.persistence.criteria.Root"%>
<%@page import="javax.persistence.criteria.CriteriaQuery"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.app.utility.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--  Include FusionCharts core file -->
<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>

<!--  Include FusionCharts Theme file -->
<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Welcome Admin</title>

</head>
<body class="bg-light">
	<jsp:include page="AdminMenu.jsp" />
	<br/>
	<br/>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 <%@page import="fusioncharts.*" %>
<div class="col-lg-3 offset-lg-3" id="chart"></div>
<%
	 Gson gson = new Gson();
 

	Session ses = HibernateUtil.getSf().openSession();
	CriteriaBuilder builder = ses.getCriteriaBuilder();
	CriteriaQuery<Object[]> cq = builder.createQuery(Object[].class);
	Root<RegisterModel> root = cq.from(RegisterModel.class);
	cq.multiselect(builder.count(root.get("rtype")),root.get("rtype"));
	cq.groupBy(root.get("rtype"));
	Query<Object[]> qry=ses.createQuery(cq);
	List<Object[]> ls = qry.list();

     // The 'chartobj' map object holds the chart attributes and data.
     Map<String, String> chartobj = new HashMap<String, String>();

     chartobj.put("caption", "Registrations");
     chartobj.put("showValues", "1");
     chartobj.put("theme", "fusion");

     // Push the data into the array using map object.
     ArrayList arrData = new ArrayList();
    
     for(Object[] ob:ls){
         Map<Object, Object> lv = new HashMap<Object, Object>();
         lv.put("label", (String)ob[1]);
         lv.put("value", (Long)ob[0]);
         arrData.add(lv);
 		
 	}
    
     //create 'dataMap' map object to make a complete FC datasource.
      Map<Object, Object> dataMap = new LinkedHashMap<Object, Object>();
 /*
     gson.toJson() the data to retrieve the string containing the
     JSON representation of the data in the array.
 */
      dataMap.put("chart", gson.toJson(chartobj));
      dataMap.put("data", gson.toJson(arrData));

     FusionCharts columnChart= new FusionCharts(
                 //type of chart
                 "column2D",
                 //unique chart ID
                 "chart1",
                 //width and height of the chart
                 "700","400",
                 //div ID of the chart container
                 "chart",
                 //data format
                 "json",
                 //data source
                 gson.toJson(dataMap)
             );

     %>

<!--    Step 5: Render the chart    -->
     <%=columnChart.render()%>

 


	



</body>
</html>