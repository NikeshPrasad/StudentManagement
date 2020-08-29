<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	</head>
	<body>
		<div class="container">
			<h1>Welcome administrator!</h1>	
			<h3 style="color:${messageColor };">${message }</h3>
			<p>Click on the below options to add, delete, modify or view the students</p>
			<ul>
				<li><a href="addStudentForm">Add student</a></li>
				<li><a href="deleteStudentForm">Delete student</a></li>
				<li><a href="modifyStudentForm">Modify student</a></li>
				<li><a href="selectStudentForm">View student by id</a></li>
				<li><a href="selectAllStudent">View all students</a></li>
			</ul>
		</div>
	</body>
</html>