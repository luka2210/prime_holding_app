<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edit Task</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<c:if test="${editTaskSuccessful}">
		<div> Task "${editTask.title }" updated successfully!</div>
	</c:if>
	
	<c:if test="${editTaskSuccessful != null && !editTaskSuccessful}">
		<div> Error: could not save to database. </div>
		<c:if test="${errorMessage != null }">
			<div> ${errorMessage }</div>
		</c:if>
	</c:if>
	
	<form:form action="/tasks/edit-task" method="POST" modelAttribute="task">
		<form:input type="hidden" path="id"/>
		<form:input type="text" path="title" placeholder="Task title"/> 
			<form:errors path="title" cssClass="error"/> <br>
		<form:textarea path="description" placeholder="Task description" rows="3" cols="20"/> 
			<form:errors path="description" cssClass="error"/> <br>
		<form:label path="dueDate"> Due date: </form:label> 
			<form:input type="date" path="dueDate" value="2023-03-13" max="2033-12-31" min="2020-01-01"/> 
				<form:errors path="dueDate" cssClass="error"/> <br>
		<form:label path="id"> Assign employee: </form:label>
			<form:select path="employee">
				<c:forEach items="${allEmployees }" var="employee" varStatus="status">
					<form:option value="${employee }" label="${employee.fullNameAndId }"/>
				</c:forEach>
			</form:select>
				<form:errors path="employee" cssClass="error"/> <br>
		<form:label path="completed"> Completed? </form:label> 
			<form:checkbox checked="true" id="checkboxCompleted" onclick="hideCompletionDateInput()" path="completed"/> 
				<form:errors path="completed" cssClass="error"/> <br>
		<div id="completionDateInputDiv">
			<form:label path="completionDate"> Completed on: </form:label> 
			<form:input type="date" path="completionDate" value="2023-04-13" max="2033-12-31" min="2020-01-10"/> 
		</div>
		<input type="submit" value="Save">
	</form:form>
	
	<script type="text/javascript">
		function hideCompletionDateInput() {
			var checkboxCompleted = document.getElementById("checkboxCompleted");
			var completionDateInputDiv = document.getElementById("completionDateInputDiv");
			if (checkboxCompleted.checked == true) 
				completionDateInputDiv.style.display = "block";
			else
				completionDateInputDiv.style.display = "none";
		}
	</script>
</body>
</html>