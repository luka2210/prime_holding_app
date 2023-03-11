package com.springboot.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="tasks")
public class TaskEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@NotNull(message="is required.")
	@Size(min=5, max=30, message="must be between 5 and 30 charachers long.")
	@Column(unique=true)
	private String title;
	@NotNull(message="is required.")
	@Size(min=10, max=150, message="must be between 10 and 150 charachers long.")
	private String description;
	@NotNull(message="is required.")
	private Date dueDate;
	private Boolean completed;
	private Date completionDate;
	@ManyToOne
	@JoinColumn(name="employees_id")
	EmployeeEntity employee;
	@Transient
	private Integer employeeId;
	
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

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
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
	
}
