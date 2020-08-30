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
		<title>Modify Student</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style type="text/css">
			#getStudentId, #displayStudent, #modifyStudentInput {
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
		<script>
			function validateNewForm() {
				
				var form = document.forms["studentForm"];
				var firstName = form["firstName"].value;
				var lastName = form["lastName"].value;
				var mobile = form["mobile"].value;
				var anumber = form["anumber"].value;
				var street = form["street"].value;
				var city = form["city"].value;
				var state = form["state"].value;
				var pinCode = form["pinCode"].value;
				
				var regexName = /^[A-Za-z]+$/;
				var regexAlphaOnly = /^[A-Za-z ]+$/;
				
				if (!regexName.test(firstName)) {
					alert("First name should contain alphabets only without any trailing and leading whitespaces");
					return false;
				}
				if (!regexName.test(lastName)) {
					alert("Last name should contain alphabets only  without any trailing and leading whitespaces");
					return false;
				}
				if (!/^\d{10}$/.test(mobile)) {
					alert("Enter your 10 digit mobile number");
					return false;
				}
				if (!/^[\w\/]+$/.test(anumber)) {
					alert("Gate/House number can only contian alphabets, digits and /");
					return false;
				}
				if (!regexAlphaOnly.test(street) || street==="") {
					alert("Street name should contain alphabets only");
					return false;
				}
				if (!regexAlphaOnly.test(city) || city==="") {
					alert("City name should contain alphabets only");
					return false;
				}
				if (!regexAlphaOnly.test(state) || state==="") {
					alert("State name should contain alphabets only");
					return false;
				}
				if (!/^\d{6}$/.test(pinCode)) {
					alert("Enter your 6 digit pin code");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<div id="modifyStudent" class="container">
			<div id="getStudentId">
				<h2>Modify Student</h2>
				<form name="getRollNo" action="getStudentByRollNoForModify" onsubmit="return validateRollNo()">
					<input type="hidden" name="requestFrom" value="modify"/>
					<label for="rollNo">Enter the roll number of the student you want to delete:</label>
					<input type="text" id="rollNo" name="rollNo" required>
					<input type="submit" class="btn btn-primary" value="Submit">
				</form>
			</div>
			
			<div id="displayStudent">
				<% 
					Student student = (Student) request.getAttribute("student");
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
							<tr class="info">
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

					<div id="modifyStudentInput">
						<h2>Edit the details you want to modify</h2>
						<sp:form id="studentForm" class="form-horizontal" onsubmit="return validateNewForm()" action="modifyStudent" method="post" modelAttribute="student">
							<div class="form-group">
								<sp:label path="rollNo" class="control-label col-sm-2">Roll number:</sp:label>
								<div class="col-sm-4">
									<sp:input path="rollNo" class="form-control" id="rollNo" readOnly="true"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="firstName" class="control-label col-sm-2">First name:</sp:label>
								<div class="col-sm-4">
									<sp:input path="firstName" class="form-control" maxlength="15" required="true" id="firstName"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="lastName" class="control-label col-sm-2">Last name:</sp:label>
								<div class="col-sm-4">
									<sp:input path="lastName" class="form-control" maxlength="15" required="true" id="lastName"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="gender" class="control-label col-sm-2">Gender:</sp:label>
								<sp:radiobuttons path="gender" items="${genderList }" required="true"/>
							</div>
							<div class="form-group">
								<sp:label path="department" class="control-label col-sm-2">Department:</sp:label>
								<div class="col-sm-4">
									<sp:select path="department" class="form-control" required="true">
										<sp:option value="Select"/>
										<sp:options items="${departmentList}"/>
									</sp:select>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="semester" class="control-label col-sm-2">Semester:</sp:label>
								<div class="col-sm-4">
									<sp:select path="semester" class="form-control" required="true">
										<sp:option value="Select"/>
										<sp:options items="${semesterList }"/>
									</sp:select>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="section" class="control-label col-sm-2">Section:</sp:label>
								<div class="col-sm-4">
									<sp:select path="section" class="form-control" required="true">
										<sp:option value="Select"/>
										<sp:options items="${sectionList }"/>
									</sp:select>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="mobile" class="control-label col-sm-2">Mobile number:</sp:label>
								<div class="col-sm-4">
									<sp:input path="mobile" class="form-control" minlength="10" maxlength="10" required="true" id="mobile"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="address.anumber" class="control-label col-sm-2">Gate/House number:</sp:label>
								<div class="col-sm-4">
									<sp:input path="address.anumber" class="form-control" maxlength="5" required="true" id="anumber"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="address.street" class="control-label col-sm-2">Street:</sp:label>
								<div class="col-sm-4">
									<sp:input path="address.street" class="form-control" maxlength="30" required="true" id="street"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="address.city" class="control-label col-sm-2">City/Town/Village:</sp:label>
								<div class="col-sm-4">
									<sp:input path="address.city" class="form-control" maxlength="25" required="true" id="city"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="address.state" class="control-label col-sm-2">State:</sp:label>
								<div class="col-sm-4">
									<sp:input path="address.state" class="form-control" maxlength="20" required="true" id="state"/>
								</div>
							</div>
							<div class="form-group">
								<sp:label path="address.pinCode" class="control-label col-sm-2">Pin code:</sp:label>
								<div class="col-sm-4">
									<sp:input path="address.pinCode" class="form-control" minlength="6" maxlength="6" required="true" id="pinCode"/>
								</div>
							</div>
							<div class="col-sm-3">
								<input type="submit" class="form-control btn btn-success" value="Submit"/>
							</div>
						</sp:form>
					</div>
				<%
					} else {
				%>
					<p style="color:red;"><b>${message }</b></p>
				<% } %>
			</div>
		</div>
	</body>
</html>