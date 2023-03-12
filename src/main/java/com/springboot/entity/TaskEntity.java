package com.springboot.entity;

import java.sql.Date;
import java.util.concurrent.TimeUnit;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="tasks")
public class TaskEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@NotNull(message="Title is required.")
	@Size(max=30, message="Title can't be longer than 30 characters.")
	@Column(unique=true)
	private String title;
	@NotNull(message="Description is required.")
	@Size(max=1000, message="Can't be longer than 1000 characters.")
	private String description;
	@NotNull(message="Due date is required.")
	private Date dueDate;
	@NotNull(message="Completion status is required.")
	private Boolean completed;
	private Date completionDate;
	@ManyToOne
	@NotNull(message="Assigned employee is required.")
	@JoinColumn(name="employees_id")
	EmployeeEntity employee;
	
	public TaskEntity() {}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Boolean getCompleted() {
		return completed;
	}

	public void setCompleted(Boolean completed) {
		this.completed = completed;
	}

	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public EmployeeEntity getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeEntity employee) {
		this.employee = employee;
	}
	
	public String getCompletedString() {
		if (completed)
			return "Yes";
		return "No";
	}
	
	public boolean getCompletedOnTime() {
		if (completionDate == null)
			return false;
		return dueDate.compareTo(completionDate) >= 0;
	}
	
	public boolean getCompletedThisMonth() {
		if (!getCompleted() || completionDate == null)
			return false;
		long diffInMilliseconds = System.currentTimeMillis() - completionDate.getTime();
		if (diffInMilliseconds < 0)
			return false;
		return TimeUnit.DAYS.convert(diffInMilliseconds, TimeUnit.MILLISECONDS) <= 30;
	}
}
