<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add new employee</title>
</head>
<body>
	<c:if test="${savedEmployeeSuccessful}">
		<div> Employee ${savedEmployee.firstName } ${savedEmployee.lastName } saved to database!</div>
	</c:if>
	
	<c:if test="${!savedEmployeeSuccessful}">
		<div> Error: could not save to database. </div>
	</c:if>
	
	<form:form action="/employees/add-employee" method="POST" modelAttribute="employee">
		<form:input type="text" path="firstName" placeholder="First name"/> <form:errors path="firstName" cssClass="error"/> <br>
		<form:input type="text" path="lastName" placeholder="Last name"/> <form:errors path="lastName" cssClass="error"/> <br>
		<form:input type="text" path="email" placeholder="E-mail address"/> <form:errors path="email" cssClass="error"/> <br>
		<form:input type="text" path="phoneNumber" placeholder="Phone number"/> <form:errors path="phoneNumber" cssClass="error"/> <br>
		<form:label path="dateOfBirth"> Date of birth: </form:label> <form:input type="date" path="dateOfBirth"/> <form:errors path="dateOfBirth" cssClass="error"/> <br>
		<form:input type="number" path="monthlySalary" placeholder="Monthly salary (in €)"/> <form:errors path="monthlySalary" cssClass="error"/> <br>
		<input type="submit" value="Save">
	</form:form>
	
	<script type="text/javascript">
		document.getElementById('dateOfBirth').valueAsDate = new Date(1999, 10, 22);
	</script>
</body>
</html>