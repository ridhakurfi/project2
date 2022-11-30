<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
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
}
.button1 {background-color: crimson;}	
</style>

</head>
<body>
<input type = "hidden" id = "status" value="<%= request.getAttribute("status") %>">
<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
<h2 class="form-title" align="center">Registration Page</h2>
<br><br><br>

				<form method="post" action="register" class="register-form"
							id="register-form">
	

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						 class="form-control"
						name="name">
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						 class="form-control"
						name="email">
				</fieldset>

				<fieldset class="form-group">
					<label>Username</label> <input type="text"
						 class="form-control"
						name="user">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Password</label> <input type="password"
						 class="form-control"
						name="pass">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Confirm Password</label> <input type="password"
						 class="form-control"
						name="re_pass">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Contact</label> <input type="text"
					 class="form-control"
						name="contact">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Photo</label> <input type="file"
					 class="form-control"
						name="photo">
				</fieldset>
				
				<button type="submit" class="button button1">Save</button>
				</form>
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