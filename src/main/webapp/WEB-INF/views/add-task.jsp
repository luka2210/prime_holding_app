<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add new task</title>
</head>
<body>
	<c:if test="${savedTaskSuccessful}">
		<div> Task \"${savedTask.title }\" saved to database!</div>
	</c:if>
	
	<c:if test="${savedTaskSuccessful != null && !savedTaskSuccessful}">
		<div> Error: could not save to database. </div>
		<c:if test="${errorMessage != null }">
			<div> ${errorMessage }</div>
		</c:if>
	</c:if>
	
	<form:form action="/tasks/add-task" method="POST" modelAttribute="task">
		<form:input type="text" path="title" placeholder="Task title"/> <form:errors path="title" cssClass="error"/> <br>
		<form:textarea path="description" placeholder="Task description" rows="3" cols="20"/> <form:errors path="description" cssClass="error"/> <br>
		<form:label path="dueDate"> Due date: </form:label> <form:input type="date" path="dueDate" value="2023-03-13" max="2033-12-31" min="2020-01-01"/> <form:errors path="dueDate" cssClass="error"/> <br>
		<form:select path="employeeId">
			<form:option selected="true" value="${null }"> Assign employee: </form:option>
			<form:options items="${allEmployees }" itemValue="id" itemLabel="fullName"/>
		</form:select> <br>
		<form:label path="completed"> Completed? </form:label> <form:checkbox checked="true" id="checkboxCompleted" onclick="hideCompletionDateInput()" path="completed"/> <br>
		<div id="completionDateInputDiv"s>
			<form:label path="completionDate"> Completed on: </form:label> <form:input type="date" path="completionDate" value="2023-04-13" max="2033-12-31" min="2020-01-10"/> 
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