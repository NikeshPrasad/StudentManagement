<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<%@ page import="edu.college.models.Student" %>
<%@ page import="edu.college.models.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Delete Student</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style type="text/css">
			div {
				margin: 30px 0;
			}
		</style>
		<script type="text/javascript">
			function validateRollNo() {
				var rollNo = document.forms["getRollNo"]["rollNo"].value;
				if (!/^\d+$/.test(rollNo)) {
					alert("Roll number should be numbers only");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<div id="deleteStudent" class="container">
			<div id="getEmployeeId">
				<h2>Delete Employee</h2>
				<form name="getRollNo" action="getStudentByRollNoForDelete" onsubmit="return validateRollNo()">
					<input type="hidden" name="requestFrom" value="delete"/>
					<label for="rollNo">Enter the roll number of the student you want to delete:</label>
					<input type="text" id="rollNo" name="rollNo" required>
					<input type="submit" class="btn btn-primary" value="Submit">
				</form>
			</div>
			
			<div id="displayStudent">
				<% 
					Student student = (Student) request.getSession().getAttribute("student");
					if (student != null) {
						Address address = student.getAddress();
				%>
					<div>
						<table class="table table-bordered">
							<tr>
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
							<tr class="danger">
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
						</table>
					</div>
					<form name="confirmDelete" action="deleteStudent" method="post">
						<input type="submit" class="btn btn-danger" value="Delete"/>
					</form>
				<%
					} else {
				%>
					<p style="color:red;"><b>${message }</b></p>
				<% } %>
			</div>
		</div>
	</body>
</html>