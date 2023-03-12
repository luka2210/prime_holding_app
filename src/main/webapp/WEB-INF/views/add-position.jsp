<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Add Position</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<c:if test="${savedPositionSuccessful}">
		<div> Position ${savedPosition.seniorityAndDepartment} saved to database!</div>
	</c:if>
	
	<c:if test="${savedPositionSuccessful != null && !savedPositionSuccessful}">
		<div> Error: could not save to database. </div>
		<c:if test="${errorMessage != null }">
			<div> ${errorMessage }</div>
		</c:if>
	</c:if>
	
	<form:form action="/positions/add-position" method="POST" modelAttribute="position">
		<form:input type="text" path="department" placeholder="Department"/> 
			<form:errors path="department" cssClass="error"/> <br>
		<form:label path="seniority"> Seniority: </form:label>
			<form:select path="seniority">
				<form:option value="0" label="Intern"/>
				<form:option value="1" label="Junior"/>
				<form:option value="2" label="Medior"/>
				<form:option value="3" label="Senior"/>
			</form:select> 
				<form:errors path="seniority" cssClass="error"/> <br>
		<input type="submit" value="Save"/>
	</form:form>
</body>
</html>