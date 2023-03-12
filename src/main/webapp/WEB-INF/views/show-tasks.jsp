<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tasks</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<div class="container">
	<div class="row">
		<form action="add-task" method="GET">
			<input type="submit" value="Add Task"/>
		</form>
	</div>
	<div class="row">
	<table id="tasks_table" class="table table-striped table-hover table-active" style="width:100%">
	<thead>
    	<tr>
    		<th>ID </th>
    		<th>Title </th>
    		<th>Description</th>
        	<th>Due date</th>
        	<th>Completed</th>
        	<th>Completion date</th>
        	<th>Assigned employee</th>
        	<th></th>
        	<th></th>
    	</tr>
    </thead>
    <tbody>
    <c:forEach items="${tasks}" var="task" varStatus="status">
        <tr>
        	<td>${task.id}</td>
        	<td>${task.title}</td>
        	<td>${task.description}</td>
        	<td>${task.dueDate}</td>
            <td>${task.completedString}</td>
            <td>${task.completionDate}</td>
            <td>${task.employee.fullNameAndId}</td>
            <td>
            	<form action="edit-task" method="GET">
            		<input type="hidden" name="taskId" value="${task.id }" />
            		<input type="submit" value="Edit"/>
            	</form>
            </td>
            <td>
            	<form action="" method="POST"> 
            		<input type="hidden" name="taskId" value="${task.id }">
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
	    	$('#tasks_table').DataTable();
		});
	</script>
</body>
</html>