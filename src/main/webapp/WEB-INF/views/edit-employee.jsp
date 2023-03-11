<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edit Employee</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<c:if test="${editEmployeeSuccessful}">
		<div> Updated information for employee ${editEmployee.firstName } ${editEmployee.lastName }!</div>
	</c:if>
	
	<c:if test="${editEmployeeSuccessful != null && !editEmployeeSuccessful}">
		<div> Error: could not update information in database. </div>
		<c:if test="${errorMessage != null }">
			<div> ${errorMessage }</div>
		</c:if>
	</c:if>
	
	<form:form action="/employees/edit-employee" method="POST" modelAttribute="employee">
		<form:input type="hidden" path="id"/>
		<form:input type="hidden" path="tasks"/>
		<form:input type="text" path="firstName" placeholder="First name"/> 
			<form:errors path="firstName" cssClass="error"/> <br>
		<form:input type="text" path="lastName" placeholder="Last name"/> 
			<form:errors path="lastName" cssClass="error"/> <br>
		<form:input type="text" path="email" placeholder="E-mail address"/> 
			<form:errors path="email" cssClass="error"/> <br>
		<form:input type="text" path="phoneNumber" placeholder="Phone number"/> 
			<form:errors path="phoneNumber" cssClass="error"/> <br>
		<form:label path="dateOfBirth"> Date of birth: </form:label> 
			<form:input type="date" path="dateOfBirth" max="2005-12-31" min="1923-01-01"/> 
			<form:errors path="dateOfBirth" cssClass="error"/> <br>
		<form:input type="number" path="monthlySalary" placeholder="Monthly salary (in €)"/> 
			<form:errors path="monthlySalary" cssClass="error"/> <br>
		<input type="submit" value="Save">
	</form:form>
	
	<script type="text/javascript">
		//document.getElementById('dateOfBirth').valueAsDate = new Date(1999, 10, 22);
	</script>
</body>
</html>