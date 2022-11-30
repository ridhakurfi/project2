<%
	if(session.getAttribute("Admin")==null){
		response.sendRedirect("home");
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Your Home Page</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="css/index-styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>	
.button {
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  margin: 4px 2px;
  cursor: pointer;
  float: right;
}
.button1 {background-color: FireBrick;}	
.button2 {background-color: DarkSeaGreen;}
.button3 {background-color: LightSalmon; color: black;}	
h1 {
	font: monospace;
	font-family: "Lucida Console", "Courier New", monospace;
  text-align: left;
}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 125;
}
</style>	
</head>
<body>

<nav
		class="navbar navbar-expand-lg bg-primary text-uppercase fixed-top"
		id="mainNav">
		
		<div class="container">
		
			<div class="collapse navbar-collapse" id="navbarResponsive">
			 
			<h1> <%="Welcome : " %> <%=session.getAttribute("user") %>
			</h1>
			 
			<img src="getimage?id=<c:out value='${record.id}' />" class="center" width="125" height ="125"  border="10">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><p hidden=><a
						class="nav-link py-3 px-0 px-lg-3 rounded"><%=session.getAttribute("user") %></a></p></li>
						
					<li class="nav-item mx-0 mx-lg-1"><p hidden=><a
						class="nav-link py-3 px-0 px-lg-3 rounded"><%=session.getAttribute("id") %></a></p></li>
						
						
					<li class="nav-item mx-0 mx-lg-1"><a  style="float: right;" 
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><button  type="submit" class="button button3">Logout</button></a></li>
					
				</ul>
				
			</div>
		</div>
	</nav>
	
	<br><br><br><br><br><br><br><br>

<h1>Admin Dashboard</h1>
	<br>
	<div class="row">
	<div class="container">
			<h3 class="text-center">List of Data</h3>
			<hr>

			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>User Name</th>
						<th>Status</th>
						<th>operation</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="record" items="${listRecord}">

						<tr>
							<td><c:out value="${record.id}" /></td>
							<td><c:out value="${record.username}" /></td>
							<td><a href="viewacc?id=<c:out value='${record.id}' />">View</a>
							<td><a href="editacc?id=<c:out value='${record.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
							<a href="deleteacc?id=<c:out value='${record.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>