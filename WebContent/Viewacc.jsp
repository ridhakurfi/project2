<%
	if(session.getAttribute("Admin")==null){
		response.sendRedirect("login.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>View Account</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
.button1 {background-color: LightSalmon;color: black;}	
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
<br><br><br>
<nav 
		class="navbar navbar-expand-lg bg-primary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
		<h1><%="Data : " %><c:out value='${record.username}' />
			</h1>
			 
				<div  class="collapse navbar-collapse" id="navbarResponsive">
			<img src="getimage?id=<c:out value='${record.id}' />" class="center" width="125" height ="125"  border="1" >
			
		
				<ul  class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><p hidden=><a
						class="nav-link py-3 px-0 px-lg-3 rounded"><%=session.getAttribute("user") %></a></p></li>
						
					<li class="nav-item mx-0 mx-lg-1"><p hidden=><a
						class="nav-link py-3 px-0 px-lg-3 rounded"><%=session.getAttribute("id") %></a></p></li>
						
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><button  type="submit" class="button button1">Logout</button></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<br><br><br><br>

<input type = "hidden" id = "status" value="<%= request.getAttribute("status") %>">
<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
<h2 class="form-title" align="center">VIEW ACCOUNT</h2>
<br><br><br>

				<form method="post" action="updateregisteracc" class="register-form"
							id="register-form">
							
				<fieldset class="form-group">
				<c:out value='${"ID : "}' /> <c:out value="${record.id}"/>
				</fieldset>

				<fieldset class="form-group">
				<c:out value='${"Name : "}' /> <c:out value="${record.name}"/>
				</fieldset>

				<fieldset class="form-group">
				<c:out value='${"Email : "}' /> <c:out value="${record.email}"/>
				</fieldset>
				
				<fieldset class="form-group">
				<c:out value='${"Username : "}' /> <c:out value="${record.username}"/>
				</fieldset>
				
				<fieldset class="form-group">
				<c:out value='${"Password : "}' /> <c:out value="${record.password}"/>
				</fieldset>
				
				<fieldset class="form-group">
				<c:out value='${"Contact : "}' /> <c:out value="${record.phone}"/>
				</fieldset>
				
				<fieldset class="form-group">
				<img src="getimageacc?id=<c:out value='${record.id}' />" class="center" width="125" height ="125"  border="1" >
				</fieldset>
				
				<fieldset class="form-group">
				<c:out value='${"Text file : "}' /> 
				<textarea name="tex" id="tex" rows="5" cols="flex" style="font-family:sans-serif;font-size:1.2em;" >
				<c:out value='${record.file}' />
				</textarea>
				</fieldset>
            	
				<fieldset class="form-group">
				<c:out value='${"Comment : "}' /> 
				<textarea name="comment" id="comment" style="font-family:sans-serif;font-size:1.2em;">
				<c:out value='${record.comment}' />
				</textarea>
				</fieldset>
				
				
				</form>
				</div></div></div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">

var status = document.getElementById("status").value;
if (status == "success"){
	swal("Congrats","Your Account Created Successfully","success");
	location.href = 'login.jsp';
}if (status == "notsame"){
	swal("Failed","Your Password didn't match","error");
}if (status == "failed"){
	swal("failed","Complete Your Data","error");
}
</script>	
</body>
</html>