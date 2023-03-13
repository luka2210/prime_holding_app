<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Employees of the month</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
  		<div class="container-fluid">
  		<a class="navbar-brand" href="<c:url value = "/"/>">
      			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Spring_Framework_Logo_2018.svg/1200px-Spring_Framework_Logo_2018.svg.png" alt="Logo" 
      				width="100" height="25" class="d-inline-block align-text-top">
     	 		Homepage
    			</a>
    	<!-- Links -->
    	<ul class="navbar-nav">
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/employees/"/>">Employees</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/tasks/"/>">Tasks</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/positions/"/>">Positions</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/employees/employees-of-the-month"/>">Top 5 Employees of the month</a>
      		</li>
   		</ul>
 	 	</div>
	</nav>

	<div class="container">
	<div class="mt-4 d-flex justify-content-center">
		<div class="display-4">
			<b> Top 5 Employees of the month </b>
		</div>
	</div>
	<div class="row mt-4">
		<table id="employees_table" class="table table-striped table-hover table-active" style="width:100%">
		<thead>
    	<tr>
    		<th>ID </th>
    		<th>Name </th>
    		<th>Tasks completed this month</th>
        	<th>Tasks completed this month on time</th>
        	<th>Score</th>
    	</tr>
    </thead>
    <tbody>
    <c:forEach items="${employees}" var="employee" varStatus="status">
        <tr>
        	<td>${employee.id}</td>
        	<td>${employee.fullName}</td>
        	<td>${employee.completedTasks}</td>
            <td>${employee.completedTasksOnTime}</td>
            <td>${employee.score}</td>
        </tr>
    </c:forEach>
    </tbody>
	</table>
	</div>
	</div>
</body>
</html>