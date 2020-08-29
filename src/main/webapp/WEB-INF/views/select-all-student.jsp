<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.college.models.Student" %>
<%@ page import="edu.college.models.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>View all Student</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style type="text/css">
			div {
				margin: 30px 0;
			}
		</style>
	</head>
	<body>
		<div id="displayAllStudent" class="container">
		<h2>Displaying all students</h2>
			<% 
				List<Student> studentList = (List) request.getAttribute("studentList");
				if (studentList != null) {
			%>
				<table class="table table-bordered table-hover" style="margin:20px 0;">
					<tr class="info">
						<th>Roll no</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Gender</th>
						<th>Department</th>
						<th>Semester</th>
						<th>Section</th>
						<th>Mobile</th>
						<th>Address no</th>
						<th>Street</th>
						<th>City</th>
						<th>State</th>
						<th>Pin code</th>
					</tr>
					<%
					for (Student student : studentList) {
						Address address = student.getAddress();
					%>
					<tr>
						<td><%=student.getRollNo()%></td>
						<td><%=student.getFirstName()%></td>
						<td><%=student.getLastName()%></td>
						<td><%=student.getGender()%></td>
						<td><%=student.getDepartment()%></td>
						<td><%=student.getSemester()%></td>
						<td><%=student.getSection()%></td>
						<td><%=student.getMobile()%></td>
						<td><%=address.getAnumber()%></td>
						<td><%=address.getStreet()%></td>
						<td><%=address.getCity()%></td>
						<td><%=address.getState()%></td>
						<td><%=address.getPinCode()%></td>
					</tr>
				<% } %>
				</table>
			<% } else { %>
				<p style="color:red;"><b>${message }</b></p>
			<% } %>
		</div>
	</body>
</html>