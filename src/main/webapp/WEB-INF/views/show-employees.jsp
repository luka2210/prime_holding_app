<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Show employees</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<div class="container">
	<div class="row">
	<table id="employees_table" class="table table-striped table-hover table-active" style="width:100%">
	<thead>
    	<tr>
    		<th>ID </th>
    		<th>Name </th>
    		<th>E-mail address</th>
        	<th>Phone number</th>
        	<th>Date of birth</th>
        	<th>Salary</th>
        	<th>Edit</th>
        	<th>Delete</th>
    	</tr>
    </thead>
    <tbody>
    <c:forEach items="${employees}" var="employee" varStatus="status">
        <tr>
        	<td>${employee.id}</td>
        	<td>${employee.fullName}</td>
        	<td>${employee.email}</td>
            <td>${employee.phoneNumber}</td>
            <td>${employee.dateOfBirth}</td>
            <td>${employee.monthlySalary}€</td>
            <td>
            	<form action="edit-employee" method="GET">
            		<input type="hidden" name="employeeId" value="${employee.id }" />
            		<input type="submit" value="Edit"/>
            	</form>
            </td>
            <td>
            	<form action="" method="POST"> 
            		<input type="hidden" name="employeeId" value="${employee.id }">
            		<input type="submit" value="Delete"/>
            	</form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
	</table>
	</div>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
	<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"> </script>
	<script src="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap5.min.js"> </script>
	<script>
		$(document).ready(function () {
	    	$('#employees_table').DataTable();
		});
	</script>
</body>
</html>